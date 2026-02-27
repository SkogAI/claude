# ~/claude/CLAUDE.md

Claude's home folder, working directory, and headquarters. Everything here belongs to claude — change freely.

## Project Structure

- `.beads/` — Issue tracking (beads_rust). Managed by `bd` commands.
- `.claude/` — Claude Code project config
- `.todo/` — Curated reference collection (hooks, skills, rtk docs)
- `email/` — Email processing system
- `global/` — Global claude config (agents, commands, hooks, skills, plugins)
- `journal/` — Daily session journals
- `projects/` — Subprojects (newinstall, skogai-core, skogapi)
- `scripts/` — Shell scripts (cgit.sh, clog.sh, csync.sh)
- `SKILL.md` — ms (Meta Skill CLI) definition

## Task Tracking

Use `bd` (beads) for all task management. Session hooks inject full beads docs automatically.
Do NOT use TodoWrite, TaskCreate, or markdown files for task tracking.

## Tools

- NEVER use sed or awk — use proper tools (yq, jq, etc.)
- `yq --front-matter=extract '<query>' file.md` — parse YAML frontmatter
- When a tool version is wrong, ask skogix to install the correct one

### RTK (Rust Token Killer)

Transparent hook auto-rewrites commands (`git status` → `rtk git status`). Full reference at `~/.claude/RTK.md`.

### ms (Meta Skill)

Skill management CLI. 800+ skills indexed. Key commands:

```bash
ms suggest --explain         # context-aware recommendations
ms search "query"            # hybrid BM25 + semantic search
ms load <skill> --level full # load skill content
ms doctor                    # health check
```

All commands support `-O json`. Config: `.ms/config.toml` per project.

## skogapi

- FastAPI service at localhost:9999 — wraps skogcli, skogparse, agents, config
- Service: `systemctl --user restart skogai-skogapi`
- Code: `projects/skogapi/main.py`
- Agents via `skogcli agent list/read/create`, NOT file directories
