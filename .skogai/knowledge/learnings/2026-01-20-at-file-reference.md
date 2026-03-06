---
title: "@ File Reference - Claude Code's Context Expansion"
date: 2026-01-20
project: SkogAI
tags: [at-references, context, claude-code, file-expansion]
source: Session building .skogai framework
status: active
---

# @ File Reference - Claude Code's Context Expansion

## What It Is

The `@` prefix in Claude Code expands file contents directly into the prompt at prompt-time.

```
@/path/to/file.md  →  file contents inlined into context
```

## Why It Matters

| Method | Source | Freshness |
|--------|--------|-----------|
| `@/path/to/file` | Real filesystem | Always current |
| Read tool | Often cached | Possibly stale |

**The `@` is the source of truth.** Read tool results may come from Claude Code's cache layer.

## Where It Works

1. **SKOGAI.md files** (auto-loaded)
   ```markdown
   <always_load>
   - @memory/context/current.md
   </always_load>
   ```

2. **claude -p prompts**
   ```bash
   claude -p "summarize @/path/to/file.md"
   ```

3. **Subagent/Task prompts**
   - `@` references in Task prompts expand before the agent sees them

## Context Chain

```
SKOGAI.md (auto-loaded)
    └── @memory/context/current.md (expanded)
            └── any @references in that file (expanded)
                    └── ...recursive expansion
```

We control the entire context graph through `@` references.

## SkogAI Alignment

```bash
$ skogcli config get '$.@'
$.@ = the intent to act or do something | {$id@$id}
```

Claude Code's `@` and SkogAI's `@` operator share semantics:
- `@file` = intent to act on (load) this file
- `[@action:arg]` = intent to execute this action

## Implications

1. **Always use `@` in SKOGAI.md** for files that must be current
2. **Don't trust Read tool for critical context** - may be cached
3. **`@` references are deterministic** - we know exactly what context expands
4. **Subagents get `@` expansion** - they see real files, not cache
