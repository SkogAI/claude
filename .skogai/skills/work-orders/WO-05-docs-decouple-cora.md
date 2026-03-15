# WO-5: Decouple skogai-docs from CORA
**Phase**: 1
**Status**: planned
**Depends on**: none

## Summary
The `skogai-docs` skill is hardcoded to a specific Rails application called CORA -- its schema enums, component names, module references, and example scenarios all assume CORA. Decouple it into a generic problem-documentation skill that works with any project.

## Context
`skogai-docs` captures solved problems as structured documentation with YAML frontmatter. The concept is project-agnostic (detect confirmation, gather context, validate schema, write doc), but the implementation is deeply tied to CORA: the schema enums list CORA-specific components like `brief_system`, `email_processing`, `assistant`; the required fields include "module" described as "Module/area of CORA"; validation rules reference "CORA-MODULES.md"; and examples use CORA domain objects. To reuse this skill in other projects, all CORA-specific content needs to become configurable or generic.

## Current State

**Files involved:**
- `SKILL.md` -- main skill (525 lines)
- `schema.yaml` -- YAML frontmatter schema (177 lines)
- `references/yaml-schema.md` -- human-readable schema reference (66 lines)
- `assets/resolution-template.md` -- documentation template
- `assets/critical-pattern-template.md` -- critical pattern template

**CORA-specific references in SKILL.md:**
1. Line 7: `description` mentions no CORA but step 2 does
2. Step 2 "Gather Context" (line 68): "Module name: Which CORA module had the problem"
3. Step 2 (line 76): "Rails version" as required environment detail
4. Step 2 (line 77): "Stage (0-6 or post-implementation)" -- CORA-specific staging system
5. Step 7 (line 256): references `docs/solutions/patterns/cora-critical-patterns.md`
6. Decision Menu Option 2 (lines 293-306): references `cora-critical-patterns.md` multiple times
7. Error Handling (line 412): "Module not in CORA-MODULES.md"
8. Example Scenario (lines 463-512): uses CORA-specific modules (Brief System, EmailProcessing)

**CORA-specific references in schema.yaml:**
1. Line 1: `# CORA Documentation Schema`
2. Line 7: `description: "Module/area of CORA"`
3. Component enum (lines 39-57): 17 values, most are CORA-specific:
   - `email_processing`, `brief_system`, `assistant` -- CORA domain
   - `rails_model`, `rails_controller`, `rails_view` -- Rails-specific
   - `hotwire_turbo`, `frontend_stimulus` -- Rails/Hotwire-specific
   - `payments`, `authentication` -- could be generic
4. Line 57: `description: "CORA component involved"`
5. Line 136: `"module must be a valid CORA module name"`
6. Examples (lines 146-176): use CORA modules and Rails versions

**CORA-specific references in yaml-schema.md:**
1. Line 7: `"Module name (e.g., 'EmailProcessing') or 'CORA' for system-wide issues"`
2. Component enum (line 10): same CORA-specific values as schema.yaml
3. Example (lines 32-46): uses "Email Processing" module, Rails version

**What should become configurable:**
- Component enum values (project defines its own)
- Module field description and validation
- Stage system (CORA's 0-6 stages)
- Rails-specific environment details
- Critical patterns file path
- Example scenarios

## Tasks
- [ ] Replace all literal "CORA" references in SKILL.md with generic language (e.g., "project module" instead of "CORA module")
- [ ] Remove "Stage (0-6 or post-implementation)" from required environment details or make it optional/configurable
- [ ] Replace `cora-critical-patterns.md` path references with a generic `critical-patterns.md`
- [ ] Remove "Module not in CORA-MODULES.md" error handler or make it reference a generic modules list
- [ ] Rewrite the example scenario with generic/placeholder project details
- [ ] Make `schema.yaml` component enum generic: replace CORA-specific components (brief_system, email_processing, assistant) with generic categories or make the enum extensible
- [ ] Remove "CORA Documentation Schema" title from schema.yaml
- [ ] Change "Module/area of CORA" to "Module/area of the project" in schema.yaml
- [ ] Change "CORA component involved" to "Project component involved" in schema.yaml
- [ ] Remove "module must be a valid CORA module name" validation rule or generalize it
- [ ] Update yaml-schema.md to match the genericized schema.yaml
- [ ] Update examples in yaml-schema.md to use generic project references
- [ ] Review `assets/resolution-template.md` for CORA references
- [ ] Review `assets/critical-pattern-template.md` for CORA references
- [ ] Consider making `rails_version` a generic `framework_version` optional field
- [ ] Test that the updated schema still validates correctly with the skill's step 5 logic

## Acceptance Criteria
- Zero literal "CORA" strings remain in any file in the skill directory
- The component enum either uses generic categories or documents how to customize per-project
- The skill works out of the box for a non-Rails, non-CORA project
- Schema validation logic still functions (enum values are valid, required fields present)
- The example scenario demonstrates the skill without assuming a specific project domain
- Rails-specific fields (rails_version, Stage 0-6) are either removed or clearly marked optional

## Risks / Notes
- If anyone is actively using this skill against a CORA project, the enum changes will break existing documentation validation -- consider providing a CORA-specific override or extension mechanism
- The component enum is the hardest part: making it fully generic risks losing the value of enum validation (preventing typos). Consider a two-tier approach: generic base enums + project-specific extensions via a config file
- The `docs/solutions/patterns/cora-critical-patterns.md` path is referenced in the decision menu -- any existing docs at that path would need migration
- The "Stage (0-6)" concept is CORA-specific lifecycle staging -- other projects may have their own lifecycle concepts, so this should become an optional freeform field rather than being removed entirely
