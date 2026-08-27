# Task-list specification

## User

A builder learning the starter kit's development loop.

## Job

Create, inspect, and complete tasks in a caller-selected local JSON file.

## Acceptance criteria

1. Adding a title creates the next numbered incomplete task.
2. Listing shows each task's status, number, and title.
3. Completing a known number persists its complete status.
4. Missing titles, unknown task numbers, malformed data, and invalid commands return clear errors.

## Test seams

- Exported task-list API for behavior and persistence.
- Command-line entrypoint for argument, status, and output smoke coverage.

## Exclusions

- Synchronization, accounts, due dates, priorities, deletion, and network access.

## Removal

Delete the example directory and its root behavior test.
