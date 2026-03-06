# Git Flow — Implementation Plan

Design: @docs/plans/2026-03-06-git-flow-design.md

## Tasks

### 1. Create the git-flow skill file
**File:** `skills/git-flow.md`
**Time:** ~3 min
**Do:**
- Create skill with frontmatter (name, description, trigger conditions)
- Skill content: step-by-step flow (create issue → branch → work → PR)
- Include the issue template, branch naming, commit format, PR format from design
- Add to skill registry so superpowers discovers it

**Verify:** Skill file exists, frontmatter is valid YAML, skill appears in available skills list.

### 2. Create a `/start` command that delegates to the skill
**File:** `commands/start.md`
**Time:** ~2 min
**Do:**
- Simple command: "Start work on a task. Creates an issue, branch, and tracks progress."
- Delegates to the git-flow skill

**Verify:** `/start` appears in available commands.

### 3. Create a `/issue` command for standalone issue creation
**File:** `commands/issue.md`
**Time:** ~2 min
**Do:**
- Command that creates a GitHub issue using the standard format
- Uses GitHub MCP tools or `gh` CLI
- Returns issue number and URL

**Verify:** Running `/issue add login page` creates a properly formatted issue on GitHub.

### 4. Test the full flow end-to-end
**Time:** ~5 min
**Do:**
- Use `/start` or trigger the skill with a small task
- Verify: issue created on GitHub, branch created locally, commits follow format, PR created linking issue

**Verify:** Issue exists on GitHub, branch exists, PR references the issue.

### 5. Update CLAUDE.md routing table
**File:** `CLAUDE.md`
**Time:** ~1 min
**Do:**
- Add git-flow skill and /start, /issue commands to the routing table

**Verify:** Routing table includes new entries.

## Order

Tasks 1-3 are independent (parallel). Task 4 depends on all three. Task 5 can happen after 4.
