---
state: done
created: 2026-04-18
tracking: ["https://github.com/SkogAI/claude/issues/44"]
tags: ["bug", "github"]
---

# bug: healthcheck references identity paths that no longer exist after .skogai reorg

**Source**: [Github #44](https://github.com/SkogAI/claude/issues/44)

## Description

## Problem

After the 2026-04-18 reorg, `claude-todo/bin/healthcheck` reported many false `[FAIL]` results due to stale path assumptions and weak root detection.

## Fix implemented

- Resolved workspace root robustly (prefer `find-agent-root.sh`, then git toplevel, then legacy fallback)
- Added fallback path checks where files moved:
  - journal conventions: `personal/journal/CONVENTIONS.md` or `journal/CONVENTIONS.md`
  - docs router: `docs/CLAUDE.md` or `.skogai/docs/CLAUDE.md`
  - bin router: `bin/CLAUDE.md` or `claude-todo/bin/CLAUDE.md`
  - notes router: `notes/CLAUDE.md` or `personal/notes/CLAUDE.md`
- Hardened memory-tier checks to handle missing directories without noisy failures
- Preserved non-zero exit behavior on real failures (`exit $FAIL`)

## Verification

```bash
./claude-todo/bin/healthcheck
```

Result:

- `31 ok, 0 warnings, 0 failures`
- exit code `0`

## Notes

*Imported from external tracker. Updated locally with completion details.*
