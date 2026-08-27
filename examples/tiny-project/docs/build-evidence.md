# Build evidence

## Setup scripts

Red command:

```bash
bash tests/test_scripts.sh
```

Observed failure: `scripts/bootstrap.sh` did not exist.

Green command:

```bash
bash tests/test_scripts.sh
```

Observed result: `PASS: script public interfaces`.

## Task-list API

Red command:

```bash
npm test
```

Observed failure: the `examples/tiny-project/src/task-list.mjs` module did not exist.

Green coverage after the API implementation and command-line entrypoint:

```text
line 97.37% | branch 94.29% | functions 100.00%
```

The current verification command is authoritative if these recorded figures become stale.
