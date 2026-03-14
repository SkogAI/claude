# Roadmap: SkogAI Skills — Chapter 1: Workspace Setup

## Overview

Three phases forced by dependency constraints. Skills must be stable before the plugin shell is created (broken paths in the shell are expensive to fix). The plugin shell must exist before chapter content is authored into it (directory structure defines path conventions). Tutorial prose must not describe skill internals until those internals are final. Each phase delivers one complete, verifiable capability — and the next phase cannot meaningfully start until the previous one is done.

## Phases

**Phase Numbering:**
- Integer phases (1, 2, 3): Planned milestone work
- Decimal phases (2.1, 2.2): Urgent insertions (marked with INSERTED)

Decimal phases appear between their surrounding integers in numeric order.

- [ ] **Phase 1: Skill Foundation** - Audit and stabilize all four existing skills; resolve planning-with-files absorption
- [ ] **Phase 2: Plugin Shell and Patterns** - Create plugin manifest, scaffold chapter structure, define RAM-file pattern, document the routing principles
- [ ] **Phase 3: Chapter 1 Content** - Author workflow files, reference extracts, and the chapter overview SKILL.md

## Phase Details

### Phase 1: Skill Foundation
**Goal**: All four existing skills are valid, stable, and safe to reference from tutorial content
**Depends on**: Nothing (first phase)
**Requirements**: FOUND-01, FOUND-02, FOUND-03
**Success Criteria** (what must be TRUE):
  1. Every skill passes `quick_validate.py` with no errors — no non-standard frontmatter keys, no markdown headings in bodies
  2. Every skill SKILL.md is under 500 lines with content in workflows/ or references/ subdirectories
  3. No absolute path @-references exist in any skill (all references use relative paths safe for plugin install)
  4. skogai-routing is demonstrably the foundational pattern — its structure is the model every other skill follows
  5. planning-with-files is resolved: RAM-file principle is extracted and located, GSD-duplicate material is removed, and the boundary between the two is documented
**Plans**: TBD

Plans:
- [ ] 01-01: Audit all four skills for frontmatter, line count, path references, and XML structure
- [ ] 01-02: Tighten skogai-routing as foundational pattern and absorb planning-with-files

### Phase 2: Plugin Shell and Patterns
**Goal**: Plugin container exists, routing principles are documented, and RAM-file pattern is concrete
**Depends on**: Phase 1
**Requirements**: UNDR-01, UNDR-02, UNDR-03, WMEM-01, WMEM-02, WMEM-03
**Success Criteria** (what must be TRUE):
  1. Plugin loads locally via `claude --plugin-dir` without errors
  2. Chapter 1 skill directory structure exists with correct namespacing
  3. `templates/ram-file.md` exists as a concrete, usable template — not prose, an actual template
  4. The routing pattern is explained as a teachable concept in a reference file, not just implemented
  5. The relationship between skills, commands, hooks, and agents is documented with clear "when to use which" guidance
**Plans**: TBD

Plans:
- [ ] 02-01: Create plugin manifest and scaffold chapter 1 directory structure
- [ ] 02-02: Define RAM-file template and document routing/understanding reference files

### Phase 3: Chapter 1 Content
**Goal**: Chapter 1 is a complete, working tutorial that teaches the SkogAI workflow by doing it
**Depends on**: Phase 2
**Requirements**: CHAP-01, CHAP-02, CHAP-03, CHAP-04
**Success Criteria** (what must be TRUE):
  1. A small-context agent (8K tokens) can complete the workspace setup workflow by reading only what the SKILL.md router points to — no upfront context dump required
  2. SKILL.md is under 500 lines and functions as a pure router, not a content document
  3. Every workflow file has `<success_criteria>` that an agent can check without external knowledge
  4. The chapter itself follows the routing pattern it teaches — SKILL.md routes to workflows/, workflows reference references/, no content is duplicated
**Plans**: TBD

Plans:
- [ ] 03-01: Author SKILL.md router and workflows/01-overview.md
- [ ] 03-02: Author workflows/02-clean-skills-dir.md and workflows/03-establish-ram-files.md
- [ ] 03-03: Author reference files (skogai-routing.md, ram-file-pattern.md) and verify end-to-end

## Progress

**Execution Order:**
Phases execute in numeric order: 1 → 2 → 3

| Phase | Plans Complete | Status | Completed |
|-------|----------------|--------|-----------|
| 1. Skill Foundation | 0/2 | Not started | - |
| 2. Plugin Shell and Patterns | 0/2 | Not started | - |
| 3. Chapter 1 Content | 0/3 | Not started | - |
