# SkogAI Skills — Chapter 1: Workspace Setup

## What This Is

A Claude Code plugin that teaches the SkogAI workflow by doing it. Each chapter builds something real — this first chapter sets up the workspace, cleans up the skills directory, and establishes the patterns everything else follows. The plugin is both the tutorial and the tool: going through it IS learning the workflow.

## Core Value

Agents of any size — from Haiku at 8K tokens to Opus at 200K — can follow the SkogAI workflow by reading files, not by having massive context windows. If it's not written down, it doesn't exist.

## Requirements

### Validated

(None yet — ship to validate)

### Active

- [ ] Clean and integrate `.claude/skills/` directory (4 skills: skogai-routing, skogai-bats-testing, planning-with-files, skill-creator)
- [ ] Establish "filesystem as memory" pattern — working memory files that small-context agents can use
- [ ] Remove or absorb `planning-with-files` — keep what GSD doesn't cover, discard the rest
- [ ] Tighten `skogai-routing` as the foundational skill (it teaches the pattern everything else follows)
- [ ] Keep `skill-creator` as-is (base tooling for building/testing skills)
- [ ] Keep `skogai-bats-testing` as-is (shell testing framework)
- [ ] Set up the plugin shell that will hold future chapters
- [ ] Chapter 1 overview: big picture, goals, what to expect from the series

### Out of Scope

- Other chapters beyond chapter 1 — future milestones
- Building new skills from scratch — this chapter is about cleaning and integrating what exists
- Changing the GSD framework itself — we use it, we don't modify it
- Perfection — this is explicitly iterative, expect to revisit

## Context

This lives in `~/claude/` which is the SkogAI home folder and operating environment. It's not application code — the repo IS the workspace. Skills are staged in `.claude/skills/` via symlinks and graduate to `~/.claude/` or marketplace plugins when stable.

The `skogai-*` prefix means "forked, created, or heavily modified" — distinguishing our skills from external ones (like `skill-creator` and `planning-with-files`).

The GSD framework (get-shit-done plugin) provides the project management workflow. This project uses GSD to manage itself — meta but practical.

Key insight from questioning: planning-with-files has a valid principle ("filesystem as memory") that GSD's planning artifacts don't fully cover. Small-context agents need a RAM-file pattern — something they update every action to stay oriented. We'll discover the right shape for this by using it.

## Constraints

- **Workspace, not app**: No build/test/lint cycle. Quality is measured by whether agents can follow the workflow.
- **Iterative by design**: First pass won't be perfect. Ship to learn, iterate to improve.
- **Plugin format**: Must work as a Claude Code plugin that others can install.
- **Agent-size agnostic**: Must work for agents with 8K context, not just 200K.

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| Use GSD to manage the GSD tutorial | Meta but practical — dogfooding the workflow | — Pending |
| Keep skill-creator as-is | It's Anthropic's official tool, useful base | — Pending |
| Absorb planning-with-files, don't just delete | "Filesystem as memory" principle is valid | — Pending |
| skogai-routing is chapter 1's foundation | It teaches the pattern everything else follows | — Pending |

---
*Last updated: 2026-03-14 after initialization*
