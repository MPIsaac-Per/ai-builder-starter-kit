# Start here

## 1. Check your machine

```bash
./scripts/doctor.sh
```

You need Git, Node.js 22.19 or newer, npm/npx, and one coding-agent CLI. BB can run through `npx`, so a global BB command is optional.

## 2. Read the installation plan

```bash
./scripts/bootstrap.sh --dry-run
```

The default is read-only. To launch the interactive upstream skill installer:

```bash
./scripts/bootstrap.sh --install-skills
```

Review the source and permissions of third-party skills before installing them.

## 3. Copy the repository instructions

For a new project, copy and edit:

```text
templates/AGENTS.md
templates/CONTEXT.md
templates/feature-spec.md
templates/implementation-ticket.md
```

Give the agent the specification before asking it to implement.

## 4. Inspect the example

```bash
node examples/tiny-project/bin/task-list.mjs --data /tmp/tasks.json add "Read the spec"
node examples/tiny-project/bin/task-list.mjs --data /tmp/tasks.json list
npm test
```

The example includes its context, specification, work item, implementation, and behavior tests.

## 5. Add the knowledge system

Read [docs/obsidian-setup.md](docs/obsidian-setup.md), then copy the daily and semester templates into your own vault. Ask your coding agent to use the repository-local `commitment-planner` skill to plan or review those records.

## 6. Run the gate

```bash
./scripts/verify.sh
```

Do not merge or publish a change that fails this command.
