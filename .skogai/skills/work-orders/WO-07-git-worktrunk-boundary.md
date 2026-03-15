# WO-7: Document skogai-git vs skogai-worktrunk boundary
**Phase**: 2
**Status**: planned
**Depends on**: WO-1 (git-worktree merge)

## Summary
The `skogai-git` and `skogai-worktrunk` skills both cover worktrees (`wt`) and gita, creating ambiguity about which skill should be invoked. A clear boundary must be drawn and documented so routing is unambiguous.

## Context
Both skills exist under `/home/skogix/.local/src/docs/skills/`. The `skogai-git` skill was designed as a unified git workflow hub (wt, gita, gh, semantic commits), while `skogai-worktrunk` focuses on `wt` and `gita` as tools with detailed configuration guidance. In practice, they overlap heavily on worktree commands, gita commands, and workflow patterns. This creates routing confusion: when a user says "create a worktree," which skill fires?

This work order depends on WO-1 (git-worktree merge) because that merge may change what content exists in `skogai-git` by the time this boundary work begins.

## Current State

### skogai-git
- **Location**: `/home/skogix/.local/src/docs/skills/skogai-git/`
- **SKILL.md**: 166 lines
- **Description**: "Unified git workflows using wt (worktrees), gita (multi-repo), gh (GitHub), and semantic commits."
- **Scope claimed**: Tool selection (wt vs gita vs gh vs raw git), commit philosophy, atomic commits, worktree workflows, PR workflows, branch management
- **references/** (5 files): commit-philosophy.md, gita-commands.md, hook-types.md, tool-selection.md, wt-commands.md
- **workflows/** (6 files): worktree-parallel.md, worktree-review.md, multi-repo.md, commit-push.md, branch-management.md, pr-workflow.md
- **Coverage**: Quick reference for wt commands, gita commands, gh commands. Routes to workflow files for step-by-step procedures.

### skogai-worktrunk
- **Location**: `/home/skogix/.local/src/docs/skills/skogai-worktrunk/`
- **SKILL.md**: 433 lines (much longer)
- **Description**: "Use when working with git worktrees (wt), managing submodules across branches, git-flow workflows, or multi-repo management (gita)."
- **Scope claimed**: wt and gita tool usage, worktrunk configuration (user config + project config), hook automation, submodule workflows, git-flow integration, LLM commit generation setup
- **reference/** (4 files): hook-types-reference.md (7KB), project-config.md (9KB), README.md (37KB), user-config.md (6KB)
- **CLAUDE.md**: Present (1.4KB) -- additional routing metadata
- **Coverage**: Deep configuration guidance, permission models, common patterns (submodules, git-flow, custom build systems, multi-repo + submodules)

## Overlap Analysis

### Direct overlaps

| Topic | skogai-git | skogai-worktrunk |
|-------|-----------|-----------------|
| `wt` command reference | Quick reference (8 commands) | Full command listing (essential + config + step commands) |
| `gita` command reference | Quick reference (8 commands) | Full command listing (essential + organization + operations) |
| "When to use wt vs gita" | Tool selection table in SKILL.md + references/tool-selection.md | "When to Use Which" section in SKILL.md |
| Worktree feature workflow | workflows/worktree-parallel.md | "Feature Branch Workflow" in SKILL.md |
| Hook types | references/hook-types.md | reference/hook-types-reference.md |
| `wt` commands detail | references/wt-commands.md | Inline in SKILL.md + reference/README.md |
| `gita` commands detail | references/gita-commands.md | Inline in SKILL.md + reference/README.md |

### Unique to skogai-git
- **gh (GitHub CLI)** integration: PR workflows, issue management, checks
- **Semantic commit philosophy**: Commit message conventions, atomic commit guidance
- **PR workflow**: Create, review, merge pull requests
- **Branch management workflow**: Create, switch, merge, cleanup branches
- **Commit-push workflow**: Step-by-step commit and push procedures
- **Worktree review workflow**: Isolated PR review in separate worktree

### Unique to skogai-worktrunk
- **Configuration management**: User config (`~/.config/worktrunk/config.toml`) vs project config (`.config/wt.toml`)
- **LLM integration setup**: Setting up `llm` or `aichat` for commit generation
- **Permission models**: Conservative (user config) vs proactive (project config)
- **Submodule lifecycle patterns**: post-create init + pre-merge deinit
- **Git-flow integration details**: Full git-flow with wt
- **Custom build system integration**: argc, task, etc. via hooks
- **CLAUDE.md routing file**: Additional metadata layer

## Proposed Resolution

**Sharpen boundaries, do not merge.** Both skills serve distinct purposes that become clear once framed correctly:

### Proposed boundary

| Skill | Scope | Mental model |
|-------|-------|-------------|
| **skogai-git** | Git **workflows and philosophy**: how to think about commits, branches, PRs, and which tool to reach for. Orchestration across tools (wt + gita + gh + raw git). | "What should I do?" |
| **skogai-worktrunk** | **wt and gita tool configuration and operation**: how to set up, configure, and use these specific tools. Deep reference material. | "How does this tool work?" |

### What needs to change

1. **skogai-git** should:
   - Remove inline `wt` and `gita` command references (defer to skogai-worktrunk for tool details)
   - Keep the tool selection table as a quick routing guide
   - Keep all workflow files (these are git workflows, not tool docs)
   - Keep commit philosophy, PR workflows, branch management
   - Add cross-reference: "For wt/gita tool details and configuration, see skogai-worktrunk"
   - Remove references/wt-commands.md and references/gita-commands.md (or replace with cross-references)

2. **skogai-worktrunk** should:
   - Remove workflow content that duplicates skogai-git workflows (the feature branch workflow in SKILL.md)
   - Keep all configuration, hook, and tool operation content
   - Add cross-reference: "For git workflow guidance and commit philosophy, see skogai-git"
   - Keep the "When to Use Which" section (it's about tool selection, fits both, but worktrunk owns tool knowledge)

3. **Shared content** (hook-types) should live in one place:
   - skogai-worktrunk owns hook configuration, so hook-types-reference.md stays there
   - skogai-git's references/hook-types.md should be removed or replaced with a cross-reference

### Updated routing rules
- "create a worktree" -> skogai-git (workflow) -> may load skogai-worktrunk for config
- "configure wt hooks" -> skogai-worktrunk
- "set up LLM for commits" -> skogai-worktrunk
- "commit these changes" -> skogai-git
- "how do I use gita groups?" -> skogai-worktrunk
- "sync all my repos" -> skogai-git (workflow) -> may load skogai-worktrunk for gita details

## Tasks
- [ ] Wait for WO-1 completion (git-worktree merge may change skogai-git content)
- [ ] Audit skogai-git SKILL.md: identify all inline wt/gita content to remove or replace with cross-refs
- [ ] Audit skogai-worktrunk SKILL.md: identify workflow content that duplicates skogai-git
- [ ] Move or deduplicate hook-types content (one canonical location)
- [ ] Deduplicate wt-commands and gita-commands references
- [ ] Add cross-reference from skogai-git to skogai-worktrunk for tool details
- [ ] Add cross-reference from skogai-worktrunk to skogai-git for workflow guidance
- [ ] Update routing tables in both SKILL.md files to reflect boundary
- [ ] Update skogai-worktrunk CLAUDE.md if routing metadata changes
- [ ] Test routing: verify representative queries land in the correct skill

## Acceptance Criteria
- No duplicated command references between the two skills
- No duplicated workflow content between the two skills
- Each skill's description clearly states its scope and defers to the other for out-of-scope topics
- Cross-references exist in both directions
- A user asking "configure wt hooks" routes to worktrunk, not git
- A user asking "create PR for this branch" routes to git, not worktrunk
- hook-types content exists in exactly one location

## Risks / Notes
- WO-1 (git-worktree merge) must complete first. If that merge adds or removes content from skogai-git, the boundary analysis here may need revision.
- The "When to Use Which" section exists in both skills. Removing it from one may break routing for users who enter through that skill. Consider keeping a brief version in skogai-git that links to the full version in skogai-worktrunk.
- The git-flow integration content in skogai-worktrunk is partly a workflow (skogai-git territory) and partly a tool configuration pattern (skogai-worktrunk territory). It may need to be split.
- Some users may think of "worktree" as a git concept and reach for skogai-git. The routing must handle this gracefully by cross-referencing.
