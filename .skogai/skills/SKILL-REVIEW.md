# Skill Review — Epic Overview

> 20 skills audited → 14 survive post-consolidation
> 10 work orders across 4 phases
> Hub: skogai-routing

---

## Key Findings

These emerged from deep-reading all skill files (not just SKILL.md):

1. **`skogai-skills` is a byte-for-byte duplicate of `skogai-routing`** — all 24 sub-files identical. Pure delete.
2. **`skogai-agent-prompting` and `skogai-prompting` are byte-for-byte identical** — only `name:` differs. Delete one.
3. **`nelson` is a copy of `nelson-base/skills/nelson/`** — nelson-base is the upstream repo (harrymunro/nelson).
4. **`skogai-docs` is unusable outside CORA** — 17 hardcoded enum values, stage references, CORA-specific paths throughout.
5. **`skogai-skill-creator` has only 4 unique pieces** vs routing — 3 Python scripts + some doc concepts. Everything else is covered by routing.

---

## Post-Consolidation Landscape (14 skills)

```
                     skogai-routing (hub)
                    /        |         \
           philosophy    tooling     standalone
           /    |    \    /  |  \        |
     prompting  |  lifecycle git argc  mcp-builder
          |     |         worktrunk jq  dev-for-cc
       nelson  workflow               docs (revised)
          |                            todos
     fleet-memory                      lore-creation
```

**Removed (6):**
- `skogai-skills` — duplicate of routing
- `skogai-agent-prompting` — duplicate of prompting
- `skogai-skill-creator` — absorbed into routing
- `skogai-git-worktree` — absorbed into git
- `nelson-base` — nelson becomes symlink to it
- `skogai-wip` — container removed, lore-creation graduated

---

## Overlap Map (verified)

| Cluster | Finding | Resolution |
|---------|---------|------------|
| **Skill Creation** | `skogai-skills` = exact copy of `skogai-routing`. `skogai-skill-creator` has 4 unique items. | Delete skills. Absorb skill-creator's scripts into routing. |
| **Prompting** | `skogai-agent-prompting` = exact copy of `skogai-prompting`. | Delete one (keep whichever name fits scope). |
| **Git** | `skogai-git-worktree` is a subset of `skogai-git` (adds worktree-manager.sh + .env handling). `skogai-worktrunk` covers wt/gita tool config — distinct scope. | Merge git-worktree → git. Sharpen git vs worktrunk boundary (git = workflow orchestration, worktrunk = tool configuration). |
| **Nelson** | `nelson-base` is upstream repo. `nelson` is extracted copy. SKILL.md identical. | Make nelson a symlink to nelson-base/skills/nelson/. |
| **Docs/Knowledge** | `skogai-docs` hardcodes CORA. `skogai-wip/lore-creation` is orphaned in undocumented container. | Decouple docs from CORA. Graduate lore-creation to top-level. |

---

## Work Orders

### Phase 1 — parallel, no dependencies

| WO | Title | Scope | Tasks | Detail |
|----|-------|-------|-------|--------|
| [WO-1](work-orders/WO-01-merge-git-worktree.md) | Merge git-worktree → git | Move worktree-manager.sh, resolve `.worktrees/` vs `~/.worktrees/` convention conflict, delete skill | 10 | Note: directory convention conflict needs decision |
| [WO-2](work-orders/WO-02-nelson-authority.md) | Nelson authority | Make nelson a symlink to nelson-base/skills/nelson/, resolve PERSONAS.md duplication | 9 | nelson-base is the upstream repo |
| [WO-5](work-orders/WO-05-docs-decouple-cora.md) | Decouple docs from CORA | Replace 17 hardcoded enums, remove stage refs, genericize schema.yaml, update templates | 16 | Deepest revision — CORA baked in everywhere |
| [WO-6](work-orders/WO-06-graduate-lore-creation.md) | Graduate lore-creation | Move to top-level, add frontmatter, remove WIP container. Decision gate: enrich before or after? | 9 | Currently 160 lines, style-guide only |

### Phase 2 — after Phase 1

| WO | Title | Scope | Tasks | Detail |
|----|-------|-------|-------|--------|
| [WO-3](work-orders/WO-03-reconcile-prompting.md) | Delete duplicate prompting skill | Byte-for-byte identical. Pick which name to keep, delete the other. | ~3 | Trivial — just a delete + reference update |
| [WO-7](work-orders/WO-07-git-worktrunk-boundary.md) | Git vs worktrunk boundary | Remove duplicated command references, add cross-refs, document: git = "what workflow" / worktrunk = "how tools work" | ~8 | Depends on WO-1 |

### Phase 3 — after Phase 2

| WO | Title | Scope | Tasks | Detail |
|----|-------|-------|-------|--------|
| [WO-4](work-orders/WO-04-consolidate-skill-creation.md) | Consolidate skill-creation cluster | Delete skogai-skills (pure duplicate). Absorb skill-creator's 3 Python scripts + unique docs into routing. Delete skill-creator. | 26 | 7 sub-phases (A-G). Biggest WO. |

### Phase 4 — polish, after structure is stable

| WO | Title | Scope | Tasks | Detail |
|----|-------|-------|-------|--------|
| [WO-8](work-orders/WO-08-cross-references.md) | Add cross-references | Only 4/18 skills currently cross-reference. 9 missing pairs identified. Add `<see_also>` XML sections. | ~12 | Cap at 3-5 refs per skill |
| [WO-9](work-orders/WO-09-argc-navigation.md) | Improve argc navigation | Split 675-line SKILL.md into router + 4 workflows + 3 references. "How to" content currently buried at line 440. | ~10 | Restructure, don't rewrite |
| [WO-10](work-orders/WO-10-ecosystem-map.md) | Ecosystem architecture map | Create routing map in skogai-routing showing 5 clusters, 12+ intent routes. | ~8 | Lives at routing/references/ecosystem-map.md |

---

## Scorecard

| Skill | Verdict | Work Order | Post-consolidation |
|-------|---------|------------|--------------------|
| fleet-memory | KEEP | — | stays |
| nelson | KEEP | WO-2 | becomes symlink to nelson-base |
| nelson-base | KEEP (source) | WO-2 | authoritative upstream |
| skogai-agent-prompting | **DELETE** | WO-3 | duplicate of prompting |
| skogai-argc | REVISE | WO-9 | restructure navigation |
| skogai-developing-for-claude-code | KEEP | — | stays |
| skogai-docs | REVISE | WO-5 | decouple from CORA |
| skogai-git | KEEP | WO-1, WO-7 | absorbs git-worktree |
| skogai-git-worktree | **DELETE** | WO-1 | absorbed into git |
| skogai-jq | KEEP | — | stays (gold standard) |
| skogai-mcp-builder | KEEP | — | stays |
| skogai-project-lifecycle | KEEP | — | stays |
| skogai-prompting | KEEP | WO-3 | sole prompting skill |
| skogai-routing | KEEP (hub) | WO-4, WO-10 | absorbs skill-creator content |
| skogai-skill-creator | **DELETE** | WO-4 | absorbed into routing |
| skogai-skills | **DELETE** | WO-4 | exact duplicate of routing |
| skogai-todos | KEEP | — | stays |
| skogai-wip | **DELETE** | WO-6 | container removed |
| skogai-wip/lore-creation | GRADUATE | WO-6 | becomes skogai-lore-creation |
| skogai-workflow | KEEP | — | stays |
| skogai-worktrunk | KEEP | WO-7 | boundary clarified vs git |

---

## Effort Estimate

| Phase | WOs | Total tasks | Parallelizable |
|-------|-----|-------------|----------------|
| 1 | 4 | ~44 | Yes (all 4 independent) |
| 2 | 2 | ~11 | Partially (WO-7 depends on WO-1) |
| 3 | 1 | 26 | Internal sub-phases A-G |
| 4 | 3 | ~30 | Yes (all 3 independent) |
| **Total** | **10** | **~111** | |

---

## Gold Standards (model for future skills)

- **skogai-jq** — comprehensive tests, schema-driven, composable
- **skogai-routing** — demonstrates its own patterns, progressive disclosure
- **skogai-developing-for-claude-code** — clear phases, working examples
