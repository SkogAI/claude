# WO-1: Merge skogai-git-worktree into skogai-git
**Phase**: 1
**Status**: planned
**Depends on**: none

## Summary
The `skogai-git-worktree` skill is a standalone worktree manager that duplicates and conflicts with worktree coverage already built into `skogai-git`. Merge the unique content from `git-worktree` into `git` and retire the standalone skill.

## Context
`skogai-git` already has two worktree-specific workflows (`workflows/worktree-parallel.md` and `workflows/worktree-review.md`), a `wt` command reference (`references/wt-commands.md`), and routing entries for worktree intents in SKILL.md. Meanwhile, `skogai-git-worktree` provides a `worktree-manager.sh` bash script, detailed documentation on .env copying, .gitignore management, and a `copy-env` subcommand -- none of which exist in `skogai-git`. Having two skills creates ambiguity about which to invoke for worktree operations.

## Current State

**skogai-git** (the target -- already covers worktrees partially):
- `SKILL.md` -- routing table includes worktree intents, references `wt` tool
- `workflows/worktree-parallel.md` -- create/switch/merge/cleanup using `wt` CLI
- `workflows/worktree-review.md` -- isolated PR review using `wt` CLI
- `references/wt-commands.md` -- wt command reference
- `references/commit-philosophy.md`, `gita-commands.md`, `hook-types.md`, `tool-selection.md`
- `workflows/branch-management.md`, `commit-push.md`, `multi-repo.md`, `pr-workflow.md`

**skogai-git-worktree** (the source -- to be merged):
- `SKILL.md` -- standalone worktree manager docs (280 lines)
- `scripts/worktree-manager.sh` -- bash script with subcommands: create, list/ls, switch/go, cleanup/clean, copy-env

**Unique content in git-worktree not covered by git:**
1. `worktree-manager.sh` script (create, list, switch, cleanup, copy-env)
2. Automatic `.env` file copying to new worktrees (.env, .env.local, .env.test)
3. Automatic `.gitignore` management for `.worktrees/` directory
4. `copy-env` subcommand for retroactive env file copying
5. Opinionated `.worktrees/` directory convention (git uses `~/.worktrees/<branch>`)
6. Integration hooks with `/workflows:review` and `/workflows:work` commands
7. Troubleshooting section (worktree already exists, cannot remove, lost in worktree, missing .env)

**Overlap / conflicts:**
- git's workflows use `wt` CLI; git-worktree uses raw `worktree-manager.sh`
- git assumes `~/.worktrees/<branch>` path; git-worktree assumes `.worktrees/` in repo root
- Both cover create, list, switch, cleanup operations

## Tasks
- [ ] Decide on canonical worktree tool: `wt` CLI vs `worktree-manager.sh` (or both with clear guidance)
- [ ] Resolve directory convention conflict: `~/.worktrees/<branch>` vs `.worktrees/` in repo root
- [ ] Copy `scripts/worktree-manager.sh` into `skogai-git/scripts/` (if keeping the script)
- [ ] Add .env copying documentation to `workflows/worktree-parallel.md`
- [ ] Add .gitignore management notes to worktree workflows
- [ ] Add `copy-env` usage to `references/wt-commands.md` or create new reference
- [ ] Add troubleshooting section to an appropriate location in skogai-git (new file or append to workflow)
- [ ] Update SKILL.md routing table if new workflow files or references are added
- [ ] Verify no other skills reference `skogai-git-worktree` by path
- [ ] Remove/archive `skogai-git-worktree` directory after merge is verified

## Acceptance Criteria
- All unique content from `skogai-git-worktree` is accessible within `skogai-git`
- `skogai-git-worktree` directory no longer exists as a standalone skill
- No broken references from other skills pointing to the old location
- The `worktree-manager.sh` script (if kept) is reachable from the merged location
- Directory convention conflict is resolved with a single documented default

## Risks / Notes
- The two skills assume different directory layouts for worktrees -- merging requires picking one or documenting both with clear guidance on when to use which
- `worktree-manager.sh` references `${CLAUDE_PLUGIN_ROOT}/skills/git-worktree/` paths that will need updating
- Other skills or CLAUDE.md files may reference `skogai-git-worktree` by name -- grep the full skills directory before removing
- The `wt` CLI and `worktree-manager.sh` may have overlapping but subtly different behavior; test both before deciding
