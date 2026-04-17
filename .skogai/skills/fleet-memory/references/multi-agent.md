---
title: multi-agent
type: note
permalink: skogai/skills/fleet-memory/references/multi-agent
---

# Multi-Agent Communication Patterns

How agents exchange information through the filesystem without message passing.

Agents in a fleet-memory system never send messages to each other. All communication happens through files: one agent writes, another reads.

## Pattern 1: Sub-Agent File Communication

### When to Use

A captain needs specialist work done — research, analysis, code review — and wants to track progress without polling the agent directly.

### Mechanism

The captain writes a briefing file before spawning the specialist. The specialist writes progress to status.md and working artifacts to scratch/. The captain reads status.md to decide when to proceed.

```
Captain writes  →  briefing.md      →  Specialist reads (at spawn)
Specialist writes →  status.md       →  Captain reads (to check progress)
Specialist writes →  scratch/*.md    →  Captain reads (for results)
Captain reads   →  scratch/results  →  Captain writes findings.md
```

No messages. No callbacks. Files are the interface.

### Example

**Step 1: Captain writes briefing before spawn**

File: `ships/victory/agents/code-reviewer/briefing.md`

```markdown
# Briefing: code-reviewer

## Task
Review authentication module for security vulnerabilities.
Focus on: input validation, token handling, session management.

## Your Files
- Write: ships/victory/agents/code-reviewer/scratch/*
- Write: ships/victory/agents/code-reviewer/status.md
- Read: ships/victory/briefing.md, policy/*

## Output Expected
Write vulnerability list to scratch/vulnerabilities.md.
Update status.md when complete.

## Dependencies
None — begin immediately.
```

**Step 2: Specialist writes status during work**

File: `ships/victory/agents/code-reviewer/status.md`

```markdown
# Status: code-reviewer
**Updated**: 2026-02-27T14:15:00Z
**Phase**: in-progress

## Completed
- Reviewed input validation (3 files)
- Reviewed token handling (2 files)

## In Progress
- Session management (1 of 4 files reviewed)

## Findings So Far
- 2 high-severity issues found (details in scratch/vulnerabilities.md)
```

**Step 3: Specialist writes results to scratch**

File: `ships/victory/agents/code-reviewer/scratch/vulnerabilities.md`

```markdown
# Vulnerability Findings

## HIGH: Missing input sanitization in auth/login.ts:47
- User-supplied `redirect_url` passed to `Response.redirect()` without validation
- Allows open redirect attacks

## HIGH: JWT secret loaded from environment without fallback check
- auth/token.ts:12 reads `process.env.JWT_SECRET`
- No error if undefined — signs tokens with `undefined` as secret
```

**Step 4: Captain reads scratch, writes ship findings**

Captain reads `scratch/vulnerabilities.md`, integrates with other work, writes the consolidated result to `ships/victory/findings.md` — the ship deliverable the coordinator reads at checkpoint.

### Failure Mode

**Orphaned specialist**: Captain spawns specialist but never reads status.md. Specialist completes work, writes results, but nobody consumes them. Prevention: captain's briefing includes explicit "read status.md after spawning code-reviewer" in its own task list.

## Pattern 2: Scope Enforcement in Practice

### When to Use

Multiple agents are active. Each needs to know what they can write, what they can only read, and what to do when they need data from a file they don't own.

### Mechanism

The ownership table in `state/mission-plan.md` is the single source of truth. Every agent checks it before writing. The check is a behavioral convention, not a runtime lock.

### Example

**Ownership table in mission-plan.md:**

```markdown
## File Ownership

| File | Owner | Scope |
|------|-------|-------|
| state/mission-plan.md | coordinator | fleet-wide |
| state/checkpoints/*.md | coordinator | fleet-wide |
| ships/victory/findings.md | captain-marsh | ship-shared |
| ships/victory/agents/code-reviewer/scratch/* | code-reviewer | agent-private |
| ships/victory/agents/code-reviewer/status.md | code-reviewer | agent-private |
| ships/astute/findings.md | captain-crane | ship-shared |
| ships/astute/agents/researcher/scratch/* | researcher | agent-private |
| knowledge/patterns.md | coordinator | fleet-wide |
```

**Scenario: code-reviewer needs to update findings.md**

code-reviewer found vulnerabilities and wants to write them directly to `ships/victory/findings.md`. But the ownership table says captain-marsh owns that file.

The agent follows this check:

```
Before writing to {path}:
  1. Look up {path} in the ownership table
  2. If owner == me → write
  3. If owner != me → do NOT write
     Instead: write to my own scratch/ and update my status.md
     The owning agent will read my results and integrate them
  4. If {path} not in table → do NOT create it
     Report to captain: "I need a file for X, but none is assigned"
```

So code-reviewer writes to `scratch/vulnerabilities.md` (which it owns) and updates `status.md` to say "findings ready." Captain-marsh reads the scratch file and incorporates the results into `ships/victory/findings.md`.

**Scenario: captain-crane needs victory's findings**

captain-crane (ship astute) needs to reference victory's results. The table shows `ships/victory/findings.md` is ship-shared scope — readable by anyone in the fleet, but only writable by captain-marsh.

captain-crane reads the file directly. No coordination needed for reads. If the file doesn't exist yet, captain-crane checks the latest checkpoint to see if victory has completed its task.

### Failure Mode

**Assumed ownership**: Agent writes to a file it "should" own based on naming convention, but the ownership table assigns it elsewhere. Prevention: always check the ownership table, never infer from path structure.

## Pattern 3: Ship-to-Ship Coordination

### When to Use

Ship B depends on Ship A's output. They run in parallel but have a data dependency. No direct agent-to-agent communication is available.

### Mechanism

Ships never read each other's files directly during active work. Instead:

1. Ship A completes work, writes to `ships/alpha/findings.md`
1. Ship A's captain updates their status
1. Coordinator runs checkpoint, reads all ship findings, writes checkpoint noting "alpha completed"
1. Ship B reads checkpoint, sees dependency resolved
1. Ship B reads `ships/alpha/findings.md` to get the actual data

The checkpoint is the synchronization barrier. Without it, Ship B might read Ship A's findings mid-write.

### Example

**Setup**: Ship alpha researches API patterns. Ship beta analyzes performance. Beta needs alpha's findings before it can begin analysis.

**Step 1: Alpha completes, writes findings**

File: `ships/alpha/findings.md`

```markdown
# API Pattern Research — Ship Alpha

## Findings
- 14 endpoints follow REST conventions
- 3 endpoints use RPC-style (legacy)
- Authentication: Bearer token on all routes
- Rate limiting: absent on internal routes

## Recommendation
Migrate 3 RPC endpoints to REST. Add rate limiting to internal routes.
```

**Step 2: Coordinator writes checkpoint**

File: `state/checkpoints/001-checkpoint.md`

```markdown
# Checkpoint 001
**Time**: 2026-02-27T14:45:00Z
**Mission**: api-audit

## Ship Status
| Ship | Task | Status | Blockers |
|------|------|--------|----------|
| alpha | API pattern research | completed | none |
| beta | Performance analysis | pending | was: blocked by alpha, now: unblocked |
| gamma | Synthesis | pending | blocked by alpha, beta |

## Completed Since Last Checkpoint
- ships/alpha/findings.md (API pattern research)

## Next Actions
- beta: Begin performance analysis. Read ships/alpha/findings.md for API inventory.
- gamma: Continue waiting for beta completion.
```

**Step 3: Beta reads checkpoint, then reads alpha's findings**

Beta's reading order:

1. `state/checkpoints/001-checkpoint.md` — sees "beta: unblocked" and instruction to read alpha findings
1. `ships/alpha/findings.md` — gets the actual research data
1. Begins its own analysis, writing to `ships/beta/findings.md`

**The wrong way (and why it fails)**:

- **Direct write**: Alpha's agent writes to beta's workspace. Violates Split Keel — alpha doesn't own beta's files.
- **Message passing**: Alpha sends "I'm done" to beta. Bypasses filesystem record. If beta restarts, the message is lost. The checkpoint persists.
- **Polling**: Beta re-reads alpha's findings.md continuously. Wastes tokens, no completeness guarantee — might read a half-written file.

### Failure Mode

**Phantom dependency**: Beta reads alpha's findings before checkpoint confirms alpha is done. Alpha was still writing; beta gets partial data. Prevention: only read cross-ship findings after a checkpoint confirms completion.

## Pattern 4: Briefing Injection

### When to Use

Spawning any agent — captain or specialist. The briefing is the agent's entire starting context. It replaces message-based instructions.

### Mechanism

The spawning agent writes `briefing.md` to the target agent's workspace, then spawns the agent with the briefing content injected as initial context. The agent does not read the file — it receives the content directly. The file persists as a record of what the agent was told.

### Example: Captain Briefing

File: `ships/victory/briefing.md`

```markdown
# Briefing: captain-marsh (Ship Victory)

## Mission
Audit the authentication system for security vulnerabilities
and produce a prioritized remediation plan.

## Your Files
| File | Access |
|------|--------|
| ships/victory/findings.md | write |
| ships/victory/briefing.md | read |
| ships/victory/agents/*/status.md | read |
| ships/victory/agents/*/scratch/* | read |
| policy/* | read |
| state/checkpoints/*.md | read |

## Agents You May Spawn
- code-reviewer: Reviews source files for vulnerabilities

## Dependencies
None — begin immediately.

## Output
Write prioritized vulnerability list to ships/victory/findings.md.
```

### Example: Specialist Briefing

File: `ships/victory/agents/code-reviewer/briefing.md`

```markdown
# Briefing: code-reviewer

## Task
Review auth/ directory for input validation
and token handling vulnerabilities.

## Your Files
| File | Access |
|------|--------|
| agents/code-reviewer/scratch/* | write |
| agents/code-reviewer/status.md | write |
| ships/victory/briefing.md | read |
| policy/standing-orders.md | read |

## Output
Write findings to scratch/vulnerabilities.md.
Update status.md when complete.
```

### Mandatory vs Optional Sections

| Section                  | Captain              | Specialist                 | Required?             |
| ------------------------ | -------------------- | -------------------------- | --------------------- |
| Mission/Task             | mission scope        | specific task              | mandatory             |
| Your Files               | full ownership table | own files + readable scope | mandatory             |
| Dependencies             | cross-ship deps      | within-ship deps           | mandatory             |
| Output                   | deliverable path     | scratch output path        | mandatory             |
| Agents You May Spawn     | specialist list      | (omit)                     | captain only          |
| Policy Files             | paths to consult     | paths to consult           | optional              |
| Context from Other Ships | checkpoint pointers  | (omit)                     | if dependencies exist |

### Token Budget

Briefings must stay under 500 tokens. Task description: 1-2 sentences. File table: paths only, no explanations. Dependencies: names only. No background context — agent reads policy files on demand.

If a briefing exceeds 500 tokens, split: task summary in briefing, detailed requirements in a policy file loaded on demand.

### Failure Mode

**Bloated briefing**: Briefing includes full policy content, background context, and detailed instructions. Exceeds 500 tokens, consumes the agent's context budget before work begins. Prevention: briefing contains pointers (file paths), not content. Agent loads detail on demand.

## Common Mistakes

### 1. Using Messages Instead of Files

**Mistake**: Agent A sends a message to Agent B saying "here are my findings." The findings exist only in conversation history.

**Why it fails**: If Agent B's context compresses or resets, the findings are lost. No other agent can access them. The coordinator can't read them at checkpoint.

**Correction**: Agent A writes findings to its designated file. Agent B reads the file. The data persists regardless of context state.

### 2. Reading Cross-Ship Files Before Checkpoint

**Mistake**: Ship beta reads `ships/alpha/findings.md` as soon as alpha's agent starts writing, hoping to get early results.

**Why it fails**: Alpha might be mid-write. Beta gets partial, possibly incoherent data. There's no signal that alpha is done.

**Correction**: Wait for a checkpoint that confirms alpha completed. Then read the findings file. The checkpoint is the "done" signal.

### 3. Writing to Files You Don't Own

**Mistake**: Specialist finds an issue that affects another ship's area and writes a note directly to that ship's findings.md.

**Why it fails**: Violates Split Keel. The other ship's captain may overwrite the note (they're the owner). Or both write simultaneously and one write is lost.

**Correction**: Write to your own scratch/. Update your status.md noting the cross-ship finding. Your captain reads it and escalates to the coordinator, who routes it to the appropriate ship.

### 4. Putting Content in Briefings Instead of Pointers

**Mistake**: Briefing includes full standing orders, complete mission history, and detailed background context. It's 2,000 tokens before the agent starts work.

**Why it fails**: Burns 8% of the 25k effective context on orientation. Agent has less room for actual work. Most of the briefing content won't be relevant to every decision.

**Correction**: Briefing contains file paths: "Read policy/standing-orders.md when you encounter a decision about X." Agent loads 200-500 tokens of policy when it actually needs them, not upfront.

______________________________________________________________________

**Reference Version**: 1.0.0 **Companion to**: fleet-memory SKILL.md
