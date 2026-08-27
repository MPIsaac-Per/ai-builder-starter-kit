#!/usr/bin/env bash
set -euo pipefail

format="human"

case "${1:-}" in
  "") ;;
  --json) format="json" ;;
  --help|-h)
    echo "Usage: ./scripts/doctor.sh [--json|--help]"
    exit 0
    ;;
  *)
    echo "Usage: ./scripts/doctor.sh [--json|--help]" >&2
    exit 2
    ;;
esac

has_command() {
  command -v "$1" >/dev/null 2>&1
}

bool_for() {
  if has_command "$1"; then
    echo true
  else
    echo false
  fi
}

git_ready="$(bool_for git)"
node_ready="$(bool_for node)"
npm_ready="$(bool_for npm)"
npx_ready="$(bool_for npx)"
bb_ready="$(bool_for bb)"
obsidian_ready="$(bool_for obsidian)"

provider="none"
for candidate in codex claude opencode pi; do
  if has_command "$candidate"; then
    provider="$candidate"
    break
  fi
done

ready=false
if [[ "$git_ready" == true && "$node_ready" == true && "$npm_ready" == true && "$npx_ready" == true && "$provider" != none ]]; then
  ready=true
fi

if [[ "$format" == json ]]; then
  printf '{"git":%s,"node":%s,"npm":%s,"npx":%s,"bb":%s,"obsidian":%s,"provider":"%s","ready":%s}\n' \
    "$git_ready" "$node_ready" "$npm_ready" "$npx_ready" "$bb_ready" "$obsidian_ready" "$provider" "$ready"
  exit 0
fi

echo "AI Builder Starter Kit doctor"
printf '  Git:          %s\n' "$git_ready"
printf '  Node:         %s\n' "$node_ready"
printf '  npm:          %s\n' "$npm_ready"
printf '  npx:          %s\n' "$npx_ready"
printf '  BB CLI:       %s (optional when using npx bb-app@latest)\n' "$bb_ready"
printf '  Obsidian CLI: %s (needed only for the knowledge-system path)\n' "$obsidian_ready"
printf '  Provider:     %s\n' "$provider"
printf '  Ready:        %s\n' "$ready"

if [[ "$ready" != true ]]; then
  echo
  echo "Install Git, a current Node.js release, and one supported coding-agent CLI."
fi
