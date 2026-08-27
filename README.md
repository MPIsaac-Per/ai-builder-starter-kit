# AI Builder Starter Kit

A public starter repository for students and solo builders using coding agents. It gives you one development loop, copyable repository instructions, BB worktree guidance, an Obsidian knowledge system, and a tested example.

## Start

```bash
git clone https://github.com/MPIsaac-Per/ai-builder-starter-kit.git
cd ai-builder-starter-kit
./scripts/doctor.sh
./scripts/bootstrap.sh --dry-run
./scripts/verify.sh
```

Continue with [START-HERE.md](START-HERE.md).

## The development loop

```text
clarify → specify → slice → implement → verify → review
```

1. Clarify uncertain decisions with `grill-with-docs`.
2. Use a throwaway prototype when runnable code must answer a design question.
3. Turn settled decisions into a specification and bounded tickets.
4. Implement one behavior at a time through a public test seam.
5. Run repository verification and review the diff against the specification.

See [docs/development-loop.md](docs/development-loop.md).

## What is included

- [Development loop](docs/development-loop.md) and [BB workbench](docs/bb-workbench.md)
- [Obsidian setup](docs/obsidian-setup.md) and [commitment system](docs/commitment-system.md)
- Copyable files under [`templates/`](templates/)
- A complete, tested [`tiny-project`](examples/tiny-project/README.md)
- Contribution, security, and publication checks for a public repository

## Verification

```bash
./scripts/verify.sh
```

The command checks required paths, shell syntax, script behavior, the example project's tests and coverage, and the public-content boundary.

## Upstream projects

This repository links to maintained upstream tools instead of copying them:

- [Matt Pocock's engineering skills](https://github.com/mattpocock/skills)
- [BB](https://github.com/get-bb/bb)
- [Obsidian Help](https://obsidian.md/help/)

See [UPSTREAMS.md](UPSTREAMS.md) for the commands verified for this draft.

## Contributing

Start with [CONTRIBUTING.md](CONTRIBUTING.md) and [CONTRIBUTION_IDEAS.md](CONTRIBUTION_IDEAS.md). A useful contribution reports the problem it solves, the evidence that proves the change, and any removal instructions.

Before creating a public remote, use the [publication checklist](docs/publication-checklist.md).

## License

[MIT](LICENSE)
