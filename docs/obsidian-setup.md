# Obsidian setup

Obsidian stores Markdown files in a local folder called a vault. The same files can be searched and edited by a coding agent.

## Vault structure

```text
Inbox/
Daily/
Courses/
Research/
Projects/
People/
Templates/
Archive/
```

Use one vault. Nested vaults break the assumption that internal links share one root.

## Core capabilities

Enable Daily notes and Templates. Keep Backlinks, Outgoing links, Properties, Search, and Command palette available. Add community plugins only after a repeated need appears and you have reviewed their permissions and source.

## Durable-note shape

```yaml
---
title: "Descriptive title"
created: "YYYY-MM-DD"
type: "course|research|project|person|meeting|decision"
status: "active|waiting|complete|archived"
tags:
  - "topic/example"
---
```

Each durable note should answer one question or represent one thing. End it with links to related notes whose relationship you have verified.

## Agent access

Enable Settings → General → Command line interface in a compatible Obsidian desktop installation.

```bash
obsidian search query="internship"
obsidian read path="Projects/Semester Commitments.md"
obsidian daily
obsidian tasks daily
obsidian backlinks path="Projects/Current Project.md"
```

Copy [templates/AGENTS.md](../templates/AGENTS.md) to the vault root and tailor the filing rules to your folders.

## Templates

- [Daily note](../templates/daily-note.md)
- [Semester commitments](../templates/semester-commitments.md)

## Removal

The vault remains ordinary Markdown if Obsidian or the CLI is removed. Delete only the `.obsidian` configuration folder to remove Obsidian-specific settings; preserve the notes.
