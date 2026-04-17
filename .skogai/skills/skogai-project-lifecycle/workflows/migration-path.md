---
title: migration-path
type: note
permalink: skogai/skills/skogai-project-lifecycle/workflows/migration-path
---

# Migration Path - Moving to Production

<objective>
Move pruned, tested code from `.skogai/skogix/` to `.skogai/claude/` and integrate with production workflows.
</objective>

<prerequisites>
Before migrating, ensure:
- Code is pruned and simplified
- Core functionality tested
- Docs are minimal but sufficient
- Follows functional-first principles
- Anti-bloat principles applied
</prerequisites>

\<decision_point>

## Should This Migrate?

**Migrate to .skogai/claude/ if:**

- Used regularly across multiple projects
- Solves a general problem (not one-off)
- Fits the "small, specific, effective" philosophy
- Worth maintaining long-term
- Benefits from standardization

**Keep in .skogai/skogix/ if:**

- Project-specific solution
- Still evolving rapidly
- Experimental/niche use case
- Not yet proven across contexts
- Personal workflow optimization

When in doubt, keep in skogix longer. Premature migration = bloat.

\</decision_point>

\<migration_process>

## 1. Choose Destination

Based on type:

**Skills** → `.skogai/claude/skills/<name>/`

- Must follow router pattern
- SKILL.md + workflows/ + references/
- Under 500 lines in SKILL.md
- Progressive disclosure

**Agents** → `.skogai/claude/agents/<name>.md`

- Single-purpose, focused
- Clear triggering conditions
- Integrates with hooks

**Workflows** → `.skogai/claude/workflows/<name>.md`

- Reusable process
- Clear start/end conditions
- Step-by-step format

**Scripts** → `.skogai/claude/scripts/<name>.sh`

- Automation only
- Well-documented arguments
- Idempotent where possible

**Hooks** → `.skogai/claude/hooks/<hook-name>.sh`

- Follows lifecycle hook pattern
- Fast execution
- Clear success/failure

## 2. Adapt to Production Structure

**For skills:**

- Split into router pattern if complex
- Move detailed content to references/
- Ensure YAML frontmatter correct
- Test routing paths

**For agents:**

- Single file, focused scope
- Clear triggering conditions
- Integration with existing agents

**For workflows:**

- XML structure
- Clear success criteria
- References to related docs

## 3. Integration Test

Test in production context:

- Works with existing `.skogai/claude/` tools?
- Follows naming conventions?
- Integrates with hooks if needed?
- Doesn't conflict with other tools?

## 4. Documentation

Add to:

- `@.skogai/claude/README.md` or relevant index
- Update related routing in other skills
- Add to skill lists if applicable

Keep docs minimal - the code/skill structure should be self-documenting.

## 5. Cleanup

After successful migration:

- Archive or remove from `.skogai/skogix/`
- Update any references to old location
- Note in changelog if applicable

\</migration_process>

\<production_standards>

Code in `.skogai/claude/` must:

- Follow functional-first principles (F#)
- Have test coverage for core workflows
- Use kebab-case naming
- Minimal comments (self-documenting code)
- No hidden errors/warnings
- Anti-bloat principles enforced

If it doesn't meet these standards, it's not ready.

\</production_standards>

\<real_examples>

## Successful Migrations

**skogai-argc** (skill):

- Started as experimental argc exploration
- Pruned to core patterns
- Moved to `.skogai/claude/skills/skogai-argc/`
- Now foundational skill

**code-simplicity-reviewer** (agent):

- Started as manual review process
- Evolved into agent
- Integrated with post-tool-use hook
- Now the ONLY core agent

**4 core workflows**:

- plan, work, review, compound
- Distilled from many experimental approaches
- Now in `.skogai/claude/workflows/`
- Form the foundation of skogai workflow

## Still in Migration Queue

**skogai-developing-for-claude-code**:

- Works well
- Still validating patterns
- May prune further before migration
- Marked as "temporary" until proven

\</real_examples>

\<success_criteria>

Migration successful when:

- Code lives in `.skogai/claude/` appropriate location
- Integrates smoothly with existing tools
- Meets production standards
- Documented minimally
- Old location cleaned up
- Usable across projects

\</success_criteria>

<philosophy>

The bar for `.skogai/claude/` is high intentionally.

Better to have 5 excellent, battle-tested tools than 50 "pretty good" ones.

Migration should feel earned, not automatic.

</philosophy>
