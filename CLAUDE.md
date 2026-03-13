# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

# @~/claude/ — my home folder

<what_is_this>

my home folder and operating environment. not application code — this repo IS my workspace: plugin management, fetched reference docs, knowledge base, project planning, and staging areas for skills/commands/hooks I'm developing.

everything routes through CLAUDE.md files. each directory has one that explains what's there and points to what's relevant. I load context lazily — read the router, follow the link, get what I need. no bulk pre-loading.

staging areas (`skills/`, `commands/`, `hooks/`, `agents/`) are symlinked into `.claude/` so edits here are active immediately. when something stabilizes it graduates to `~/.claude/` or a plugin in the marketplace.

</what_is_this>

<structure>

- @.skogai/ — knowledge, memory, templates, tasks, journal — routing via @.skogai/CLAUDE.md
- @marketplaces/ — plugin marketplaces (symlinks to ~/.local/src/)
- @projects/ — active development repos (symlinks to ~/.local/src/, managed by gita)
- @docs/ — fetched reference docs (run `docs/fetch-docs.sh` to populate claude-code/)
- @skills/ — WIP skills staging (symlinked from .claude/skills)
- @commands/ — WIP commands staging (symlinked from .claude/commands)
- @hooks/ — WIP hooks staging (symlinked from .claude/hooks)
- @agents/ — WIP agents staging (symlinked from .claude/agents)

</structure>

<common_commands>

**Workspace (Argcfile.sh — run with `argc`):**
- `argc workspace list` — list all worktrees
- `argc workspace open <name> [--claude]` — open existing worktree, optionally with claude
- `argc workspace create <task-id> [--claude]` — create worktree from gptodo task
- `argc workspace ship [-t title] [-b body]` — push + create PR against master
- `argc workspace merge` — local fast-forward via `wt merge`
- `argc workspace remove <name>` — remove a worktree
- `argc debug interface [--json]` — show all available argc commands

**Git workflow (via `/work` command or `git-workflow` skill):**
- `/work` — interactive workflow entry (pick → sync → branch → work → ship → merge → cleanup)
- `/work <github-url>` — start from issue
- `/work <task-id>` — start from gptodo task

**Multi-repo management:**
- `gita ll` — overview of all repos in ~/.local/src/
- `gita fetch` — fetch all repos
- `gita super <repo> <cmd>` — run git command on specific repo

**Task management:**
- `gptodo list` — list tasks
- `gptodo import --source github --repo <owner/repo>` — import GitHub issues
- `gptodo check <id>` — mark task done

**Worktree management (wt):**
- `wt list` — list worktrees
- `wt switch --create <branch>` — create new worktree
- `wt merge` — merge worktree into master (auto-detects context)
- `wt remove <branch-name>` — remove worktree (uses full branch name)

**Docs:**
- `docs/fetch-docs.sh` — fetch claude-code reference docs

</common_commands>

<routing>

| need to know about... | read |
|---|---|
| plugins, skills, hooks, MCP tools | @marketplaces/CLAUDE.md |
| style conventions, naming, XML tags | @.skogai/knowledge/patterns/style/CLAUDE.md |
| commit format and git rules | @.skogai/knowledge/patterns/style/commit-conventions.md |
| current work state | @.skogai/memory/context/current.md (generated — run `skogai context refresh`) |
| quick decisions log | @.skogai/memory/decisions.md |
| @-reference system | @.skogai/knowledge/patterns/style/at-references.md |
| gptme-contrib (gptodo, sessions, runloops) | @skills/gptme/SKILL.md |
| git workflow phases & troubleshooting | @skills/git-workflow/SKILL.md |

</routing>

<conventions>

**Commits:** `{type}({phase}-{plan}): {description}` — types: feat, fix, test, refactor, docs, chore. Stage files individually, never `git add .`.

**@-references:** `@path/to/file` in prompts expands the real file at prompt-time (always current). Read tool may return cached content.

**Idempotency:** every operation should be safe to run twice. scripts, syncs, and setup must skip what's done and fix what's missing — never fail on existing state.

**Context philosophy:** routing over dumping. load the right thing at the right time. placeholders over pre-loading.

**Symlink pattern:** `.claude/{skills,commands,hooks,agents}` → `../` counterparts. Edit in project root, active immediately. Graduate to `~/.claude/` or a plugin when stable.

**Worktrees:** `.skogai/.worktrees` → `.claude/worktrees`. gptodo creates worktrees here. `GPTODO_TASKS_DIR=/home/skogix/claude/.skogai/tasks` must be set.

**Git model:** master is the only branch that talks to origin. Feature branches are temporary worktrees — PR against master, clean up after merge. No develop branch.

</conventions>

<architecture>

This repo is a **workspace**, not an application. It has no build/test/lint cycle. The architecture is a hub-and-spoke routing system:

- **Hub:** This CLAUDE.md and `.skogai/CLAUDE.md` route to specific knowledge
- **Spokes:** Each subdirectory has its own CLAUDE.md explaining what's there
- **Symlinks:** `~/.local/src/` holds all real repos. `projects/` and `marketplaces/` are symlinks in. `.claude/` symlinks out to `skills/`, `commands/`, `hooks/`, `agents/` for live development
- **Plugin lifecycle:** Edit in project root → active via symlink → graduate to `~/.claude/` or marketplace plugin when stable
- **Environment:** `.envrc` loads env vars via `skogcli config export-env`. `GPTODO_TASKS_DIR` and Letta agent config are set here
- **Settings:** `.claude/settings.json` configures permissions (pre-approved CLI tools: gita, gptodo, gh, argc, wt), enabled plugins (superpowers ecosystem), and marketplaces (worktrunk, skogai, superpowers)

</architecture>
