#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

usage() {
  cat <<'EOF'
Usage:
  ./scripts/install.sh <target-dir>

What it does:
  - Copies xstack's skills/ and packs/ into <target-dir>
  - Preserves the relative paths required by SKILL.md references

Examples:
  ./scripts/install.sh ~/my-codex/xstack
  ./scripts/install.sh ./vendor/xstack

Notes:
  - The target directory should be a place your Codex setup can read from.
  - This script does not try to guess your Codex runtime's skill directory.
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

if [[ $# -ne 1 ]]; then
  usage
  exit 1
fi

TARGET_DIR="$1"
mkdir -p "$TARGET_DIR"
mkdir -p "$TARGET_DIR/skills" "$TARGET_DIR/packs"

cp -R "$REPO_DIR/skills/." "$TARGET_DIR/skills/"
cp -R "$REPO_DIR/packs/." "$TARGET_DIR/packs/"

cat <<EOF
xstack installed successfully.

Source:
  $REPO_DIR

Installed to:
  $TARGET_DIR

Installed paths:
  $TARGET_DIR/skills
  $TARGET_DIR/packs

Next step:
  Point your Codex setup at this target directory, or keep the repo in a location your workflow already reads from.
EOF
