#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

required_paths=(
  README.md
  START-HERE.md
  AGENTS.md
  CONTEXT.md
  CONTRIBUTION_IDEAS.md
  .github/CODEOWNERS
  docs/spec.md
  docs/development-loop.md
  docs/bb-workbench.md
  docs/obsidian-setup.md
  docs/commitment-system.md
  .agents/skills/commitment-planner/SKILL.md
  templates/AGENTS.md
  templates/CONTEXT.md
  templates/feature-spec.md
  templates/implementation-ticket.md
  templates/daily-note.md
  templates/semester-commitments.md
  examples/tiny-project/README.md
  examples/tiny-project/src/task-list.mjs
  examples/tiny-project/bin/task-list.mjs
  CONTRIBUTING.md
  SECURITY.md
  LICENSE
)

for required_path in "${required_paths[@]}"; do
  [[ -f "$required_path" ]] || {
    echo "Missing required path: $required_path" >&2
    exit 1
  }
done

bash -n scripts/bootstrap.sh scripts/doctor.sh scripts/verify.sh tests/test_scripts.sh .bb-env-setup.sh
bash tests/test_scripts.sh
npm test

private_patterns=(
  "Matthew"" Ivey"
  "Synapse""Dx"
  "michael""@mpiv.ai"
  "/Users/""michaelisaac"
  "BEGIN ""PRIVATE KEY"
  "op:""//"
)

for private_pattern in "${private_patterns[@]}"; do
  if grep -RInF \
    --exclude-dir=.git \
    --exclude=verify.sh \
    -- "$private_pattern" . >/dev/null; then
    echo "Public-boundary pattern found: $private_pattern" >&2
    exit 1
  fi
done

echo "PASS: repository verification"
