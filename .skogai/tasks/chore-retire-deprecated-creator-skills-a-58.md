---
state: new
created: 2026-04-23
tracking: ["https://github.com/SkogAI/claude/issues/58"]
tags: ["documentation", "area/agent-home", "github"]
---

# chore: retire deprecated creator skills after skogai-routing is canonical

**Source**: [Github #58](https://github.com/SkogAI/claude/issues/58)

## Description

## Problem

There are multiple overlapping skill-creation artifacts in the moved `skills/` tree, but current direction narrows their fate substantially:

* `skill-creator` is the official Claude/Codex skill creator and can be removed from this repo-local set for now
* `skogai-skill-creator` is an older skill-creation setup and can also be removed
* `skogai-skills` is better treated as an earlier routing-led start of skill creation, not as a separate long-term canonical entrypoint
* `skogai-routi

## Notes

*Imported from external tracker. See source link for full context.*
