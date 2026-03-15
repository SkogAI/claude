---
title: "WO-3: Delete duplicate prompting skill"
labels: skills, cleanup, phase-2
---

## Summary

`skogai-agent-prompting` and `skogai-prompting` are byte-for-byte identical except for the `name:` field. Delete one.

## Context

Both skills exist under `/home/skogix/.local/src/docs/skills/`:

- **skogai-agent-prompting**: `name: skogai-agent-prompting`, 384-line SKILL.md, 10 reference files
- **skogai-prompting**: `name: skogai-prompting`, 384-line SKILL.md, 10 reference files

The SKILL.md files differ by exactly **one line**: the `name:` field. All 10 reference files are identical (same names, same byte sizes). Neither skill has any content the other lacks.

**Reference files (identical in both):**
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

**Name choice:** `skogai-prompting` is shorter and allows future expansion into non-agent prompting. `skogai-agent-prompting` is more specific and prevents scope creep. Owner's call.

## Tasks

- [ ] Byte-level diff of all 10 reference file pairs to confirm true identity
- [ ] Decide which name to keep (`skogai-prompting` recommended for brevity)
- [ ] Grep all skills and CLAUDE.md files for references to the name being deleted
- [ ] Update any references found to point to the surviving skill
- [ ] Delete the redundant skill directory entirely
- [ ] Verify the surviving skill routes correctly

## Acceptance Criteria

- Only one prompting skill exists
- All references point to the surviving skill
- No broken links in any CLAUDE.md or SKILL.md
- The surviving skill's name accurately reflects its scope
