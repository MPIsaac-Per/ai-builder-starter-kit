# Commitment system

The system separates captured ideas from active commitments.

The repository includes a local [`commitment-planner`](../.agents/skills/commitment-planner/SKILL.md) skill. It turns the records below into a user-approved semester, weekly, daily, change, or review workflow. It runs only during an active agent session and does not create background reminders or calendar events.

## Semester record

Keep one written outcome for each active area:

- Courses: the academic result being protected.
- Research: the result owed to the lab or program.
- Internship: the next application or relationship milestone.
- Build: one active experiment with an explicit evaluation condition.

Use [the semester template](../templates/semester-commitments.md).

## Daily record

The daily note names one result under `Finish today`, then preserves scheduled commitments, blocked work, captured ideas, and completed evidence.

Use [the daily template](../templates/daily-note.md).

## Rules

- Keep one build experiment active.
- Capture other ideas without starting them.
- A new commitment must displace, delay, or narrow an existing commitment.
- Define completion through observable evidence such as submitted, tested, published, presented, interviewed, or rejected after evaluation.
- Ask the agent to work from written records instead of reconstructing commitments from chat history.

## Weekly review prompt

```text
Read my Semester Commitments note and the last seven Daily notes.

Report completed commitments with file evidence. Identify active commitments that received no work, blocked work with no next action, and any new commitment that displaced nothing. Propose the smallest set of written commitments for the next week. Do not edit the vault until I approve the changes.
```

The same review can be requested with:

```text
Use the commitment-planner skill to review my current commitments.
```

## Removal

Archive `Semester Commitments.md` and stop using the daily template. Existing notes remain ordinary Markdown records. Delete `.agents/skills/commitment-planner/` to remove the skill.
