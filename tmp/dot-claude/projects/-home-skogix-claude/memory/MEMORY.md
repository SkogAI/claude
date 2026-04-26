---
title: MEMORY
type: note
permalink: claude/tmp/dot-claude/projects/home-skogix-claude/memory/memory
---

# Auto Memory — ~/claude

## RTK (Rust Token Killer)

- **Version**: v0.22.2 (docs in .todo/ previously referenced v0.2.0 — now fixed)
- **Hook**: `~/.claude/hooks/rtk-rewrite.sh` — transparent PreToolUse rewrite, zero overhead
- **Setup**: `rtk init -g --auto-patch` installs hook + RTK.md + settings.json patch
- **Audit**: `rtk hook-audit` shows rewrite metrics; `rtk gain` shows savings
- **Discovery**: `rtk discover` analyzes Claude Code history for missed savings
- Old docs said ls (-274%) and grep (buggy) — both now work well (73%, 95%)
- `rtk init --show` gives full status of RTK integration health

## Claude Code Hooks

- PreToolUse hooks can **rewrite** commands via `updatedInput` in JSON output (not just deny)
- Format: `{ hookSpecificOutput: { permissionDecision: "allow", updatedInput: { command: "..." } } }`
- Hook receives stdin JSON: `{ tool_name, tool_input: { command }, ... }`
- Exit 0 = allow, exit 2 = block, JSON deny = block with reason
- Hooks registered in settings.json under `hooks` key, scoped by matcher regex
- `$CLAUDE_PROJECT_DIR` for project-relative paths in hook commands

## Beads

- `br` alias sometimes unavailable; `bd` is the reliable alias
- `bd sync` is deprecated — use `bd dolt push` / `bd dolt pull`
- Dolt SQL server required but often not running; check with `bd dolt start`
- Fallback: use git commits as traceability trail

## Project Conventions

- `.todo/` = curated reference collection (hooks, skills, templates, docs). Claudeignored.
- CLAUDE.md uses **router pattern**: routes by intent, doesn't dump content. ~24 lines.
- Beads instructions injected by session hook — don't duplicate in CLAUDE.md
- Tools referenced but NOT installed: ms, cm, grepai, serena, ast-grep

## Global ~/.claude/ Setup

- Commands: wrapCliAsApi, wrapup, learn, catchup (all global)
- Agents: nelson, doc-writer (global)
- Skills: skogai-agent-prompting, nelson-base, fleet-memory (global)
- Hooks: rtk-rewrite.sh (global PreToolUse:Bash)
- csync.sh syncs ~/.claude/ dirs to ~/claude/global/ (add-only, no --delete)
- Bare repo at /mnt/sda1/claude-global.git tracks all of ~/.claude/
