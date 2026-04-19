---
state: done
created: 2026-04-18
updated: 2026-04-19
tracking: ["https://github.com/SkogAI/claude/issues/43"]
tags: ["bug", "github"]
---

# bug: core tooling missing on non-skogix containers (staging, deployment)

**Source**: [Github #43](https://github.com/SkogAI/claude/issues/43)

## Description

## Problem

`CLAUDE.md` and `.claude/CLAUDE.md` assume a stack of CLI tools is present, but they only exist on skogix's workstation. On a stock staging container (`/home/user/claude`) or the deployment target (`/home/claude`), none of them are available.

## Observed on staging container (2026-04-18)

**Missing from PATH:**
- `skogcli` — blocks `.envrc` when `.envrc` depends on it
- `direnv` — no `.envrc` activation even if `skogcli` exists
- `skogai`, `gptodo`, `wt`, `gita`, `argc`
- `gh` (GitHub MCP tools can substitute)
- `atuin` and `shellcheck` can be missing depending on environment

## Completion

Implemented graceful degradation so missing optional tools no longer break workflow:

1. **Hardened hook commands in `.claude/settings.json`**
   - Wrapped all `atuin hook claude-code` invocations with command existence checks:
     - `command -v atuin >/dev/null 2>&1 && atuin hook claude-code || true`
   - Guarded shellcheck hook execution:
     - skip when `shellcheck` is unavailable instead of failing noisily
   - Made statusline resilient when `wt` is missing by falling back to git branch:
     - `command -v wt ... || git rev-parse --abbrev-ref HEAD ...`

2. **Extended `claude-todo/bin/healthcheck` with tooling audit**
   - Added a dedicated `tooling` section that reports presence/absence of expected binaries.
   - Missing tools are warnings (informative) rather than hard failures, preventing false negatives on minimal containers.

## Validation

- `.claude/settings.json` validates as JSON (`jq empty`).
- `claude-todo/bin/healthcheck` runs successfully and now prints tool availability summary.
- Healthcheck exit code remains non-blocking for missing optional tooling (warn), while preserving failure semantics for true hard failures.

## Notes

This resolves the immediate operational bug by making the environment assumptions explicit and non-fatal. A future bootstrap pass can still add automatic installation/verification for required tools.
