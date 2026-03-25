#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

pass() { echo "[PASS] $1"; }
fail() { echo "[FAIL] $1"; exit 1; }

run_case() {
  local name="$1"
  local cmd="$2"
  local expected_flow_csv="$3"
  local expected_skill_csv="$4"
  local expected_pack_csv="$5"

  local output
  if ! output="$(eval "$cmd")"; then
    fail "$name: command failed"
  fi

  CASE_NAME="$name" \
  JSON_PAYLOAD="$output" \
  EXPECTED_FLOW="$expected_flow_csv" \
  EXPECTED_SKILLS="$expected_skill_csv" \
  EXPECTED_PACKS="$expected_pack_csv" \
  python3 - <<'PY'
import json
import os
import sys

name = os.environ['CASE_NAME']
payload = json.loads(os.environ['JSON_PAYLOAD'])
expected_flow = [x for x in os.environ['EXPECTED_FLOW'].split(',') if x]
expected_skills = [x for x in os.environ['EXPECTED_SKILLS'].split(',') if x]
expected_packs = [x for x in os.environ['EXPECTED_PACKS'].split(',') if x]

actual_flow = payload.get('flow', [])
actual_skills = [item['name'] for item in payload.get('skills', [])]
actual_packs = [item['name'] for item in payload.get('packs', [])]

missing = []
for item in expected_flow:
    if item not in actual_flow:
        missing.append(f"flow:{item}")
for item in expected_skills:
    if item not in actual_skills:
        missing.append(f"skill:{item}")
for item in expected_packs:
    if item not in actual_packs:
        missing.append(f"pack:{item}")

# ensure expected flow order is preserved if all present
if not missing and len(expected_flow) >= 2:
    positions = [actual_flow.index(item) for item in expected_flow]
    if positions != sorted(positions):
        missing.append(f"flow-order:{expected_flow}")

if missing:
    print(f"[FAIL] {name}: missing or misordered expectations -> {', '.join(missing)}")
    print(json.dumps(payload, indent=2, ensure_ascii=False))
    sys.exit(1)
else:
    print(f"[PASS] {name}")
PY
}

echo "xstack recommend tests"
echo

run_case \
  "nextjs-prisma-feature" \
  "./scripts/recommend.sh --task feature --stack 'nextjs prisma' --json" \
  "plan-product,plan-engineering,implement-feature,review-frontend-flow,qa-release" \
  "plan-product,review-frontend-flow" \
  "nextjs-app-pack,prisma-pack"

run_case \
  "nestjs-sensitive-backend" \
  "./scripts/recommend.sh --task backend --stack 'nestjs prisma' --risk sensitive --json" \
  "careful-mode,plan-engineering,implement-feature,review-backend-api,security-review,qa-release" \
  "security-review,review-backend-api" \
  "nestjs-backend-pack,auth-permission-pack,prisma-pack"

run_case \
  "bug-freeze" \
  "./scripts/recommend.sh --task bug --risk freeze --json" \
  "freeze-mode,investigate-bug,qa-release" \
  "freeze-mode,investigate-bug" \
  "incident-response-pack"

run_case \
  "trpc-fullstack-feature" \
  "./scripts/recommend.sh --task fullstack --stack 'nextjs trpc prisma' --json" \
  "plan-engineering,implement-feature,review-frontend-flow,review-backend-api,qa-release" \
  "review-frontend-flow,review-backend-api" \
  "nextjs-app-pack,trpc-pack,prisma-pack,fullstack-contract-pack"

run_case \
  "express-api-high-risk" \
  "./scripts/recommend.sh --task backend --stack 'express prisma' --risk high --json" \
  "careful-mode,plan-engineering,implement-feature,review-backend-api,security-review,qa-release" \
  "review-backend-api,security-review" \
  "express-api-pack,prisma-pack,backend-api-pack,release-risk-pack"

echo
pass "All recommend fixtures passed"
