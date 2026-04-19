---
created: 2026-04-18
permalink: claude/tasks/feat-knowledge-decisions-learnings-patte-27
state: active
tracking:
- https://github.com/SkogAI/claude/issues/27
---

# feat: knowledge/ — decisions, learnings, patterns

**Source**: [Github #27](https://github.com/SkogAI/claude/issues/27)

## Description

Structured knowledge base for a project: architectural decisions, session learnings, and reusable patterns.

## Structure

```
.skogai/knowledge/
├── decisions/    # architectural decision records (ADRs)
├── learnings/    # session-captured learnings (dated)
└── patterns/     # reusable patterns and style guides
```

- `decisions/` — when and why something was decided, alternatives considered
- `learnings/` — things discovered during the work (dated, searchable)
- `patterns/` — reusable approach

## Notes

*Imported from external tracker. See source link for full context.*

## Completion

- `knowledge/` exists with decision, lesson, and pattern structures populated
- `knowledge/DECISIONS.md` and `knowledge/SKOGAI.md` present
- seed entries and style pattern files are in place under `knowledge/decisions/`, `knowledge/lessons/`, and `knowledge/patterns/style/`

## Verification

- Confirmed files listed in task inventory are present in `knowledge/`

## Notes

*Imported from external tracker. Updated locally with completion details.*