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

**beads sync:**

1. run `br sync --flush-only` to export any dirty issues to JSONL
2. run `br list -s in_progress` to check for stale in-progress issues —
   close completed ones with `br close <id>`, update others as needed

**commit:**

3. run `git status` in each repo directory that was touched during the session
4. if uncommitted changes exist (including .beads/), auto-commit with a
   descriptive message
5. push to remote

**file placement check:**

6. if any files were created or saved during this session:
   - verify they follow the project naming convention
   - auto-fix naming violations (rename the file)
   - could this file be merged into an existing one instead?
   - if it's a document-type file (.md, .docx, etc.) and NOT a
     `{AGENT,SKOGAI,CLAUDE}.md` file, it should live inside `./docs/`
     unless the user explicitly placed it elsewhere
   - auto-move misplaced files to their correct location

**task cleanup:**

7. check your internal task list (TaskList) for in-progress or stale items
8. mark completed tasks as done, flag orphaned ones

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
- **beads issue** (`br q "description"`) — use for "remember to do this in
  the future" when the task would extend outside the current context: needs
  extra research, has dependencies, or is more complex than "write this to
  file". set appropriate priority and type.

**decision framework:**

- is it a permanent project convention? → claude.md or `.claude/rules/`
- is it scoped to specific file types? → `.claude/rules/` with `paths:`
  frontmatter
- is it a pattern or insight claude discovered? → auto memory
- is it personal/ephemeral context? → `claude.local.md`
- is it duplicating content from another file? → use `@import` instead
- is it future work that needs research/dependencies/complexity? → beads issue

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
- **beads issue** — for skill/hook specs, complex improvements, or anything
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
   → [beads] br-xyz: create post-deploy health check skill

---

no action needed:

4. knowledge: discovered x works this way
   already documented in claude.md

## phase 4: journal it

after all other phases are complete, review the full conversation for material
worth preserving. look for:

- interesting technical solutions or debugging stories
- educational content (how-tos, tips, lessons learned)
- project milestones or feature launches
- architectural decisions and their reasoning

**if journal-worthy material exists:**

draft the entry and save to `!`echo $SKOGAI_CLAUDE_HOME`/journal/yyyy-mm-dd/<description>.md`

present the draft location in the report:

all wrap-up steps complete. journal entry saved:

1. "title" — 1-2 sentence description.
   saved to: journal/2026-02-20/sniffing-claudes-context-window.md

**if nothing journal-worthy:**

say "nothing worth journaling from this session" and you're done.
