---
state: new
created: 2026-04-18
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
- `skogcli` — blocks `.envrc` (single-line `eval "$(skogcli config export-env ...)"`)
- `direnv` — no `.envrc` activation even if skogcli existed
- `skogai`, `gptodo`, `wt` (

## Notes

*Imported from external tracker. See source link for full context.*
