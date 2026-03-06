---
state: new
created: 2026-03-06
tracking: ["https://github.com/SkogAI/claude/issues/35"]
tags: ["enhancement", "github"]
---

# hook: auto-record CC sessions via gptme-sessions post-session

**Source**: [Github #35](https://github.com/SkogAI/claude/issues/35)

## Description

## Idea

Create a Claude Code hook (or integrate into `/wrapup` skill) that automatically runs:

```bash
gptme-sessions post-session \
  --harness claude-code \
  --trajectory <current-session-jsonl> \
  --model <current-model>
```

This would:
1. Extract signals (tool calls, commits, grade, tokens) from the session
2. Record it in `.skogai/state/sessions/`
3. Enable `gptme-sessions stats` and `runs` analytics over time

## Questions
- Should this be a `Stop` hook or part of `/wrapup`?
- How to 

## Notes

*Imported from external tracker. See source link for full context.*
