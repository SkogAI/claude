---
name: fleet-memory
description: Multi-agent memory coordination for filesystem-based agent systems. Activates when designing memory scopes for parallel agents, enforcing file ownership boundaries, implementing checkpoint-based state management, or coordinating memory lifecycle across agent teams.
permalink: skogai/skills/fleet-memory/skill
---

# Fleet Memory: Multi-Agent Memory Coordination

Coordinates memory across parallel agents using the filesystem as shared state. Fills the gap between single-agent memory (persistence frameworks) and single-agent filesystem patterns (scratch pads, skill loading) by adding scope isolation, ownership enforcement, and lifecycle management.

Core insight: multi-agent memory is 40% knowledge retention, 60% coordination and scope management. This skill handles the 60%.

## When to Activate

- Designing memory architecture for multi-agent systems
- Enforcing which agents can read/write which files
- Implementing checkpoints that reset agent attention
- Managing memory lifecycle across missions or sessions
- Preventing concurrent write conflicts between parallel agents
- Structuring shared vs private agent workspaces

## Core Concepts

### Memory Tiers

Four tiers, distinguished by mutability and lifetime:

| Tier          | Mutability     | Lifetime                           | Example                                                |
| ------------- | -------------- | ---------------------------------- | ------------------------------------------------------ |
| **Policy**    | Read-only      | Permanent                          | Standing orders, role definitions, recovery procedures |
| **State**     | Owner-writable | Mission/session                    | Checkpoints, progress snapshots, task status           |
| **Entity**    | Owner-writable | Persistent                         | Agent identity, scope boundaries, file ownership map   |
| **Knowledge** | Owner-writable | Persistent, consolidation-eligible | Learned facts, patterns, synthesis outputs             |

**Policy is not State.** Policy is consulted at decision points but never modified during execution. State is ephemeral and changes every checkpoint. Conflating them causes scope violations and stale-data poisoning.

### Scope Isolation

Three scopes, enforced at write time:

| Scope             | Read            | Write            | Use                                                |
| ----------------- | --------------- | ---------------- | -------------------------------------------------- |
| **Agent-private** | Owning agent    | Owning agent     | Scratch work, intermediate findings, local state   |
| **Ship-shared**   | All ship agents | Designated owner | Ship findings, shared task state, briefings        |
| **Fleet-wide**    | All agents      | Coordinator only | Mission plan, policy, checkpoints, final synthesis |

Enforcement is operational, not technical. Assign each file a single writer in the mission plan. No file has two writers — ever. This is the Split Keel principle: concurrent writes to shared files destroy coherence.

## File Structure

```
{workspace}/
  policy/                         # Fleet-wide, read-only
    standing-orders.md            # Anti-patterns, guardrails
    roles.md                      # Per-role read/write permissions
    damage-control.md             # Failure recovery procedures
  state/                          # Mutable, checkpoint-scoped
    mission-plan.md               # Task DAG, file ownership, dependencies
    checkpoints/
      {NNN}-checkpoint.md         # Sequenced state snapshots
  ships/
    {ship-name}/
      briefing.md                 # Ship context (injected at spawn)
      findings.md                 # Ship deliverable (owner: captain)
      agents/
        {agent-name}/
          scratch/                # Agent-private workspace
          status.md               # Agent progress (owner: agent)
  knowledge/                      # Persistent, consolidation-eligible
    patterns.md                   # Reusable patterns promoted from missions
    entities.md                   # Entity registry
  archive/                        # Completed/superseded items
    {date}-{item}.md
```

Naming: lowercase-with-hyphens. Timestamps: ISO 8601. Sequence numbers: zero-padded 3-digit.

## Memory Lifecycle

```
Active ──checkpoint──→ Archived
  │                       │
  └──promotion──→ Policy  └──superseded──→ Deprecated
```

- **Active to Archived**: At each checkpoint, current state snapshots move to archive. New state begins fresh.
- **Active to Policy**: Stable patterns proved across missions become permanent read-only reference.
- **Archived to Deprecated**: Superseded by newer version. Mark in frontmatter, don't delete — git handles true deletion.

Trigger consolidation when: file count exceeds threshold, retrieval degrades, or at scheduled intervals. Invalidate but don't discard.

## Progressive Disclosure for Memory

Memory loads in layers, not all at once:

1. **At spawn** (~500 tokens): Agent receives briefing only — task, scope, file ownership, dependencies
1. **On demand**: Agent reads policy files at decision points (standing orders, damage control)
1. **At checkpoint**: Coordinator reads all ship findings, writes synthesis checkpoint
1. **On failure**: Agent loads damage-control.md, follows typed recovery procedure

Never load all memory into a single context. The 25k effective limit means 2-3 active memory files maximum. Index everything, load selectively.

## Concurrency Safety

Prevention over resolution. Don't detect conflicts — prevent them.

1. **Single-writer rule**: Every writable file has exactly one designated owner, declared in mission-plan.md
1. **Read-many, write-one**: Any agent in scope can read; only the owner writes
1. **Checkpoint serialization**: State writes happen at defined checkpoint intervals, not continuously
1. **Conflict equals bug**: If two agents write the same file, the architecture is wrong. Fix ownership, not the conflict.

## Failure Recovery

| Failure           | Detection                        | Recovery                                                |
| ----------------- | -------------------------------- | ------------------------------------------------------- |
| Stale state       | Checkpoint age exceeds threshold | Force checkpoint, refresh all readers                   |
| Scope violation   | Agent wrote outside ownership    | Revert write, escalate to coordinator                   |
| Lost agent        | No status update for N turns     | Reassign owned files, rebuild from last checkpoint      |
| Conflicting facts | Two sources disagree             | Prefer most recent `valid_from`; surface to coordinator |
| Corrupted state   | Validation fails on read         | Rollback to last valid checkpoint                       |

See [Architecture Reference](./references/architecture.md) for detailed failure mode catalog and recovery procedures.

## Guidelines

1. Assign every writable file exactly one owner before execution begins
1. Separate policy (read-only reference) from state (mutable snapshots) — always
1. Use checkpoints as attention resets — agents re-read state, not conversation history
1. Load memory progressively: briefing at spawn, detail on demand
1. Consolidate archived memory before it exceeds retrieval thresholds
1. Promote stable patterns to policy; deprecate superseded state
1. Design for the 25k effective limit: max 2-3 loaded memory files per agent context
1. Enforce single-writer through mission planning, not runtime locking

## Integration

- memory-systems — Persistence frameworks for the Knowledge tier (Mem0, Zep, Letta)
- filesystem-context — File I/O patterns underlying all tiers
- multi-agent-patterns — Coordination patterns this skill operationalizes
- context-optimization — Observation masking reduces memory-load cost
- context-compression — Checkpoint summaries are lossy compression by design

## References

- [Architecture Reference](./references/architecture.md) — Tier definitions, scope enforcement, checkpoint protocol, worked examples, anti-patterns
- [Memory Primitives](./references/primitives.md) — Read, write, query, checkpoint operations with decision trees and failure modes
- [Consolidation](./references/consolidation.md) — Pattern promotion, entity archival, archive compression, trigger thresholds
- [Multi-Agent Communication](./references/multi-agent.md) — File-based communication patterns, scope enforcement in practice, briefing injection
- [Conventions](./references/conventions.md) — Naming rules, frontmatter schemas, directory structure, validation checklist
- memory-systems — Single-agent persistence patterns
- filesystem-context — Filesystem I/O patterns for agents

______________________________________________________________________

## Skill Metadata

**Created**: 2026-02-27 **Last Updated**: 2026-02-27 **Author**: Nelson Squadron (HMS Victory) **Version**: 1.0.0
