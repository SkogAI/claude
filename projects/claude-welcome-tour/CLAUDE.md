# Claude Welcome Tour

Working memory for the SkogAI rebuild — fresh start, documented from scratch.

## What SkogAI Is

Intelligent context routing for Claude Code sessions — get the *right* context at the *right* time instead of dumping everything at boot. "Routing over dumping" — minimal boot that detects session type and loads on demand (~10k right tokens vs 50k dump).

## What Exists Now

- `scripts/csync.sh` — auto-commit hook (needs fix: still uses `cgit.sh`, should use `claude-dotfiles`)
- `scripts/clog.sh` — log viewer (partially updated by user, needs pathspec exclusions)
- `scripts/cgit.sh` — legacy bare repo wrapper (replaced by `claude-dotfiles`)
- `global/` — symlinks into ~/.claude/ (settings, projects, plans, todos, plugins, exclude)
- `projects/skogapi/` — FastAPI service (routing data, agents, config). Status unknown.
- `projects/skogai-context/` — planning docs for the context routing system. Not implemented.
- `projects/newinstall/` — post-archinstall setup docs.
- `.skogai/` — legacy local context (DECISIONS.md, RULES.md, email system, journal, todo archive). "Probably doesn't make sense with current context but we will get there."

## What's Been Removed

- `global/skills/` — all skills deleted (routing, agent-prompting, argc, fleet-memory, nelson)
- `~/.claude/skills/` — stale cached skills
- `projects/skogai-core/` — plugin scaffold deleted
- Failed `csync-check.sh` and its artifacts (snapshots/, /tmp files)

## Key Discoveries

**Cache pollution is the core problem.** Anthropic's cache serves deleted files as current. Skills deleted weeks ago were read as real during /init. Only Claude can see the cache — user cannot audit it. Fix: explicit delete + Read tool verification.

**Bare repo is live and thorough.** `claude-dotfiles diff` revealed Claude Code records: debug telemetry, every user message verbatim, full conversation transcripts (including thinking blocks with crypto signatures), shell history, screen dimensions, API handshakes, permission decisions. All committed by csync on every message.

**Bare repo log is noisy.** Raw `claude-dotfiles log --stat` produces 6500+ lines of noise (debug, transcripts, tool-results, zsh_history). Needs pathspec exclusions.

**Bloating file still exists.** `global/projects/-home-skogix-claude/7879c7bc-abb6-4432-8022-25a59da10510/tool-results/bisf9iew9.txt` — 7736-line tool-results file from the overengineered csync-check script. Makes `/diff` choke.

**Git diff format.** `i/`/`w/` prefixes (not `a/`/`b/`) come from `diff.mnemonicPrefix = true`. `i/` = index, `w/` = working tree. In bare repo diff, `[32m` (green) = new since last csync.

## Unresolved References (to clarify or remove)

- **rtk** — command rewrite hook (`global/hooks/rtk-rewrite.sh`). What is it?
- **beads/br** — issue tracking referenced in /wrapup command. What is it?
- **~/skogai/** — external repo, managed via `skogai-dotfiles`. Will set up together.
- **soul document** — identity layer referenced in skogai-context planning.

## Design Principles

- Stale context is worse than no context
- Archaeology before generation (recover existing work before inventing)
- Small iterations, focused agents, constrained workflows
- After ~500 tokens of explanation, stop
- Don't overengineer. One command. One thing.
- Always verify against disk, never trust cache

## Tour Progress

1. [x] Init — explored repo, wrote root CLAUDE.md
2. [x] Context audit — shared what I see vs what's opaque
3. [x] Cleanup — deleted stale skills, skogai-core, ~/.claude/skills/
4. [x] Dual-git exploration — mapped both repos via proper wrappers
5. [x] Root CLAUDE.md updated — removed stale skills/skogai-core refs, added git wrappers, cache warning
6. [ ] Fix scripts — clog.sh (pathspec exclusions), csync.sh (cgit.sh → claude-dotfiles, remove skills from rsync)
7. [ ] Delete bloating tool-results file (bisf9iew9.txt)
8. [ ] Set up ~/skogai and explore skogai-dotfiles
9. [ ] Clarify or remove stale references (rtk, beads/br, soul document)
10. [ ] Check skogapi/ status
11. [ ] Explore .skogai/todo/ (archived project docs, bin scripts)
12. [ ] Rebuild skills/plugins from scratch with full understanding
