#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

usage() {
  cat <<'EOF'
Usage:
  ./scripts/recommend.sh [options] [freeform query]

Options:
  --task <type>     Task type, e.g. feature|bug|review|release|frontend|backend
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

# task type
if task_is('feature') or has_any('feature', 'build', 'new feature', 'implement'):
    add_skill(['plan-product', 'plan-engineering', 'implement-feature', 'review-change', 'qa-release'], 4, 'Detected feature-building intent.')

if task_is('bug') or has_any('bug', 'fix', 'incident', 'regression', 'broken', 'debug'):
    add_skill(['investigate-bug', 'plan-engineering', 'implement-feature', 'review-change', 'qa-release'], 5, 'Detected bug-fix or investigation intent.')

if task_is('review') or has_any('review', 'diff', 'audit', 'check'):
    add_skill(['review-change'], 4, 'Detected review-oriented intent.')

if task_is('release') or has_any('release', 'ship', 'deploy', 'rollout'):
    add_skill(['qa-release', 'document-release'], 4, 'Detected release-oriented intent.')
    add_pack(['release-risk-pack'], 3, 'Release keywords suggest rollout-risk attention.')

# frontend / backend / UX
if task_is('frontend') or has_any('frontend', 'ui', 'ux', 'page', 'component', 'screen'):
    add_skill(['review-frontend-flow'], 5, 'Detected frontend or UI-oriented work.')
    add_pack(['frontend-state-flow-pack', 'component-consistency-pack'], 4, 'Frontend work benefits from state and consistency checks.')

if has_any('form', 'submit', 'validation'):
    add_pack(['form-flow-pack'], 5, 'Form-related work benefits from form-flow checks.')
    add_skill(['review-frontend-flow'], 2, 'Form work often needs a frontend flow review.')

if task_is('backend') or has_any('backend', 'api', 'endpoint', 'controller', 'handler', 'service'):
    add_skill(['review-backend-api'], 5, 'Detected backend or API-oriented work.')
    add_pack(['backend-api-pack'], 4, 'Backend/API work benefits from contract-focused review.')

# security / permissions
if risk_is('high', 'sensitive') or has_any('auth', 'permission', 'permissions', 'role', 'roles', 'tenant', 'billing', 'security', 'secure', 'ownership'):
    add_skill(['security-review', 'review-backend-api'], 6, 'Detected auth, permission, or trust-boundary risk.')
    add_pack(['auth-permission-pack'], 5, 'Auth and permission work benefits from dedicated auth/permission checks.')

# data / db
if has_any('db', 'database', 'schema', 'migration', 'migrate', 'prisma', 'transaction', 'query'):
    add_pack(['db-migration-pack', 'prisma-pack'], 5, 'Detected schema, data, or Prisma-related work.')
    add_skill(['plan-engineering', 'review-backend-api', 'qa-release'], 2, 'Data changes usually need stronger planning and release checks.')

# framework / stack
if has_any('next', 'nextjs', 'next.js', 'app router', 'server action', 'route handler'):
    add_pack(['nextjs-app-pack'], 6, 'Detected Next.js-specific context.')
    add_skill(['review-frontend-flow', 'plan-engineering'], 2, 'Next.js work often crosses client/server boundaries.')

if has_any('trpc', 't.rpc'):
    add_pack(['trpc-pack'], 6, 'Detected tRPC-specific context.')
    add_skill(['review-backend-api', 'review-frontend-flow'], 2, 'tRPC work often spans contract and UI assumptions.')

if has_any('nestjs', 'nest'):
    add_pack(['nestjs-backend-pack'], 6, 'Detected NestJS-specific context.')
    add_skill(['review-backend-api', 'security-review'], 2, 'NestJS backend work often needs backend and security review.')

if has_any('express'):
    add_pack(['express-api-pack'], 6, 'Detected Express-specific context.')
    add_skill(['review-backend-api'], 2, 'Express work often benefits from route and middleware review.')

# fullstack / integration
if task_is('fullstack') or has_any('fullstack', 'full-stack', 'client server', 'frontend backend', 'contract'):
    add_pack(['fullstack-contract-pack'], 6, 'Detected cross-layer or contract-alignment work.')
    add_skill(['review-frontend-flow', 'review-backend-api'], 3, 'Full-stack work benefits from both frontend and backend review.')

# risk control
if risk_is('high', 'sensitive') or has_any('risky', 'sensitive', 'high-impact', 'ambiguous', 'careful'):
    add_skill(['careful-mode'], 7, 'Detected risky or ambiguous work.')
    add_pack(['release-risk-pack'], 4, 'Risk-sensitive work benefits from explicit release-risk thinking.')

if risk_is('freeze') or has_any('freeze', 'containment', 'stabilize', 'stabilization'):
    add_skill(['freeze-mode', 'investigate-bug'], 7, 'Detected freeze or stabilization intent.')
    add_pack(['incident-response-pack'], 5, 'Stabilization work benefits from incident-response guidance.')

if risk_is('resume') or has_any('unfreeze', 'resume', 'resume normal execution'):
    add_skill(['unfreeze-mode'], 7, 'Detected unfreeze intent.')

# fallback
if max(skill_scores.values()) == 0:
    add_skill(['plan-engineering', 'review-change', 'qa-release'], 3, 'No strong pattern detected, falling back to the smallest useful default workflow.')

sorted_skills = sorted(skill_scores.items(), key=lambda x: (-x[1], x[0]))
sorted_packs = sorted(pack_scores.items(), key=lambda x: (-x[1], x[0]))
recommended_skills = [name for name, score in sorted_skills if score > 0][:6]
recommended_packs = [name for name, score in sorted_packs if score > 0][:6]

flow = []
for candidate in [
    'careful-mode',
    'freeze-mode',
    'unfreeze-mode',
    'plan-product',
    'investigate-bug',
    'plan-engineering',
    'implement-feature',
    'review-frontend-flow',
    'review-backend-api',
    'review-change',
    'security-review',
    'qa-release',
    'document-release',
]:
    if candidate in recommended_skills and candidate not in flow:
        flow.append(candidate)

if 'freeze-mode' in flow and 'implement-feature' in flow:
    flow.remove('implement-feature')
if 'unfreeze-mode' in flow and 'freeze-mode' in flow:
    flow.remove('unfreeze-mode')
if 'review-change' in flow and ('review-frontend-flow' in flow or 'review-backend-api' in flow):
    flow = [x for x in flow if x != 'review-change']

if 'qa-release' in flow:
    flow = [x for x in flow if x != 'qa-release'] + ['qa-release']
if 'document-release' in flow:
    flow = [x for x in flow if x != 'document-release'] + ['document-release']

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
    'why': reasons[:8],
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
