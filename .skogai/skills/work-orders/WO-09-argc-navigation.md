# WO-9: Improve skogai-argc navigation
**Phase**: 4
**Status**: planned
**Depends on**: WO-1 through WO-7 (all prior phases must complete; WO-8 cross-references should ideally land first so argc's see_also is included)

## Summary
Restructure the 675-line skogai-argc SKILL.md into a router-pattern skill with clear separation between core workflow (what you need to get started) and behind-the-scenes content (how argc works internally).

## Context
skogai-argc is one of the most content-rich skills at 675 lines -- well over the 500-line guideline established by skogai-routing and skogai-skills. It mixes "how to use argc" with "how argc works internally" in a single flat document. An agent that triggers this skill to create an Argcfile.sh has to wade through generated bash internals, validation cascade details, and `argc --argc-build` output before finding the task runner pattern.

## Current State

### Current section structure of SKILL.md (675 lines):
1. **YAML frontmatter** (lines 1-4) -- name + description
2. **Purpose** (lines 6-11) -- what argc is, two components
3. **When to Use** (lines 13-27) -- trigger conditions
4. **How to Use This Skill** (lines 29-30) -- header only
5. **Core Workflow** (lines 32-109) -- `argc --argc-eval` explanation, success/error examples, key points
6. **Available Comment Tags** (lines 111-167) -- tag reference table, @cmd vs @describe, argument modifiers
7. **Inline Choices and Default Values** (lines 261-288)
8. **Environment Variables** (lines 290-338)
9. **Choice Functions - Dynamic Validation** (lines 340-392)
10. **Symbols - Dynamic Choice Functions** (lines 394-438)
11. **Task Runner Pattern (Argcfile.sh)** (lines 440-549) -- basic setup, capabilities, multi-namespace, env vars, task deps, why over Make
12. **Behind the Scenes** (lines 552-638) -- `argc --argc-build` output, validation function internals, generated functions, trade-offs, JSON export
13. **Safety Guidelines** (lines 640-657)
14. **Additional Resources** (lines 659-662) -- pointers to docs/ and examples/
15. **Quick Start Template** (lines 664-675) -- example commands

### Problems with current structure:
- "Core Workflow" section (32-109) is actually about understanding argc internals via `--argc-eval`, not about getting work done
- The actual "how to create an Argcfile.sh" content is buried at line 440
- "Behind the Scenes" (552-638) is reference material that belongs in references/
- Comment tags, modifiers, choices, symbols, and env vars (111-438) are reference material, not workflow
- No intake/routing pattern despite being complex enough to warrant one
- No XML structure (uses markdown headings throughout, contrary to skogai-routing's principle #4)

## Tasks
- [ ] Define what stays in SKILL.md (should be under 300 lines ideally):
  - YAML frontmatter
  - Essential principles: the `argc --argc-eval` insight (condensed to 20-30 lines), the eval integration pattern, safety guidelines
  - Intake question: "What do you want to do?"
  - Routing table mapping intents to workflows/references
  - Quick reference of most common comment tags (compact table, not full examples)
  - Quick start template (keep)
- [ ] Create `workflows/` directory with:
  - `create-argcfile.md` -- step-by-step for creating an Argcfile.sh task runner from scratch
  - `add-argument-parsing.md` -- converting existing bash script to use argc
  - `add-completions.md` -- setting up shell completions for custom commands
  - `add-validation.md` -- adding choice functions and symbols for input validation
- [ ] Create `references/` directory with:
  - `comment-tags.md` -- full tag reference (@describe, @cmd, @arg, @option, @flag, @env, @meta, @alias) with all modifiers and examples (absorbs current lines 111-438)
  - `argc-internals.md` -- how argc --argc-build works, generated functions, validation cascade, JSON export (absorbs current lines 552-638)
  - `task-runner-patterns.md` -- advanced Argcfile patterns: multi-namespace, env vars, task dependencies, comparison with Make (absorbs parts of lines 440-549)
- [ ] Propose a table of contents for the new SKILL.md:
  ```
  1. YAML frontmatter
  2. <essential_principles> -- argc = bash code generation, always use --argc-eval to understand
  3. <intake> -- What do you want to do?
  4. <routing> -- Maps to workflows
  5. <quick_reference> -- Comment tag cheat sheet (compact)
  6. <reference_index> -- Links to references/
  7. <workflows_index> -- Links to workflows/
  8. <success_criteria>
  ```
- [ ] Migrate content from SKILL.md to new files, preserving all information
- [ ] Add cross-reference to skogai-worktrunk (wt uses argc internally)
- [ ] Verify all @docs/ and @examples/ references still work after restructure
- [ ] Test the restructured skill by simulating common argc tasks

## Acceptance Criteria
- SKILL.md is under 500 lines (target: 200-300)
- An agent asked to "create an Argcfile.sh" reaches the right workflow within one routing hop
- All current content is preserved (nothing deleted, only moved)
- The "Behind the Scenes" content is in references/, not cluttering the main skill
- Comment tag reference is complete and searchable in references/
- The skill follows the router pattern established by skogai-routing
- Quick start template remains directly in SKILL.md for immediate use

## Risks / Notes
- The current "Core Workflow" section's `argc --argc-eval` insight is genuinely valuable and should remain prominent in essential_principles -- it is the key teaching that makes argc understandable. Do not bury it in references.
- The Safety Guidelines ("Never make argc scripts executable") currently has a note saying "detailed explanation will be provided separately" -- this WO should either provide that explanation in a reference file or remove the placeholder.
- The skill currently uses markdown headings (#, ##, ###) throughout. Converting to XML structure is a significant reformatting effort but aligns with the routing skill's principle #4.
- Existing references to `@docs/` and `@examples/` use a relative path convention that must be preserved.
