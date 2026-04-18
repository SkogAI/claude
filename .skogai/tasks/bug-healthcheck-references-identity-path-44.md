---
state: new
created: 2026-04-18
tracking: ["https://github.com/SkogAI/claude/issues/44"]
tags: ["bug", "github"]
---

# bug: healthcheck references identity paths that no longer exist after .skogai reorg

**Source**: [Github #44](https://github.com/SkogAI/claude/issues/44)

## Description

## Problem

After today's reorg (commits `210787c` → `db781e2` on 2026-04-18), `claude-todo/bin/healthcheck` reports 20+ `[FAIL]` entries because the paths it checks moved or were removed.

## Reproduction

```bash
./claude-todo/bin/healthcheck
```

**Output excerpt:**

```
identity paths
------------------
  [FAIL] personal/soul/01-equation.md
  [FAIL] personal/soul/02-skogai-family.md
  ... (all 10 soul sections)
  [FAIL] personal/profile.md
  [FAIL] personal/journal/CONVENTIONS.md
  [FAIL] pe

## Notes

*Imported from external tracker. See source link for full context.*
