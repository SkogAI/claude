# Requirements: SkogAI Skills — Chapter 1

**Defined:** 2026-03-14
**Core Value:** Agents of any size can follow the SkogAI workflow by reading files, not by having massive context windows

## v1 Requirements

### Foundation

- [ ] **FOUND-01**: Skills directory is audited — each skill has valid frontmatter, follows <500 line discipline, uses XML structure
- [ ] **FOUND-02**: skogai-routing is established as the foundational pattern — it teaches how every other skill should be built
- [ ] **FOUND-03**: planning-with-files is resolved — "filesystem as memory" principle is preserved where GSD doesn't cover it, implementation debt is removed

### Understanding

- [ ] **UNDR-01**: Chapter 1 SKILL.md explains WHY the workspace exists and what problem it solves (routing over dumping, lazy loading, progressive disclosure)
- [ ] **UNDR-02**: The routing pattern is documented as a teachable concept — not just used, but explained so agents and humans understand the principle
- [ ] **UNDR-03**: The relationship between skills, commands, hooks, and agents is clear — when to use which, why they're separate

### Working Memory

- [ ] **WMEM-01**: RAM-file pattern is defined — what a small-context agent needs to stay oriented (current state, what just happened, what's next)
- [ ] **WMEM-02**: The pattern is lightweight enough for 8K context agents but useful enough for 200K agents to benefit from
- [ ] **WMEM-03**: Clear guidance on when to write to disk vs trust context — decision framework, not rigid rules

### Chapter Structure

- [ ] **CHAP-01**: Chapter 1 has workflow files that walk through workspace setup step by step
- [ ] **CHAP-02**: Reference files provide domain knowledge that workflows point to (not dumped upfront)
- [ ] **CHAP-03**: The chapter itself follows the routing pattern it teaches (dogfooding)
- [ ] **CHAP-04**: Chapter is designed as first in a series — extensible without restructuring

## v2 Requirements

### Plugin Packaging

- **PLUG-01**: Plugin manifest (.claude-plugin/plugin.json) for distribution
- **PLUG-02**: Skill description optimization for reliable triggering
- **PLUG-03**: Chapter series navigation between installed chapters

### Testing

- **TEST-01**: Bats tests verify skill structure validity
- **TEST-02**: Eval cases verify skill triggering accuracy

### Advanced

- **ADVN-01**: Agent-size annotations (which parts are critical for small-context agents)
- **ADVN-02**: Context budget tracking (how many tokens each skill/reference costs)

## Out of Scope

| Feature | Reason |
|---------|--------|
| Building chapters 2+ | Future milestones — this is chapter 1 only |
| Modifying the GSD framework | We use it, we don't modify it |
| Implementation-first approach | Understanding WHY comes before building HOW |
| Perfect first pass | Explicitly iterative — ship to learn, revisit to improve |
| Plugin marketplace submission | v2 concern — local development first |

## Traceability

| Requirement | Phase | Status |
|-------------|-------|--------|
| FOUND-01 | Phase 1 | Pending |
| FOUND-02 | Phase 1 | Pending |
| FOUND-03 | Phase 1 | Pending |
| UNDR-01 | Phase 2 | Pending |
| UNDR-02 | Phase 2 | Pending |
| UNDR-03 | Phase 2 | Pending |
| WMEM-01 | Phase 2 | Pending |
| WMEM-02 | Phase 2 | Pending |
| WMEM-03 | Phase 2 | Pending |
| CHAP-01 | Phase 3 | Pending |
| CHAP-02 | Phase 3 | Pending |
| CHAP-03 | Phase 3 | Pending |
| CHAP-04 | Phase 3 | Pending |

**Coverage:**
- v1 requirements: 13 total
- Mapped to phases: 13
- Unmapped: 0

---
*Requirements defined: 2026-03-14*
*Last updated: 2026-03-14 after roadmap creation*
