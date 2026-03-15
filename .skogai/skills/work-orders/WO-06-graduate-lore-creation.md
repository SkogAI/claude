# WO-6: Graduate lore-creation from skogai-wip
**Phase**: 1
**Status**: planned
**Depends on**: none

## Summary
The `lore-creation` skill is the only content inside `skogai-wip/`, a staging container for work-in-progress skills. Evaluate whether lore-creation is ready for graduation to a top-level `skogai-lore-creation` skill and retire the empty WIP container.

## Context
`skogai-wip/` exists as a holding area for skills not yet ready for top-level placement. It currently contains exactly one subdirectory: `lore-creation/`, with a single file (`SKILL.md`). The lore-creation skill provides guidance for creating structured knowledge documentation -- it covers lore categories (process, domain, historical, reference), document structure templates, best practices, and a validation checklist. The skill is self-contained and has no dependencies on other files or scripts. The question is whether it is complete enough to stand alone at the top level.

## Current State

**skogai-wip/ directory:**
- `lore-creation/SKILL.md` -- the only file in the entire WIP tree (160 lines)
- No other files, no other subdirectories, no README or CLAUDE.md for the WIP container itself

**lore-creation/SKILL.md contents:**
- Frontmatter: name `lore-creation`, allowed-tools: Bash, Read, Write, Edit
- "When to Use" section: knowledge documentation, knowledge bases, complex systems, persistent repositories
- "Lore Structure" section: basic markdown template (Overview, Key Concepts, Details, Examples, References)
- "Creating Effective Lore" section: 5 guidelines (overview first, define terms, structure hierarchically, include examples, cross-reference)
- "Lore Categories" section: process, domain, historical, reference lore
- "Best Practices" section: keep current, make searchable, write for the reader
- "Validation Checklist": 6-item checklist

**Assessment of readiness:**
- The skill is documentation-only (no scripts, no schema, no complex workflows)
- Content is generic and project-agnostic -- no hardcoded references
- It provides guidance but no automation (no scripts to scaffold lore docs)
- The validation checklist is manual (no enforced gates)
- Missing: no references/ directory, no templates/ directory, no examples of actual lore documents
- The skill reads more like a style guide than an operational workflow

## Tasks
- [ ] Evaluate whether SKILL.md is complete enough for top-level graduation or needs additional content first
- [ ] If graduating: create `skogai-lore-creation/` at the top level of the skills directory
- [ ] If graduating: move `skogai-wip/lore-creation/SKILL.md` to `skogai-lore-creation/SKILL.md`
- [ ] If graduating: consider adding a `templates/` directory with the lore document template extracted from SKILL.md
- [ ] If graduating: consider adding an `examples/` directory with one concrete lore document demonstrating the format
- [ ] Update the SKILL.md frontmatter `name` field if the skill name changes (e.g., from `lore-creation` to `skogai-lore-creation`)
- [ ] Verify no other skills or CLAUDE.md files reference `skogai-wip/lore-creation` by path
- [ ] Remove `skogai-wip/` directory after graduation (it has no other content)
- [ ] If NOT graduating: document what is needed before lore-creation is ready, and add a README to skogai-wip explaining its purpose

## Acceptance Criteria
- `lore-creation` exists at a top-level skill path (not nested under WIP)
- The `skogai-wip/` directory is removed (no remaining content justifies its existence)
- No broken references from other skills or CLAUDE.md files
- The graduated skill is loadable and functional (SKILL.md frontmatter is valid)
- A decision is documented on whether the skill needs enrichment (templates, examples, automation) as a follow-up

## Risks / Notes
- The skill is lightweight (single file, 160 lines, guidance-only) -- graduating it as-is is low risk but also low value unless it gets used. Consider whether enrichment should happen before or after graduation
- The WIP container has no README or purpose statement -- it is unclear whether other skills were planned for it or if it was created solely for lore-creation
- The skill name in frontmatter is `lore-creation` (no `skogai-` prefix) -- decide whether to add the prefix for consistency with other skills or keep it short
- If other WIP skills are planned in future, a new staging mechanism should be defined rather than recreating `skogai-wip/`
