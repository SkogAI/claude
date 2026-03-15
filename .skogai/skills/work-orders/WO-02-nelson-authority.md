# WO-2: Clarify nelson vs nelson-base authority
**Phase**: 1
**Status**: planned
**Depends on**: none

## Summary
Two nelson directories exist -- `nelson/` (a deployed skill copy) and `nelson-base/` (a full upstream repo clone with demos, CI, contributing docs, and the same skill nested inside). Clarify which is the source of truth, whether they are in sync, and establish a single authoritative path.

## Context
`nelson-base/` is a clone of the upstream `harrymunro/nelson` GitHub repository. It contains the full repo structure: README, LICENSE, CONTRIBUTING, demos (battleships game), docs/images, CI config (lychee.toml, _typos.toml), a check-references script, and the actual skill nested at `skills/nelson/`. Meanwhile, `nelson/` at the top level of the skills directory appears to be a direct copy of just the skill portion (SKILL.md + references/). Both contain identical SKILL.md content. This creates confusion about where to make edits and which copy gets loaded.

## Current State

**nelson/** (top-level skill directory):
- `SKILL.md` -- main skill entrypoint (143 lines, identical to nelson-base's copy)
- `PERSONAS.md` -- personas file (uppercase, at root)
- `references/` -- full reference tree:
  - `action-stations.md`, `commendations.md`, `crew-roles.md`, `personas.md` (lowercase duplicate), `royal-marines.md`, `squadron-composition.md`
  - `admiralty-templates/` (8 template files including `marine-deployment-brief.md`)
  - `damage-control/` (6 procedure files)
  - `standing-orders/` (12 anti-pattern files including `battalion-ashore.md`)

**nelson-base/** (full upstream repo clone):
- `CLAUDE.md` -- project-level instructions for contributors
- `README.md` -- full upstream README with installation, usage, architecture docs (314 lines)
- `CONTRIBUTING.md` -- contribution guidelines
- `LICENSE` -- MIT license
- `lychee.toml`, `_typos.toml` -- CI/lint config
- `scripts/check-references.sh` -- reference validation script
- `agents/nelson.md` -- agent interface definition
- `demos/battleships/` -- full battleships demo app (HTML/CSS/JS, 14 JS files, 7 CSS files)
- `docs/` -- images and PERSONAS.md
- `skills/nelson/` -- the actual skill (SKILL.md + references/, identical structure to top-level nelson/)

**Key differences:**
- `nelson/` has `PERSONAS.md` at root AND `references/personas.md` (possible duplication)
- `nelson-base/` has `agents/nelson.md` -- not present in `nelson/`
- `nelson-base/` has `battalion-ashore.md` in standing-orders; `nelson/` also has it
- `nelson-base/` has demos, CI, contributing -- none in `nelson/`
- `nelson-base/CLAUDE.md` references `.claude/skills/nelson` symlink for local dev

## Tasks
- [ ] Diff `nelson/SKILL.md` against `nelson-base/skills/nelson/SKILL.md` to confirm they are identical or identify drift
- [ ] Diff all reference files between `nelson/references/` and `nelson-base/skills/nelson/references/` to check for drift
- [ ] Determine whether `nelson/` was manually copied from `nelson-base/skills/nelson/` or installed via plugin system
- [ ] Decide on authority model: (a) nelson-base is upstream, nelson is deployed copy; (b) nelson is the working copy, nelson-base is archived reference; (c) replace nelson with symlink to nelson-base/skills/nelson
- [ ] Resolve the PERSONAS.md duplication (root-level `PERSONAS.md` vs `references/personas.md`)
- [ ] Determine if `agents/nelson.md` from nelson-base should be present in the deployed skill
- [ ] Document the chosen authority model (which to edit, how updates flow)
- [ ] If nelson-base is kept as upstream reference, add a note in its CLAUDE.md about the relationship
- [ ] If nelson is the deployed copy, consider whether nelson-base should be moved out of the skills directory entirely (e.g., to a `vendor/` or `upstream/` location)

## Acceptance Criteria
- A single source of truth is identified and documented
- No content drift exists between the two copies of the skill
- The PERSONAS.md duplication is resolved
- The update flow is documented (how changes from upstream reach the deployed skill)
- The `agents/` directory question is resolved (needed or not in deployed skill)

## Risks / Notes
- If nelson-base is a git clone, it may have its own `.git` directory -- check whether it is a submodule, subtree, or plain copy
- Editing the wrong copy means changes get silently lost on next sync
- The battleships demo in nelson-base is substantial (14 JS files) -- if nelson-base is kept, clarify that this is upstream reference material, not part of the skill
- `nelson-base/CLAUDE.md` mentions a symlink at `.claude/skills/nelson` pointing to `../../skills/nelson` -- this suggests nelson-base was designed to be the repo root with the skill loaded via symlink, but the current setup has both flattened into the skills directory
