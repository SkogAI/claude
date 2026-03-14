# Project Research Summary

**Project:** SkogAI Skills — Chapter 1: Workspace Setup
**Domain:** Claude Code skill authoring and chapter-based tutorial plugin
**Researched:** 2026-03-14
**Confidence:** HIGH

## Executive Summary

This project is a Claude Code plugin that teaches the SkogAI workflow by executing it. The canonical implementation pattern is clear and well-documented: skills use YAML frontmatter plus an XML-body `SKILL.md` as an entry-point router, with detailed content deferred to `workflows/`, `references/`, and `templates/` subdirectories. Progressive disclosure is not a style preference — it is an architectural constraint driven by the 8K–32K context budgets of small agents. Every design decision must be tested against the constraint that a Haiku agent with 8K tokens can complete the full workflow.

The recommended approach is strictly sequenced: stabilize the four existing skills first, then establish the plugin shell, then write Chapter 1 content. This order exists because tutorial content is downstream of skill quality — any chapter prose that references skill internals becomes stale the moment those internals change. The "filesystem as memory" RAM-file pattern (absorbed from `planning-with-files`) must be defined as a concrete template before any workflow step references it, because its location and structure are dependencies for every subsequent chapter.

The primary risks are context bloat (SKILL.md files exceeding the 500-line limit) and path coupling (hardcoded absolute paths that break on plugin install). Both risks must be addressed in Phase 1 — the skill cleanup phase — before anything else is built. Building tutorial content before skills are stable or building plugin infrastructure before paths are audited will produce rework at high cost.

---

## Key Findings

### Recommended Stack

The skill format is non-negotiable: `SKILL.md` with YAML frontmatter (`name`, `description` — both required) and an XML-structured body. No markdown headings (`#`, `##`) in the body. The `quick_validate.py` script enforces allowed frontmatter keys and will reject `version`, `tools`, `verified`, and `lastVerifiedAt` — a live pitfall in the existing `planning-with-files` skill. Plugin packaging produces a `.skill` zip via `package_skill.py` which runs validation first.

**Core technologies:**
- SKILL.md (YAML frontmatter + XML body): skill entry point and invocation trigger — no alternative
- XML semantic tags (`<objective>`, `<process>`, `<success_criteria>`, `<routing>`): structure for reliable agent parsing — markdown headings must not be used in skill bodies
- `workflows/` + `references/` subdirectories: progressive disclosure implementation — required for any skill over ~200 lines or with multiple paths
- Python 3 (`quick_validate.py`, `package_skill.py`): packaging and validation tooling — system Python, no version pin required
- Bash/zsh: scripts bundled in `scripts/` subdirectory — preferred for environment and git operations
- `plugin.json` (`.claude-plugin/plugin.json`): plugin manifest establishing namespace — required for `--plugin-dir` install and marketplace distribution

Full detail: `.planning/research/STACK.md`

### Expected Features

The plugin has two simultaneous consumers: agents (8K–200K context) who invoke skills to do work, and humans who read the plugin to understand what was built. Features must serve both.

**Must have (table stakes):**
- Plugin manifest — nothing loads without it; first deliverable
- Chapter overview skill — entry point with series navigation stub
- XML semantic structure throughout — agents parse by tag, not heading; the tutorial must model what it teaches
- Progressive disclosure (SKILL.md under 500 lines) — non-negotiable for small-context agent compatibility
- `<success_criteria>` on every skill — agents need a completion signal or tasks drift
- skogai-routing integrated as foundational pattern — Chapter 1 teaches this pattern and must implement it
- Filesystem as memory RAM-file pattern — the core insight this plugin exists to teach; must be concrete, not prose

**Should have (competitive differentiators):**
- Intent-based routing (not wizard menus) — Claude Code has no interactive UI; routing must be semantic
- Chapter series architecture (extensibility) — future chapters are already out of scope but the shell must accommodate them
- Agent-size-agnostic annotations — explicit per-skill context budget guidance

**Defer (v2+):**
- `skill-creator` description optimization loop — requires subagent infrastructure not yet built
- Blind comparison testing between skill versions — eval infrastructure not yet built
- Automated skill health checks via `skogai-bats-testing` — useful but not Chapter 1 scope

Full detail: `.planning/research/FEATURES.md`

### Architecture Approach

The plugin follows a three-layer architecture: Plugin Distribution Layer (`.claude-plugin/plugin.json` + `skills/` structure), Skill Structure Layer (per-skill `SKILL.md` + `workflows/` + `references/` + `templates/`), and Runtime Layer (Claude Code skill resolution, priority: enterprise > personal > project > plugin). Skills in the plugin are namespaced (`/skogai-skills:chapter-1-workspace-setup`), which prevents collisions with standalone `.claude/skills/` entries but requires deliberate name design. RAM files must live in the user's workspace (`.skogai/plan/<chapter>/`), not inside the plugin — plugin files are copied to a read-only cache on install.

**Major components:**
1. Plugin shell (`.claude-plugin/plugin.json` + `skills/` directory) — namespace container for all chapters; must be created before any chapter content
2. Chapter 1 skill (`SKILL.md` as router, `workflows/` for steps, `references/` for patterns) — implements and teaches the progressive disclosure pattern simultaneously
3. RAM-file template (`templates/ram-file.md`) — concrete working-memory structure that workflows instruct agents to create in the user's workspace; the abstraction that makes small-context agents viable
4. Existing skill integrations (skogai-routing, skill-creator, skogai-bats-testing as-is; planning-with-files absorbed) — source material for Chapter 1 and reference implementations

Full detail: `.planning/research/ARCHITECTURE.md`

### Critical Pitfalls

1. **Context bloat (SKILL.md over 500 lines)** — treat SKILL.md as a router only; move everything except essential principles and routing table to `workflows/` and `references/`; warning sign is any SKILL.md exceeding 300 lines during authoring
2. **Tutorial content before stable skills** — this is the hardest sequencing constraint: do not write prose describing skill internals until skill cleanup is closed; Phase 1 must be complete before Phase 3 begins; no exceptions
3. **Hardcoded absolute paths in @-references** — skills developed at `~/.local/src/` via symlink silently break when installed via plugin; audit all four existing skills for `@./.claude/skills/` references before creating the plugin shell; use only relative paths within skill directories
4. **Description under-triggering** — vague descriptions prevent the tutorial from firing; write descriptions that name user contexts explicitly ("learn SkogAI", "set up workspace", "chapter 1 tutorial"); run a manual trigger eval against at least 5 realistic phrases before shipping
5. **Conflating GSD planning artifacts with agent RAM files** — `.planning/` is for orchestrator artifacts (project state); `.skogai/plan/` is for agent working memory (session state); absorbing `planning-with-files` must produce a clean separation, not a merge

Full detail: `.planning/research/PITFALLS.md`

---

## Implications for Roadmap

Based on combined research, a 3-phase structure is strongly implied by dependency constraints. Phase sequencing is not a preference — it is forced by the fact that tutorial content is downstream of skill quality, and skill quality is downstream of path auditing.

### Phase 1: Skill Cleanup and Foundation

**Rationale:** Everything else depends on the four existing skills being stable and correctly structured. Pitfall 6 (tutorial before stable skills) is a sequencing constraint across the entire project — it cannot be mitigated by good writing in later phases. Pitfalls 1 (context bloat) and 3 (hardcoded paths) must also be resolved here, before any content is authored or packaged.

**Delivers:**
- All four skills (`skogai-routing`, `skill-creator`, `skogai-bats-testing`, `planning-with-files`) audited for markdown headings, line count, and absolute path references
- `skogai-routing` tightened as the foundational pattern demonstration
- `planning-with-files` absorbed: RAM-file principle extracted, GSD-duplicate material discarded, remaining content located in `.skogai/plan/` namespace
- Decision on RAM-file structure documented (shape, location, update cadence)
- No non-standard frontmatter keys (`version`, `tools`, `verified`, `lastVerifiedAt`) in any skill

**Addresses:** Table stakes (XML structure, progressive disclosure), Pitfalls 1, 2, 3, 6

**Avoids:** Rework if tutorial references unstable skill internals; broken @-references on plugin install

**Research flag:** No additional research needed — patterns are well-documented and live codebase provides ground truth.

---

### Phase 2: Plugin Shell

**Rationale:** The plugin manifest is a prerequisite for any namespaced invocation. Plugin shell must exist before Chapter 1 content is written into it, because the directory structure (`skills/chapter-1-workspace-setup/`) determines path conventions for all subsequent work. Description optimization also belongs here — it requires stable skill content to evaluate.

**Delivers:**
- `.claude-plugin/plugin.json` with correct name, version, author
- `skills/` directory structure with Chapter 1 skill directory scaffolded (no content yet)
- `settings.json` plugin registration verified locally via `claude --plugin-dir`
- Skill description written to pass a manual 5-phrase trigger eval
- `templates/ram-file.md` created (RAM-file structure defined in Phase 1 lands here as a template)

**Uses:** Plugin manifest format from STACK.md; namespace design from ARCHITECTURE.md (anti-pattern 4)

**Implements:** Plugin Distribution Layer; Skill Invocation Control pattern

**Avoids:** Pitfall 4 (description under-triggering) — description is written here with explicit trigger phrase testing

**Research flag:** No additional research needed — plugin.json format and settings.json schema verified from live codebase.

---

### Phase 3: Chapter 1 Content

**Rationale:** Only possible after Phase 1 (stable skills to reference) and Phase 2 (plugin shell to write into). This phase produces the actual tutorial chapter — workflow files, reference distillations, and the chapter overview. The RAM-file template (Phase 2) is referenced here by workflows.

**Delivers:**
- `SKILL.md` as progressive disclosure router (essential principles + routing table, under 500 lines)
- `workflows/01-overview.md` — big picture, series goals, what Chapter 1 builds
- `workflows/02-clean-skills-dir.md` — step-by-step procedure for integrating the four skills
- `workflows/03-establish-ram-files.md` — procedure for creating and using the RAM-file pattern
- `references/skogai-routing.md` — distilled routing pattern (not a copy of the skill; a reference extract)
- `references/ram-file-pattern.md` — the "filesystem as memory" principle in concise reference form
- `<success_criteria>` present and checkable in every workflow file

**Implements:** Chapter overview skill; filesystem-as-memory pattern; skogai-routing integration; agent-size-agnostic design

**Avoids:** Pitfall 1 (context bloat) — SKILL.md contains only router; Pitfall 6 (content before stable skills) — Phase 1 gate enforces this

**Research flag:** Workflow content design may benefit from `/gsd:research-phase` if the RAM-file update cadence question is unresolved after Phase 1. Otherwise standard patterns apply.

---

### Phase Ordering Rationale

- Phase 1 before Phase 2: paths must be audited before the plugin shell is created, or the plugin will bundle broken references
- Phase 1 before Phase 3: tutorial content must not describe skill internals until those internals are final (Pitfall 6 — sequencing constraint, not style preference)
- Phase 2 before Phase 3: plugin directory structure establishes paths that workflow files will reference; authoring content into an undefined structure creates rework
- Individual workflows within Phase 3 are independent and can be written in parallel

### Research Flags

Phases needing deeper research during planning:
- **Phase 3:** RAM-file update cadence (every tool call vs. phase boundary) is unresolved. If Phase 1 absorption of `planning-with-files` does not produce a clear answer, run `/gsd:research-phase` before authoring `workflows/03-establish-ram-files.md`.

Phases with standard patterns (skip research-phase):
- **Phase 1:** Skill structure, frontmatter constraints, and XML requirements are fully documented in `skill-creator` and `skogai-routing` source files. No external research needed.
- **Phase 2:** Plugin manifest format and settings.json schema are verified from the live workspace. No external research needed.

---

## Confidence Assessment

| Area | Confidence | Notes |
|------|------------|-------|
| Stack | HIGH | Derived directly from `quick_validate.py` source code and live `settings.json` — no inference required |
| Features | HIGH | Cross-referenced against official Claude Code docs and two consumer audiences (agent + human); feature dependencies mapped explicitly |
| Architecture | HIGH | Based on official docs at `/docs/claude-code/` plus direct codebase analysis; component boundaries verified from live plugin registry |
| Pitfalls | HIGH | Derived from direct codebase analysis plus authoritative `skill-creator` documentation; recovery costs assessed concretely |

**Overall confidence:** HIGH

### Gaps to Address

- **RAM-file update cadence:** Research identified that agents should write state "after every action" (from `planning-with-files`) but `skill-creator` guidance suggests reading only at phase boundaries to avoid context overhead. The right answer is probably task-dependent. Resolve by using the pattern during Phase 1 and observing.
- **`planning-with-files` absorption scope:** The exact boundary between what GSD already covers and what the RAM-file pattern adds is declared in PROJECT.md as "Pending." Phase 1 must produce a concrete decision before Phase 3 content references it.
- **Chapter series extensibility:** Future chapters are out of scope, but Phase 2's plugin shell must not trap them. The exact namespace and inter-chapter navigation stubs are not yet specified. Resolve during Phase 2 planning — a minimal stub is sufficient; don't over-engineer.

---

## Sources

### Primary (HIGH confidence)
- `/home/skogix/claude/.claude/skills/skill-creator/SKILL.md` — official Anthropic skill authoring guide, progressive disclosure, 500-line limit, description triggering
- `/home/skogix/claude/.claude/skills/skill-creator/scripts/quick_validate.py` — authoritative allowed frontmatter keys (source code)
- `/home/skogix/claude/.claude/skills/skill-creator/scripts/package_skill.py` — .skill zip format and exclusion rules (source code)
- `/home/skogix/claude/.claude/skills/skogai-routing/SKILL.md` — router pattern, XML structure requirements, progressive disclosure math
- `/home/skogix/claude/docs/claude-code/skills.md` — official Claude Code skills documentation
- `/home/skogix/claude/docs/claude-code/plugins.md` — official Claude Code plugins documentation
- `/home/skogix/claude/docs/claude-code/sub-agents.md` — official Claude Code subagent documentation
- `/home/skogix/claude/.claude/settings.json` — live plugin registration format and marketplace config

### Secondary (HIGH — live codebase)
- `.planning/codebase/ARCHITECTURE.md` — agent spawning model, state management, symlink lifecycle (written 2026-03-14 from live codebase)
- `.planning/codebase/CONCERNS.md` — identified technical risks and debt patterns
- `.planning/PROJECT.md` — project scope, key decisions, constraints

---
*Research completed: 2026-03-14*
*Ready for roadmap: yes*
