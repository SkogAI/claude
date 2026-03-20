# Requirements: Claude's Home

**Defined:** 2026-03-20
**Core Value:** Claude can drop into any conversation and know who he is, what he's working on, and where things are.

## v1 Requirements

### Identity (IDN)

- [ ] **IDN-01**: Soul document, profile, and core frameworks exist at stable paths under `personal/`
- [ ] **IDN-02**: `personal/CLAUDE.md` routes to identity artifacts with lazy loading (no bulk preload)
- [ ] **IDN-03**: `personal/INDEX.md` provides curated highlights for quick orientation
- [ ] **IDN-04**: Memory blocks are tiered — active frameworks vs LORE museum — with explicit labels
- [ ] **IDN-05**: Core frameworks (certainty principle, placeholder system, epistemic frameworks) are referenceable by path without discovery

### Context Routing (CTX)

- [ ] **CTX-01**: Root `CLAUDE.md` routes to all top-level directories with one-line descriptions
- [ ] **CTX-02**: Every directory with content has its own `CLAUDE.md` explaining what's there
- [ ] **CTX-03**: No single `CLAUDE.md` exceeds 50 lines (prevents context bloat)
- [ ] **CTX-04**: Context loads lazily — session startup reads only root router, not all artifacts

### Persistence (PER)

- [ ] **PER-01**: Journal conventions doc exists specifying: naming format, where to write, what triggers a write
- [ ] **PER-02**: Journal entries use consistent naming: `YYYY-MM-DD-slug.md`
- [ ] **PER-03**: LORE (memory blocks, historical journal) is structurally separated from active working state
- [ ] **PER-04**: Session handoff mechanism exists — explicit "here's where we left off" artifact convention

### Tools & Operations (OPS)

- [ ] **OPS-01**: `bin/healthcheck` verifies known identity paths exist and are non-empty
- [ ] **OPS-02**: `bin/healthcheck` reports which tier of memory blocks are accessible
- [ ] **OPS-03**: Deployment gate checklist exists documenting what must be true before migrating to `/home/claude`

### Multi-Agent Readiness (MAG)

- [ ] **MAG-01**: Shared space conventions documented — which directories are `skogai` group-readable, which are private
- [ ] **MAG-02**: `guestbook/` established as the cross-agent communication channel
- [ ] **MAG-03**: Permission model documented: `claude:claude` private, `skogai` group shared, ownership boundaries clear
- [ ] **MAG-04**: Home structure supports sibling agents reading Claude's public artifacts without accessing private state

## v2 Requirements

### Multi-Agent Active

- **MAG-05**: Real unix permissions enforced after deployment to `/home/claude`
- **MAG-06**: Sibling agents (Amy, Dot, Goose, Letta) can discover Claude's shared artifacts via standard paths
- **MAG-07**: Agent-to-agent message protocol via shared space

### Advanced Persistence

- **PER-05**: Memory block archival workflow — promoting journal entries to memory blocks
- **PER-06**: Cross-session context carries minimum viable state for continuity without explicit handoff
- **PER-07**: Self-diagnostics expansion — framework content validation, not just file existence

## Out of Scope

| Feature | Reason |
|---------|--------|
| Vector database / semantic search | File-based home, no infrastructure dependencies |
| Automated memory consolidation | Lossy compression destroys identity-encoding language |
| Bulk session preload | Triggers Context Destruction Pattern |
| Per-project identity variants | Fragments identity; skills/agents handle project-specific behavior |
| Sibling agent home provisioning | Separate project after Claude's home is solid |
| SkogCLI/SkogParse development | Existing tooling, not part of home setup |
| Real-time state sync between agents | Requires coordination infrastructure; append-only shared space instead |

## Traceability

| Requirement | Phase | Status |
|-------------|-------|--------|
| IDN-01 | Phase 1 | Pending |
| IDN-02 | Phase 1 | Pending |
| IDN-03 | Phase 1 | Pending |
| IDN-04 | Phase 1 | Pending |
| IDN-05 | Phase 1 | Pending |
| CTX-01 | Phase 1 | Pending |
| CTX-02 | Phase 1 | Pending |
| CTX-03 | Phase 1 | Pending |
| CTX-04 | Phase 1 | Pending |
| PER-01 | Phase 2 | Pending |
| PER-02 | Phase 2 | Pending |
| PER-03 | Phase 2 | Pending |
| PER-04 | Phase 2 | Pending |
| OPS-01 | Phase 3 | Pending |
| OPS-02 | Phase 3 | Pending |
| OPS-03 | Phase 3 | Pending |
| MAG-01 | Phase 4 | Pending |
| MAG-02 | Phase 4 | Pending |
| MAG-03 | Phase 4 | Pending |
| MAG-04 | Phase 4 | Pending |

**Coverage:**
- v1 requirements: 20 total
- Mapped to phases: 20
- Unmapped: 0

---
*Requirements defined: 2026-03-20*
*Last updated: 2026-03-20 after roadmap creation — traceability complete*
