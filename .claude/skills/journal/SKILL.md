---
name: journal
description: write or review session journal entries at personal/journal/YYYY-MM-DD/<description>.md — invoke when recording session notes, decisions, or insights worth preserving
---

<objective>
Create append-only journal entries following personal/journal/CONVENTIONS.md exactly.
Entries are immutable snapshots — content cannot change after writing, formatting corrections only.
</objective>

<quick_start>
Default: write a new entry for today.
Path: `personal/journal/YYYY-MM-DD/<kebab-slug>.md`
Requires: YAML frontmatter (copy templates/entry.md)
</quick_start>

<intake>
What do you need?

1. Write a new entry (default — go here if intent is clear)
2. Review recent entries
3. Check conventions
</intake>

<routing>
| Intent | Next |
|--------|------|
| write, new, record, log, wrapup phase 4, session end | workflows/write-entry.md |
| review, read, recent, list, what was written | list `personal/journal/` newest-first |
| conventions, rules, format, how, where | references/conventions.md |
</routing>

<reference_index>
- **conventions:** references/conventions.md — canonical rules, @ links to CONVENTIONS.md
- **template:** templates/entry.md — copy and fill for every entry
</reference_index>
