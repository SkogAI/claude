---
state: new
created: 2026-04-18
tracking: ["https://github.com/SkogAI/claude/issues/45"]
tags: ["enhancement", "github"]
---

# chore: consolidate scripts — claude-todo/bin/ vs .skogai/scripts/ split

**Source**: [Github #45](https://github.com/SkogAI/claude/issues/45)

## Description

## Problem

After today's reorg, executable scripts live in two places with overlapping purpose:

**`claude-todo/bin/`** (old, renamed from `bin/` via commit `f37d4ba`):
- `healthcheck`
- `claude-md-linecheck`
- `context.sh`, `context-git.sh`, `context-journal.sh`, `context-workspace.sh`
- `build-system-prompt.sh`
- `fetch-docs.sh`
- `find-agent-root.sh`

**`.skogai/scripts/`** (new):
- `bootstrap/` — `bootstrap.sh`, `consumer-init.sh`, `symlink.sh`
- `context/` — 20+ `context-*.sh` scripts (app

## Notes

*Imported from external tracker. See source link for full context.*
