# Tiny project: task list

This example shows the repository artifacts surrounding a small command-line behavior.

## Paper trail

- [Context](CONTEXT.md)
- [Specification](docs/spec.md)
- [Work item](issues/001-task-list.md)
- [Implementation](src/task-list.mjs)
- [Behavior tests](../../tests/task-list.test.mjs)
- [Build evidence](docs/build-evidence.md)

## Run

```bash
node bin/task-list.mjs --data /tmp/tasks.json add "Read the spec"
node bin/task-list.mjs --data /tmp/tasks.json list
node bin/task-list.mjs --data /tmp/tasks.json done 1
```

## Verify

From the repository root:

```bash
npm test
```

## Removal

Delete `examples/tiny-project/` and `tests/task-list.test.mjs`, then remove the example links from the root documentation and verification required paths.
