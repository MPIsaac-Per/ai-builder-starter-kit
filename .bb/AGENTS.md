# BB workspace instructions

- Read the root `AGENTS.md`, `CONTEXT.md`, and current specification before changing behavior.
- Give one thread one bounded ownership area.
- Use isolated worktrees for overlapping implementation.
- Preserve the public-content boundary.
- Run `./scripts/verify.sh` before reporting completion.
- Leave publishing, deployment, and destructive actions for human approval.
