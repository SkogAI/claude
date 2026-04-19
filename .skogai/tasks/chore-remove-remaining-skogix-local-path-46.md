---
state: done
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
- Per the Claude Code docs (`.skogai/docs/claude-code/memory.md:335`): **"This setting is accepted from policy, local, and user settings. It is not accepted from project settings (`.claude/settings.json`) to prevent a shared project from redirecting auto memory writes to sensitive locations."**
- So this key should not exist in project settings

### 2. `worktrunk` local directory marketplace (line ~137)

```json
"worktrunk": {
  "source": { "source": "directory", "path": "/home/skogix/.local/src/worktrunk" }
}
```

- Host-local path that fails to resolve on non-skogix environments
- Should not live in shared project settings

## Completion

- Removed `extraKnownMarketplaces.worktrunk` local directory source from `.claude/settings.json`
- Removed `autoMemoryDirectory` from `.claude/settings.json` (project settings)
- Verified `.claude/settings.json` is valid JSON
- Verified no `/home/skogix` or `~/claude` paths remain in `.claude/settings.json`

## Notes

*Imported from external tracker. Updated locally with completion details.*
