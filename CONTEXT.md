# Domain context

## Purpose

This repository helps a student or solo builder use AI coding agents without surrendering product decisions, verification, or control of publication.

## Vocabulary

- **Builder**: the human who owns the goal and approves decisions.
- **Agent**: a coding or research system working under repository instructions.
- **Development loop**: clarify, specify, slice, implement, verify, review.
- **Starter kit**: the documentation, templates, scripts, and example project in this repository.
- **Work item**: one bounded user outcome with observable acceptance criteria.
- **Evidence**: command output or a behavior test that directly supports a completion claim.
- **Public boundary**: the rule excluding personal records, confidential material, credentials, and machine-specific configuration.

## Decisions

- The kit remains useful without paid services beyond the builder's chosen coding-agent provider.
- Third-party skills are installed from their maintained upstream repositories rather than copied here.
- The example project uses Node's standard library and built-in test runner.
- Setup scripts are read-only unless the user passes an explicit installation flag.
