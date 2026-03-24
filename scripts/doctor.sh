#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

pass() { echo "[PASS] $1"; }
warn() { echo "[WARN] $1"; }
fail() { echo "[FAIL] $1"; }

FAILED=0
WARNED=0

check_file() {
  local path="$1"
  if [[ -f "$path" ]]; then
    pass "Found file: $path"
  else
    fail "Missing file: $path"
    FAILED=1
  fi
}

check_dir() {
  local path="$1"
  if [[ -d "$path" ]]; then
    pass "Found directory: $path"
  else
    fail "Missing directory: $path"
    FAILED=1
  fi
}

check_ref_exists() {
  local source_file="$1"
  local ref_path="$2"
  local resolved
  resolved="$(cd "$(dirname "$source_file")" && realpath -m "$ref_path")"
  if [[ -f "$resolved" || -d "$resolved" ]]; then
    pass "Reference from $source_file -> $ref_path"
  else
    fail "Broken reference from $source_file -> $ref_path"
    FAILED=1
  fi
}

echo "xstack doctor"
echo "root: $ROOT_DIR"
echo

check_file "README.md"
check_file "RELEASE_NOTES.md"
check_file "ROADMAP.md"
check_file "CONTRIBUTING.md"
check_file "MILESTONE_v0.3.0.md"
check_file "LICENSE"
check_dir "skills"
check_dir "packs"
check_dir "examples"
check_dir "scripts"
check_file "scripts/install.sh"
check_file "scripts/doctor.sh"

echo
for skill in skills/*; do
  [[ -d "$skill" ]] || continue
  if [[ -f "$skill/SKILL.md" ]]; then
    pass "Skill file present: $skill/SKILL.md"
  else
    fail "Missing SKILL.md in $skill"
    FAILED=1
  fi
done

echo
while IFS= read -r file; do
  while IFS= read -r ref; do
    ref_clean="${ref#\
}"
    check_ref_exists "$file" "$ref_clean"
  done < <(grep -oE '\.\./\.\./packs/[^` )]+' "$file" || true)
done < <(find skills -type f -name 'SKILL.md' | sort)

echo
while IFS= read -r doc; do
  if grep -q "codex-agent.git" "$doc"; then
    warn "Old repository URL found in $doc"
    WARNED=1
  fi
done < <(find . -maxdepth 2 -type f \( -name '*.md' -o -name '*.sh' \) -not -path './.git/*' -not -path './scripts/doctor.sh' | sort)

REMOVED_PACK_NAME="fastapi-""backend-pack"
FASTAPI_HITS="$(grep -Rni --exclude-dir=.git --exclude=doctor.sh "$REMOVED_PACK_NAME" . || true)"
if [[ -n "$FASTAPI_HITS" ]]; then
  warn "Found removed pack reference: $REMOVED_PACK_NAME"
  echo "$FASTAPI_HITS"
  WARNED=1
else
  pass "No removed FastAPI pack references found"
fi

echo
if [[ $FAILED -ne 0 ]]; then
  echo "xstack doctor finished with failures."
  exit 1
fi

if [[ $WARNED -ne 0 ]]; then
  echo "xstack doctor finished with warnings."
  exit 0
fi

echo "xstack doctor finished cleanly."
