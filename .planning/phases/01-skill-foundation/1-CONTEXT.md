# Phase 1: Skill Foundation - Context

**Gathered:** 2026-03-15
**Status:** Ready for planning

<domain>
## Phase Boundary

Create a walkthrough workflow that teaches a human (and later an agent) how to set up their SkogAI workspace from scratch. The existing four skills are the subject matter — not things to fix upfront. Walking through the workflow naturally reveals what's broken or inconsistent; those discoveries get captured as todos, not pre-planned.

Deliverable: a workflow someone can follow that results in a working workspace AND a list of discovered issues.

</domain>

<decisions>
## Implementation Decisions

### Audience & voice
- Written for a human learner first — specifically a non-programmer
- Litmus test: if the author can't understand it as written, it's not explained well enough
- Agent-friendliness comes naturally from clarity, not from agent-specific formatting
- Plain language, no jargon without explanation

### Workflow approach
- Learn by doing, not by reading about doing
- The workflow IS the audit — walking through setup reveals what needs fixing
- No upfront analysis phase; discovery happens inline
- Each step explains WHY, not just WHAT

### Discovery handling
- When the workflow hits something broken/inconsistent: capture it via `/gsd:add-todo`
- Don't stop to fix — drop it, continue the workflow
- Todos get addressed later in their own right
- The workflow stays focused on teaching, not repairing

### Entry point
- Fresh starter setup — "demo run" for proof of concept
- Assume someone with a clean starting point, not someone inheriting the existing repo
- The existing skills serve as concrete examples within the walkthrough

### Claude's Discretion
- Step ordering within the workflow
- How to structure the walkthrough document(s)
- Level of detail per step (guided by "non-programmer can follow it")

</decisions>

<specifics>
## Specific Ideas

- The workflow should be a "demo run" — a proof of concept that a non-programmer could use as a starter setup
- Existing skills (skogai-routing, planning-with-files, skogai-bats-testing, skill-creator) are teaching material, not fix targets
- skogai-routing demonstrates the routing pattern; planning-with-files demonstrates filesystem-as-memory
- Things that need rewriting get rewritten as part of going through the workflow, not as a separate pass

</specifics>

<code_context>
## Existing Code Insights

### Reusable Assets
- `skogai-routing/` — already a clean router pattern example (215 lines, proper subdirectories)
- `planning-with-files/` — contains the "filesystem as memory" concept (RAM = context, disk = persistent)
- `skill-creator/` — Anthropic's official skill creation tool, useful reference
- `skogai-bats-testing/` — shell testing framework, 677 lines in single file

### Established Patterns
- Router pattern: SKILL.md routes to workflows/, references/, templates/, scripts/
- Progressive disclosure: show what's needed to find what's needed
- XML structure in skill bodies (no markdown headings)

### Integration Points
- The workflow this phase creates becomes the content Phase 3 wraps into chapter 1
- Discoveries captured as todos feed back into future phase work
- skogai-routing's structure is the model the tutorial teaches from

</code_context>

<deferred>
## Deferred Ideas

- Mechanical skill auditing (frontmatter validation, line counts) — captured as todos if discovered during walkthrough
- Plugin manifest and chapter structure — Phase 2
- RAM-file template creation — Phase 2 (WMEM-01)
- Tutorial prose and chapter packaging — Phase 3

</deferred>

---

*Phase: 01-skill-foundation*
*Context gathered: 2026-03-15*
