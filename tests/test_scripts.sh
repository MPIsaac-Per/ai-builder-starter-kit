#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

fail() {
  echo "FAIL: $1" >&2
  exit 1
}

dry_run_output="$(bash "$ROOT_DIR/scripts/bootstrap.sh" --dry-run)"
[[ "$dry_run_output" == *"npx bb-app@latest"* ]] || fail "bootstrap dry run omitted BB"
[[ "$dry_run_output" == *"npx skills@latest add mattpocock/skills"* ]] || fail "bootstrap dry run omitted skills"

if bash "$ROOT_DIR/scripts/bootstrap.sh" --unknown >/dev/null 2>&1; then
  fail "bootstrap accepted an unknown argument"
fi

doctor_output="$(bash "$ROOT_DIR/scripts/doctor.sh" --json)"
node -e 'const value = JSON.parse(process.argv[1]); if (typeof value.ready !== "boolean") process.exit(1)' "$doctor_output" \
  || fail "doctor did not emit valid readiness JSON"

commitment_skill="$ROOT_DIR/.agents/skills/commitment-planner/SKILL.md"
[[ -f "$commitment_skill" ]] || fail "commitment planner skill is missing"
grep -Fxq 'name: commitment-planner' "$commitment_skill" \
  || fail "commitment planner name is invalid"
grep -Fq 'description:' "$commitment_skill" \
  || fail "commitment planner description is missing"
grep -Fq 'displace, delay, or narrow' "$commitment_skill" \
  || fail "commitment planner omits the displacement rule"
grep -Fq 'Do not create background jobs' "$commitment_skill" \
  || fail "commitment planner permits background automation"
grep -Fq 'Do not modify records until the user approves' "$commitment_skill" \
  || fail "commitment planner omits the approval boundary"

echo "PASS: script public interfaces"
