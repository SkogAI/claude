---
title: "WO-9: Restructure skogai-argc navigation"
labels: skills, refactor, phase-4
---

## Summary

Restructure the 675-line `skogai-argc` SKILL.md into a router-pattern skill. The "how to create an Argcfile.sh" content is buried at line 440, while internal implementation details occupy the first half.

**Depends on:** WO-1 through WO-7 (structure should be stable)

## Context

### Current section structure (675 lines):
1. **YAML frontmatter** (1-4)
2. **Purpose** (6-11) — what argc is, two components
3. **When to Use** (13-27) — trigger conditions
4. **How to Use** (29-30) — header only
5. **Core Workflow** (32-109) — `argc --argc-eval` explanation (actually about internals, not getting work done)
6. **Available Comment Tags** (111-167) — tag reference table, modifiers
7. **Inline Choices and Default Values** (261-288)
8. **Environment Variables** (290-338)
9. **Choice Functions** (340-392)
10. **Symbols** (394-438)
11. **Task Runner Pattern (Argcfile.sh)** (440-549) — THE ACTUAL "HOW TO" CONTENT
12. **Behind the Scenes** (552-638) — `argc --argc-build` output, internals
13. **Safety Guidelines** (640-657)
14. **Additional Resources** (659-662)
15. **Quick Start Template** (664-675)

### Problems:
- Actual usage content buried at line 440
- Lines 111-438 are reference material mixed into main flow
- Lines 552-638 are pure internals
- No intake/routing pattern despite complexity warranting it
- Uses markdown headings throughout (no XML structure)

## Proposed Structure

### New SKILL.md (target: 200-300 lines):
```
1. YAML frontmatter
2. <essential_principles> — argc = bash code generation via --argc-eval (20-30 lines)
3. <intake> — "What do you want to do?"
4. <routing> — Intent → workflow mapping
5. <quick_reference> — Most common comment tags (compact table)
6. <reference_index>
7. <workflows_index>
8. <success_criteria>
```

### New workflows/:
- `create-argcfile.md` — step-by-step for creating an Argcfile.sh from scratch
- `add-argument-parsing.md` — converting existing bash script to use argc
- `add-completions.md` — setting up shell completions
- `add-validation.md` — adding choice functions and symbols

### New references/:
- `comment-tags.md` — full tag reference with all modifiers and examples (absorbs lines 111-438)
- `argc-internals.md` — how --argc-build works, generated functions, JSON export (absorbs lines 552-638)
- `task-runner-patterns.md` — advanced Argcfile patterns, comparison with Make (absorbs parts of lines 440-549)

## Tasks

- [ ] Create `skogai-argc/workflows/` directory
- [ ] Create `skogai-argc/references/` directory
- [ ] Extract comment tags content (lines 111-438) into `references/comment-tags.md`
- [ ] Extract "Behind the Scenes" (lines 552-638) into `references/argc-internals.md`
- [ ] Extract advanced Argcfile patterns into `references/task-runner-patterns.md`
- [ ] Create `workflows/create-argcfile.md` from task runner section (lines 440-549)
- [ ] Create `workflows/add-argument-parsing.md`
- [ ] Create `workflows/add-completions.md`
- [ ] Create `workflows/add-validation.md` from choice functions/symbols content
- [ ] Rewrite SKILL.md as router: essential_principles, intake, routing, quick_reference, indexes
- [ ] Convert from markdown headings to XML structure
- [ ] Preserve `argc --argc-eval` insight prominently in essential_principles
- [ ] Verify all `@docs/` and `@examples/` references still work
- [ ] Add cross-reference to skogai-worktrunk (wt uses argc internally)

## Acceptance Criteria

- SKILL.md is under 300 lines (ideally 200-250)
- Agent asked to "create an Argcfile.sh" reaches right workflow in one routing hop
- All content preserved (nothing deleted, only moved)
- "Behind the Scenes" is in references/, not main skill
- Comment tag reference is complete in references/
- Follows router pattern from skogai-routing
- Quick start template remains in SKILL.md

## Notes

- The `argc --argc-eval` insight is the key teaching — keep it prominent in essential_principles, don't bury in references
- Safety Guidelines ("Never make argc scripts executable") has placeholder for "detailed explanation" — either provide it or remove placeholder
- Converting markdown to XML is significant reformatting but aligns with ecosystem conventions
- Preserve `@docs/` and `@examples/` relative path convention
