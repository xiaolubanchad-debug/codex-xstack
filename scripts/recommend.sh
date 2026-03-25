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
  - It uses keyword matching plus xstack metadata.
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


def add_skill(names, points, reason):
    for name in names:
        if name in skill_scores:
            skill_scores[name] += points
    reasons.append(reason)


def add_pack(names, points, reason):
    for name in names:
        if name in pack_scores:
            pack_scores[name] += points
    reasons.append(reason)


def has_any(*tokens):
    return any(token in query or token in words for token in tokens)


def task_is(*values):
    return task in values


def risk_is(*values):
    return risk in values


def push_unique(seq, item):
    if item and item not in seq:
        seq.append(item)


# detect dimensions more explicitly
is_feature = task_is('feature') or has_any('feature', 'build', 'new feature', 'implement')
is_bug = task_is('bug') or has_any('bug', 'fix', 'incident', 'regression', 'broken', 'debug')
is_review = task_is('review') or has_any('review', 'diff', 'audit', 'check')
is_release = task_is('release') or has_any('release', 'ship', 'deploy', 'rollout')
is_frontend = task_is('frontend') or has_any('frontend', 'ui', 'ux', 'page', 'component', 'screen')
is_form = has_any('form', 'submit', 'validation')
is_backend = task_is('backend') or has_any('backend', 'api', 'endpoint', 'controller', 'handler', 'service')
is_fullstack = task_is('fullstack') or has_any('fullstack', 'full-stack', 'client server', 'frontend backend', 'contract')
is_security = risk_is('high', 'sensitive') or has_any('auth', 'permission', 'permissions', 'role', 'roles', 'tenant', 'billing', 'security', 'secure', 'ownership')
is_data = has_any('db', 'database', 'schema', 'migration', 'migrate', 'prisma', 'transaction', 'query')
is_next = has_any('next', 'nextjs', 'next.js', 'app router', 'server action', 'route handler')
is_trpc = has_any('trpc', 't.rpc')
is_nest = has_any('nestjs', 'nest')
is_express = has_any('express')
is_risky = risk_is('high', 'sensitive') or has_any('risky', 'high-impact', 'ambiguous', 'careful')
is_freeze = risk_is('freeze') or has_any('freeze', 'containment', 'stabilize', 'stabilization')
is_resume = risk_is('resume') or has_any('unfreeze', 'resume', 'resume normal execution')

# derive better surface guess from stack clues when task is vague
if not (is_frontend or is_backend or is_fullstack):
    if is_next and not (is_nest or is_express or is_trpc or has_any('route handler', 'server action', 'api')):
        is_frontend = True
    if is_nest or is_express:
        is_backend = True
    if is_trpc:
        is_fullstack = True

# scoring for suggestions
if is_feature:
    add_skill(['plan-product', 'plan-engineering', 'implement-feature', 'qa-release'], 5, 'Detected feature-building intent.')
if is_bug:
    add_skill(['investigate-bug', 'plan-engineering', 'implement-feature', 'qa-release'], 6, 'Detected bug-fix or investigation intent.')
if is_review:
    add_skill(['review-change'], 4, 'Detected review-oriented intent.')
if is_release:
    add_skill(['qa-release', 'document-release'], 5, 'Detected release-oriented intent.')
    add_pack(['release-risk-pack'], 4, 'Release-oriented work benefits from explicit rollout-risk checks.')
if is_frontend:
    add_skill(['review-frontend-flow'], 6, 'Detected frontend or UI-oriented work.')
    add_pack(['frontend-state-flow-pack', 'component-consistency-pack'], 5, 'Frontend work benefits from state and consistency checks.')
if is_form:
    add_pack(['form-flow-pack'], 6, 'Form-related work benefits from form-flow checks.')
    add_skill(['review-frontend-flow'], 2, 'Form work often needs a frontend flow review.')
if is_backend:
    add_skill(['review-backend-api'], 6, 'Detected backend or API-oriented work.')
    add_pack(['backend-api-pack'], 5, 'Backend/API work benefits from contract-focused review.')
if is_fullstack:
    add_skill(['review-frontend-flow', 'review-backend-api'], 4, 'Detected full-stack or contract-alignment work.')
    add_pack(['fullstack-contract-pack'], 6, 'Cross-layer work benefits from explicit contract-alignment checks.')
if is_security:
    add_skill(['security-review', 'review-backend-api'], 7, 'Detected auth, permission, or trust-boundary risk.')
    add_pack(['auth-permission-pack'], 6, 'Auth and permission work benefits from dedicated auth/permission checks.')
if is_data:
    add_pack(['db-migration-pack', 'prisma-pack'], 6, 'Detected schema, data, or Prisma-related work.')
    add_skill(['plan-engineering', 'qa-release'], 2, 'Data changes usually need stronger planning and release checks.')
if is_next:
    add_pack(['nextjs-app-pack'], 7, 'Detected Next.js-specific context.')
    add_skill(['plan-engineering', 'review-frontend-flow'], 2, 'Next.js work often crosses client/server boundaries.')
if is_trpc:
    add_pack(['trpc-pack'], 7, 'Detected tRPC-specific context.')
    add_skill(['review-backend-api', 'review-frontend-flow'], 3, 'tRPC work often spans contract and UI assumptions.')
if is_nest:
    add_pack(['nestjs-backend-pack'], 7, 'Detected NestJS-specific context.')
    add_skill(['review-backend-api'], 2, 'NestJS backend work often needs backend contract review.')
if is_express:
    add_pack(['express-api-pack'], 7, 'Detected Express-specific context.')
    add_skill(['review-backend-api'], 2, 'Express work often benefits from route and middleware review.')
if is_risky:
    add_skill(['careful-mode'], 8, 'Detected risky or ambiguous work.')
    add_pack(['release-risk-pack'], 5, 'Risk-sensitive work benefits from explicit release-risk thinking.')
if is_freeze:
    add_skill(['freeze-mode', 'investigate-bug'], 8, 'Detected freeze or stabilization intent.')
    add_pack(['incident-response-pack'], 6, 'Stabilization work benefits from incident-response guidance.')
if is_resume:
    add_skill(['unfreeze-mode'], 8, 'Detected unfreeze intent.')

if max(skill_scores.values()) == 0:
    add_skill(['plan-engineering', 'review-change', 'qa-release'], 3, 'No strong pattern detected, falling back to the smallest useful default workflow.')

# let pack metadata influence skill recommendations a bit
for pack_name, score in list(pack_scores.items()):
    if score <= 0:
        continue
    meta = pack_meta[pack_name]
    for skill_name in meta.get('bestFitSkills', []):
        if skill_name in skill_scores:
            skill_scores[skill_name] += max(1, score // 3)

# flow generation is template-driven first, score-driven second
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
    if is_frontend or (is_next and not is_backend and not is_fullstack):
        push_unique(flow, 'review-frontend-flow')
    if is_backend or is_fullstack or is_security:
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
    if is_frontend or (is_next and not is_backend and not is_fullstack):
        push_unique(flow, 'review-frontend-flow')
    if is_fullstack:
        push_unique(flow, 'review-backend-api')
    elif is_backend or is_security:
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

# score sort after template generation
sorted_skills = sorted(skill_scores.items(), key=lambda x: (-x[1], x[0]))
sorted_packs = sorted(pack_scores.items(), key=lambda x: (-x[1], x[0]))
recommended_skills = []

# keep flow skills first in the recommendation list
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
