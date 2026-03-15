---
title: "WO-1: Merge skogai-git-worktree into skogai-git"
labels: skills, merge, phase-1
---

## Summary

Absorb `skogai-git-worktree` into `skogai-git` and delete the standalone skill. git-worktree is a strict subset of git's scope, and git already has worktree workflows.

## Context

**Source (to be merged):** `skogai-git-worktree/`
- `SKILL.md` — standalone worktree manager docs (280 lines)
- `scripts/worktree-manager.sh` — bash script with subcommands: create, list/ls, switch/go, cleanup/clean, copy-env

**Target (absorbing):** `skogai-git/`
- Already has `workflows/worktree-parallel.md` and `workflows/worktree-review.md`
- Already has `references/wt-commands.md`
- SKILL.md routing table already includes worktree intents

**Unique content in git-worktree not covered by git:**
1. `worktree-manager.sh` script (create, list, switch, cleanup, copy-env)
2. Automatic `.env` file copying to new worktrees (.env, .env.local, .env.test)
3. Automatic `.gitignore` management for `.worktrees/` directory
4. `copy-env` subcommand for retroactive env file copying
5. Integration hooks with `/workflows:review` and `/workflows:work` commands
6. Troubleshooting section (worktree already exists, cannot remove, lost in worktree, missing .env)

**Known conflict:** git assumes `~/.worktrees/<branch>` path; git-worktree assumes `.worktrees/` in repo root. Must resolve.

## Tasks

- [ ] Decide canonical worktree directory convention: `~/.worktrees/<branch>` vs `.worktrees/` in repo root
- [ ] Decide on canonical worktree tool: `wt` CLI vs `worktree-manager.sh` (or both with clear guidance)
- [ ] Copy `scripts/worktree-manager.sh` into `skogai-git/scripts/` (if keeping the script)
- [ ] Add .env copying documentation to `workflows/worktree-parallel.md`
- [ ] Add .gitignore management notes to worktree workflows
- [ ] Add `copy-env` usage to `references/wt-commands.md` or create new reference
- [ ] Add troubleshooting section to appropriate location in skogai-git
- [ ] Update SKILL.md routing table if new workflow files or references are added
- [ ] Grep all skills for references to `skogai-git-worktree` and update them
- [ ] Delete `skogai-git-worktree/` directory

## Acceptance Criteria

- All unique content from `skogai-git-worktree` is accessible within `skogai-git`
- `skogai-git-worktree` directory no longer exists
- No broken references from other skills
- Directory convention conflict is resolved with a single documented default
- `worktree-manager.sh` (if kept) references correct paths from new location

## Notes

- `worktree-manager.sh` may have hardcoded `${CLAUDE_PLUGIN_ROOT}/skills/git-worktree/` paths — check and update
- The `wt` CLI and `worktree-manager.sh` may have overlapping but subtly different behavior — test both before deciding
