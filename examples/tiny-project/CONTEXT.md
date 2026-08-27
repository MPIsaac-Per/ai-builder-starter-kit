# Task-list context

## Purpose

Demonstrate a complete development paper trail using a dependency-free command-line example.

## Vocabulary

- **Task**: a numbered title with an incomplete or complete status.
- **Data file**: a caller-selected JSON file containing the task list.
- **Builder**: the person invoking the command.

## Decisions

- The caller selects the data path so tests and experiments cannot overwrite personal files.
- JSON is used because it is inspectable with standard tools.
- The public seams are the exported task-list API and the command-line entrypoint.
