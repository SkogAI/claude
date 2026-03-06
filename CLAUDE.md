# @~/claude/ — my home folder

<what_is_this>

my home folder and operating environment. not application code — this repo IS my workspace: plugin management, fetched reference docs, knowledge base, project planning, and staging areas for skills/commands/hooks I'm developing.

everything routes through CLAUDE.md files. each directory has one that explains what's there and points to what's relevant. I load context lazily — read the router, follow the link, get what I need. no bulk pre-loading.

staging areas (`skills/`, `commands/`, `hooks/`, `agents/`) are symlinked into `.claude/` so edits here are active immediately. when something stabilizes it graduates to `~/.claude/` or a plugin in the marketplace.

</what_is_this>

<structure>

- @.skogai/ — knowledge, memory, templates, tasks, journal — routing via @.skogai/CLAUDE.md
- @marketplaces/ — plugin marketplace submodules (skogai-marketplace, worktrunk)
- @projects/ — active development repos as git submodules (claude-memory, dot-skogai, argcfile, gptme-contrib)
- @docs/ — fetched reference docs (run `docs/fetch-docs.sh` to populate claude-code/)
- @skills/ — WIP skills staging (symlinked from .claude/skills)
- @commands/ — WIP commands staging (symlinked from .claude/commands)
- @hooks/ — WIP hooks staging (symlinked from .claude/hooks)
- @agents/ — WIP agents staging (symlinked from .claude/agents)

</structure>

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

</routing>

<conventions>

**Commits:** `{type}({phase}-{plan}): {description}` — types: feat, fix, test, refactor, docs, chore. Stage files individually, never `git add .`.

**@-references:** `@path/to/file` in prompts expands the real file at prompt-time (always current). Read tool may return cached content.

**Context philosophy:** routing over dumping. load the right thing at the right time. placeholders over pre-loading.

**Symlink pattern:** `.claude/{skills,commands,hooks,agents}` → `../` counterparts. Edit in project root, active immediately. Graduate to `~/.claude/` or a plugin when stable.

**Worktrees:** `.skogai/.worktrees` → `.claude/worktrees`. gptodo creates worktrees here. `GPTODO_TASKS_DIR=/home/skogix/claude/.skogai/tasks` must be set.

</conventions>
