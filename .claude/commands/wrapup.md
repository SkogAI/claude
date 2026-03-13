---
name: wrap-up
description: use when user says "wrap up", "close session", "end session",
  "wrap things up", "close out this task", or invokes /wrap-up — runs
  end-of-session checklist for shipping, memory, and self-improvement
---

# session wrap-up

run four phases in order. each phase is conversational and inline — no
separate documents. all phases auto-apply without asking; present a
consolidated report at the end.

## phase 1: ship it

**task sync:**

1. run !`gptodo fetch --all`
   to refresh external issue states
2. run !`gptodo list` to
   check for stale in-progress tasks — update completed ones with
   `gptodo edit <task> --state done`

**commit:**

1. run !`git status` in each repo directory that was touched during the session
2. if uncommitted changes exist, auto-commit with a descriptive message
3. push to remote

**worktree cleanup:**

1. run !`wt list` to check for worktrees that are done — merge completed ones
   with `wt merge` and remove with `wt remove`

**file placement check:**

1. if any files were created or saved during this session:
   - verify they follow the project naming convention
   - auto-fix naming violations (rename the file)
   - could this file be merged into an existing one instead?
   - if it's a document-type file (.md, .docx, etc.) and NOT a
     `{AGENT,SKOGAI,CLAUDE}.md` file, it should live inside `./docs/`
     unless the user explicitly placed it elsewhere
   - auto-move misplaced files to their correct location

## phase 2: remember it

review what was learned during the session. decide where each piece of
knowledge belongs in the memory hierarchy:

**memory placement guide:**

- **auto memory** (claude writes for itself) — debugging insights, patterns
  discovered during the session, project quirks
- **claude.md** (instructions for claude) — permanent project rules,
  conventions, commands, architecture decisions that should guide all future
  sessions
- **`.claude/rules/`** (modular project rules) — topic-specific instructions
  that apply to certain file types or areas. use `paths:` frontmatter to scope
  rules to relevant files (e.g., testing rules scoped to `tests/**`)
- **`claude.local.md`** (private per-project notes) — personal wip context,
  local urls, sandbox credentials, current focus areas that shouldn't be
  committed
- **`@import` references** — when a claude.md would benefit from referencing
  another file rather than duplicating its content
- **gptodo task** (`gptodo add "title"`) — use for "remember to do this in
  the future" when the task would extend outside the current context: needs
  extra research, has dependencies, or is more complex than "write this to
  file". optionally create a GitHub issue first and import with
  `gptodo import`.

**decision framework:**

- is it a permanent project convention? → claude.md or `.claude/rules/`
- is it scoped to specific file types? → `.claude/rules/` with `paths:`
  frontmatter
- is it a pattern or insight claude discovered? → auto memory
- is it personal/ephemeral context? → `claude.local.md`
- is it duplicating content from another file? → use `@import` instead
- is it future work that needs research/dependencies/complexity? → gptodo task

note anything important in the appropriate location.

## phase 3: review & apply

analyze the conversation for self-improvement findings. if the session was
short or routine with nothing notable, say "nothing to improve" and proceed
to phase 4.

**auto-apply all actionable findings immediately** — do not ask for approval
on each one. apply the changes, commit them, then present a summary of what
was done.

**finding categories:**

- **skill gap** — things claude struggled with, got wrong, or needed multiple
  attempts
- **friction** — repeated manual steps, things user had to ask for explicitly
  that should have been automatic
- **knowledge** — facts about projects, preferences, or setup that claude
  didn't know but should have
- **automation** — repetitive patterns that could become skills, hooks, or
  scripts

**action types:**

- **claude.md** — edit the relevant project or global claude.md
- **rules** — create or update a `.claude/rules/` file
- **auto memory** — save an insight for future sessions
- **gptodo task** — for skill/hook specs, complex improvements, or anything
  needing a dedicated session to implement properly. prefer this over
  inline implementation when the fix would need research, testing, or
  multi-file changes beyond the current session's scope.
- **claude.local.md** — create or update per-project local memory

present a summary after applying, in two sections — applied items first,
then no-action items:

findings (applied):

1. skill gap: cost estimates were wrong multiple times
   → [claude.md] added token counting reference table

2. knowledge: worker crashes on 429/400 instead of retrying
   → [rules] added error-handling rules for worker

3. automation: checking service health after deploy is manual
   → [gptodo] create post-deploy health check skill

---

no action needed:

1. knowledge: discovered x works this way
   already documented in claude.md

## phase 4: journal it

after all other phases are complete, review the full conversation for material
worth preserving. look for:

- interesting technical solutions or debugging stories
- educational content (how-tos, tips, lessons learned)
- project milestones or feature launches
- architectural decisions and their reasoning

**if journal-worthy material exists:**

draft the entry and save to `!`echo $SKOGAI_CLAUDE_HOME`/.skogai/journal/yyyy-mm-dd/<description>.md`

present the draft location in the report:

all wrap-up steps complete. journal entry saved:

1. "title" — 1-2 sentence description.
   saved to: .skogai/journal/2026-02-20/sniffing-claudes-context-window.md

**if nothing journal-worthy:**

say "nothing worth journaling from this session" and you're done.
