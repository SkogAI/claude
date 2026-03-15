---
title: "WO-6: Graduate lore-creation from skogai-wip"
labels: skills, cleanup, phase-1
---

## Summary

`lore-creation` is the only content inside `skogai-wip/`, an undocumented WIP container. Graduate it to a top-level skill and remove the empty container.

## Context

**`skogai-wip/` contains:**
- `lore-creation/SKILL.md` — the only file in the entire WIP tree (160 lines)
- No other files, subdirectories, README, or CLAUDE.md for the WIP container

**`lore-creation/SKILL.md` contents:**
- Frontmatter: name `lore-creation`, allowed-tools: Bash, Read, Write, Edit
- "When to Use" section: knowledge documentation, knowledge bases, complex systems
- "Lore Structure" section: markdown template (Overview, Key Concepts, Details, Examples, References)
- "Creating Effective Lore" section: 5 guidelines
- "Lore Categories" section: process, domain, historical, reference lore
- "Best Practices" section: keep current, make searchable, write for reader
- "Validation Checklist": 6-item checklist

**Assessment:** Documentation-only, no scripts or schema. Generic and project-agnostic. Reads more like a style guide than an operational workflow. Self-contained, no dependencies.

## Tasks

- [ ] Decision gate: graduate as-is (lightweight) or enrich first (add templates/examples)?
- [ ] Create `skogai-lore-creation/` at top level of skills directory
- [ ] Move `skogai-wip/lore-creation/SKILL.md` to `skogai-lore-creation/SKILL.md`
- [ ] Update SKILL.md frontmatter `name` field (decide: `lore-creation` or `skogai-lore-creation`)
- [ ] Optionally: extract lore document template from SKILL.md into `templates/` directory
- [ ] Optionally: add one concrete example lore document in `examples/`
- [ ] Grep all skills for references to `skogai-wip/lore-creation`
- [ ] Remove `skogai-wip/` directory (no remaining content)
- [ ] If NOT graduating: document what's needed first, add README to skogai-wip

## Acceptance Criteria

- `lore-creation` exists at a top-level skill path (not nested under WIP)
- `skogai-wip/` directory is removed
- No broken references
- SKILL.md frontmatter is valid and loadable
- Decision documented on whether enrichment (templates, examples) is a follow-up

## Notes

- Lightweight (160 lines, guidance-only) — low risk but also low standalone value
- Name prefix: other skills use `skogai-` prefix. Decide whether to add it for consistency.
- If other WIP skills are planned, define a new staging mechanism rather than recreating `skogai-wip/`
