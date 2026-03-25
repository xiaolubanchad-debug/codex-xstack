#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

usage() {
  cat <<'EOF'
Usage:
  ./scripts/recommend.sh [options] [freeform query]

Options:
  --task <type>     Task type, e.g. feature|bug|review|release|frontend|backend|fullstack
  --stack <value>   Stack hint, e.g. "nextjs prisma" or "nestjs prisma"
  --risk <level>    Risk hint, e.g. low|medium|high|sensitive|freeze
  --json            Output JSON instead of formatted text
  -h, --help        Show help

Examples:
  ./scripts/recommend.sh "nextjs prisma feature"
  ./scripts/recommend.sh --task feature --stack "nextjs prisma"
  ./scripts/recommend.sh --task backend --stack "express prisma" --risk high
  ./scripts/recommend.sh --task bug --risk freeze
  ./scripts/recommend.sh --task backend --stack "nestjs prisma" --risk sensitive --json

What it does:
  - Suggests a starting skill flow
  - Suggests relevant packs
  - Explains why those recommendations fit the query

Notes:
  - This is a heuristic prototype, not a full planner.
  - It uses keyword matching plus xstack metadata and config/recommend-rules.json.
EOF
}

TASK=""
STACK=""
RISK=""
JSON_OUTPUT=0
POSITIONAL=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    --task)
      [[ $# -ge 2 ]] || { echo "Missing value for --task" >&2; exit 1; }
      TASK="$2"
      shift 2
      ;;
    --stack)
      [[ $# -ge 2 ]] || { echo "Missing value for --stack" >&2; exit 1; }
      STACK="$2"
      shift 2
      ;;
    --risk)
      [[ $# -ge 2 ]] || { echo "Missing value for --risk" >&2; exit 1; }
      RISK="$2"
      shift 2
      ;;
    --json)
      JSON_OUTPUT=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      POSITIONAL+=("$1")
      shift
      ;;
  esac
done

FREEFORM_QUERY="${POSITIONAL[*]:-}"

if [[ -z "$FREEFORM_QUERY" && -z "$TASK" && -z "$STACK" && -z "$RISK" ]]; then
  usage
  exit 1
fi

python3 - "$FREEFORM_QUERY" "$TASK" "$STACK" "$RISK" "$JSON_OUTPUT" <<'PY'
import glob
import json
import re
import sys

freeform_query = sys.argv[1].strip()
task = sys.argv[2].strip().lower()
stack = sys.argv[3].strip().lower()
risk = sys.argv[4].strip().lower()
json_output = sys.argv[5] == '1'

with open('config/recommend-rules.json', 'r', encoding='utf-8') as f:
    rules = json.load(f)

parts = []
if freeform_query:
    parts.append(freeform_query)
if task:
    parts.append(task)
if stack:
    parts.append(stack)
if risk:
    parts.append(risk)
query = ' '.join(parts).strip().lower()
words = set(re.findall(r"[a-z0-9+.-]+", query))

skill_meta = {}
for path in glob.glob('skills/*/skill.json'):
    with open(path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    skill_meta[data['name']] = data

pack_meta = {}
for path in glob.glob('packs/*.json'):
    with open(path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    pack_meta[data['name']] = data

skill_scores = {name: 0 for name in skill_meta}
pack_scores = {name: 0 for name in pack_meta}
reasons = []


def add_skill(names, points, reason=None):
    for name in names:
        if name in skill_scores:
            skill_scores[name] += points
    if reason:
        reasons.append(reason)


def add_pack(names, points, reason=None):
    for name in names:
        if name in pack_scores:
            pack_scores[name] += points
    if reason:
        reasons.append(reason)


def has_any(tokens):
    return any(token in query or token in words for token in tokens)


def apply_rule(rule):
    if rule.get('skills'):
        add_skill(rule['skills'], rule.get('skillPoints', 0), rule.get('reason'))
    if rule.get('packs'):
        add_pack(rule['packs'], rule.get('packPoints', 0), None)


# explicit task matches first
if task and task in rules['tasks']:
    apply_rule(rules['tasks'][task])

# keyword-driven task matches
for name, rule in rules['tasks'].items():
    if task == name:
        continue
    if has_any(rule.get('keywords', [])):
        apply_rule(rule)

# signal matches
matched_signals = set()
for name, rule in rules['signals'].items():
    if has_any(rule.get('keywords', [])):
        matched_signals.add(name)
        apply_rule(rule)

# risk aliases
for signal_name in rules.get('riskAliases', {}).get(risk, []):
    if signal_name in rules['signals'] and signal_name not in matched_signals:
        matched_signals.add(signal_name)
        apply_rule(rules['signals'][signal_name])

# derived booleans for flow generation
is_feature = task == 'feature' or has_any(rules['tasks']['feature']['keywords'])
is_bug = task == 'bug' or has_any(rules['tasks']['bug']['keywords'])
is_review = task == 'review' or has_any(rules['tasks']['review']['keywords'])
is_release = task == 'release' or has_any(rules['tasks']['release']['keywords'])
is_frontend = task == 'frontend' or has_any(rules['tasks']['frontend']['keywords'])
is_backend = task == 'backend' or has_any(rules['tasks']['backend']['keywords'])
is_fullstack = task == 'fullstack' or has_any(rules['tasks']['fullstack']['keywords'])
is_form = 'form' in matched_signals
is_security = 'security' in matched_signals
is_data = 'data' in matched_signals
is_next = 'nextjs' in matched_signals
is_trpc = 'trpc' in matched_signals
is_nest = 'nestjs' in matched_signals
is_express = 'express' in matched_signals
is_risky = 'risky' in matched_signals
is_freeze = 'freeze' in matched_signals
is_resume = 'resume' in matched_signals

# derive better surface guess from stack clues when task is vague
if not (is_frontend or is_backend or is_fullstack):
    if is_next and not (is_nest or is_express or is_trpc or has_any(['route handler', 'server action', 'api'])):
        is_frontend = True
    if is_nest or is_express:
        is_backend = True
    if is_trpc:
        is_fullstack = True

if max(skill_scores.values()) == 0:
    apply_rule(rules['fallback'])

# metadata-based pack -> skill reinforcement
for pack_name, score in list(pack_scores.items()):
    if score <= 0:
        continue
    meta = pack_meta[pack_name]
    for skill_name in meta.get('bestFitSkills', []):
        if skill_name in skill_scores:
            skill_scores[skill_name] += max(1, score // 3)


def push_unique(seq, item):
    if item and item not in seq:
        seq.append(item)


# template-driven flow generation
flow = []

if is_freeze:
    push_unique(flow, 'freeze-mode')
    push_unique(flow, 'investigate-bug')
    if is_security:
        push_unique(flow, 'security-review')
    push_unique(flow, 'qa-release')
elif is_resume:
    push_unique(flow, 'unfreeze-mode')
    push_unique(flow, 'plan-engineering')
    push_unique(flow, 'qa-release')
elif is_bug:
    if is_risky:
        push_unique(flow, 'careful-mode')
    push_unique(flow, 'investigate-bug')
    push_unique(flow, 'plan-engineering')
    push_unique(flow, 'implement-feature')
    if is_fullstack:
        push_unique(flow, 'review-frontend-flow')
        push_unique(flow, 'review-backend-api')
    else:
        if is_frontend or (is_next and not is_backend and not is_fullstack):
            push_unique(flow, 'review-frontend-flow')
        if is_backend or is_security:
            push_unique(flow, 'review-backend-api')
    if is_security:
        push_unique(flow, 'security-review')
    if not any(x in flow for x in ['review-frontend-flow', 'review-backend-api']):
        push_unique(flow, 'review-change')
    push_unique(flow, 'qa-release')
else:
    if is_risky:
        push_unique(flow, 'careful-mode')
    if is_feature:
        push_unique(flow, 'plan-product')
    push_unique(flow, 'plan-engineering')
    if is_feature or is_frontend or is_backend or is_fullstack or is_data:
        push_unique(flow, 'implement-feature')
    if is_fullstack:
        push_unique(flow, 'review-frontend-flow')
        push_unique(flow, 'review-backend-api')
    else:
        if is_frontend or (is_next and not is_backend and not is_fullstack):
            push_unique(flow, 'review-frontend-flow')
        if is_backend or is_security:
            push_unique(flow, 'review-backend-api')
    if is_security:
        push_unique(flow, 'security-review')
    if not any(x in flow for x in ['review-frontend-flow', 'review-backend-api']) and (is_review or not is_feature):
        push_unique(flow, 'review-change')
    if is_release or is_feature or is_backend or is_frontend or is_fullstack or is_data:
        push_unique(flow, 'qa-release')
    if is_release:
        push_unique(flow, 'document-release')

if not flow:
    flow = ['plan-engineering', 'review-change', 'qa-release']

sorted_skills = sorted(skill_scores.items(), key=lambda x: (-x[1], x[0]))
sorted_packs = sorted(pack_scores.items(), key=lambda x: (-x[1], x[0]))
recommended_skills = []

for item in flow:
    if item in skill_meta and item not in recommended_skills:
        recommended_skills.append(item)

for name, score in sorted_skills:
    if score > 0 and name not in recommended_skills:
        recommended_skills.append(name)

recommended_skills = recommended_skills[:8]
recommended_packs = [name for name, score in sorted_packs if score > 0][:6]

result = {
    'query': query,
    'task': task or None,
    'stack': stack or None,
    'risk': risk or None,
    'flow': flow,
    'skills': [
        {'name': name, 'summary': skill_meta[name]['summary']}
        for name in recommended_skills
    ],
    'packs': [
        {'name': name, 'summary': pack_meta[name]['summary']}
        for name in recommended_packs
    ],
    'why': reasons[:10],
    'tip': 'This script is a starting-point recommender. Use it to choose a sane first workflow, then refine with the repo reality.'
}

if json_output:
    print(json.dumps(result, indent=2, ensure_ascii=False))
else:
    print('xstack recommend')
    print(f"query: {query}")
    if task:
        print(f"task: {task}")
    if stack:
        print(f"stack: {stack}")
    if risk:
        print(f"risk: {risk}")
    print()
    print('Suggested flow:')
    for idx, item in enumerate(flow, start=1):
        print(f'  {idx}. {item}')
    print()
    print('Suggested skills:')
    for item in result['skills']:
        print(f"  - {item['name']}: {item['summary']}")
    print()
    print('Suggested packs:')
    if result['packs']:
        for item in result['packs']:
            print(f"  - {item['name']}: {item['summary']}")
    else:
        print('  - None strongly suggested from the current query.')
    print()
    print('Why:')
    for reason in result['why']:
        print(f'  - {reason}')
    print()
    print('Tip:')
    print(f"  - {result['tip']}")
PY
