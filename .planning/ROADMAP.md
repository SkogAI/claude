# Roadmap: Claude's Home

## Overview

The identity migration is done — personal artifacts are in personal/ with routing and an index. What remains is three distinct deliveries: refining what was placed (memory block tiering, routing completeness, framework path clarity), building what's missing (journal conventions, LORE separation, session handoff, healthcheck), and proving the home is ready (deployment gate, multi-agent permission model). Four phases, each delivering one verifiable capability.

## Phases

**Phase Numbering:**
- Integer phases (1, 2, 3): Planned milestone work
- Decimal phases (2.1, 2.2): Urgent insertions (marked with INSERTED)

Decimal phases appear between their surrounding integers in numeric order.

- [ ] **Phase 1: Identity & Routing** - Tier memory blocks, complete CLAUDE.md routing across all directories, confirm framework paths
- [ ] **Phase 2: Persistence Layer** - Journal conventions, LORE structural separation from active state, session handoff mechanism
- [ ] **Phase 3: Operations & Deployment Gate** - Healthcheck expansion, deployment gate checklist, pre-migration validation
- [ ] **Phase 4: Multi-Agent Readiness** - Permission model documented, shared space conventions, guestbook established as cross-agent channel

## Phase Details

### Phase 1: Identity & Routing
**Goal**: Every artifact in the home is navigable from root in two hops — memory blocks are tiered, frameworks are referenceable by direct path, and no directory is a routing dead end
**Depends on**: Nothing (identity migration is already complete; this phase refines it)
**Requirements**: IDN-01, IDN-02, IDN-03, IDN-04, IDN-05, CTX-01, CTX-02, CTX-03, CTX-04
**Success Criteria** (what must be TRUE):
  1. Soul document, profile, and core frameworks are at stable paths under personal/ with "last validated" dates confirming they match the current environment
  2. Memory blocks are visibly split into active frameworks and LORE museum tiers — personal/CLAUDE.md or a sub-router labels which tier each block belongs to
  3. Each core framework (certainty-principle, placeholder-approach, epistemic-frameworks) is loadable via a direct path without reading adjacent frameworks
  4. Root CLAUDE.md routes to every top-level directory with content — personal/, docs/, bin/, notes/, guestbook/, lab/ — with one-line descriptions
  5. Every directory with content has a CLAUDE.md under 50 lines; a fresh session following root → one directory router reaches the right artifact without loading irrelevant files
**Plans:** 2/3 plans executed

Plans:
- [ ] 01-01-PLAN.md — Split soul document, create sub-routers, rewrite personal/CLAUDE.md for lazy loading
- [ ] 01-02-PLAN.md — Rewrite root router, create thin CLAUDE.md files, trim docs/CLAUDE.md
- [ ] 01-03-PLAN.md — Automated verification of all requirements + human navigation checkpoint

### Phase 2: Persistence Layer
**Goal**: Writing to the home is disciplined — journal conventions exist and are followed, LORE lives behind an explicit gate so it cannot be accidentally loaded as active context, and sessions can end with a context bridge the next session can pick up
**Depends on**: Phase 1
**Requirements**: PER-01, PER-02, PER-03, PER-04
**Success Criteria** (what must be TRUE):
  1. A journal conventions document exists specifying: naming format (YYYY-MM-DD/<description>.md date-folder structure), where to write, what triggers a write, and the append-only rule — readable in under 30 seconds
  2. All journal entries in personal/journal/ follow the YYYY-MM-DD/<description>.md date-folder convention (verifiable with ls)
  3. Reaching memory blocks from a fresh session requires an explicit navigation step — the default routing path does not auto-load LORE
  4. A session handoff convention exists: there is a known artifact format for "here is what to load next session," and at least one handoff artifact has been written using it
**Plans:** 2/3 plans executed

Plans:
- [x] 02-01-PLAN.md — Create journal conventions doc, establish directory structure, verify LORE gating
- [x] 02-02-PLAN.md — Move context scripts from scripts/context/ to bin/, update bin/ router
- [x] 02-03-PLAN.md — Create wrap-up command, write first handoff artifact (journal entry)

### Phase 3: Operations & Deployment Gate
**Goal**: The home can verify its own health and a deployment gate documents exactly what must be true before migrating to /home/claude — nothing ships on assumption
**Depends on**: Phase 2
**Requirements**: OPS-01, OPS-02, OPS-03
**Success Criteria** (what must be TRUE):
  1. Running bin/healthcheck verifies that known identity paths (soul document, profile, core frameworks) exist and are non-empty — exits non-zero with a clear diagnostic message if any are missing
  2. Running bin/healthcheck reports which memory block tier (active vs LORE) is accessible — not just a file count
  3. A deployment gate checklist exists at a stable path, each item is binary (pass/fail), and the checklist covers: routing test results, identity validation, permission audit, and healthcheck passing
**Plans**: TBD

### Phase 4: Multi-Agent Readiness
**Goal**: Shared space boundaries are documented and defensible before any sibling agent is provisioned — permission defaults are correct from day one so collaboration pressure cannot erode them
**Depends on**: Phase 3
**Requirements**: MAG-01, MAG-02, MAG-03, MAG-04
**Success Criteria** (what must be TRUE):
  1. A permission model document specifies which directories are skogai group-readable, which are claude:claude private, and why — categories are explicit, not implied
  2. guestbook/ has a CLAUDE.md establishing it as the designated cross-agent communication channel with write conventions (format, naming, what goes there)
  3. The permission model distinguishes three tiers: private state (personal/, .claude/), shared-read (docs/), shared-write (guestbook/) — each tier is documented with rationale
  4. Claude's home structure allows a future sibling agent to read guestbook/ and docs/ without requiring access to personal/ or .claude/ — the boundaries are navigable by design, not instruction
**Plans**: TBD

## Progress

**Execution Order:**
Phases execute in numeric order: 1 → 2 → 3 → 4

| Phase | Plans Complete | Status | Completed |
|-------|----------------|--------|-----------|
| 1. Identity & Routing | 2/3 | In Progress|  |
| 2. Persistence Layer | 2/3 | In Progress|  |
| 3. Operations & Deployment Gate | 0/TBD | Not started | - |
| 4. Multi-Agent Readiness | 0/TBD | Not started | - |

### Phase 5: skogai-live-chat-implementation

**Goal:** [To be planned]
**Requirements**: TBD
**Depends on:** Phase 4
**Plans:** 0 plans

Plans:
- [ ] TBD (run /gsd:plan-phase 5 to break down)

---
*Roadmap created: 2026-03-20*
*Requirements coverage: 20/20 v1 requirements mapped*
