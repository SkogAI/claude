---
state: new
created: 2026-04-23
tracking: ["https://github.com/SkogAI/claude/issues/56"]
tags: ["documentation", "area/agent-home", "github"]
---

# audit: normalize shared skills to current SKILL.md structure

**Source**: [Github #56](https://github.com/SkogAI/claude/issues/56)

## Description

## Problem

The moved `skills/` set does not consistently match the structure taught by the repo's own skill-authoring guidance.

Concrete examples from the current tree:

* `skills/skogai-argc/SKILL.md` is about 677 lines
* `skills/skogai-bats-testing/SKILL.md` is about 677 lines
* `skills/skogai-docs/SKILL.md` is about 523 lines
* `skills/skogai-wrapup/SKILL.md` uses `name: wrapup` while the directory is `skogai-wrapup`
* many moved skills still use markdown-heading bodies even where `skogai-s

## Notes

*Imported from external tracker. See source link for full context.*
