# Plan: Slim down ~/CLAUDE.md, push domain knowledge to project SKOGAI.md files

## Context

The top-level `~/CLAUDE.md` is a 78-line system reference document containing hardware specs, disk layout, boot config, desktop environment, keyboard settings, and installed software. Most of this already exists in `projects/system/SKOGAI.md` (and is more detailed there). Per CONVENTIONS.md: "Do not duplicate content — use @-imports to reference files instead."

The goal is to make `~/CLAUDE.md` a thin router — user identity, project index, and @-imports — while each project owns its domain knowledge via `SKOGAI.md`.

## Steps

### 1. Create projects/git/SKOGAI.md

Extract portable facts from `projects/git/README.md`:
- **Identity**: GitHub user Skogix, email, name
- **Auth**: SSH with ed25519 key (passphrase-protected), gh CLI scopes
- **Conventions**: SSH URLs, gh as primary tool

### 2. Create projects/dotfiles/SKOGAI.md

Extract from `projects/dotfiles/CLAUDE.md`:
- **Bare repo setup**: git dir, work tree, command
- **Config philosophy**: explicit over minimal, per DECISIONS.md
- Placeholder for managed configs list

### 3. Create projects/claude-code/SKOGAI.md

Summarize from `README.md` and `TODO.md`:
- **Scope**: MCP servers, plugins, hooks, keybindings, memory
- **Current state**: installed at `~/.local/bin`, MCP servers injected from claude.ai (audit pending)

### 4. Create projects/claude-code/CLAUDE.md

Only project without one. Add:
- Scope definition
- Workflow (INBOX.list based)
- `## Files to read` section

### 5. Update projects/system/SKOGAI.md

Add "Installed Software" section (base + user-installed packages) — this info currently only exists in `~/CLAUDE.md` lines 53-66.

### 6. Update projects/system/CLAUDE.md

- Fix Key Files table: `STATE.md` → `SKOGAI.md` (the actual filename)
- Fix Workflow references: step 2 and 4 say `STATE.md`, should say `SKOGAI.md`
- Add `## Files to read` section

### 7. Update projects/git/CLAUDE.md

Add `## Files to read` section referencing `SKOGAI.md`, `README.md`, `INBOX.list`.

### 8. Update projects/dotfiles/CLAUDE.md

Add `## Files to read` section referencing `SKOGAI.md`, `DECISIONS.md`, `INBOX.list`.

### 9. Rewrite ~/CLAUDE.md (do last)

Strip all system inventory. New structure:
- **User** — 2 lines: skogix is a vim user, prefer vi-style everywhere
- **System at a Glance** — 1 line + @-import to `projects/system/SKOGAI.md`
- **Projects** — table with path and scope for each project
- **Files to read** — keep existing @-imports, remove `@projects/` (now covered by project table), keep `RULES.md`, `CONVENTIONS.md`, `TODO.md`, `DECISIONS.md`, `bin/SKOGAI.md`, `INBOX.list`

## Files touched

| File | Action |
|------|--------|
| `projects/git/SKOGAI.md` | Create |
| `projects/dotfiles/SKOGAI.md` | Create |
| `projects/claude-code/SKOGAI.md` | Create |
| `projects/claude-code/CLAUDE.md` | Create |
| `projects/system/SKOGAI.md` | Edit (add installed software) |
| `projects/system/CLAUDE.md` | Edit (fix STATE.md refs, add Files to read) |
| `projects/git/CLAUDE.md` | Edit (add Files to read) |
| `projects/dotfiles/CLAUDE.md` | Edit (add Files to read) |
| `~/CLAUDE.md` | Rewrite (slim down) |

## Verification

1. Start a fresh Claude Code session from `~` — confirm it loads the slim `CLAUDE.md` and can navigate to system details via @-imports
2. `cd ~/projects/system` — confirm `SKOGAI.md` now has installed software section
3. `cd ~/projects/git` — confirm `SKOGAI.md` exists with identity/auth info
4. Check no content duplication: system specs appear only in `projects/system/SKOGAI.md`, not in `~/CLAUDE.md`
