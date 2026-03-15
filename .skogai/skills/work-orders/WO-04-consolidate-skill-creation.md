# WO-4: Consolidate Skill-Creation Cluster (routing as hub)
**Phase**: 3
**Status**: planned
**Depends on**: WO-3 (prompting reconciliation should be done first to avoid cascading changes)

## Summary

Three skills (skogai-routing, skogai-skills, skogai-skill-creator) cover the same domain -- teaching agents how to create and manage skills -- with massive duplication. Routing should absorb the useful unique content from the other two and become the single authoritative skill for skill creation, while skill-creator is reduced to a thin quick-start wrapper around its scripts.

## Context

**Why routing is the right hub:**
- It already has the most mature and intentional SKILL.md: it frames skill creation through the lens of the router pattern and progressive disclosure, which is itself the meta-pattern that all complex skills should follow.
- Its SKILL.md includes a fifth routing option ("Use the routing patterns in your general workflow") that positions it as a general-purpose routing knowledge source, not just a skill-creation tool.
- Its description emphasizes progressive disclosure as a design philosophy, not just a process to follow.
- It owns the complete content set: 12 references, 10 workflows, 2 templates.

**What the 3 skills currently provide:**

| Skill | Role | Files |
|-------|------|-------|
| **skogai-routing** | Router-pattern skill creation + progressive disclosure philosophy | SKILL.md + 12 refs + 10 workflows + 2 templates = **25 files** |
| **skogai-skills** | Generic skill creation/authoring guidance | SKILL.md + 12 refs + 10 workflows + 2 templates = **25 files** |
| **skogai-skill-creator** | Anthropic-style linear skill creation process + utility scripts | SKILL.md + 3 scripts = **4 files** |

## Content Map

### skogai-routing (hub -- keep and expand)

| File | Description |
|------|-------------|
| `SKILL.md` | Router + essential principles + intake (5 options) + routing table + reference/workflow indexes. 216 lines. Emphasizes "trust the agent", progressive disclosure math (7^n), templates/scripts as first-class. |
| **references/** | |
| `api-security.md` | Secure API wrapper pattern using `~/.claude/scripts/secure-api.sh`, credential storage in `~/.claude/.env` |
| `be-clear-and-direct.md` | Prompting clarity guidelines: contextual info, specificity, sequential steps, examples, edge cases, output format |
| `common-patterns.md` | Skill authoring patterns: template pattern, examples pattern, consistent terminology, default+escape-hatch, anti-patterns, progressive disclosure, validation, checklist |
| `core-principles.md` | XML structure, conciseness, degrees of freedom, model testing (Haiku/Sonnet/Opus), progressive disclosure, validation |
| `executable-code.md` | When/how to use scripts: execution vs reference, file organization, utility scripts, error handling, dependencies, MCP tool references |
| `iteration-and-testing.md` | Eval-driven development, Claude A/B testing, model testing, XML validation during testing, observation-based iteration, progressive refinement, success metrics |
| `recommended-structure.md` | Router pattern justification, SKILL.md template, workflow template, when to use router vs simple |
| `skill-structure.md` | XML requirements (required/conditional tags), YAML requirements, naming conventions, progressive disclosure patterns, file organization, anti-patterns, validation checklist |
| `use-xml-tags.md` | Complete XML tag reference: required tags (objective, quick_start, success_criteria), conditional tags (context, workflow, advanced_features, validation, examples, anti_patterns, security_checklist, testing, common_patterns, reference_guides), intelligence rules, nesting guidelines |
| `using-scripts.md` | Scripts purpose, when to use, structure, example, workflow integration, best practices, security |
| `using-templates.md` | Templates purpose, when to use, structure, example, workflow integration, best practices |
| `workflows-and-validation.md` | Complex workflows, feedback loops (validate-fix-repeat, plan-validate-execute), conditional workflows, validation scripts, iterative refinement, checkpoint pattern, error recovery |
| **workflows/** | |
| `create-new-skill.md` | 10-step process: adaptive requirements, API research trigger, structure decision, directory creation, write SKILL.md, write workflows, write references, validate, slash command, test |
| `create-domain-expertise-skill.md` | 12-step process for exhaustive domain expertise skills (build-X): research phase (5+ web searches), organize by domain areas, full lifecycle coverage (build->ship), dual-purpose test |
| `audit-skill.md` | 5-step skill audit: list skills, read skill, run checklist (YAML, structure, router pattern, workflows, content quality), generate report, offer fixes |
| `verify-skill.md` | 7-step content accuracy verification: categorize dependency type, extract verifiable claims, verify by type (CLI/API/framework), freshness report, update, schedule |
| `add-workflow.md` | 8-step add workflow: select skill, analyze structure, gather requirements, upgrade to router if needed, create workflow file, update SKILL.md, create references, test |
| `add-reference.md` | 7-step add reference: select skill, analyze structure, gather requirements, create reference file, update SKILL.md, update workflows, verify |
| `add-template.md` | 7-step add template: identify skill, analyze need, create directory, design structure, write template, update workflow, test |
| `add-script.md` | 8-step add script: identify skill, analyze need, create directory, design script, write script, make executable, update workflow, test |
| `upgrade-to-router.md` | 9-step upgrade: select skill, verify it needs upgrading, identify components, create directories, extract workflows, extract references, rewrite SKILL.md, verify nothing lost, test |
| `get-guidance.md` | 7-step guidance: understand problem, determine if skill is right, map workflows, identify domain knowledge, draft structure, identify principles, present recommendation |
| **templates/** | |
| `router-skill.md` | Copy-and-fill template for a router-pattern SKILL.md (frontmatter, essential_principles, intake, routing, quick_reference, reference_index, workflows_index, success_criteria) |
| `simple-skill.md` | Copy-and-fill template for a simple single-file skill (frontmatter, objective, quick_start, process, success_criteria) |

### skogai-skill-creator (reduce to quick-start)

| File | Unique? | Description |
|------|---------|-------------|
| `SKILL.md` | **PARTIALLY UNIQUE** | Anthropic's official skill creation guide. Linear 6-step process (understand -> plan -> init -> edit -> package -> iterate). Uses markdown headings (not XML). Detailed on `assets/` folder (not mentioned in routing). References `scripts/init_skill.py` and `scripts/package_skill.py`. Writing style guidance ("imperative/infinitive form"). Progressive disclosure explanation (3-level loading). |
| `scripts/init_skill.py` | **UNIQUE** | Scaffolding script: generates skill directory with SKILL.md template, example scripts/references/assets |
| `scripts/package_skill.py` | **UNIQUE** | Packaging script: validates skill and creates distributable .zip file |
| `scripts/quick_validate.py` | **UNIQUE** | Quick validation script: checks YAML frontmatter, naming, description, structure |

**Unique content in skill-creator's SKILL.md not found in routing:**
- The `assets/` folder concept (files used in output, not loaded into context: logos, templates, fonts)
- The `scripts/init_skill.py` scaffolding workflow
- The `scripts/package_skill.py` packaging/distribution workflow
- Writing style guidance ("imperative/infinitive form", verb-first)
- The 3-level progressive disclosure explanation (metadata ~100 words -> SKILL.md body <5k words -> bundled resources unlimited)
- Explicit mention of `license:` frontmatter field

### skogai-skills (clarify role or merge)

| File | Unique? | Description |
|------|---------|-------------|
| `SKILL.md` | **DUPLICATED** (near-identical to routing) | Same essential_principles, same intake (4 options vs routing's 5), same routing table, same reference_index, same workflows_index, same yaml_requirements, same success_criteria. Missing routing's 5th option ("Use routing patterns in general workflow"), missing routing's progressive disclosure math, missing routing's enhanced "trust the agent" principle, missing routing's emphasis on templates/scripts as value-adds. |
| `references/*` (12 files) | **DUPLICATED** | Identical copies of all 12 routing reference files |
| `workflows/*` (10 files) | **DUPLICATED** | Identical copies of all 10 routing workflow files |
| `templates/*` (2 files) | **DUPLICATED** | Identical copies of both routing template files |

**skogai-skills has zero unique content.** It is a strict subset of skogai-routing. Routing's SKILL.md is a superset with additional principles, a 5th routing option, and richer framing.

## Overlap Matrix

| Content | skogai-routing | skogai-skills | skogai-skill-creator |
|---------|:-:|:-:|:-:|
| **Essential principles (trust agent, SKILL.md always loaded, router pattern, XML, progressive disclosure)** | YES (enhanced) | YES (base) | partial (progressive disclosure only) |
| **Intake/routing menu** | YES (5 options) | YES (4 options) | NO |
| **Router pattern structure** | YES | YES | partial (mentions but doesn't teach) |
| **references/api-security.md** | YES | YES (identical) | -- |
| **references/be-clear-and-direct.md** | YES | YES (identical) | -- |
| **references/common-patterns.md** | YES | YES (identical) | -- |
| **references/core-principles.md** | YES | YES (identical) | -- |
| **references/executable-code.md** | YES | YES (identical) | -- |
| **references/iteration-and-testing.md** | YES | YES (identical) | -- |
| **references/recommended-structure.md** | YES | YES (identical) | -- |
| **references/skill-structure.md** | YES | YES (identical) | -- |
| **references/use-xml-tags.md** | YES | YES (identical) | -- |
| **references/using-scripts.md** | YES | YES (identical) | -- |
| **references/using-templates.md** | YES | YES (identical) | -- |
| **references/workflows-and-validation.md** | YES | YES (identical) | -- |
| **workflows/create-new-skill.md** | YES | YES (identical) | -- |
| **workflows/create-domain-expertise-skill.md** | YES | YES (identical) | -- |
| **workflows/audit-skill.md** | YES | YES (identical) | -- |
| **workflows/verify-skill.md** | YES | YES (identical) | -- |
| **workflows/add-workflow.md** | YES | YES (identical) | -- |
| **workflows/add-reference.md** | YES | YES (identical) | -- |
| **workflows/add-template.md** | YES | YES (identical) | -- |
| **workflows/add-script.md** | YES | YES (identical) | -- |
| **workflows/upgrade-to-router.md** | YES | YES (identical) | -- |
| **workflows/get-guidance.md** | YES | YES (identical) | -- |
| **templates/router-skill.md** | YES | YES (identical) | -- |
| **templates/simple-skill.md** | YES | YES (identical) | -- |
| **`assets/` folder concept** | -- | -- | **UNIQUE** |
| **init_skill.py (scaffolding)** | -- | -- | **UNIQUE** |
| **package_skill.py (packaging)** | -- | -- | **UNIQUE** |
| **quick_validate.py (validation)** | -- | -- | **UNIQUE** |
| **Writing style guidance** | -- | -- | **UNIQUE** |
| **Linear 6-step creation process** | -- | -- | **UNIQUE** |
| **3-level progressive disclosure explanation** | -- | -- | partial (routing covers concept, not the formal levels) |
| **YAML frontmatter** | YES | YES (identical) | YES (adds `license:` field) |
| **Description field guidance** | YES | YES | YES (similar) |

## Proposed Architecture

### skogai-routing (the consolidated hub)

After consolidation, routing becomes the single authoritative skill for skill creation and management. Changes needed:

1. **Absorb unique content from skill-creator into references:**
   - Add `references/assets-folder.md` -- the `assets/` folder concept (files not loaded into context, used in output)
   - Add `references/writing-style.md` -- imperative/infinitive form guidance, or fold into `be-clear-and-direct.md`
   - Enhance `core-principles.md` progressive disclosure section with the formal 3-level model (metadata -> SKILL.md -> bundled resources)

2. **Add skill-creator's scripts to routing:**
   - Move `scripts/init_skill.py` into routing's new `scripts/` directory
   - Move `scripts/package_skill.py` into routing's `scripts/`
   - Move `scripts/quick_validate.py` into routing's `scripts/`

3. **Update create-new-skill.md workflow** to reference `scripts/init_skill.py` as an option in Step 4 (directory creation)

4. **Add `license:` to YAML requirements** as optional field

5. **No SKILL.md rewrite needed** -- routing's SKILL.md is already the superset. Just ensure the description covers "create, audit, verify, package" to capture skill-creator's trigger keywords.

### skogai-skill-creator (thin quick-start wrapper)

Becomes a minimal redirector. Its purpose: catch users who say "create a skill" or "new skill" with Anthropic-style language, and redirect them to routing.

```yaml
---
name: skogai-skill-creator
description: Quick-start guide for creating new skills. Redirects to skogai-routing for the full skill creation workflow. Use when users want to create, build, or initialize a new skill.
---
```

Body:
- 1-paragraph explaining that full skill creation lives in skogai-routing
- Points to `skogai-routing` for the complete workflow
- Retains reference to its scripts (init, package, validate) which now live in routing's scripts/ directory
- Under 50 lines total

### skogai-skills (retire / delete)

**Recommendation: Delete entirely.**

skogai-skills contains zero unique content. Every file is an identical copy of a file that exists in skogai-routing. Its SKILL.md is a strict subset of routing's SKILL.md (4 options vs 5, less detailed principles).

Keeping it around creates:
- Confusion about which skill is authoritative
- Maintenance burden (changes must be applied to both)
- Discovery conflicts (both trigger on the same keywords)

## Migration Plan

All source paths relative to `/home/skogix/.local/src/docs/skills/`.

### Phase A: Enhance routing with unique skill-creator content

| # | Task | Source | Destination |
|---|------|--------|-------------|
| A1 | Extract `assets/` folder documentation from skill-creator SKILL.md | `skogai-skill-creator/SKILL.md` (lines 67-76) | New file: `skogai-routing/references/using-assets.md` |
| A2 | Extract writing style guidance from skill-creator SKILL.md | `skogai-skill-creator/SKILL.md` (line 167) | Append to `skogai-routing/references/be-clear-and-direct.md` |
| A3 | Enhance progressive disclosure in core-principles.md with 3-level model | `skogai-skill-creator/SKILL.md` (lines 77-85) | Amend `skogai-routing/references/core-principles.md` progressive_disclosure_principle section |
| A4 | Add `license:` as optional YAML field | `skogai-skill-creator/SKILL.md` (line 4) | Amend `skogai-routing/references/skill-structure.md` yaml_requirements section |

### Phase B: Move scripts into routing

| # | Task | Source | Destination |
|---|------|--------|-------------|
| B1 | Create scripts/ directory in routing | -- | `skogai-routing/scripts/` |
| B2 | Copy init_skill.py | `skogai-skill-creator/scripts/init_skill.py` | `skogai-routing/scripts/init_skill.py` |
| B3 | Copy package_skill.py | `skogai-skill-creator/scripts/package_skill.py` | `skogai-routing/scripts/package_skill.py` |
| B4 | Copy quick_validate.py | `skogai-skill-creator/scripts/quick_validate.py` | `skogai-routing/scripts/quick_validate.py` |

### Phase C: Update routing workflows to reference scripts

| # | Task | File |
|---|------|------|
| C1 | Update create-new-skill.md Step 4 to offer `scripts/init_skill.py` as scaffolding option | `skogai-routing/workflows/create-new-skill.md` |
| C2 | Add Step 10.5 or new step to create-new-skill.md for optional packaging via `scripts/package_skill.py` | `skogai-routing/workflows/create-new-skill.md` |
| C3 | Update audit-skill.md to offer `scripts/quick_validate.py` as automated check | `skogai-routing/workflows/audit-skill.md` |

### Phase D: Update routing SKILL.md indexes

| # | Task | File |
|---|------|------|
| D1 | Add `using-assets.md` to reference_index | `skogai-routing/SKILL.md` |
| D2 | Ensure description captures skill-creator trigger keywords ("create", "build", "initialize", "package") | `skogai-routing/SKILL.md` |

### Phase E: Reduce skill-creator to thin wrapper

| # | Task | File |
|---|------|------|
| E1 | Rewrite skill-creator SKILL.md as thin redirector (~50 lines) pointing to skogai-routing | `skogai-skill-creator/SKILL.md` |
| E2 | Remove scripts/ from skill-creator (now in routing) | `skogai-skill-creator/scripts/` |

### Phase F: Retire skogai-skills

| # | Task | File |
|---|------|------|
| F1 | Delete `skogai-skills/references/` (12 files, all duplicates) | `skogai-skills/references/*` |
| F2 | Delete `skogai-skills/workflows/` (10 files, all duplicates) | `skogai-skills/workflows/*` |
| F3 | Delete `skogai-skills/templates/` (2 files, all duplicates) | `skogai-skills/templates/*` |
| F4 | Delete `skogai-skills/SKILL.md` (subset of routing's SKILL.md) | `skogai-skills/SKILL.md` |
| F5 | Remove `skogai-skills/` directory | `skogai-skills/` |

### Phase G: Validation

| # | Task |
|---|------|
| G1 | Invoke skogai-routing and test all 5 intake options route correctly |
| G2 | Verify all referenced files exist (no broken links) |
| G3 | Verify scripts execute (init_skill.py, package_skill.py, quick_validate.py) |
| G4 | Invoke skogai-skill-creator and verify it redirects to routing |
| G5 | Confirm skogai-skills no longer exists |
| G6 | Search for any external references to skogai-skills and update them |

## Tasks

- [ ] A1: Create `skogai-routing/references/using-assets.md` with assets/ folder documentation from skill-creator
- [ ] A2: Append writing style guidance (imperative/infinitive form) to `be-clear-and-direct.md`
- [ ] A3: Enhance `core-principles.md` with formal 3-level progressive disclosure model
- [ ] A4: Add `license:` as optional field to `skill-structure.md` YAML requirements
- [ ] B1: Create `skogai-routing/scripts/` directory
- [ ] B2: Copy `init_skill.py` to `skogai-routing/scripts/`
- [ ] B3: Copy `package_skill.py` to `skogai-routing/scripts/`
- [ ] B4: Copy `quick_validate.py` to `skogai-routing/scripts/`
- [ ] C1: Update `create-new-skill.md` to offer `init_skill.py` as scaffolding option
- [ ] C2: Add packaging step to `create-new-skill.md` referencing `package_skill.py`
- [ ] C3: Update `audit-skill.md` to offer `quick_validate.py` as automated validation
- [ ] D1: Add `using-assets.md` to routing's `<reference_index>`
- [ ] D2: Update routing description to capture skill-creator trigger keywords
- [ ] E1: Rewrite `skogai-skill-creator/SKILL.md` as thin redirector to routing
- [ ] E2: Remove `skogai-skill-creator/scripts/` directory (scripts now in routing)
- [ ] F1: Delete all files in `skogai-skills/references/`
- [ ] F2: Delete all files in `skogai-skills/workflows/`
- [ ] F3: Delete all files in `skogai-skills/templates/`
- [ ] F4: Delete `skogai-skills/SKILL.md`
- [ ] F5: Remove `skogai-skills/` directory entirely
- [ ] G1: Test routing skill -- all 5 intake options, all workflow routes
- [ ] G2: Verify no broken file references across routing
- [ ] G3: Test scripts execute correctly from new location
- [ ] G4: Test skill-creator redirector works
- [ ] G5: Confirm skogai-skills is fully removed
- [ ] G6: Search codebase for references to `skogai-skills` and update/remove

## Acceptance Criteria

- skogai-routing is the single authoritative skill for skill creation, containing all unique content from all 3 skills
- skogai-routing has scripts/ with init_skill.py, package_skill.py, quick_validate.py
- skogai-routing references/ includes using-assets.md and enhanced be-clear-and-direct.md, core-principles.md, skill-structure.md
- skogai-skill-creator is a thin redirector (<50 lines) pointing to routing
- skogai-skills directory no longer exists
- Zero duplicated content across the remaining skills
- All workflow routes in routing work correctly
- All scripts execute from their new location
- No broken file references anywhere
- External references to skogai-skills have been updated

## Risks / Notes

- **Trigger keyword conflicts**: After consolidation, both routing and skill-creator will trigger on "create skill" type queries. The skill-creator redirector must have a description that clearly defers to routing, or it should be deleted entirely rather than kept as a wrapper. Consider whether the redirector adds value or just adds confusion.
- **Script path updates**: The scripts (init_skill.py, package_skill.py) may have internal path references or hardcoded assumptions about their location. These need to be checked and updated after moving.
- **WO-3 dependency**: If WO-3 (prompting reconciliation) touches be-clear-and-direct.md or core-principles.md, those changes should land first to avoid merge conflicts when this WO appends content to the same files.
- **Alternative to redirector**: Instead of keeping skill-creator as a thin wrapper, consider deleting it entirely and updating routing's description to cover all its trigger keywords. This is the cleaner solution but means losing the `skogai-skill-creator` name as a discovery path.
- **assets/ vs templates/**: The skill-creator's `assets/` concept (files not loaded into context, used in output) overlaps with but is distinct from routing's `templates/` concept (output structures Claude copies and fills). The new `using-assets.md` reference should clearly distinguish these.
- **Anthropic upstream**: skill-creator appears to be an Anthropic-provided skill (has `license:` field). If updates come from upstream, the thin-wrapper approach preserves the ability to diff against the original. If deleting entirely, keep a copy in an archive for reference.
