---
title: "WO-2: Clarify nelson vs nelson-base authority"
labels: skills, merge, phase-1
---

## Summary

Two nelson directories exist — `nelson/` (deployed skill copy) and `nelson-base/` (upstream repo clone from harrymunro/nelson). Establish single source of truth and eliminate duplication.

## Context

**`nelson/`** (top-level skill directory):
- `SKILL.md` — 143 lines, identical to nelson-base's copy
- `PERSONAS.md` — personas file (uppercase, at root)
- `references/` — full tree: action-stations, commendations, crew-roles, personas (lowercase duplicate), royal-marines, squadron-composition, admiralty-templates/ (8 files), damage-control/ (6 files), standing-orders/ (12 files)

**`nelson-base/`** (upstream repo clone):
- `CLAUDE.md` — contributor instructions, mentions `.claude/skills/nelson` symlink for local dev
- `README.md` — 314 lines, installation/usage/architecture
- `CONTRIBUTING.md`, `LICENSE` (MIT)
- `lychee.toml`, `_typos.toml` — CI/lint config
- `scripts/check-references.sh` — reference validation
- `agents/nelson.md` — agent interface definition
- `demos/battleships/` — full HTML/CSS/JS demo (14 JS files, 7 CSS files)
- `docs/` — images and PERSONAS.md
- `skills/nelson/` — the actual skill (identical to top-level `nelson/`)

**PERSONAS.md duplication:** `nelson/PERSONAS.md` (root, uppercase) AND `nelson/references/personas.md` (lowercase)

## Tasks

- [ ] Diff `nelson/SKILL.md` vs `nelson-base/skills/nelson/SKILL.md` to confirm identical or identify drift
- [ ] Diff all reference files between `nelson/references/` and `nelson-base/skills/nelson/references/`
- [ ] Check if `nelson-base/` has its own `.git` directory (submodule? subtree? plain copy?)
- [ ] Decide authority model: nelson-base is upstream, nelson becomes symlink to `nelson-base/skills/nelson/`
- [ ] Resolve PERSONAS.md duplication (root-level vs `references/personas.md`)
- [ ] Determine if `agents/nelson.md` should be in the deployed skill
- [ ] Replace `nelson/` with symlink to `nelson-base/skills/nelson/` (or document chosen relationship)
- [ ] Document the update flow (how upstream changes reach deployed skill)
- [ ] Consider moving nelson-base out of skills/ to `vendor/` or `upstream/` if it's not itself a skill

## Acceptance Criteria

- Single source of truth identified and documented
- No content drift between copies
- PERSONAS.md duplication resolved
- Update flow documented
- `agents/` directory question resolved

## Notes

- nelson-base/CLAUDE.md mentions symlink at `.claude/skills/nelson` pointing to `../../skills/nelson` — suggests nelson-base was designed as the repo root with skill loaded via symlink
- The battleships demo is substantial (14 JS files) — clarify it's upstream reference material, not part of the skill
- Editing the wrong copy means changes silently lost on next sync
