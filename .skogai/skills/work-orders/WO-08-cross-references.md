# WO-8: Add cross-references across all skills
**Phase**: 4
**Status**: planned
**Depends on**: WO-1 through WO-7 (all prior phases must complete so skill content is stable before linking)

## Summary
Audit every skill's SKILL.md for existing and missing cross-references, then add a consistent `<see_also>` section to each skill that points to related skills.

## Context
The skill ecosystem has 18+ skills spanning philosophy, tooling, creation, and standalone domains. Some skills already reference others informally (e.g., `skogai-developing-for-claude-code` mentions "working-with-claude-code", `skogai-project-lifecycle` lists skills that graduated). However, most skills operate as islands with no pointers to related capabilities. An agent landing in one skill has no structured way to discover that a related skill exists.

## Current State

### Skills that currently reference other skills:
- **skogai-developing-for-claude-code** references "working-with-claude-code" skill for deep docs
- **skogai-project-lifecycle** lists several skills as examples (skogai-argc, skogai-docs, skogai-jq, skogai-todos, skogai-worktrunk, skogai-developing-for-claude-code, skogai-skill-creator, skogai-git-worktree)
- **skogai-workflow** mentions other skills as "lenses on top" (routing, prompting, lifecycle) but with no links
- **fleet-memory** lists integration points (memory-systems, filesystem-context, multi-agent-patterns, context-optimization, context-compression) but these may not correspond to actual skill names

### Skills that SHOULD reference each other but don't:
- **skogai-skills** and **skogai-routing** are near-duplicates teaching skill creation from different angles -- neither references the other
- **skogai-skill-creator** does not reference skogai-skills or skogai-routing despite covering the same domain
- **skogai-prompting** and **skogai-agent-prompting** are identical in content -- one should reference the other (or be merged; out of scope for this WO)
- **skogai-git** and **skogai-git-worktree** and **skogai-worktrunk** all cover worktree workflows -- none cross-reference
- **skogai-mcp-builder** should reference skogai-prompting (MCP tool design philosophy aligns with prompt-native)
- **nelson** should reference fleet-memory (multi-agent coordination)
- **skogai-argc** should reference skogai-worktrunk (wt uses argc patterns)
- **skogai-docs** and **skogai-todos** both track work items -- should cross-reference
- **skogai-workflow** should link to skogai-project-lifecycle (the loop vs the dual-phase system)

### No cross-references at all:
- skogai-jq (standalone)
- skogai-argc (standalone)
- skogai-todos (standalone)
- skogai-docs (standalone)

## Tasks
- [ ] Create a cross-reference audit spreadsheet: for each of the 18 skills, list (a) what it references today, (b) what it should reference
- [ ] Define the standard format for cross-references -- propose a `<see_also>` XML section at the end of SKILL.md containing a table of related skills with one-line rationale
- [ ] Determine whether inline references (within routing tables or workflow descriptions) should supplement or replace the `<see_also>` section
- [ ] Add `<see_also>` section to every skill that has at least one natural neighbor
- [ ] For skills with inline references to other skills, verify those references are accurate (skill names match, paths work)
- [ ] Flag the skogai-prompting / skogai-agent-prompting duplication for separate resolution (out of scope but must be noted)
- [ ] Flag the skogai-skills / skogai-routing overlap for separate resolution
- [ ] Validate that fleet-memory's integration references point to real skills or mark them as aspirational

## Acceptance Criteria
- Every skill with a natural neighbor has a `<see_also>` section (or equivalent) with at least one cross-reference
- Cross-reference format is consistent across all skills (same XML tag, same table columns)
- No broken references (every referenced skill name corresponds to an actual skill directory)
- The audit spreadsheet is committed as a reference artifact so future skill additions can consult it
- Standalone skills (like skogai-jq) that genuinely have no neighbors are explicitly noted as standalone in the audit

## Risks / Notes
- The skogai-prompting / skogai-agent-prompting situation is a content duplication issue, not just a cross-reference gap. This WO should flag it but not attempt to merge them.
- Cross-references add maintenance burden: every time a skill is renamed or removed, references must update. Consider whether the `<see_also>` section should use directory paths or just skill names.
- fleet-memory references skills that may not exist yet (memory-systems, filesystem-context, etc.) -- these should be marked as "planned" rather than removed.
- Adding too many cross-references defeats the purpose of progressive disclosure. Cap at 3-5 references per skill unless there is strong justification.
