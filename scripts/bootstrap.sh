#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: ./scripts/bootstrap.sh [--dry-run|--install-skills|--help]"
}

print_plan() {
  cat <<'PLAN'
1. Check the machine:
   ./scripts/doctor.sh

2. Start BB:
   npx bb-app@latest

3. Install the maintained engineering skills from the repository root:
   npx skills@latest add mattpocock/skills

   Select setup-matt-pocock-skills, ask-matt, grill-with-docs,
   to-spec, to-tickets, implement, tdd, diagnosing-bugs, and code-review.

4. In the coding agent, run:
   /setup-matt-pocock-skills
PLAN
}

mode="${1:---dry-run}"

case "$mode" in
  --dry-run)
    print_plan
    ;;
  --install-skills)
    command -v npx >/dev/null 2>&1 || {
      echo "npx is required. Install a current Node.js release first." >&2
      exit 1
    }
    echo "Running the interactive upstream skills installer."
    exec npx skills@latest add mattpocock/skills
    ;;
  --help|-h)
    usage
    ;;
  *)
    usage >&2
    exit 2
    ;;
esac
