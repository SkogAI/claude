# Git Flow Design

## Problem

No git workflow exists. Issues don't get created. Work happens directly on master with throwaway commit messages. No branches, no PRs, no traceability.

## Design

A single skill (`git-flow`) that enforces: **issue → branch → work → PR → merge** for every piece of work.

### Flow

```
user describes task
  → Claude creates GitHub issue on SkogAI/claude
  → Claude creates branch: {issue-number}-{slug}
  → work happens with conventional commits
  → Claude creates PR referencing "Closes #{issue-number}"
  → user approves → merge
```

### Issue format

```markdown
## What
One-sentence description of the task.

## Why
Context: what problem this solves or what it enables.

## Tasks
- [ ] task 1
- [ ] task 2
```

### Branch naming

```
{issue-number}-{short-slug}
```

Examples: `42-git-flow-skill`, `15-fix-routing-bug`

### Commit format

Existing convention, enforced:
```
{type}(#{issue-number}): {description}
```

Examples: `feat(#42): add git-flow skill`, `fix(#15): correct routing logic`

### PR format

```markdown
## Summary
What changed and why.

## Closes #{issue-number}

## Changes
- bullet list of what was done
```

### Skill trigger

The skill activates when:
- User asks to build/fix/add something
- User says "work on #{number}"
- Any task that will result in code changes

### Integration with existing skills

- **brainstorming** → creates the issue at the end of design approval
- **using-git-worktrees** → uses the branch name from the issue
- **finishing-a-development-branch** → creates the PR linking the issue
- **verification-before-completion** → runs before PR creation

### What this does NOT do

- No labels, milestones, or project boards (YAGNI)
- No issue templates beyond the simple format above
- No branch protection rules
- No required reviewers
