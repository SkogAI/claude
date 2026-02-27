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
- Dolt server may be down; check with `bd dolt start` if needed

## Project Conventions

- `.todo/` = curated reference collection (hooks, skills, templates, docs)
- RTK reference docs live at `.todo/rtk-optimized.md`; also embedded in CLAUDE.md

## Merge History (2026-02-27)

- `projects/hq/` merged into ~/claude: CONVENTIONS.md, DECISIONS.md, RULES.md updated
- `projects/skogai-core/` relocated to ~/claude/projects/skogai-core/
- `.todo/demodotfiles/` removed (redundant snapshot of projects/)
- merge-log.md tracks full provenance
- projects/dotfiles, git, system kept as external references (not merged)

## Global ~/.claude/ Setup

- Commands: wrapCliAsApi, wrapup, learn, catchup (all global)
- Agents: nelson, doc-writer (global)
- Skills: skogai-agent-prompting, nelson-base (global)
- Hooks: rtk-rewrite.sh (global), rtk-auto-wrapper.sh (project-local)
- csync.sh syncs: plans, memories, teams, tasks, projects, transcripts, session-env, usage-data, commands, agents, skills, hooks
- rsync uses `-a` (recursive) but NO `--delete` — add-only policy
- Bare repo at /mnt/sda1/claude-global.git tracks all of ~/.claude/

## Beads / Dolt

- Dolt SQL server required but often not running
- `bd init` and `bd sync` will fail without it
- Fallback: use git commits as traceability trail + merge-log.md
