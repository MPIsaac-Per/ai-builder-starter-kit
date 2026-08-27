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

echo "PASS: script public interfaces"
