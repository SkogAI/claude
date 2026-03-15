---
title: "WO-7: Document skogai-git vs skogai-worktrunk boundary"
labels: skills, refactor, phase-2
---

## Summary

Both `skogai-git` and `skogai-worktrunk` cover `wt` and `gita` commands, creating routing ambiguity. Sharpen boundaries: git = workflow orchestration ("what to do"), worktrunk = tool configuration ("how tools work").

**Depends on:** WO-1 (git-worktree merge changes git's content)

## Context

**skogai-git** (166-line SKILL.md):
- Description: "Unified git workflows using wt, gita, gh, semantic commits"
- References: commit-philosophy, gita-commands, hook-types, tool-selection, wt-commands
- Workflows: worktree-parallel, worktree-review, multi-repo, commit-push, branch-management, pr-workflow

**skogai-worktrunk** (433-line SKILL.md):
- Description: "Use when working with git worktrees (wt), managing submodules, git-flow workflows, or multi-repo management (gita)"
- References: hook-types-reference (7KB), project-config (9KB), README (37KB), user-config (6KB)
- Also has CLAUDE.md with routing metadata

## Overlap Analysis

| Topic | skogai-git | skogai-worktrunk |
|-------|-----------|-----------------|
| `wt` command reference | Quick ref (8 cmds) | Full listing |
| `gita` command reference | Quick ref (8 cmds) | Full listing |
| "When to use wt vs gita" | Tool selection table + reference | "When to Use Which" section |
| Worktree feature workflow | workflows/worktree-parallel.md | Feature Branch Workflow in SKILL.md |
| Hook types | references/hook-types.md | reference/hook-types-reference.md |

**Unique to git:** gh integration, semantic commit philosophy, PR workflows, branch management, commit-push workflow
**Unique to worktrunk:** Configuration management (user + project config), LLM setup, permission models, submodule lifecycle, git-flow integration, custom build system hooks

## Proposed Boundary

| Skill | Scope | Mental model |
|-------|-------|-------------|
| **skogai-git** | Git workflows and philosophy. Which tool to reach for, how to think about commits/branches/PRs. | "What should I do?" |
| **skogai-worktrunk** | wt and gita tool configuration and operation. How to set up, configure, and use these tools. | "How does this tool work?" |

## Tasks

- [ ] Wait for WO-1 completion (git-worktree merge may change skogai-git content)
- [ ] Audit skogai-git SKILL.md: identify inline wt/gita content to remove or cross-ref
- [ ] Audit skogai-worktrunk SKILL.md: identify workflow content that duplicates git
- [ ] Deduplicate hook-types (keep in worktrunk, cross-ref from git)
- [ ] Deduplicate wt-commands and gita-commands references (keep full versions in worktrunk, keep quick-ref or cross-ref in git)
- [ ] Add cross-reference from git to worktrunk: "For wt/gita tool details and configuration, see skogai-worktrunk"
- [ ] Add cross-reference from worktrunk to git: "For git workflow guidance and commit philosophy, see skogai-git"
- [ ] Update routing tables in both SKILL.md files
- [ ] Update skogai-worktrunk CLAUDE.md if routing metadata changes
- [ ] Test routing: "configure wt hooks" → worktrunk, "create PR" → git

## Acceptance Criteria

- No duplicated command references between the two skills
- No duplicated workflow content
- Each skill's description clearly states scope and defers to other
- Cross-references exist in both directions
- hook-types content exists in exactly one location
- Routing for representative queries lands in correct skill

## Notes

- "When to Use Which" exists in both — keep brief version in git linking to full version in worktrunk
- Git-flow content in worktrunk is partly workflow (git territory) and partly config (worktrunk territory) — may need splitting
- Users may think "worktree" = git concept and reach for skogai-git — routing must handle this via cross-reference
