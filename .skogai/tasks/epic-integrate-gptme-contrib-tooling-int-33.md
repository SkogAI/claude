---
state: new
created: 2026-03-06
tracking: ["https://github.com/SkogAI/claude/issues/33"]
tags: ["enhancement", "epic", "github"]
---

# epic: integrate gptme-contrib tooling into ~/claude workflow

**Source**: [Github #33](https://github.com/SkogAI/claude/issues/33)

## Description

## Context

The gptme-contrib monorepo has been fully mapped into a skill at `skills/gptme/` (SKILL.md + 14 reference files). Now we need to actually wire the tools into the daily workflow.

## Sub-tasks

### Session lifecycle
- [ ] Auto-run `gptme-sessions post-session --harness claude-code` at end of session (hook or `/wrapup` integration)
- [ ] Auto-run `gptme-sessions signals` to grade completed sessions
- [ ] Integrate `summarize smart` into daily cron / session journal generation

### Task

## Notes

*Imported from external tracker. See source link for full context.*
