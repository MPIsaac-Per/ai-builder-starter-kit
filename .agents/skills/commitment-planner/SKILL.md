---
name: commitment-planner
description: >-
  Run a user-approved commitment planning and follow-through workflow over
  Obsidian or Markdown records. Use for semester planning, weekly planning,
  daily prioritization, idea capture, workload conflicts, commitment changes,
  blocked-work review, or evidence-based completion audits. Read existing
  Semester Commitments and Daily notes, preserve one active build, require
  each new commitment to displace, delay, or narrow existing work, and require
  observable completion evidence. Do not use for passive note-taking,
  autonomous calendar changes, background reminders, or unsupervised edits.
metadata:
  short-description: Plan and audit written commitments
---

# Commitment Planner

Turn written commitments into a deliberate plan during an active agent session. Do not create background jobs, recurring reminders, or calendar events.

Work from the user's records. Do not infer deadlines, available time, or obligations that are not documented.

## Records

Use these records when available:

- `Semester Commitments`, with sections for courses, research, internships, one active build, captured ideas, and displacement history.
- Daily notes, with sections for `Finish today`, scheduled commitments, blocked work, captured ideas, and completed evidence.

Find records by title and frontmatter before assuming a file path.

When initializing the system, use these repository templates if present:

- [`templates/semester-commitments.md`](../../../templates/semester-commitments.md)
- [`templates/daily-note.md`](../../../templates/daily-note.md)
- [`docs/commitment-system.md`](../../../docs/commitment-system.md)

## Select a mode

Choose the narrowest mode that matches the request.

### Semester

Establish one written outcome for each active area:

- Courses
- Research
- Internship
- Active build

Keep inactive possibilities under `Captured ideas`.

### Week

Read the semester record and the previous seven daily notes.

Identify:

- Commitments that require attention this week
- Fixed obligations supplied by the user
- Blocked work without a next action
- Commitments that received no work
- Conflicts between available time and active commitments

Propose the smallest viable set of weekly commitments.

### Today

Read the active commitments and the most recent daily note.

Propose:

1. One observable result under `Finish today`
2. Fixed scheduled commitments
3. Supporting work that fits around those commitments
4. A next action for blocked work

Use time blocks only when the user or a connected calendar provides them.

### Change

When the user wants to activate a new commitment:

1. Capture the proposed outcome and its completion evidence.
2. Identify the existing commitment it would displace, delay, or narrow.
3. Present the tradeoff.
4. Wait for approval.
5. Update the commitment record and displacement log.

If the user does not accept the tradeoff, leave the idea under `Captured ideas`.

### Review

Compare written commitments with completed evidence.

Report:

- Completed commitments and their evidence
- Active commitments with no recorded work
- Blocked commitments without a next action
- New commitments that displaced nothing
- Items repeatedly carried forward
- Decisions requiring the user's attention

Do not mark work complete without observable evidence.

## Operating rules

- Keep one outcome for each active area.
- Keep no more than one active build experiment.
- Captured ideas are not active commitments.
- Every new commitment must displace, delay, or narrow an existing commitment.
- Define completion with evidence such as submitted, tested, published, presented, interviewed, or deliberately rejected after evaluation.
- Preserve fixed obligations before allocating discretionary work.
- Do not silently carry unfinished work forward.
- Do not reconstruct commitments from chat when written records exist.
- Do not modify records until the user approves the proposed changes.
- Do not write to external calendars or task systems without an explicit request and separate authorization.

## Change workflow

Before editing, present a compact proposal:

| Area | Current commitment | Proposed change | Tradeoff | Completion evidence |
|---|---|---|---|---|

After approval:

1. Edit only the agreed records.
2. Preserve unrelated content.
3. Read back the resulting commitments.
4. Report the files changed and the next written commitment.
