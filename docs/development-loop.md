# Development loop

## 1. Clarify

Start with the user, their job, and the behavior that will show success. Ask the agent to find facts in the repository and official sources. Reserve human questions for product decisions.

Use `grill-with-docs` inside a repository so decisions remain in `CONTEXT.md` and architecture decision records. Use `grill-me` for a decision that has no working directory or durable repository record.

## 2. Specify

Write a versioned specification containing:

- User and job
- Observable acceptance criteria
- Testing seams
- Scope and exclusions
- Removal path

Use [the feature specification template](../templates/feature-spec.md).

## 3. Slice

Split the specification into work items that each produce one observable result. A work item should state its ownership boundary, verification command, blockers, and approval gates.

Use [the implementation ticket template](../templates/implementation-ticket.md).

## 4. Implement

Work through one vertical behavior at a time:

1. Write a test through the agreed public seam.
2. Run it and capture the expected failure.
3. Write the smallest implementation that passes.
4. Run the focused test again.
5. Continue only after the slice is green.

Avoid tests that mock internal code, call private functions, or repeat the implementation inside the expected value.

## 5. Verify

Run the repository's focused test during development. Run the full gate before review. Save the exact command and output that support each acceptance claim.

For this repository:

```bash
./scripts/verify.sh
```

## 6. Review

Review the diff along separate axes:

- Standards: does the change follow the repository's written rules?
- Specification: does it implement the accepted behavior without extra scope?

Resolve findings before merge. Publication and deployment remain human decisions.

## Removal

Remove this guide by deleting `docs/development-loop.md` and its links from `README.md` and `START-HERE.md`.
