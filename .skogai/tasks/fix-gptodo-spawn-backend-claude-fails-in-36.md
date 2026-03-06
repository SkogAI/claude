---
state: new
created: 2026-03-06
tracking: ["https://github.com/SkogAI/claude/issues/36"]
tags: ["bug", "github"]
---

# fix: gptodo spawn --backend claude fails inside CC sessions

**Source**: [Github #36](https://github.com/SkogAI/claude/issues/36)

## Description

## Problem

`gptodo spawn <task> --backend claude` was tested during the mapping session and appeared to launch but the agent produced no output. The worktree was created at `.skogai/.worktrees/` (before symlink fix) and the session metadata was written to `.skogai/state/sessions/`, but the actual claude subprocess likely failed.

## Suspected cause

The `CLAUDECODE` environment variable nesting issue. `gptodo.subagent` should strip `CLAUDECODE` and `CLAUDE_CODE_ENTRYPOINT` before spawning, simi

## Notes

*Imported from external tracker. See source link for full context.*
