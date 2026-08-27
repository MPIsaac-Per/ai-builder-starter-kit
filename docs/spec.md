# Starter kit specification

- Status: approved local draft
- Tier: TIER-1 pre-user
- Version: 1

## User

A student or solo builder who wants a repeatable AI-assisted development and personal knowledge workflow.

## Job

Clone one public repository, verify the local prerequisites, follow one development loop, copy working templates, and inspect a complete example without exposing private material.

## Observable acceptance criteria

1. `./scripts/doctor.sh --json` emits valid JSON describing Git, Node, npm/npx, BB, Obsidian CLI, and coding-agent provider availability.
2. `./scripts/bootstrap.sh --dry-run` prints the official BB and Matt Pocock skill commands without executing a network or installation action.
3. `./scripts/verify.sh` validates required files, shell syntax, public-boundary patterns, behavior tests, and coverage thresholds.
4. The tiny example project can add, list, and complete tasks through its public command-line interface using a caller-selected data file.
5. The repository contains copyable agent, context, feature-specification, implementation-ticket, Obsidian daily-note, and semester-commitment templates.
6. A new contributor can find the setup path, contribution rules, security policy, issue forms, and pull-request checklist from the root README.
7. The published material contains no named mentee, undisclosed startup concept, private Atlas content, credentials, private email addresses, or local user paths.

## Test seams

- Shell command seam: arguments, exit status, and stdout/stderr from `scripts/*.sh`.
- Example CLI seam: arguments, exit status, stdout/stderr, and the JSON data file selected by the caller.
- Repository seam: required tracked paths and the public-boundary scan performed by `scripts/verify.sh`.

## Verification mapping

| Acceptance criterion | Evidence |
|---|---|
| 1 | `tests/test_scripts.sh`: `doctor emits valid JSON` |
| 2 | `tests/test_scripts.sh`: `bootstrap dry run is non-mutating` |
| 3 | `scripts/verify.sh` and `.github/workflows/verify.yml` |
| 4 | `examples/tiny-project/test/task-list.test.mjs` |
| 5 | `scripts/verify.sh`: required-path check |
| 6 | `scripts/verify.sh`: required-path check |
| 7 | `scripts/verify.sh`: public-boundary scan |

## Removal

The entire slice is removed by reverting the introducing commit or deleting the unpushed local repository. The example project, BB integration, and Obsidian templates are separate directories and can be removed independently.

## Metric

Record cycle time from this specification to the first external user who successfully runs `./scripts/verify.sh`.
