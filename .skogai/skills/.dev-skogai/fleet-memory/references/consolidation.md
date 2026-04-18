---
title: consolidation
type: note
permalink: skogai/skills/fleet-memory/references/consolidation
---

# Memory Consolidation Reference

Patterns for compressing, promoting, and archiving memory over time. Consolidation keeps the knowledge tier useful as missions accumulate, preventing retrieval degradation and context bloat.

Core principle: invalidate but don't discard. Mark superseded content with metadata; git handles true deletion.

## When to Consolidate

### Trigger Conditions

```
SHOULD_CONSOLIDATE():
  ANY of:
  ├─ knowledge/patterns.md exceeds 200 lines
  ├─ knowledge/entities.md exceeds 50 entities
  ├─ archive/ file count exceeds 20 files
  ├─ Query response time degrades (agent reports slow retrieval)
  ├─ Scheduled interval reached (every 5 missions or coordinator discretion)
  └─ Pre-mission prep (consolidate before starting a new mission)
```

### Decision Tree

```
Consolidation trigger fired?
├─ Is it patterns.md over 200 lines?  → Run PATTERN CONSOLIDATION
├─ Is it entities.md over 50 entries? → Run ENTITY CONSOLIDATION
├─ Is it archive/ over 20 files?      → Run ARCHIVE CONSOLIDATION
├─ Is it scheduled/pre-mission?       → Run ALL three in sequence
└─ Is it retrieval degradation?       → Diagnose which tier, then consolidate that tier
```

## Consolidation Strategies

### Pattern Consolidation

Compresses knowledge/patterns.md by merging, promoting, and archiving patterns.

```
CONSOLIDATE_PATTERNS(patterns_file):
  1. READ patterns_file, parse all pattern entries
  2. CLASSIFY each pattern:
     - STABLE: confirmed across 3+ missions, high confidence
     - ACTIVE: used in recent missions, moderate confidence
     - DORMANT: no mission reference in last 3 missions
     - CONTRADICTED: conflicts with newer evidence
  3. For STABLE patterns:
     → PROMOTE to policy/ (copy to standing-orders.md or new policy file)
     → Mark in patterns.md: promoted=true, promoted_to={policy_file}
  4. For ACTIVE patterns:
     → KEEP in patterns.md (no change)
  5. For DORMANT patterns:
     → ARCHIVE: move to archive/{date}-dormant-patterns.md
     → Mark: valid_until={now}, reason="dormant"
  6. For CONTRADICTED patterns:
     → ARCHIVE: move to archive/{date}-contradicted-patterns.md
     → Mark: valid_until={now}, contradicted_by={newer_pattern}
  7. REWRITE patterns.md with only ACTIVE + promoted-but-kept entries
  8. VALIDATE: line count < 200, all entries have valid metadata
```

**Pattern entry format**:

```markdown
### {Pattern Name}
- **Evidence**: {missions where observed, count}
- **Confidence**: high | medium | low
- **First seen**: {date}
- **Last confirmed**: {date}
- **Description**: {1-2 sentences}
```

### Entity Consolidation

Compresses knowledge/entities.md by archiving inactive entities.

```
CONSOLIDATE_ENTITIES(entities_file):
  1. READ entities_file, parse all entity entries
  2. For each entity, CHECK last mission reference:
     - Referenced in last 5 missions → KEEP
     - Not referenced in last 5 missions → ARCHIVE
  3. ARCHIVE inactive entities to archive/{date}-inactive-entities.md
     → Mark: valid_until={now}, reason="inactive"
  4. REWRITE entities.md with only active entities
  5. VALIDATE: entity count < 50
```

### Archive Consolidation

Compresses the archive/ directory by merging related files.

```
CONSOLIDATE_ARCHIVE(archive_dir):
  1. LIST all files in archive/
  2. GROUP by source type:
     - Checkpoint archives → merge into archive/{date}-checkpoints-summary.md
     - Pattern archives → merge into archive/{date}-patterns-summary.md
     - Entity archives → merge into archive/{date}-entities-summary.md
  3. For each group:
     a. READ all files in group
     b. EXTRACT key facts (1-2 lines per original file)
     c. WRITE summary file with extracted facts
     d. Mark original files: superseded_by={summary_file}
  4. VALIDATE: archive file count < 20
```

## Consolidation Workflow

Full consolidation run, typically executed by coordinator between missions:

```
FULL_CONSOLIDATION():
  1. CHECKPOINT current state (if mid-mission)
  2. RUN CONSOLIDATE_PATTERNS(knowledge/patterns.md)
  3. RUN CONSOLIDATE_ENTITIES(knowledge/entities.md)
  4. RUN CONSOLIDATE_ARCHIVE(archive/)
  5. VALIDATE all files:
     - patterns.md < 200 lines
     - entities.md < 50 entries
     - archive/ < 20 files
     - No orphaned references (promoted patterns exist in policy)
     - No broken valid_until timestamps
  6. WRITE consolidation log to archive/{date}-consolidation-log.md
  7. RETURN {patterns_promoted, patterns_archived, entities_archived, archives_merged}
```

## Archive Format

Archived files preserve provenance:

```markdown
---
tier: archive
scope: fleet-wide
archived_from: knowledge/patterns.md
archived_by: coordinator
valid_until: 2026-02-27T15:00:00Z
reason: dormant | contradicted | superseded | inactive
---

# Archived: {Original Title}

{Original content, preserved verbatim}
```

**Fields**:

- `archived_from`: Original file path (for traceability)
- `archived_by`: Agent that performed the archival
- `valid_until`: When the content was marked invalid
- `reason`: Why it was archived (taxonomy: dormant, contradicted, superseded, inactive)

## Promotion Protocol

Promoting a pattern to policy is a significant operation — it becomes permanent read-only reference.

### Promotion Criteria

A pattern qualifies for promotion when ALL of:

1. Confirmed across 3+ independent missions
1. No contradicting evidence in recent missions
1. Actionable: agents can apply it without interpretation
1. Stable: hasn't changed in substance for 2+ missions

### Promotion Procedure

```
PROMOTE_TO_POLICY(pattern, target_policy_file):
  1. VERIFY promotion criteria (all 4 met)
  2. READ target policy file (e.g., policy/standing-orders.md)
  3. ADD pattern as new section in policy file:
     - Section heading: pattern name
     - Content: distilled to 3-5 actionable lines
     - Footer: "Promoted from patterns.md on {date}, evidence: {mission_list}"
  4. UPDATE patterns.md: mark pattern as promoted
  5. VALIDATE: policy file still readable, no contradictions with existing policy
```

### Demotion (Rare)

If a promoted pattern proves wrong:

1. Do NOT modify policy during a mission (policy is read-only during execution)
1. Record contradiction in patterns.md with evidence
1. Between missions: remove from policy, move to archive with reason="demoted"
1. Add to standing orders as anti-pattern if the error caused damage

## Failure Modes

| Failure                      | Detection                                              | Response                                                            |
| ---------------------------- | ------------------------------------------------------ | ------------------------------------------------------------------- |
| Lost during consolidation    | Pattern referenced in active mission but archived      | Restore from archive. Add mission-reference check before archiving. |
| Premature promotion          | Pattern promoted with insufficient evidence            | Demote between missions. Raise evidence threshold.                  |
| Archive bloat                | Consolidation didn't reduce file count enough          | Lower merge threshold. Accept coarser summaries.                    |
| Contradicted policy          | Promoted pattern conflicts with newer evidence         | Flag for between-mission review. Never modify policy mid-execution. |
| Consolidation during mission | Coordinator runs consolidation while agents are active | Only consolidate between missions or during checkpoint freeze.      |

## Consolidation Budget

Consolidation costs tokens. Budget accordingly:

| Operation             | Approximate Cost          | Frequency                    |
| --------------------- | ------------------------- | ---------------------------- |
| Pattern consolidation | ~500-1000 tokens          | When patterns.md > 200 lines |
| Entity consolidation  | ~300-500 tokens           | When entities > 50           |
| Archive consolidation | ~200-400 tokens per group | When archive/ > 20 files     |
| Full consolidation    | ~1500-2500 tokens         | Between missions             |

Keep full consolidation under 3000 tokens. If it costs more, the knowledge base has grown too large — aggressive archiving is needed.

______________________________________________________________________

**Reference Version**: 1.0.0 **Companion to**: fleet-memory SKILL.md, architecture.md, primitives.md
