---
title: workspace
type: note
permalink: claude/memory/context/workspace
---

# Workspace Context

## Environment

- Machine: skogix-workstation (Arch Linux)
- Shell: zsh, vim mode
- Claude's staged home: `/home/skogix/claude` → deploys to `/home/claude`
- Remote: `origin → SkogAI/claude`

## Git conventions

- Branch naming: `<agent>/<description>-<id>` (e.g. `claude/add-claude-documentation-KmFlh`)
- Commit style: conventional, lowercase, imperative
  - `chore:` maintenance/config
  - `docs:` documentation
  - `feat:` new features
  - `fix:` bug fixes

## CI

All workflows delegate to `SkogAI/.github` reusable workflows. Require `CLAUDE_CODE_OAUTH_TOKEN` secret.

- `claude.yml` — triggered by `@claude` mention in issues/PRs
- `claude-pr-review.yml` — auto PR review on every PR
- `claude-manual.yml` — manual dispatch from Actions tab

## Key files

- `.claude/settings.json` — single source of truth for Claude Code config
- `docs/deployment-gate.md` — checklist before migrating to /home/claude
- `bin/healthcheck` — environment sanity check
- `.planning/ROADMAP.md` — full roadmap spec
