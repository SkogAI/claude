---
state: new
created: 2026-04-18
tracking: ["https://github.com/SkogAI/claude/issues/46"]
tags: ["enhancement", "github"]
---

# chore: remove remaining skogix-local paths from settings.json

**Source**: [Github #46](https://github.com/SkogAI/claude/issues/46)

## Description

## Problem

Two `/home/skogix/...` paths remain in `.claude/settings.json` after the reorg. Neither breaks this container (one is ignored, the other fails gracefully on load), but both should be cleaned up.

## Remaining paths

### 1. `autoMemoryDirectory` (line ~152)

```json
"autoMemoryDirectory": "/home/skogix/claude/.skogai/memory"
```

- Points to the old home path
- Per the Claude Code docs (`.skogai/docs/claude-code/memory.md:335`): **"This setting is accepted from policy, local, and user

## Notes

*Imported from external tracker. See source link for full context.*
