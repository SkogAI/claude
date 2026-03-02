# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

Meta-system for Claude Code collaboration and observability. Tracks `~/.claude/` runtime state, houses projects, and codifies working conventions between Skogix and Claude.

## Architecture

**Dual git repos:**
- **Home repo** (this repo, `~/claude/`) — projects, docs, scripts, symlinked `~/.claude/` contents
- **Bare repo** (`/mnt/sda1/claude-global.git`, work tree: `$HOME`) — tracks everything in `~/.claude/` for observability. Wrapper: `./scripts/cgit.sh`

**`global/`** — symlinks into `~/.claude/` (settings, projects, plans, todos, plugins, exclude). Changes appear in both repos' diffs.

**`projects/`** — active project source:
- `skogapi/` — FastAPI service exposing routing data, agents, config, services (`uvicorn projects.skogapi.main:app`)
- `skogai-core/` — Claude Code plugin scaffold (`.claude-plugin/plugin.json`, hooks, skills, commands, agents)
- `skogai-context/` — context management planning docs (not yet implemented)
- `newinstall/` — post-archinstall setup documentation

**`scripts/`:**
- `csync.sh` — auto-commits both repos, runs on every message via UserPromptSubmit hook. Syncs `~/.claude/` dirs to `./global/`, commits bare repo, commits+pushes home repo
- `cgit.sh` — bare repo git wrapper (`git --git-dir=/mnt/sda1/claude-global.git --work-tree=$HOME`)
- `clog.sh` — shows recent commits from both repos

**`.skogai/`** — local context: RULES.md, DECISIONS.md, email system, journal entries, todo archive

## Conventions

- `@path/to/file` means "this file is important, read it." `@path/dir/` means "explore this directory." The `@` is not part of the filesystem path.
- `.list` files are append-only flat files (one item per line, no markup). Used for inboxes.
- Ending messages with "Did I get it right?" or similar confirmation-seeking questions is **strictly forbidden**.
- Claude's role is orchestrator: break problems into agent-sized pieces, hand off implementation to specialists. Don't try to do everything yourself.
- After ~500 tokens of explanation, stop. Small iterations, focused agents, constrained workflows.
- Archaeology before generation: recover existing work before inventing new things.

## Commands

- `/catchup` — restore context after `/clear` (git history, uncommitted changes, TODOs)
- `/learn [topic]` — document a learning or pattern into `docs/`
- `/wrapup` — end-of-session checklist: commit, memory capture, self-improvement review, journal

## Skills (in `global/skills/`)

- `skogai-routing` — progressive disclosure router pattern for complex skills
- `skogai-agent-prompting` — prompt-native philosophy (outcomes not workflows)
- `skogai-argc` — argc-based CLI patterns
- `fleet-memory` — multi-agent memory coordination with scope tiers (policy/state/entity/knowledge)
- `nelson` — squadron execution framework for parallel agent teams

## Environment

Arch Linux, zsh, neovim, i3 WM, Swedish Dvorak keyboard layout. Package manager: pacman (+ yay/paru for AUR). Dotfiles managed via chezmoi. Config exports via `skogcli config export-env` in `.envrc`.

## Hooks

- `rtk-rewrite.sh` (PreToolUse:Bash) — transparently rewrites raw commands to `rtk` equivalents for output-controlled execution
- `csync.sh` fires on UserPromptSubmit to auto-commit both repos
- `skogai-core/hooks/hooks.json` — debug hooks on SessionStart, SessionEnd, PreToolUse, PostToolUse, Stop, SubagentStop, PreCompact
