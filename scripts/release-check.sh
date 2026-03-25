#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

pass() { echo "[PASS] $1"; }
step() { echo; echo ">>> $1"; }

step "Build generated indexes"
./scripts/build-index.sh
pass "Generated indexes"

step "Run recommendation fixtures"
./scripts/test-recommend.sh
pass "Recommendation fixtures passed"

step "Run repository doctor"
./scripts/doctor.sh
pass "Repository doctor passed"

echo
echo "release-check finished cleanly."
