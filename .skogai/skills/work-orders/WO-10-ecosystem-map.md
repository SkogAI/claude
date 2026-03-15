# WO-10: Document the skill ecosystem architecture
**Phase**: 4
**Status**: planned
**Depends on**: WO-1 through WO-9 (all prior WOs, especially WO-8 cross-references, must complete so the map reflects final relationships)

## Summary
Create an ecosystem map inside skogai-routing that documents the skill clusters, their relationships, and intent-based routing paths so agents and humans can navigate the full skill landscape.

## Context
The skill ecosystem has grown to 18+ skills organically. There is no single place that shows how they relate, which clusters they belong to, or how to navigate from an intent ("I want to build an MCP server") to the right skill. skogai-routing currently teaches how to BUILD routing skills -- it does not itself serve as a map of the ecosystem. This WO creates that map as a reference inside skogai-routing, since routing is the natural home for navigation infrastructure.

## Current State

### Skill inventory (18 skills identified):

**Philosophy / Meta layer:**
- skogai-workflow -- the atomic loop (intent/understand/implement/iterate)
- skogai-project-lifecycle -- explosive vs production phases, pruning philosophy
- skogai-prompting -- prompt-native architecture philosophy
- skogai-agent-prompting -- identical content to skogai-prompting (duplication)

**Skill creation layer:**
- skogai-routing -- how to build routing skills with progressive disclosure
- skogai-skills -- how to create skills (XML structure, router pattern)
- skogai-skill-creator -- how to create skills (Anthropic official approach, init scripts)
- skogai-developing-for-claude-code -- how to create Claude Code plugins

**Git / version control tooling:**
- skogai-git -- unified git workflows (wt, gita, gh, semantic commits)
- skogai-git-worktree -- worktree manager script for isolated development
- skogai-worktrunk -- wt + gita configuration and workflows

**Multi-agent coordination:**
- nelson -- Royal Navy squadron metaphor for parallel agent execution
- fleet-memory -- multi-agent memory coordination (filesystem-based)

**Standalone domain tools:**
- skogai-argc -- argc CLI framework for bash
- skogai-jq -- 60+ schema-driven jq transformations
- skogai-mcp-builder -- MCP server development guide
- skogai-docs -- problem/solution documentation capture
- skogai-todos -- file-based todo tracking system

### Known issues affecting the map:
- skogai-prompting and skogai-agent-prompting are duplicates
- skogai-skills and skogai-routing have significant overlap
- skogai-git, skogai-git-worktree, and skogai-worktrunk overlap in worktree coverage
- fleet-memory references skills that may not exist yet

### Current navigation gaps:
- No "I want to X" routing table exists at the ecosystem level
- An agent asked to "build a CLI tool" would not know to look at skogai-argc
- An agent asked to "coordinate parallel work" would not know nelson exists
- The relationship between philosophy skills and practical skills is implicit

## Tasks
- [ ] Define the skill clusters/layers:
  - **Philosophy** -- skogai-workflow, skogai-project-lifecycle, skogai-prompting (the "why")
  - **Creation** -- skogai-routing, skogai-skills, skogai-skill-creator, skogai-developing-for-claude-code (building skills/plugins)
  - **Git tooling** -- skogai-git, skogai-git-worktree, skogai-worktrunk (version control)
  - **Multi-agent** -- nelson, fleet-memory (parallel execution)
  - **Standalone tools** -- skogai-argc, skogai-jq, skogai-mcp-builder, skogai-docs, skogai-todos (domain-specific)
- [ ] Create intent-based routing table mapping common intents to skills:
  ```
  "I want to build a CLI tool" --> skogai-argc
  "I want to create a new skill" --> skogai-skill-creator (official) or skogai-skills (SkogAI style)
  "I want to process JSON data" --> skogai-jq
  "I want to build an MCP server" --> skogai-mcp-builder
  "I want to work on multiple branches" --> skogai-git --> worktree workflow
  "I want to coordinate parallel agents" --> nelson
  "I want to design agent memory" --> fleet-memory
  "I want to document a solved problem" --> skogai-docs
  "I want to track work items" --> skogai-todos
  "I want to understand the project philosophy" --> skogai-workflow + skogai-project-lifecycle
  "I want to build a Claude Code plugin" --> skogai-developing-for-claude-code
  "I want to design a prompt-native agent" --> skogai-prompting
  ```
- [ ] Decide the format for the ecosystem map:
  - Option A: A single `references/ecosystem-map.md` in skogai-routing with ASCII diagram + routing table
  - Option B: An interactive intake in skogai-routing's SKILL.md that adds an "explore ecosystem" option to the existing menu
  - Option C: Both -- reference file for the full picture, intake option for guided navigation
  - Recommendation: Option C
- [ ] Create the ecosystem map reference file with:
  - Cluster diagram (ASCII or markdown table showing layers)
  - Per-skill one-liner descriptions
  - Intent routing table
  - Known overlaps and how to choose between overlapping skills
  - Skills with no current cross-references (islands)
- [ ] Add an intake option to skogai-routing: "5. Explore the skill ecosystem" that routes to the ecosystem map
- [ ] Document the overlap situations with resolution guidance:
  - skogai-prompting vs skogai-agent-prompting: "use skogai-prompting, agent-prompting is a duplicate awaiting merge"
  - skogai-skills vs skogai-routing: "routing focuses on progressive disclosure patterns; skills focuses on XML structure and best practices"
  - skogai-git vs skogai-worktrunk vs skogai-git-worktree: "git is the umbrella; worktrunk for wt/gita config; git-worktree for the manager script"
- [ ] Flag skills that may be candidates for merging in a future phase (not this WO's job to merge)

## Acceptance Criteria
- A file `references/ecosystem-map.md` exists in skogai-routing
- The map covers all 18+ skills with cluster assignments and one-liner descriptions
- An intent routing table with at least 12 common intents maps to specific skills
- Overlap situations are documented with clear "when to use which" guidance
- skogai-routing's intake section includes an option to navigate the ecosystem
- The map is self-consistent with the cross-references added in WO-8
- A new skill added in the future would have an obvious place in the cluster diagram

## Risks / Notes
- This map will go stale as skills are added, merged, or renamed. Consider adding a "last updated" date and a maintenance note.
- The map should NOT try to be exhaustive about what each skill does -- that is the job of each skill's description. Keep entries to one line.
- The overlap situations (especially the prompting duplication) may cause confusion if agents consult the map. The map should give clear guidance on which to prefer until merges happen.
- The ecosystem map is metadata about skills, not a skill itself. It should live as a reference in skogai-routing, not as its own skill directory.
- fleet-memory references integration points with skills that do not exist (memory-systems, filesystem-context, etc.). The map should note these as "planned/aspirational" rather than omitting them.
