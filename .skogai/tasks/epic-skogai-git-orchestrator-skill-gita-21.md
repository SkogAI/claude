---
state: new
created: 2026-04-23
tracking: ["https://github.com/SkogAI/claude/issues/21"]
---

# Epic: skogai-git orchestrator skill (gita + worktrunk + gptodo)

**Source**: [Github #21](https://github.com/SkogAI/claude/issues/21)

## Description

Create a `skogai-git` skill that orchestrates three specialized sub-skills into a unified git workflow:

* **gita** — multi-repo status, fetch, bulk operations across `~/.local/src/`
* **worktrunk** — worktree lifecycle (create, switch, merge, ship, remove)
* **gptodo** — task-aware worktrees, spawn agents, issue sync

## Sub-tasks

* Create worktrunk specialist skill
* Extract gptodo specialist skill from gptme
* Create skogai-git orchestrator skill

## Repo

`SkogAI/claude` (`.skogai/skills/`)

## Notes

*Imported from external tracker. See source link for full context.*
