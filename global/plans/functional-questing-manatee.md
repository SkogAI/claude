# Plan: Create CLAUDE.md

## Context
This repo has no root-level CLAUDE.md. The global `~/.claude/CLAUDE.md` exists but contains broken stubs (`[@todo:claude]` placeholders). Creating a proper `CLAUDE.md` at the repo root to orient future Claude Code instances.

## What to include
Based on exploration:
- Repo purpose: meta-system for Claude Code collaboration, context management, observability
- Architecture: dual git repos (home + bare), global/ symlinks, projects/, scripts/
- Key conventions from `.skogai/RULES.md`: `@` path notation, `.list` files, no confirmation-seeking questions, agent-first workflow
- Scripts: csync.sh, cgit.sh, clog.sh
- Projects overview: skogapi (FastAPI), skogai-core (plugin), skogai-context (planning)
- Commands: /catchup, /learn, /wrapup
- Skills: fleet-memory, nelson, skogai-routing, skogai-agent-prompting, skogai-argc

## Implementation
Single file creation: `/home/skogix/claude/CLAUDE.md`
