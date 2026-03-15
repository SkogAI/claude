---
title: "WO-8: Add cross-references across all skills"
labels: skills, enhancement, phase-4
---

## Summary

Only 4 of 18 skills currently reference others. Audit all skills and add consistent `<see_also>` sections linking related skills. Cap at 3-5 references per skill.

**Depends on:** WO-1 through WO-7 (all prior phases must complete so skill content is stable)

## Context

### Skills that currently cross-reference:
- **skogai-developing-for-claude-code** → "working-with-claude-code" skill
- **skogai-project-lifecycle** → lists skogai-argc, skogai-docs, skogai-jq, skogai-todos, skogai-worktrunk, etc. as graduated examples
- **skogai-workflow** → mentions routing, prompting, lifecycle as "lenses" (no links)
- **fleet-memory** → lists integration points (memory-systems, filesystem-context — may not be real skills)

### Missing cross-references identified:
1. **skogai-mcp-builder** ↔ **skogai-prompting** (MCP tool design aligns with prompt-native philosophy)
2. **nelson** ↔ **fleet-memory** (multi-agent coordination)
3. **skogai-argc** ↔ **skogai-worktrunk** (wt uses argc patterns)
4. **skogai-docs** ↔ **skogai-todos** (both track work items)
5. **skogai-workflow** ↔ **skogai-project-lifecycle** (loop vs dual-phase)
6. **skogai-git** ↔ **skogai-worktrunk** (workflow vs config — added by WO-7)
7. **skogai-routing** ↔ **skogai-project-lifecycle** (how to structure vs when to formalize)
8. **skogai-prompting** ↔ **nelson** (philosophy that enables squadron pattern)
9. **skogai-prompting** ↔ **fleet-memory** (philosophy that enables memory coordination)

### No cross-references needed (standalone):
- skogai-jq (self-contained JSON transformation library)

## Tasks

- [ ] Create cross-reference audit: for each skill, list current refs and proposed refs
- [ ] Define `<see_also>` format: XML section at end of SKILL.md with table (skill name, one-line rationale)
- [ ] Determine whether inline references supplement or replace `<see_also>`
- [ ] Add `<see_also>` to all skills with natural neighbors (estimated 13-14 skills)
- [ ] Verify inline references in skills that already cross-reference are accurate
- [ ] Validate fleet-memory's integration references point to real skills or mark aspirational
- [ ] Commit audit spreadsheet as reference artifact for future skill additions

## Acceptance Criteria

- Every skill with a natural neighbor has `<see_also>` with at least one cross-reference
- Format is consistent across all skills (same XML tag, same columns)
- No broken references (every referenced name corresponds to actual skill)
- Standalone skills explicitly noted as standalone in audit
- Cap of 3-5 references per skill maintained

## Notes

- Cross-refs add maintenance burden — every rename/removal requires updates. Consider using skill names vs directory paths.
- fleet-memory references skills that may not exist yet (memory-systems, filesystem-context) — mark as "planned"
- Too many cross-references defeats progressive disclosure
