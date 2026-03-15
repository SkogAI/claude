---
title: "WO-4: Consolidate skill-creation cluster into skogai-routing"
labels: skills, merge, phase-3
---

## Summary

Three skills cover skill creation: `skogai-routing` (25 files, most mature), `skogai-skills` (25 files, exact duplicate of routing), `skogai-skill-creator` (4 files, 4 unique items). Consolidate into routing as the single hub.

**Depends on:** WO-3 (prompting reconciliation, to avoid cascading changes to shared reference files)

## Context

### skogai-skills = PURE DUPLICATE (delete entirely)
All 24 sub-files (12 references, 10 workflows, 2 templates) are byte-for-byte identical to routing's. Its SKILL.md is a strict subset (4 intake options vs routing's 5, less detailed principles). **Zero unique content.**

### skogai-skill-creator = 4 UNIQUE ITEMS (absorb then reduce)
**Unique content to migrate into routing:**
1. `scripts/init_skill.py` — scaffolding script generating skill directory with template
2. `scripts/package_skill.py` — packaging script creating distributable .zip
3. `scripts/quick_validate.py` — validation script checking YAML frontmatter/structure
4. Documentation concepts not in routing:
   - `assets/` folder pattern (files used in output, not loaded into context)
   - Writing style guidance (imperative/infinitive form)
   - Formal 3-level progressive disclosure model (metadata ~100 words -> SKILL.md <5k -> resources unlimited)
   - `license:` YAML frontmatter field

### skogai-routing = ALREADY THE SUPERSET (expand slightly)
25 files: SKILL.md + 12 references + 10 workflows + 2 templates. Needs only targeted additions.

## Tasks

### Phase A: Enhance routing with unique skill-creator content
- [ ] Create `skogai-routing/references/using-assets.md` documenting the `assets/` folder concept (from skill-creator SKILL.md lines 67-76)
- [ ] Append writing style guidance (imperative/infinitive form) to `skogai-routing/references/be-clear-and-direct.md`
- [ ] Enhance `skogai-routing/references/core-principles.md` progressive disclosure section with formal 3-level model
- [ ] Add `license:` as optional YAML field to `skogai-routing/references/skill-structure.md`

### Phase B: Move scripts into routing
- [ ] Create `skogai-routing/scripts/` directory
- [ ] Copy `skogai-skill-creator/scripts/init_skill.py` to `skogai-routing/scripts/`
- [ ] Copy `skogai-skill-creator/scripts/package_skill.py` to `skogai-routing/scripts/`
- [ ] Copy `skogai-skill-creator/scripts/quick_validate.py` to `skogai-routing/scripts/`

### Phase C: Update routing workflows to reference scripts
- [ ] Update `workflows/create-new-skill.md` Step 4 to offer `scripts/init_skill.py` as scaffolding option
- [ ] Add packaging step to `workflows/create-new-skill.md` referencing `scripts/package_skill.py`
- [ ] Update `workflows/audit-skill.md` to offer `scripts/quick_validate.py` as automated validation

### Phase D: Update routing SKILL.md
- [ ] Add `using-assets.md` to `<reference_index>` in SKILL.md
- [ ] Update routing description to capture skill-creator trigger keywords ("create", "build", "initialize", "package")

### Phase E: Reduce skill-creator to thin redirector
- [ ] Rewrite `skogai-skill-creator/SKILL.md` as thin redirector (~50 lines) pointing to skogai-routing
- [ ] Remove `skogai-skill-creator/scripts/` directory (scripts now in routing)
- [ ] Alternative: delete skill-creator entirely and rely on routing's updated description for discovery

### Phase F: Delete skogai-skills
- [ ] Delete all files in `skogai-skills/references/` (12 files, all duplicates)
- [ ] Delete all files in `skogai-skills/workflows/` (10 files, all duplicates)
- [ ] Delete all files in `skogai-skills/templates/` (2 files, all duplicates)
- [ ] Delete `skogai-skills/SKILL.md`
- [ ] Remove `skogai-skills/` directory entirely

### Phase G: Validation
- [ ] Test routing skill — all 5 intake options route correctly
- [ ] Verify no broken file references across routing
- [ ] Test scripts execute correctly from new location (`init_skill.py`, `package_skill.py`, `quick_validate.py`)
- [ ] If skill-creator kept as redirector: verify it redirects to routing
- [ ] Confirm skogai-skills no longer exists
- [ ] Grep all skills for references to `skogai-skills` and update/remove

## Acceptance Criteria

- `skogai-routing` is the single authoritative skill for skill creation
- `skogai-routing/scripts/` contains init_skill.py, package_skill.py, quick_validate.py
- `skogai-routing/references/` includes using-assets.md, enhanced be-clear-and-direct.md, core-principles.md, skill-structure.md
- `skogai-skills/` directory no longer exists
- `skogai-skill-creator` is either a thin redirector (<50 lines) or deleted entirely
- Zero duplicated content across remaining skills
- All scripts execute from new location
- No broken file references anywhere

## Notes

- Scripts may have internal path references or hardcoded location assumptions — check after moving
- `assets/` vs `templates/` distinction: assets = files not loaded into context (logos, fonts), templates = output structures Claude fills. New reference must clarify.
- skill-creator appears to be Anthropic-provided (has `license:` field). If keeping as redirector, preserves ability to diff against upstream. If deleting, archive a copy.
- Consider whether redirector adds value or just adds routing confusion
