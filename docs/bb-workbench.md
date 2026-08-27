# BB workbench

BB is an agent workspace that can run Codex, Claude Code, Cursor, Pi, OpenCode, and other supported providers in steerable threads.

## Install or start

```bash
npx bb-app@latest
```

Open the local URL printed by BB. Authenticate the provider CLI you intend to use.

## Repository configuration

Track these files:

- `AGENTS.md` for provider-native repository instructions.
- `.bb/AGENTS.md` for BB's provider-independent instruction injection.
- `.bb-env-setup.sh` for setup in new BB-managed worktrees.

Keep secrets out of tracked files. If a future project must copy an untracked environment file into a new worktree, use `.worktreeinclude` with the narrowest possible patterns. Review that decision before committing the pattern.

## Thread pattern

- Keep one parent thread responsible for the accepted outcome and decisions.
- Give each bounded work item one owner and one thread.
- Use isolated worktrees for implementation that may overlap or fail.
- Steer a running thread when a requirement changes.
- Inspect the diff and command evidence before accepting the result.

## Prompt contract

Every implementation prompt should state:

```text
Objective:
Owned files or module:
Excluded scope:
Acceptance behavior:
Verification commands:
Human approval gates:
Report back with changed files, evidence, and blockers.
```

## Worktree setup

BB runs a tracked `.bb-env-setup.sh` after creating a managed worktree. Keep the hook deterministic and small. A failing hook prevents BB from keeping the worktree.

This repository's hook runs the read-only doctor command. The full verification remains an explicit development and review gate.

## Removal

Delete `.bb/AGENTS.md` and `.bb-env-setup.sh` to remove BB-specific repository behavior. The remaining material still works with provider-native agents.
