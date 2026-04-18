---
title: primitives
type: note
permalink: skogai/skills/fleet-memory/references/primitives
---

# Memory Primitives Reference

Operational patterns for memory read, write, query, and checkpoint. Each primitive includes: when to use, preconditions, procedure, file format, and failure modes.

## Write

Creates or updates a memory entry. Every write must target a file the agent owns.

### When to Use

- Capturing findings, progress, or status during execution
- Creating a new memory entry (scratch note, finding, status update)
- Updating an existing entry with new information (replace, not append)

**Do not use** to modify policy files (read-only tier) or files owned by another agent.

### Preconditions

1. File is in agent's ownership scope (listed in briefing or mission-plan.md)
1. Agent is the designated writer (not just a reader)
1. Not during a checkpoint freeze (coordinator has not signaled checkpoint-in-progress)

### Decision Tree

```
Need to persist information?
├─ Is it scratch/intermediate? → Write to agents/{name}/scratch/
├─ Is it a deliverable?       → Write to ships/{ship}/findings.md
├─ Is it my status?           → Write to agents/{name}/status.md
└─ Is it a learned pattern?   → Write to knowledge/patterns.md (coordinator only)
```

### File Format

All writable memory files use this frontmatter:

```markdown
---
tier: state | entity | knowledge
scope: agent-private | ship-shared | fleet-wide
owner: {agent-name}
valid_from: 2026-02-27T14:00:00Z
---

# {Title}

{Content — structured markdown}
```

**Fields**:

- `tier`: Which memory tier (never `policy` — policy is read-only)
- `scope`: Visibility boundary
- `owner`: Single writer identity — must match the writing agent
- `valid_from`: ISO 8601 timestamp of creation or last substantive update

### Procedure

```
WRITE(file_path, content, metadata):
  1. CHECK ownership: file_path in agent.owned_files
     → FAIL "scope violation" if not owned
  2. CHECK freeze: checkpoint_in_progress == false
     → FAIL "checkpoint freeze" if frozen
  3. BUILD frontmatter from metadata {tier, scope, owner, valid_from=now()}
  4. WRITE file_path with frontmatter + content
  5. RETURN success
```

### Update vs Create

- **Create**: File does not exist. Write frontmatter + content.
- **Update**: File exists. Replace content entirely (mutate in place). Update `valid_from` to current timestamp. Git handles history — never append to existing content to preserve history.

### Failure Modes

| Failure           | Detection                                   | Response                                          |
| ----------------- | ------------------------------------------- | ------------------------------------------------- |
| Scope violation   | File not in ownership list                  | Do not write. Report to coordinator.              |
| Checkpoint freeze | Write attempted during checkpoint           | Queue write. Execute after checkpoint completes.  |
| Stale owner       | Agent ID doesn't match file's `owner` field | Do not write. Ownership may have been reassigned. |

______________________________________________________________________

## Read

Loads a specific memory file, respecting scope boundaries.

### When to Use

- Loading policy at a decision point (standing orders, damage control)
- Reading another ship's findings (when in scope)
- Resyncing from latest checkpoint after drift
- Loading briefing or mission plan at spawn

**Do not use** to read agent-private files of other agents (scope violation).

### Preconditions

1. File exists at the expected path
1. File is within agent's read scope (see scope table in SKILL.md)

### Decision Tree

```
Need to load information?
├─ Decision point?        → Read policy/{relevant-file}.md
├─ Resyncing state?       → Read state/checkpoints/{latest}.md
├─ Need another ship's output? → Read ships/{ship}/findings.md (if in scope)
├─ Need own context?      → Read own agents/{name}/scratch/ or status.md
└─ Need entity info?      → Read knowledge/entities.md
```

### Scope Check

```
READ(file_path, agent):
  1. RESOLVE scope of file_path:
     - policy/*           → fleet-wide read (all agents)
     - state/*            → fleet-wide read (all agents)
     - ships/{ship}/*     → ship-shared read (agents on that ship + coordinator)
     - agents/{name}/*    → agent-private read (only owning agent + coordinator)
     - knowledge/*        → fleet-wide read (all agents)
  2. CHECK agent has read access for resolved scope
     → FAIL "scope violation" if not authorized
  3. READ file, parse frontmatter
  4. CHECK valid_from: if expired (valid_until < now), WARN "stale data"
  5. RETURN parsed content + metadata
```

### Failure Modes

| Failure             | Detection                                            | Response                                                           |
| ------------------- | ---------------------------------------------------- | ------------------------------------------------------------------ |
| File not found      | Path doesn't exist                                   | Check if file is created later (dependency). Report if unexpected. |
| Scope violation     | Agent reading outside its scope                      | Do not process. Report to coordinator.                             |
| Stale data          | `valid_until` in past, or checkpoint age > threshold | Use data but flag staleness. Request checkpoint if critical.       |
| Corrupt frontmatter | YAML parse fails                                     | Read content without metadata. Report to file owner.               |

______________________________________________________________________

## Query

Searches across memory files by tier, scope, time range, or keyword. Used for discovery — when the agent doesn't know the exact file path.

### When to Use

- Finding which ship produced findings on a topic
- Locating patterns relevant to current task
- Checking if a fact already exists before creating a duplicate
- Coordinator surveying all ship status before checkpoint

**Do not use** as a substitute for reading known files. If you know the path, use Read.

### Decision Tree

```
Looking for information?
├─ Know the file path?         → Use READ (not query)
├─ Know the tier?              → Query within tier directory
├─ Know the time range?        → Filter by valid_from in frontmatter
├─ Searching by topic/keyword? → Scan file names + frontmatter descriptions
└─ Need everything from a ship? → List ships/{ship}/ directory
```

### Procedure

```
QUERY(filters: {tier?, scope?, after?, before?, keyword?}):
  1. RESOLVE search paths from filters:
     - tier=policy   → search policy/
     - tier=state    → search state/
     - tier=entity   → search knowledge/entities.md
     - tier=knowledge → search knowledge/
     - scope=ship:{name} → search ships/{name}/
     - scope=agent:{name} → search ships/*/agents/{name}/
     - no tier/scope → search all (expensive — avoid)
  2. LIST files in resolved paths
  3. For each file:
     a. PARSE frontmatter (lightweight — don't read full content)
     b. FILTER by time range: valid_from >= after AND valid_from <= before
     c. FILTER by keyword: match against filename, title, frontmatter description
  4. SORT results by valid_from descending (newest first)
  5. RETURN list of {path, tier, scope, owner, valid_from, title}
```

### Cost Awareness

Query is the most expensive primitive. Each file scanned costs tokens for frontmatter parsing.

- **Cheap**: Query within a single directory (5-10 files)
- **Medium**: Query across a tier (10-30 files)
- **Expensive**: Unscoped query across all tiers (50+ files) — always filter first

### Failure Modes

| Failure          | Detection                                        | Response                                                                       |
| ---------------- | ------------------------------------------------ | ------------------------------------------------------------------------------ |
| No results       | Empty result set                                 | Broaden filters. Check if expected files exist yet.                            |
| Too many results | Result count exceeds useful threshold            | Narrow filters. Add tier or time constraint.                                   |
| Scope leak       | Results include files outside agent's read scope | Post-filter by agent's scope. Should not happen if search paths respect scope. |

______________________________________________________________________

## Checkpoint

Serializes current state, archives previous checkpoint, and resets agent attention. Coordinator-only primitive.

### When to Use

- After a ship completes its primary deliverable
- When coordinator detects drift between agents
- At fixed intervals (every 3 completed tasks)
- Before high-risk operations (Action Station 2+)
- At budget burn thresholds (50%, 75%)

**Only the coordinator executes checkpoints.** Agents pause writes when checkpoint is signaled.

### Preconditions

1. Agent is the coordinator (has fleet-wide write scope)
1. No concurrent checkpoint is in progress
1. At least one state change has occurred since last checkpoint

### Procedure

```
CHECKPOINT(mission, reason):
  1. SIGNAL checkpoint-in-progress (all agents pause writes)
  2. DETERMINE next sequence number: NNN = last checkpoint + 1
  3. READ all ship findings:
     for each ship in ships/:
       read ships/{ship}/findings.md
       read ships/{ship}/agents/*/status.md
  4. BUILD checkpoint content:
     - Ship status table (ship, task, status, blockers)
     - Completed since last checkpoint
     - Budget burn (token %, time %)
     - Decision required (continue | rescope | stop)
     - Next actions per ship
  5. WRITE state/checkpoints/{NNN}-checkpoint.md
  6. UPDATE state/mission-plan.md if task status changed
  7. SIGNAL checkpoint-complete (agents resume writes)
  8. AGENTS re-read latest checkpoint to resync
  9. RETURN checkpoint path
```

### Checkpoint as Attention Reset

The key insight: after a checkpoint, agents should re-read state from files rather than relying on conversation history. This prevents attention drift in long conversations.

```
POST-CHECKPOINT agent behavior:
  1. Read state/checkpoints/{latest}.md
  2. Read own ships/{ship}/briefing.md (may have been updated)
  3. Discard assumptions from pre-checkpoint conversation
  4. Continue from checkpoint state
```

### Failure Modes

| Failure                   | Detection                                 | Response                                                              |
| ------------------------- | ----------------------------------------- | --------------------------------------------------------------------- |
| Agent wrote during freeze | File modified between signal and complete | Revert write. Re-run checkpoint.                                      |
| Missing ship findings     | Ship findings file empty or missing       | Record as "no findings" in checkpoint. Flag ship as potentially lost. |
| Budget exceeded           | Token or time burn > 100%                 | Checkpoint with decision=stop. Escalate to user.                      |
| Checkpoint corruption     | Written file fails validation             | Retry write. If fails again, escalate.                                |

______________________________________________________________________

## Primitive Selection Quick Reference

| Situation                  | Primitive  | Target                           |
| -------------------------- | ---------- | -------------------------------- |
| Recording a finding        | WRITE      | ships/{ship}/findings.md         |
| Updating my status         | WRITE      | agents/{name}/status.md          |
| Scratch notes              | WRITE      | agents/{name}/scratch/{topic}.md |
| Checking standing orders   | READ       | policy/standing-orders.md        |
| Resyncing after checkpoint | READ       | state/checkpoints/{latest}.md    |
| Finding relevant patterns  | QUERY      | knowledge/ with keyword filter   |
| Locating ship outputs      | QUERY      | ships/ with tier=state           |
| End of phase               | CHECKPOINT | state/checkpoints/{NNN}.md       |
| Budget threshold hit       | CHECKPOINT | state/checkpoints/{NNN}.md       |

______________________________________________________________________

**Reference Version**: 1.0.0 **Companion to**: fleet-memory SKILL.md, architecture.md
