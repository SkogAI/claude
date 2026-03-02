# Plan: Slim down ~/CLAUDE.md, push domain knowledge to project SKOGAI.md files

## Context

The top-level `~/CLAUDE.md` is a 78-line system reference document containing hardware specs, disk layout, boot config, desktop environment, keyboard settings, and installed software. Most of this already exists in `projects/system/SKOGAI.md` (and is more detailed there). Per CONVENTIONS.md: "Do not duplicate content — use @-imports to reference files instead."

The goal is to make `~/CLAUDE.md` a thin router — user identity, project index, and @-imports — while each project owns its domain knowledge via `SKOGAI.md`.

## Steps

### 1. Send inbox message to projects/git/

`append projects/git/INBOX.list` asking for a SKOGAI.md to be created. Include:
- @~/CONVENTIONS.md (defines what SKOGAI.md is and how it's used)
- @projects/git/README.md (source material — identity, auth, conventions)
- Note: SKOGAI.md should be a portable project summary, not a duplicate of README.md. Extract the machine-readable facts, not the prose.

### 2. Send inbox message to projects/dotfiles/

`append projects/dotfiles/INBOX.list` asking for a SKOGAI.md to be created. Include:
- @~/CONVENTIONS.md (defines what SKOGAI.md is and how it's used)
- @projects/dotfiles/CLAUDE.md (source material — bare repo setup, workflow)
- @projects/dotfiles/DECISIONS.md (config philosophy)

### 3. Send inbox message to projects/claude-code/

`append projects/claude-code/INBOX.list` asking for:
- A SKOGAI.md summarizing the project scope and current state
- A CLAUDE.md with scope, workflow, and `## Files to read` section
- @~/CONVENTIONS.md (defines what both files should contain)
- @projects/claude-code/README.md and @projects/claude-code/TODO.md (source material)

### 4. Send inbox message to projects/system/

`append projects/system/INBOX.list` asking for:
- Add "Installed Software" sections to SKOGAI.md (base packages + user-installed). This info currently only lives in ~/CLAUDE.md and needs a proper home.
- Fix `STATE.md` → `SKOGAI.md` references in CLAUDE.md (Key Files table, Workflow steps 2 and 4)
- Add `## Files to read` section to CLAUDE.md per @~/CONVENTIONS.md

### 5. Send inbox messages to projects/git/ and projects/dotfiles/

`append` to both INBOX.list files asking for a `## Files to read` section to be added to their CLAUDE.md, per @~/CONVENTIONS.md.

### 6. Rewrite ~/CLAUDE.md (do directly — this is our own scope)

Strip all system inventory. New structure:
- **User Preferences** — skogix is a vim user, prefer vi-style everywhere
- **System at a Glance** — 1 line summary + @-import to `projects/system/SKOGAI.md`
- **Projects** — table with path and scope for each project
- **Files to read** — RULES.md, CONVENTIONS.md, TODO.md, DECISIONS.md, bin/SKOGAI.md, INBOX.list

This is the only file we edit directly — it's in our working scope at `~/`.

## What this plan does NOT do

- Write file contents for other projects. Each project session creates its own files with local context.
- Specify exact content for SKOGAI.md files. The inbox messages carry enough context (@-imports) for the receiving session to do it right.

## Execution order

Steps 1-5 (inbox messages) can all happen in parallel — they're independent.
Step 6 (rewrite ~/CLAUDE.md) can happen immediately — it only removes content, doesn't depend on the inbox items being processed.
