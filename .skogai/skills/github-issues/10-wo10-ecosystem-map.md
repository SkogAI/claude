---
title: "WO-10: Document skill ecosystem architecture map"
labels: skills, enhancement, phase-4
---

## Summary

Create an ecosystem map in `skogai-routing/references/ecosystem-map.md` documenting all skill clusters, relationships, and intent-based routing paths. Add "Explore the skill ecosystem" as an intake option in routing.

**Depends on:** All prior WOs (map must reflect final post-consolidation state)

## Context

After consolidation, ~14 skills will exist across 5 clusters. No single place currently shows how they relate or how to navigate from an intent to the right skill.

## Proposed Skill Clusters

### Philosophy (3 skills)
- **skogai-workflow** — the atomic loop (intent → understand → implement → iterate)
- **skogai-project-lifecycle** — explosive vs production phases, pruning philosophy
- **skogai-prompting** — prompt-native architecture philosophy

### Creation (2 skills)
- **skogai-routing** — how to build routing skills with progressive disclosure (hub)
- **skogai-developing-for-claude-code** — how to create Claude Code plugins

### Git Tooling (2 skills)
- **skogai-git** — unified git workflows (wt, gita, gh, semantic commits)
- **skogai-worktrunk** — wt + gita tool configuration and operation

### Multi-Agent (2 skills)
- **nelson** — squadron orchestration for parallel agent execution
- **fleet-memory** — multi-agent memory coordination

### Standalone Tools (5 skills)
- **skogai-argc** — argc CLI framework for bash
- **skogai-jq** — 60+ schema-driven jq transformations
- **skogai-mcp-builder** — MCP server development guide
- **skogai-docs** — problem/solution documentation capture
- **skogai-todos** — file-based todo tracking
- **skogai-lore-creation** — structured knowledge documentation

## Proposed Intent Routing Table

```
"I want to build a CLI tool"              → skogai-argc
"I want to create a new skill"            → skogai-routing
"I want to process JSON data"             → skogai-jq
"I want to build an MCP server"           → skogai-mcp-builder
"I want to work on multiple branches"     → skogai-git → worktree workflow
"I want to coordinate parallel agents"    → nelson
"I want to design agent memory"           → fleet-memory
"I want to document a solved problem"     → skogai-docs
"I want to track work items"              → skogai-todos
"I want to understand project philosophy" → skogai-workflow + skogai-project-lifecycle
"I want to build a Claude Code plugin"    → skogai-developing-for-claude-code
"I want to design a prompt-native agent"  → skogai-prompting
"I want to configure wt or gita"          → skogai-worktrunk
```

## Tasks

- [ ] Create `skogai-routing/references/ecosystem-map.md` with:
  - Cluster diagram (ASCII or markdown table)
  - Per-skill one-liner descriptions
  - Intent routing table (12+ intents)
  - Known overlaps with "when to use which" guidance
  - Islands (skills with no neighbors)
- [ ] Add intake option to skogai-routing SKILL.md: "Explore the skill ecosystem" routing to ecosystem-map.md
- [ ] Add "last updated" date and maintenance note to the map
- [ ] Verify map is consistent with cross-references added in WO-8
- [ ] Ensure map structure allows easy addition of future skills

## Acceptance Criteria

- `references/ecosystem-map.md` exists in skogai-routing
- Map covers all surviving skills with cluster assignments and one-liners
- Intent routing table has 12+ common intents mapped to skills
- Overlap situations documented with clear "when to use which"
- skogai-routing intake includes ecosystem exploration option
- Map is self-consistent with WO-8 cross-references
- New skill added in future has obvious cluster placement

## Notes

- Map will go stale as skills change — include "last updated" date
- Keep entries to one line per skill — detailed docs are each skill's job
- fleet-memory references integration points with skills that may not exist yet — mark as "planned/aspirational"
- This is metadata about skills, not a skill itself — lives as a reference in routing
