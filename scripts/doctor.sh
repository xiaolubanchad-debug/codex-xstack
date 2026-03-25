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
check_file "MILESTONE_v0.3.x.md"
check_file "START_HERE.md"
check_file "QUICKSTART.md"
check_file "ANTI_PATTERNS.md"
check_file "METADATA.md"
check_file "LICENSE"
check_dir "skills"
check_dir "packs"
check_dir "examples"
check_dir "scripts"
check_dir "config"
check_file "config/recommend-rules.json"
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

  if [[ -f "$skill/skill.json" ]]; then
    pass "Skill metadata present: $skill/skill.json"
  else
    fail "Missing skill metadata: $skill/skill.json"
    FAILED=1
  fi
done

echo
for pack in packs/*.md; do
  [[ -f "$pack" ]] || continue
  json_path="${pack%.md}.json"
  if [[ -f "$json_path" ]]; then
    pass "Pack metadata present: $json_path"
  else
    fail "Missing pack metadata: $json_path"
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
METADATA_CHECK_OUTPUT="$(python3 - <<'PY'
import glob
import json
import os
import sys

errors = []
passes = []

skill_categories = {"core", "review", "extended", "control"}
pack_scopes = {"frontend", "backend", "fullstack", "data", "security", "quality", "operations", "platform"}

skill_dirs = sorted([p for p in glob.glob('skills/*') if os.path.isdir(p)])
skill_names = {os.path.basename(p) for p in skill_dirs}
pack_md_files = sorted(glob.glob('packs/*.md'))
pack_names = {os.path.splitext(os.path.basename(p))[0] for p in pack_md_files}

for skill_dir in skill_dirs:
    name = os.path.basename(skill_dir)
    path = os.path.join(skill_dir, 'skill.json')
    if not os.path.isfile(path):
        continue
    try:
        with open(path, 'r', encoding='utf-8') as f:
            data = json.load(f)
    except Exception as e:
        errors.append(f"Invalid JSON in {path}: {e}")
        continue

    required = ['name', 'type', 'category', 'summary', 'entry']
    for field in required:
        if field not in data:
            errors.append(f"Missing field '{field}' in {path}")

    if data.get('name') != name:
        errors.append(f"Skill metadata name mismatch in {path}: expected '{name}', found '{data.get('name')}'")
    if data.get('type') != 'skill':
        errors.append(f"Skill metadata type must be 'skill' in {path}")
    if data.get('category') not in skill_categories:
        errors.append(f"Invalid skill category in {path}: {data.get('category')}")
    entry = data.get('entry')
    if entry and not os.path.isfile(os.path.join(skill_dir, entry)):
        errors.append(f"Skill entry does not exist for {path}: {entry}")
    if not isinstance(data.get('summary'), str) or not data.get('summary', '').strip():
        errors.append(f"Skill summary must be a non-empty string in {path}")

    triggers = data.get('triggers', [])
    if triggers and not isinstance(triggers, list):
        errors.append(f"Skill triggers must be an array in {path}")
    recommended = data.get('recommendedWith', [])
    if recommended and not isinstance(recommended, list):
        errors.append(f"Skill recommendedWith must be an array in {path}")
    else:
        for ref in recommended:
            if ref not in skill_names:
                errors.append(f"Unknown recommended skill '{ref}' in {path}")
    packs = data.get('packs', [])
    if packs and not isinstance(packs, list):
        errors.append(f"Skill packs must be an array in {path}")
    else:
        for ref in packs:
            if ref not in pack_names:
                errors.append(f"Unknown pack '{ref}' in {path}")

    passes.append(f"Validated skill metadata: {path}")

for pack_md in pack_md_files:
    name = os.path.splitext(os.path.basename(pack_md))[0]
    path = os.path.join('packs', name + '.json')
    if not os.path.isfile(path):
        continue
    try:
        with open(path, 'r', encoding='utf-8') as f:
            data = json.load(f)
    except Exception as e:
        errors.append(f"Invalid JSON in {path}: {e}")
        continue

    required = ['name', 'type', 'scope', 'summary', 'entry']
    for field in required:
        if field not in data:
            errors.append(f"Missing field '{field}' in {path}")

    if data.get('name') != name:
        errors.append(f"Pack metadata name mismatch in {path}: expected '{name}', found '{data.get('name')}'")
    if data.get('type') != 'pack':
        errors.append(f"Pack metadata type must be 'pack' in {path}")
    if data.get('scope') not in pack_scopes:
        errors.append(f"Invalid pack scope in {path}: {data.get('scope')}")
    entry = data.get('entry')
    if entry and not os.path.isfile(os.path.join('packs', entry)):
        errors.append(f"Pack entry does not exist for {path}: {entry}")
    if not isinstance(data.get('summary'), str) or not data.get('summary', '').strip():
        errors.append(f"Pack summary must be a non-empty string in {path}")

    best_fit = data.get('bestFitSkills', [])
    if best_fit and not isinstance(best_fit, list):
        errors.append(f"Pack bestFitSkills must be an array in {path}")
    else:
        for ref in best_fit:
            if ref not in skill_names:
                errors.append(f"Unknown best-fit skill '{ref}' in {path}")

    passes.append(f"Validated pack metadata: {path}")

for line in passes:
    print("PASS|" + line)
for line in errors:
    print("FAIL|" + line)
PY
)"

while IFS= read -r line; do
  [[ -n "$line" ]] || continue
  if [[ "$line" == PASS\|* ]]; then
    pass "${line#PASS|}"
  elif [[ "$line" == FAIL\|* ]]; then
    fail "${line#FAIL|}"
    FAILED=1
  fi
done <<< "$METADATA_CHECK_OUTPUT"

echo
while IFS= read -r doc; do
  if grep -q "codex-agent.git" "$doc"; then
    warn "Old repository URL found in $doc"
    WARNED=1
  fi
done < <(find . -maxdepth 2 -type f \( -name '*.md' -o -name '*.sh' -o -name '*.json' \) -not -path './.git/*' -not -path './scripts/doctor.sh' | sort)

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
