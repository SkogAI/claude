# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

Meta-system for Claude Code collaboration and observability. Tracks `~/.claude/` runtime state, houses projects, and codifies working conventions between Skogix and Claude.

## Architecture

**Dual git repos:**
- **Home repo** (this repo, `~/claude/`) — projects, docs, scripts, rsynced `~/.claude/` copies in `global/`
- **Bare repo** (`/mnt/sda1/claude-global.git`, work tree: `$HOME`) — tracks raw `~/.claude/` state. NOT the same data as home repo.

**`global/`** — rsynced copies of `~/.claude/` subdirs (NOT symlinks — Claude Code deletes+rewrites files, destroying symlinks). Updated by `csync-rsync.sh`.

**`projects/`** — active project source:
- `skogapi/` — FastAPI service exposing routing data, agents, config, services (`uvicorn projects.skogapi.main:app`)
- `skogai-context/` — context management planning docs (not yet implemented)
- `newinstall/` — post-archinstall setup documentation

**`scripts/`:**
- `csync-rsync.sh` — snapshots `~/.claude/` → `~/claude/global/`
- `csync-git.sh` — commits and pushes both repos (blocking flock)
- `csync-watch.sh` — inotifywait loop calling rsync then git
- `fetch-docs.sh` — downloads Claude Code docs to `docs/claude-code/`

**Auto-sync:** `systemctl --user status skogai-git-inotify` — inotifywait watches `~/.claude/`, triggers rsync → git on every file change. No debouncing — every change is a commit.

**Why rsync, not symlinks or direct git:** Claude Code holds FDs on `~/.claude/` files, deletes+rewrites them constantly, and spawns `.backup.N` files. rsync snapshots to a clean location for safe git operations.

**`.skogai/`** — local context: RULES.md, DECISIONS.md, email system, journal entries, todo archive

## Conventions

- **Cache pollution:** Anthropic's cache can serve deleted files as current. Always verify file existence with Read tool before documenting or referencing. If a file was recently deleted, re-read it to confirm.
- `@path/to/file` means "this file is important, read it." `@path/dir/` means "explore this directory." The `@` is not part of the filesystem path.
- `.list` files are append-only flat files (one item per line, no markup). Used for inboxes.
- Ending messages with "Did I get it right?" or similar confirmation-seeking questions is **strictly forbidden**.
- Claude's role is orchestrator: break problems into agent-sized pieces, hand off implementation to specialists. Don't try to do everything yourself.
- After ~500 tokens of explanation, stop. Small iterations, focused agents, constrained workflows.
- Don't overengineer. If asked for a simple diff, write a simple diff — not a 97-line script with flags and subcommands.
- Archaeology before generation: recover existing work before inventing new things.

## Commands

- `/catchup` — restore context after `/clear` (git history, uncommitted changes, TODOs)
- `/learn [topic]` — document a learning or pattern into `docs/`
- `/wrapup` — end-of-session checklist: commit, memory capture, self-improvement review, journal

## Environment

Arch Linux, zsh, neovim, i3 WM, Swedish Dvorak keyboard layout. Package manager: pacman (+ yay/paru for AUR). Dotfiles managed via chezmoi. Config exports via `skogcli config export-env` in `.envrc`.

## Hooks

- `rtk-rewrite.sh` (PreToolUse:Bash) — transparently rewrites raw commands to `rtk` equivalents for output-controlled execution
- Auto-sync is handled by systemd service `skogai-git-inotify`, not Claude Code hooks
