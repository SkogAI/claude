---
state: new
created: 2026-04-23
tracking: ["https://github.com/SkogAI/claude/issues/61"]
tags: ["documentation", "area/agent-home", "github"]
---

# design: make skogai-routing the canonical entrypoint for repo-local skills/

**Source**: [Github #61](https://github.com/SkogAI/claude/issues/61)

## Description

## Context

Per current direction, `skogai-routing` is the first and most important skill in the moved `skills/` set. It should become the canonical router and guide for the rest of the skills, tools, and workflows.

This means the first pass should not try to perfect every moved skill equally. It should instead harden `skills/skogai-routing/` as the entrypoint that determines how the rest of the repo-local skill system is discovered and evolved.

## Scope

* treat `skills/skogai-routing/` as th

## Notes

*Imported from external tracker. See source link for full context.*
