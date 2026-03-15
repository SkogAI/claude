---
title: "WO-5: Decouple skogai-docs from CORA"
labels: skills, refactor, phase-1
---

## Summary

`skogai-docs` is hardcoded to a Rails app called CORA — 17 enum values, stage references, module paths all assume CORA. Make it generic and usable with any project.

## Context

The skill captures solved problems as structured YAML-frontmatter documentation. The workflow is project-agnostic (detect, gather context, validate schema, write doc), but the implementation is deeply CORA-specific.

**Files involved:**
- `SKILL.md` — 525 lines
- `schema.yaml` — 177 lines
- `references/yaml-schema.md` — 66 lines
- `assets/resolution-template.md`
- `assets/critical-pattern-template.md`

## CORA-Specific References (exhaustive)

### In SKILL.md:
1. Step 2 "Gather Context": "Module name: Which CORA module had the problem"
2. Step 2: "Rails version" as required environment detail
3. Step 2: "Stage (0-6 or post-implementation)" — CORA staging system
4. Step 7: references `docs/solutions/patterns/cora-critical-patterns.md`
5. Decision Menu Option 2: references `cora-critical-patterns.md` multiple times
6. Error Handling: "Module not in CORA-MODULES.md"
7. Example Scenario: uses CORA modules (Brief System, EmailProcessing)

### In schema.yaml:
1. Title: `# CORA Documentation Schema`
2. Module field: `description: "Module/area of CORA"`
3. Component enum (17 values, most CORA-specific): `email_processing`, `brief_system`, `assistant`, `rails_model`, `rails_controller`, `rails_view`, `hotwire_turbo`, `frontend_stimulus`, `payments`, `authentication`, etc.
4. Component description: `"CORA component involved"`
5. Validation: `"module must be a valid CORA module name"`
6. Examples: use CORA modules and Rails versions

### In yaml-schema.md:
1. Module description: "e.g., 'EmailProcessing' or 'CORA' for system-wide issues"
2. Component enum: same CORA-specific values
3. Example: uses "Email Processing" module, Rails version

## Tasks

- [ ] Replace all literal "CORA" references in SKILL.md with generic language ("project module" instead of "CORA module")
- [ ] Remove or make optional "Stage (0-6 or post-implementation)" (CORA lifecycle)
- [ ] Replace `cora-critical-patterns.md` path with generic `critical-patterns.md`
- [ ] Remove/generalize "Module not in CORA-MODULES.md" error handler
- [ ] Rewrite example scenario with generic/placeholder project details
- [ ] Genericize `schema.yaml` component enum: replace CORA-specific components with generic categories or make extensible
- [ ] Remove "CORA Documentation Schema" title from schema.yaml
- [ ] Change "Module/area of CORA" to "Module/area of the project"
- [ ] Change "CORA component involved" to "Project component involved"
- [ ] Remove/generalize "module must be a valid CORA module name" validation rule
- [ ] Update yaml-schema.md to match genericized schema.yaml
- [ ] Update examples in yaml-schema.md with generic project references
- [ ] Review `assets/resolution-template.md` for CORA references
- [ ] Review `assets/critical-pattern-template.md` for CORA references
- [ ] Make `rails_version` a generic `framework_version` optional field
- [ ] Test updated schema validates correctly with the skill's step 5 logic

## Acceptance Criteria

- Zero literal "CORA" strings remain in any file
- Component enum uses generic categories or documents how to customize per-project
- Skill works out of the box for non-Rails, non-CORA projects
- Schema validation logic still functions
- Example scenario demonstrates skill without assuming specific project domain
- Rails-specific fields are removed or clearly marked optional

## Notes

- If anyone is actively using against CORA, enum changes will break existing doc validation — consider providing CORA-specific override mechanism
- Component enum: making it fully generic risks losing enum validation value. Consider two-tier approach: generic base + project-specific extensions via config
- "Stage (0-6)" is CORA lifecycle staging — should become optional freeform field, not removed entirely
