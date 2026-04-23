---
state: new
created: 2026-04-23
tracking: ["https://github.com/SkogAI/claude/issues/59"]
tags: ["documentation", "area/agent-home", "testing", "github"]
---

# test: add automated validation for repo-local skills/

**Source**: [Github #59](https://github.com/SkogAI/claude/issues/59)

## Description

## Problem

The shared `skills/` tree currently has no automated guardrails for the conventions it teaches. That makes it easy to reintroduce the same migration and structure bugs during future skill imports.

Examples of regressions worth catching automatically:

* frontmatter `name:` does not match directory name
* descriptions are missing or too weak to explain trigger conditions
* workflow/reference files are referenced but missing
* legacy `~/.claude/skills/` references remain in repo-local

## Notes

*Imported from external tracker. See source link for full context.*
