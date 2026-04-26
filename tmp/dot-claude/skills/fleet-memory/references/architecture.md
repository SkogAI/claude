---
title: architecture
type: note
permalink: claude/tmp/dot-claude/skills/fleet-memory/references/architecture
---

# Fleet Memory Architecture Reference

Detailed architecture for multi-agent memory coordination. The SKILL.md provides the decision framework; this document provides implementation depth.

## Memory Tier Definitions

### Tier 1: Policy Memory

**Purpose**: Permanent reference consulted at decision points. Never modified during execution.

**Contents**:

- Standing orders (anti-patterns, operational guardrails)
- Role definitions (per-role read/write permissions)
- Damage control procedures (typed failure recovery)
- Mission-level constraints (budget, scope, quality gates)

**File convention**:

```
policy/
  standing-orders.md    # One file, sections per order
  roles.md              # Role name → permissions table
  damage-control.md     # Failure type → recovery procedure
```

**Access pattern**: Read on demand at decision points. Never loaded at spawn (too expensive). Agent knows policy files exist from briefing; reads when encountering a decision that matches policy scope.

**Example: roles.md**

```markdown
# Role Permissions

| Role | Reads | Writes | Escalates To |
|------|-------|--------|--------------|
| coordinator | all fleet-wide, all ship findings | mission-plan, checkpoints, synthesis | user |
| captain | own ship, fleet policy, checkpoints | own ship findings, own briefing | coordinator |
| specialist | own agent-private, own ship briefing | own scratch, own status | captain |
```

### Tier 2: State Memory

**Purpose**: Mutable snapshots of current execution state. Scoped to mission/session lifetime.

**Contents**:

- Mission plan (task DAG, ownership map, dependencies)
- Checkpoints (sequenced state snapshots)
- Active task status per agent

**File convention**:

```
state/
  mission-plan.md       # Single source of truth for task structure
  checkpoints/
    001-checkpoint.md   # First checkpoint
    002-checkpoint.md   # Second checkpoint (supersedes first)
```

**Access pattern**: Mission plan read at spawn (included in briefing summary). Checkpoints written by coordinator at defined intervals. Agents read latest checkpoint to resync after drift.

**Example: mission-plan.md (ownership section)**

```markdown
## File Ownership

| File | Owner | Scope |
|------|-------|-------|
| state/mission-plan.md | coordinator | fleet-wide |
| state/checkpoints/*.md | coordinator | fleet-wide |
| ships/victory/findings.md | captain-marsh | ship-shared |
| ships/victory/agents/pwp/scratch/* | pwp | agent-private |
| ships/astute/findings.md | captain-crane | ship-shared |
| knowledge/patterns.md | coordinator | fleet-wide |
```

**Example: checkpoint file**

```markdown
# Checkpoint 002
**Time**: 2026-02-27T14:30:00Z
**Mission**: fleet-memory skill design

## Ship Status
| Ship | Task | Status | Blockers |
|------|------|--------|----------|
| Victory | Architecture design | in_progress | none |
| Astute | Research patterns | completed | none |
| Daring | Core primitives | pending | blocked by Victory |

## Budget Burn
- Token budget: 42% consumed
- Time budget: 35% elapsed

## Decision Required
None — all ships on track. Continue.
```

### Tier 3: Entity Memory

**Purpose**: Persistent identity and relationship tracking across missions.

**Contents**:

- Agent identities (name, role, capabilities)
- Scope boundaries (which agent owns which workspace)
- Relationship map (who reports to whom, who depends on whom)

**File convention**:

```
knowledge/
  entities.md           # Entity registry with properties
```

**Access pattern**: Loaded when coordinator needs to resolve identity ("which agent owns this file?") or when spawning new agents ("what roles exist?").

**Example: entities.md**

```markdown
# Entity Registry

## Agents
| Name | Role | Ship | Status |
|------|------|------|--------|
| captain-marsh | captain | victory | active |
| captain-crane | captain | astute | active |
| pwp | specialist | victory | active |

## Ships
| Name | Mission | Captain | Status |
|------|---------|---------|--------|
| victory | architecture | captain-marsh | active |
| astute | research | captain-crane | completed |
```

### Tier 4: Knowledge Memory

**Purpose**: Learned facts and patterns that persist beyond individual missions. Subject to consolidation.

**Contents**:

- Reusable patterns discovered during execution
- Synthesis outputs from completed missions
- Facts with temporal validity (`valid_from`, `valid_until`)

**File convention**:

```
knowledge/
  patterns.md           # Pattern name → description + evidence
  entities.md           # Entity registry (see Tier 3)
```

**Access pattern**: Loaded when starting new missions (what did we learn before?). Consolidated when file exceeds threshold.

**Consolidation rules**:

1. When `patterns.md` exceeds 200 lines, consolidate: merge similar patterns, promote high-confidence patterns to policy, archive low-evidence patterns
1. When entity count exceeds 50, archive inactive entities (no mission reference in last 5 missions)
1. Never delete — mark deprecated with `valid_until` timestamp

## Scope Enforcement Protocol

### At Mission Planning Time

1. Coordinator creates `state/mission-plan.md` with explicit file ownership table
1. Every writable file appears in the ownership table with exactly one owner
1. Each agent's briefing includes only the files they own and can read
1. No file is unowned — if a file has no writer, it doesn't need to exist yet

### At Write Time

Before writing any file, the agent checks:

1. Is this file in my ownership scope? (listed in briefing or mission plan)
1. Am I the designated writer? (not just a reader)
1. Is this the right time? (not between checkpoints when state is frozen)

If any check fails, the agent does not write. It reports the attempted write to its coordinator as a potential scope violation.

### At Checkpoint Time

1. Coordinator signals checkpoint (all agents pause writes)
1. Coordinator reads all ship findings and agent status files
1. Coordinator writes checkpoint file to `state/checkpoints/`
1. Coordinator updates mission plan if task status changed
1. Agents resume — they re-read latest checkpoint to resync

### Scope Violation Response

When a scope violation is detected:

1. **Immediate**: Revert the unauthorized write (coordinator or owning agent)
1. **Diagnostic**: Why did the agent attempt this write? Missing briefing info? Unclear ownership?
1. **Corrective**: Update mission plan or briefing to clarify boundaries
1. **Preventive**: If pattern repeats, add to standing orders as anti-pattern

## Checkpoint Protocol

Checkpoints serve three functions:

1. **State snapshot**: Capture current progress for recovery
1. **Attention reset**: Agents re-read state instead of relying on conversation history
1. **Coordination sync**: All agents align on current mission state

### When to Checkpoint

- After any ship completes its primary deliverable
- When coordinator detects drift (agent outputs diverging from mission plan)
- At fixed intervals (e.g., every 3 completed tasks)
- Before any high-risk operation (Action Station 2+)
- When budget burn exceeds 50% and 75% thresholds

### Checkpoint Contents

Every checkpoint includes:

```markdown
# Checkpoint {NNN}
**Time**: {ISO 8601}
**Mission**: {mission name}

## Ship Status
{table: ship, task, status, blockers}

## Completed Since Last Checkpoint
{list of deliverables}

## Budget Burn
- Token: {percentage}
- Time: {percentage}

## Decision Required
{continue | rescope | stop} — {rationale}

## Next Actions
{what each ship should do next}
```

## Progressive Disclosure Protocol

### Layer 0: Skill Discovery (~20 tokens)

```
fleet-memory — Multi-agent memory coordination
```

Only the name and one-line description. Loaded in skill catalog at startup.

### Layer 1: Briefing (~500 tokens)

```markdown
Your task: {task description}
Your files: {owned files list}
Your scope: {what you can read}
Dependencies: {what must complete before you start}
Policy files: {paths to consult at decision points}
```

Injected when agent is spawned. Contains everything needed to begin work.

### Layer 2: Policy On-Demand (~200-500 tokens each)

Agent reads standing-orders.md or damage-control.md when:

- Encountering a decision not covered by briefing
- Hitting a failure mode
- Reaching a quality gate

### Layer 3: Full Architecture (this file, ~1500 tokens)

Loaded only when designing or debugging the memory system itself. Not needed during normal execution.

## Worked Example: Three-Ship Mission

### Setup

```
Mission: Analyze codebase and produce refactoring plan
Ships: Alpha (research), Beta (analysis), Gamma (synthesis)
```

### File Structure Created at Mission Start

```
fleet-workspace/
  policy/
    standing-orders.md          # Pre-existing
    roles.md                    # Pre-existing
  state/
    mission-plan.md             # Coordinator writes
    checkpoints/                # Empty at start
  ships/
    alpha/
      briefing.md              # Coordinator writes
      findings.md              # Captain Alpha writes
      agents/
        researcher/
          scratch/             # Researcher writes
          status.md            # Researcher writes
    beta/
      briefing.md              # Coordinator writes
      findings.md              # Captain Beta writes
    gamma/
      briefing.md              # Coordinator writes
      findings.md              # Captain Gamma writes
  knowledge/
    patterns.md                # Coordinator writes (post-mission)
```

### Execution Flow

1. **Coordinator** writes mission-plan.md with ownership table and spawns three ships
1. **Alpha** reads briefing, begins research, writes findings to `ships/alpha/findings.md`
1. **Beta** is blocked on Alpha — reads briefing, waits (or works on independent subtask)
1. **Alpha completes** — coordinator runs Checkpoint 001, reads Alpha findings
1. **Beta unblocked** — reads checkpoint, reads Alpha findings, begins analysis
1. **Beta completes** — coordinator runs Checkpoint 002
1. **Gamma** reads both checkpoints + Alpha/Beta findings, produces synthesis
1. **Coordinator** runs final checkpoint, writes knowledge/patterns.md with learned patterns

### Token Budget Through Mission

```
Spawn briefing:     ~500 tokens per agent (1,500 total)
Policy reads:       ~300 tokens per read, ~2 reads per agent
Ship findings:      ~1,000 tokens each (read by coordinator)
Checkpoints:        ~400 tokens each, 3 checkpoints
Total coordination: ~5,000 tokens overhead for 3-ship mission
```

## Anti-Patterns

### Split Keel (Concurrent Writes)

**Symptom**: Two agents write the same file; one agent's work is silently overwritten. **Cause**: File not in ownership table, or ownership table has two writers. **Prevention**: Every writable file has exactly one owner. Audit mission plan before execution.

### Drifting Anchorage (Stale State)

**Symptom**: Agent acts on outdated information because it never re-read state. **Cause**: No checkpoint between state change and agent's next action. **Prevention**: Checkpoint after every significant state change. Agents re-read state at checkpoint.

### Memory Hoarding (Context Bloat)

**Symptom**: Agent loads all memory files at once, exceeding effective context limit. **Cause**: No progressive disclosure; agent treats memory as "load everything." **Prevention**: Briefing contains file paths, not file contents. Agent loads on demand.

### Ghost Writer (Unowned Files)

**Symptom**: File appears in workspace with no designated owner. Nobody maintains it, it goes stale. **Cause**: File created ad-hoc during execution, never added to mission plan. **Prevention**: If a file needs to exist, it needs an owner. Add to mission plan or don't create it.

### Policy Drift (Mutable Policy)

**Symptom**: Agent modifies standing orders during execution, breaking invariants for other agents. **Cause**: Policy files not marked read-only in ownership table. **Prevention**: Policy tier is always read-only. Changes to policy happen between missions, never during.

______________________________________________________________________

**Reference Version**: 1.0.0 **Companion to**: fleet-memory SKILL.md
