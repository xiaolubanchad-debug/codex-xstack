#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCRIPTS_DIR="$ROOT_DIR/scripts"

usage() {
  cat <<'EOF'
Usage:
  ./scripts/xstack.sh <command> [args...]

Commands:
  doctor                     Run repository validation
  build-index                Generate SKILLS_INDEX.md and PACKS_INDEX.md
  recommend [args...]        Run the workflow recommender
  test-recommend             Run recommender fixture tests
  install <target-dir>       Install skills/ and packs/ into a target directory
  help                       Show this help

Examples:
  ./scripts/xstack.sh doctor
  ./scripts/xstack.sh build-index
  ./scripts/xstack.sh recommend "nextjs prisma feature"
  ./scripts/xstack.sh recommend --task backend --stack "nestjs prisma" --risk sensitive --json
  ./scripts/xstack.sh test-recommend
  ./scripts/xstack.sh install ~/my-codex/xstack

Notes:
  - This is a lightweight unified entrypoint for the repository scripts.
  - It is not yet a packaged CLI.
EOF
}

COMMAND="${1:-help}"
shift || true

case "$COMMAND" in
  doctor)
    exec "$SCRIPTS_DIR/doctor.sh" "$@"
    ;;
  build-index)
    exec "$SCRIPTS_DIR/build-index.sh" "$@"
    ;;
  recommend)
    exec "$SCRIPTS_DIR/recommend.sh" "$@"
    ;;
  test-recommend)
    exec "$SCRIPTS_DIR/test-recommend.sh" "$@"
    ;;
  install)
    exec "$SCRIPTS_DIR/install.sh" "$@"
    ;;
  help|-h|--help)
    usage
    ;;
  *)
    echo "Unknown command: $COMMAND" >&2
    echo >&2
    usage >&2
    exit 1
    ;;
esac
