---
state: new
created: 2026-03-06
tracking: ["https://github.com/SkogAI/claude/issues/34"]
tags: ["enhancement", "github"]
---

# audit: review which CLAUDE.md @-references should be auto-loaded

**Source**: [Github #34](https://github.com/SkogAI/claude/issues/34)

## Description

## Problem

The CLAUDE.md auto-loading chain currently loads 12 files into every session's context. Many of these are rarely needed:

```
~/.claude/CLAUDE.md
CLAUDE.md
.skogai/CLAUDE.md
.skogai/memory/context/current.md
.skogai/memory/decisions.md
.skogai/templates/decision-record.md      ← only when creating ADRs
.skogai/templates/knowledge-entry.md      ← only when creating entries
.skogai/knowledge/patterns/style/CLAUDE.md
.skogai/templates/CLAUDE.md               ← only when using templates


## Notes

*Imported from external tracker. See source link for full context.*
