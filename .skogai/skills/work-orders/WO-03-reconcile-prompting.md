# WO-3: Reconcile skogai-agent-prompting vs skogai-prompting
**Phase**: 2
**Status**: planned
**Depends on**: none

## Summary
Two skills (`skogai-agent-prompting` and `skogai-prompting`) are byte-for-byte identical except for their name field. One must be eliminated, or clear distinct scopes must be defined.

## Context
Both skills exist under `/home/skogix/.local/src/docs/skills/` and serve the same stated purpose: guiding prompt-native agent architecture. Having two identical skills wastes routing decisions and creates confusion about which to invoke. The duplication likely arose from a rename or fork that was never cleaned up.

## Current State

### skogai-agent-prompting
- **SKILL.md**: 384 lines, `name: skogai-agent-prompting`
- **Description**: "Use when building AI agents using prompt-native architecture where features are defined in prompts, not code."
- **references/** (10 files):
  - action-parity-discipline.md (11KB)
  - agent-native-testing.md (17KB)
  - architecture-patterns.md (17KB)
  - dynamic-context-injection.md (10KB)
  - mcp-tool-design.md (16KB)
  - mobile-patterns.md (18KB)
  - refactoring-to-prompt-native.md (9KB)
  - self-modification.md (8KB)
  - shared-workspace-architecture.md (21KB)
  - system-prompt-design.md (7KB)

### skogai-prompting
- **SKILL.md**: 384 lines, `name: skogai-prompting`
- **Description**: Identical to above.
- **references/** (10 files): Same filenames and sizes as above.

## Overlap Analysis

### Identical content
- The two SKILL.md files differ by exactly **one line**: the `name:` field in frontmatter. Every other line (essential_principles, intake, routing, architecture_checklist, quick_start, reference_index, anti_patterns, success_criteria) is identical.
- Both `references/` directories contain the same 10 files with the same byte sizes.

### What is unique to each
- **Nothing.** Neither skill has any content the other lacks.

### Naming analysis
- `skogai-agent-prompting` is more specific: it clearly signals this is about **agent** prompting (prompt-native architecture for AI agents).
- `skogai-prompting` is broader: could be interpreted as general prompt engineering, but the actual content is entirely agent-specific.

## Proposed Resolution

**Merge: eliminate one, keep the other.**

### Recommended base: `skogai-prompting`

Rationale:
- Shorter, cleaner name.
- The content covers both general prompting principles (system prompt design, prompt structure) and agent-specific patterns. A broader name allows future expansion into non-agent prompting topics (e.g., user-facing prompt templates, prompt testing, prompt versioning) without renaming.
- However, if the intent is to keep the scope strictly agent-native architecture, `skogai-agent-prompting` is the more honest name. This is a judgment call for the owner.

### Alternative: keep `skogai-agent-prompting`
If the skill should remain strictly scoped to agent-native architecture (which the content strongly suggests), the more specific name prevents scope creep and makes routing intent clearer.

## Tasks
- [ ] Verify reference files are also identical (byte-level diff of all 10 pairs)
- [ ] Decide which name to keep based on intended scope
- [ ] Delete the redundant skill directory entirely
- [ ] Update any CLAUDE.md routers or skill indexes that reference the deleted name
- [ ] Search for cross-references in other skills that link to the deleted name
- [ ] Verify the surviving skill routes correctly after deletion

## Acceptance Criteria
- Only one prompting skill exists
- All references and routers point to the surviving skill
- No broken links in any CLAUDE.md or SKILL.md that previously referenced the deleted skill
- The surviving skill's name accurately reflects its scope

## Risks / Notes
- Other skills or CLAUDE.md files may reference either name; a search across the entire docs tree is needed before deletion.
- If any external tooling (skill loader, command routing) uses the skill name for dispatch, both names need to be checked there too.
- The reference files should be diffed at the byte level, not just by size, to confirm true identity before deleting.
