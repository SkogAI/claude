---
state: new
created: 2026-04-23
tracking: ["https://github.com/SkogAI/claude/issues/57"]
tags: ["documentation", "area/agent-home", "github"]
---

# chore: replace stale ~/.claude/skills and legacy path assumptions in shared skills

**Source**: [Github #57](https://github.com/SkogAI/claude/issues/57)

## Description

## Problem

Several moved skills still instruct agents to read or write from legacy locations even though the review staging area is now repo-local `skills/`.

Concrete examples:

* workflows under `skills/skogai-routing/workflows/` still use `~/.claude/skills/...`
* matching workflows under `skills/skogai-skills/workflows/` also use `~/.claude/skills/...`
* `skills/skogai-docs/SKILL.md` still references `.claude/skills/skill-creator/scripts/init_skill.py`
* some moved skills still mention unava

## Notes

*Imported from external tracker. See source link for full context.*
