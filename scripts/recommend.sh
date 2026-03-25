#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

usage() {
  cat <<'EOF'
Usage:
  ./scripts/recommend.sh <query>

Examples:
  ./scripts/recommend.sh "nextjs prisma feature"
  ./scripts/recommend.sh "backend api auth permissions"
  ./scripts/recommend.sh "bug incident freeze"
  ./scripts/recommend.sh "frontend form flow"

What it does:
  - Suggests a starting skill flow
  - Suggests relevant packs
  - Explains why those recommendations fit the query

Notes:
  - This is a heuristic prototype, not a full planner.
  - It uses simple keyword matching plus xstack metadata.
EOF
}

if [[ $# -eq 0 ]]; then
  usage
  exit 1
fi

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

QUERY="$*"

python3 - "$QUERY" <<'PY'
import glob
import json
import os
import re
import sys

query = sys.argv[1].lower()
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

# task type
if has_any('feature', 'build', 'new feature', 'implement'):
    add_skill(['plan-product', 'plan-engineering', 'implement-feature', 'review-change', 'qa-release'], 4, 'Detected feature-building intent.')

if has_any('bug', 'fix', 'incident', 'regression', 'broken', 'debug'):
    add_skill(['investigate-bug', 'plan-engineering', 'implement-feature', 'review-change', 'qa-release'], 5, 'Detected bug-fix or investigation intent.')

if has_any('review', 'diff', 'audit', 'check'):
    add_skill(['review-change'], 4, 'Detected review-oriented intent.')

if has_any('release', 'ship', 'deploy', 'rollout'):
    add_skill(['qa-release', 'document-release'], 4, 'Detected release-oriented intent.')
    add_pack(['release-risk-pack'], 3, 'Release keywords suggest rollout-risk attention.')

# frontend / backend / UX
if has_any('frontend', 'ui', 'ux', 'page', 'component', 'screen'):
    add_skill(['review-frontend-flow'], 5, 'Detected frontend or UI-oriented work.')
    add_pack(['frontend-state-flow-pack', 'component-consistency-pack'], 4, 'Frontend work benefits from state and consistency checks.')

if has_any('form', 'submit', 'validation'):
    add_pack(['form-flow-pack'], 5, 'Form-related work benefits from form-flow checks.')
    add_skill(['review-frontend-flow'], 2, 'Form work often needs a frontend flow review.')

if has_any('backend', 'api', 'endpoint', 'controller', 'handler', 'service'):
    add_skill(['review-backend-api'], 5, 'Detected backend or API-oriented work.')
    add_pack(['backend-api-pack'], 4, 'Backend/API work benefits from contract-focused review.')

# security / permissions
if has_any('auth', 'permission', 'permissions', 'role', 'roles', 'tenant', 'billing', 'security', 'secure', 'ownership'):
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
if has_any('fullstack', 'full-stack', 'client server', 'frontend backend', 'contract'):
    add_pack(['fullstack-contract-pack'], 6, 'Detected cross-layer or contract-alignment work.')
    add_skill(['review-frontend-flow', 'review-backend-api'], 3, 'Full-stack work benefits from both frontend and backend review.')

# risk control
if has_any('risky', 'sensitive', 'high-impact', 'ambiguous', 'careful'):
    add_skill(['careful-mode'], 7, 'Detected risky or ambiguous work.')
    add_pack(['release-risk-pack'], 4, 'Risk-sensitive work benefits from explicit release-risk thinking.')

if has_any('freeze', 'containment', 'stabilize', 'stabilization'):
    add_skill(['freeze-mode', 'investigate-bug'], 7, 'Detected freeze or stabilization intent.')
    add_pack(['incident-response-pack'], 5, 'Stabilization work benefits from incident-response guidance.')

if has_any('unfreeze', 'resume', 'resume normal execution'):
    add_skill(['unfreeze-mode'], 7, 'Detected unfreeze intent.')

# fallback
if max(skill_scores.values()) == 0:
    add_skill(['plan-engineering', 'review-change', 'qa-release'], 3, 'No strong pattern detected, falling back to the smallest useful default workflow.')

# build recommendations
sorted_skills = sorted(skill_scores.items(), key=lambda x: (-x[1], x[0]))
sorted_packs = sorted(pack_scores.items(), key=lambda x: (-x[1], x[0]))

recommended_skills = [name for name, score in sorted_skills if score > 0][:6]
recommended_packs = [name for name, score in sorted_packs if score > 0][:6]

# derive a compact suggested flow
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

# simplify flow to avoid awkward combinations
if 'freeze-mode' in flow and 'implement-feature' in flow:
    flow.remove('implement-feature')
if 'unfreeze-mode' in flow and 'freeze-mode' in flow:
    flow.remove('unfreeze-mode')
if 'review-change' in flow and ('review-frontend-flow' in flow or 'review-backend-api' in flow):
    # prefer specific review modes when already present
    flow = [x for x in flow if x != 'review-change'] + ['qa-release'] if 'qa-release' in flow else [x for x in flow if x != 'review-change']
    seen = []
    dedup = []
    for x in flow:
        if x not in seen:
            dedup.append(x)
            seen.append(x)
    flow = dedup

# ensure qa-release tends to appear near the end if relevant
if 'qa-release' in flow:
    flow = [x for x in flow if x != 'qa-release'] + ['qa-release']
if 'document-release' in flow:
    flow = [x for x in flow if x != 'document-release'] + ['document-release']

print('xstack recommend')
print(f'query: {query}')
print()
print('Suggested flow:')
for idx, item in enumerate(flow, start=1):
    print(f'  {idx}. {item}')
print()
print('Suggested skills:')
for name in recommended_skills:
    print(f"  - {name}: {skill_meta[name]['summary']}")
print()
print('Suggested packs:')
if recommended_packs:
    for name in recommended_packs:
        print(f"  - {name}: {pack_meta[name]['summary']}")
else:
    print('  - None strongly suggested from the current query.')
print()
print('Why:')
for reason in reasons[:8]:
    print(f'  - {reason}')
print()
print('Tip:')
print('  - This script is a starting-point recommender. Use it to choose a sane first workflow, then refine with the repo reality.')
PY
