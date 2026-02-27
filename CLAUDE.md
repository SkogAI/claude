# ~/claude/CLAUDE.md

Claude's home folder, working directory, and headquarters. Everything here belongs to claude — change freely.

## Project Structure

- `.beads/` — Issue tracking (beads_rust). Managed by `bd` commands.
- `.claude/` — Claude Code project config
- `.todo/` — Curated reference collection (hooks, skills, rtk docs). Claudeignored.
- `email/` — Email processing system
- `global/` — Synced mirror of ~/.claude/ (bare git repo at /mnt/sda1/claude-global.git)
- `journal/` — Daily session journals
- `projects/` — Subprojects (newinstall, skogai-core, skogapi)
- `scripts/` — Shell scripts (cgit.sh, clog.sh, csync.sh)
- `RULES.md` — Behavioral rules and conventions
- `DECISIONS.md` — Architectural history and decision log

## Task Tracking

Use `bd` (beads) for all task management. Session hooks inject full beads docs automatically.
Do NOT use TodoWrite, TaskCreate, or markdown files for task tracking.

## Session Close Protocol

Work is NOT complete until `git push` succeeds. Before ending any session:

```bash
git add <files> && git commit -m "..." && git push
```

## Conventions

- `@` is a conversational shorthand for referencing paths — never part of the actual filename
- `SKOGAI.md` = agent-agnostic project summary (portable). `CLAUDE.md` = project root.
- Do not duplicate content — use @-imports to reference files instead

## Tools

- NEVER use sed or awk — use proper tools (yq, jq, etc.)
- `yq --front-matter=extract '<query>' file.md` — parse YAML frontmatter
- When a tool version is wrong, ask skogix to install the correct one

### RTK (Rust Token Killer)

Transparent hook auto-rewrites commands (`git status` → `rtk git status`). Full reference at `~/.claude/RTK.md`.

## skogapi

- FastAPI service at localhost:9999 — wraps skogcli, skogparse, agents, config
- Service: `systemctl --user restart skogai-skogapi`
- Code: `projects/skogapi/main.py`
- Agents via `skogcli agent list/read/create`, NOT file directories
