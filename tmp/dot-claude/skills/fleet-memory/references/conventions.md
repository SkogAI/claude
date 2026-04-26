---
title: conventions
type: note
permalink: claude/tmp/dot-claude/skills/fleet-memory/references/conventions
---

# Fleet Memory Conventions

Naming, metadata, and structural rules for fleet-memory workspaces.

## 1. File Naming

All paths use **lowercase-with-hyphens**. No spaces, underscores, or uppercase.

### Rules

- Directory names: `lowercase-with-hyphens`
- File names: `lowercase-with-hyphens.md`
- Checkpoints: `{NNN}-checkpoint.md` (NNN = zero-padded 3-digit: 001, 002, ...)
- Archive files: `{YYYY-MM-DD}-{description}.md`
- Scratch files: any name, agent's choice (private namespace, still lowercase-with-hyphens)
- Sequence numbers: always zero-padded 3-digit (001 through 999)

### Examples

| Good                             | Bad                             | Why                           |
| -------------------------------- | ------------------------------- | ----------------------------- |
| `ships/alpha-team/findings.md`   | `ships/Alpha_Team/findings.md`  | No uppercase, no underscores  |
| `001-checkpoint.md`              | `1-checkpoint.md`               | Zero-pad to 3 digits          |
| `2026-02-27-mission-summary.md`  | `Feb27_summary.md`              | ISO date prefix, hyphens only |
| `agents/captain-marsh/status.md` | `agents/captainMarsh/status.md` | No camelCase                  |
| `knowledge/patterns.md`          | `knowledge/Patterns.MD`         | Lowercase extension           |

______________________________________________________________________

## 2. Frontmatter Schema

Every memory file has YAML frontmatter. Fields are file-type-specific.

### briefing.md

```yaml
---
ship: {ship-name}
mission: {mission-name}
captain: {agent-name}
scope: [list of readable paths]
owns: [list of writable paths]
dependencies: [task IDs or ship names]
spawned: 2026-02-27T14:00:00Z
---
```

### findings.md

```yaml
---
ship: {ship-name}
author: {agent-name}
status: draft | complete | superseded
valid_from: 2026-02-27T14:00:00Z
supersedes: {file path or null}
---
```

### Checkpoint ({NNN}-checkpoint.md)

```yaml
---
sequence: 001
mission: {mission-name}
time: 2026-02-27T14:30:00Z
ships_reporting: [alpha, beta]
---
```

### status.md

```yaml
---
agent: {agent-name}
ship: {ship-name}
role: coordinator | captain | specialist
updated: 2026-02-27T14:00:00Z
---
```

### General writable file (from primitives.md)

```yaml
---
tier: state | entity | knowledge
scope: agent-private | ship-shared | fleet-wide
owner: {agent-name}
valid_from: 2026-02-27T14:00:00Z
---
```

### patterns.md entries (structured content, not frontmatter)

```markdown
### {pattern-name}
- **Evidence**: {count} observations across {count} missions
- **Confidence**: high | medium | low
- **Valid from**: 2026-02-27T14:00:00Z
- **Description**: ...
```

______________________________________________________________________

## 3. Directory Structure Rules

### Required contents

| Directory                      | Must contain                                    | Owner                                      |
| ------------------------------ | ----------------------------------------------- | ------------------------------------------ |
| `policy/`                      | standing-orders.md, roles.md, damage-control.md | read-only (no runtime writer)              |
| `state/`                       | mission-plan.md, checkpoints/                   | coordinator                                |
| `ships/{ship-name}/`           | briefing.md, findings.md                        | captain (findings), coordinator (briefing) |
| `ships/{ship}/agents/{agent}/` | status.md, scratch/                             | agent                                      |
| `knowledge/`                   | patterns.md, entities.md                        | coordinator                                |
| `archive/`                     | date-prefixed files only                        | coordinator                                |

### Structural constraints

- `policy/` is flat (no subdirectories)
- `state/` contains only mission-plan.md and checkpoints/
- `knowledge/` is flat
- `archive/` is flat, every file prefixed with `YYYY-MM-DD-`
- `scratch/` is the only freeform namespace (agent-private, any file names)

### Complete tree: 2-ship, 3-agent workspace

```
fleet-workspace/
  policy/
    standing-orders.md
    roles.md
    damage-control.md
  state/
    mission-plan.md
    checkpoints/
      001-checkpoint.md
      002-checkpoint.md
  ships/
    alpha/
      briefing.md
      findings.md
      agents/
        captain-marsh/
          status.md
          scratch/
            notes.md
        researcher-one/
          status.md
          scratch/
    beta/
      briefing.md
      findings.md
      agents/
        captain-crane/
          status.md
          scratch/
  knowledge/
    patterns.md
    entities.md
  archive/
    2026-02-27-alpha-initial-findings.md
```

______________________________________________________________________

## 4. Metadata Conventions

### Timestamps

All dates and times use **ISO 8601**: `YYYY-MM-DDTHH:MM:SSZ`

- Always include time component (not just date)
- Always use UTC (Z suffix)
- Example: `2026-02-27T14:30:00Z`

### Status vocabularies

Fixed values. No synonyms, no abbreviations.

| Domain | Allowed values                                   |
| ------ | ------------------------------------------------ |
| Task   | `pending`, `in_progress`, `completed`, `blocked` |
| File   | `draft`, `complete`, `superseded`, `deprecated`  |
| Agent  | `active`, `idle`, `terminated`                   |
| Ship   | `active`, `completed`, `failed`                  |

### Identifiers

- Agent names: lowercase-with-hyphens (e.g., `captain-marsh`), never UUID
- Ship names: lowercase-with-hyphens (e.g., `alpha-team`)
- Owner references: always agent name, matching the agent's directory name
- Scope paths: relative from workspace root (e.g., `ships/alpha/findings.md`, not absolute paths)

### Sequence numbers

- Always zero-padded to 3 digits: `001`, `002`, ..., `999`
- Sequential with no gaps (if 003 is deleted, next is still 004)
- Used for checkpoints only

______________________________________________________________________

## 5. Content Structure Rules

### Markdown formatting

- `#` for file title (one per file)
- `##` for sections
- `###` for subsections
- Maximum 3 header levels. No `####` or deeper.

### Tables

Pipe-delimited with header separator:

```markdown
| Name | Role | Ship | Status |
|------|------|------|--------|
| captain-marsh | captain | alpha | active |
```

### Lists and code

- Use `-` for unordered lists, never `*`
- Code blocks: triple backtick with language tag (```` ```markdown ````, ```` ```yaml ````)
- Inline code: single backtick for file paths, field names, values

### Whitespace

- One blank line between sections
- No trailing whitespace on any line
- File ends with single newline (no trailing blank lines)
- No blank lines inside tables

### Content principle

Replace, don't append. When updating a file, overwrite the content entirely. Update `valid_from` to current timestamp. Git handles version history.

______________________________________________________________________

## 6. Validation Checklist

Run before writing any file:

- [ ] Filename uses lowercase-with-hyphens only (no spaces, underscores, uppercase)
- [ ] File extension is `.md`
- [ ] Frontmatter contains all required fields for this file type (see Section 2)
- [ ] All dates are ISO 8601 with time and Z suffix
- [ ] All status values are from the approved vocabulary (see Section 4)
- [ ] File has a single designated owner matching the writing agent
- [ ] Owner field matches agent's actual name
- [ ] File path is within agent's ownership scope
- [ ] No duplicate `#` headers (one title per file)
- [ ] Header depth does not exceed `###`
- [ ] Tables have header + separator + data rows
- [ ] Lists use `-` not `*`
- [ ] File ends with single newline
- [ ] Checkpoint sequence number is zero-padded 3-digit
- [ ] Archive filename starts with `YYYY-MM-DD-`
- [ ] No absolute paths in scope references (use workspace-relative)

______________________________________________________________________

**Reference Version**: 1.0.0 **Companion to**: fleet-memory SKILL.md
