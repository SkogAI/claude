---
title: "Skill Review: Consolidate 20 skills down to 14"
labels: epic, skills, cleanup
---

## Overview

Comprehensive review and consolidation of the skill ecosystem at `/home/skogix/.local/src/docs/skills/`. 20 skills audited, 6 to be removed through merges/deletes, resulting in 14 clean skills with `skogai-routing` as the central hub.

## Key Findings

- `skogai-skills` is a **byte-for-byte duplicate** of `skogai-routing` (all 24 sub-files identical)
- `skogai-agent-prompting` is a **byte-for-byte duplicate** of `skogai-prompting` (only `name:` differs)
- `skogai-skill-creator` has only **4 unique pieces** vs routing (3 Python scripts + doc concepts)
- `skogai-docs` is **unusable outside CORA** (17 hardcoded enum values)
- `nelson` is a **copy** of `nelson-base/skills/nelson/`

## Subtasks

### Phase 1 (parallel, no dependencies)
- [ ] #WO-1 Merge `skogai-git-worktree` into `skogai-git`
- [ ] #WO-2 Clarify `nelson` vs `nelson-base` authority
- [ ] #WO-5 Decouple `skogai-docs` from CORA
- [ ] #WO-6 Graduate `lore-creation` from `skogai-wip`

### Phase 2 (depends on Phase 1)
- [ ] #WO-3 Delete duplicate prompting skill
- [ ] #WO-7 Document `skogai-git` vs `skogai-worktrunk` boundary (depends on WO-1)

### Phase 3 (depends on Phase 2)
- [ ] #WO-4 Consolidate skill-creation cluster into `skogai-routing`

### Phase 4 (polish, depends on all prior)
- [ ] #WO-8 Add cross-references across all skills
- [ ] #WO-9 Restructure `skogai-argc` navigation
- [ ] #WO-10 Document skill ecosystem architecture map

## Post-Consolidation Result

**Removed (6):**
- `skogai-skills` — exact duplicate of routing
- `skogai-agent-prompting` — exact duplicate of prompting
- `skogai-skill-creator` — absorbed into routing
- `skogai-git-worktree` — absorbed into git
- `nelson-base` — nelson becomes symlink to it (base kept as upstream)
- `skogai-wip` — container removed, lore-creation graduated

**Surviving (14):**
fleet-memory, nelson, skogai-argc, skogai-developing-for-claude-code, skogai-docs, skogai-git, skogai-jq, skogai-lore-creation, skogai-mcp-builder, skogai-project-lifecycle, skogai-prompting, skogai-routing, skogai-todos, skogai-workflow, skogai-worktrunk
