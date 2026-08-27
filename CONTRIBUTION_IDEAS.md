# Contribution ideas

Each idea below should become one issue before implementation. The contributor should narrow it to one observable outcome and add verification.

## Verify another setup path

Run the starter kit on Linux or Windows through WSL2. Record the exact prerequisite gap, add a repeatable check, and update only the affected setup instructions.

## Add a second example

Create a small browser interface or research utility that demonstrates a different public test seam. Include context, a specification, one bounded work item, behavior tests, and removal instructions.

## Check relative links in the repository gate

Move the current ad hoc relative-link verification into a dependency-free script with behavior tests. Keep external URL health outside the local gate because it depends on network state.

## Add an Obsidian vault scaffold

Create a script that generates the documented folders and templates into a caller-selected empty directory. It must refuse non-empty destinations unless the user selects a safe merge mode.

## Improve upstream freshness checks

Add a read-only command that reports whether the documented BB, skills installer, and Obsidian CLI sources have changed since the date in `UPSTREAMS.md`. It must not update files automatically.

## Contribution boundary

Do not use a personal project, unpublished product idea, private conversation, credential, or employer material as an example. Use invented data and primary-source links.
