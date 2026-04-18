---
name: skogai-project-lifecycle
description: Navigate SkogAI's dual workflow system - explosive creative phase using skogix personal plugin setup and the controlled production-ready phase skogai/claude where all of SkogAI's experience comes into play with long term goals and strategies. Use when starting new features, deciding when to migrate work, planning a workflow or tooling setup or understanding the pruning process that is core to SkogAI's philosophy.
permalink: skogai/skills/skogai-project-lifecycle/skill
---

<objective>
Guide navigation between SkogAI's two development workflows: explosive creative experimentation and production-ready implementation.
</objective>

\<essential_principles>

## The Core Insight

> **"What the agent does NOT know is the ONLY thing we should care about."**

LLMs are additive by nature. They will happily generate documentation, code, and explanations that contain 80% inferable content and 20% actual value. The pruning philosophy inverts this: instead of asking "what should we add?", ask "what can Claude reconstruct without being told?"

**If Claude can regenerate it from zero context, it doesn't belong in your codebase.**

This principle applies everywhere:

- **Documentation**: Generic best practices? Claude knows them. Delete.
- **Code comments**: Standard patterns? Claude can infer. Delete.
- **Skills**: Instructions Claude would follow anyway? Noise. Delete.
- **Architecture docs**: Obvious decisions? Waste of tokens. Delete.

What remains after pruning is the _actual_ intellectual property of your project.

## The Dual System

**`.skogai/skogix/` - Explosive Phase**

- Try everything, fail fast, MVP focus
- "Spew tokens all over the place" - half won't work, that's fine
- No constraints, rapid iteration
- Prove it works first
- LLM's additive nature is an _asset_ here

**`.skogai/claude/` - Production Phase**

- Tested, pruned, well-oiled
- Functional-first (F#), high test coverage
- Anti-bloat principles enforced
- Make it perfect after proving it works
- LLM's additive nature is a _liability_ here - must actively counteract

## The Flow

```
explosive → test/validate → prune → polish → production
     ↓                        ↓
  additive                subtractive
  (let it grow)           (cut the inferable)
```

Each phase has different tools, constraints, and success criteria.

## The Pruning Test

For any piece of content (doc, code, skill, config), apply this test:

1. **Full Context**: What did Claude produce with full project knowledge?
1. **Starved Context**: What would Claude produce knowing _nothing_ about your project?
1. **Delta**: What's in #1 that's NOT in #2?

**Only the delta has value. Everything else is noise.**

See `@references/differential-documentation-engine.md` for the concrete implementation of this test.

\</essential_principles>

<intake>

Where are you in the lifecycle?

1. Starting new feature/idea (explosive phase)
1. Have working MVP, need to prune/polish (transition)
1. Migrating to production (.skogai/claude/)
1. Understanding the philosophy/when to use which

**Wait for response before routing.**

</intake>

<routing>

| Response                              | Workflow                           | Purpose                        |
| ------------------------------------- | ---------------------------------- | ------------------------------ |
| 1, "start", "new", "explosive"        | workflows/starting-explosive.md    | How to work in .skogai/skogix/ |
| 2, "prune", "polish", "transition"    | workflows/pruning-to-production.md | How to clean up working code   |
| 3, "migrate", "production", "claude"  | workflows/migration-path.md        | Moving to .skogai/claude/      |
| 4, "philosophy", "when", "understand" | references/workflow-philosophy.md  | Decision criteria              |

**After routing, follow the workflow exactly.**

</routing>

\<pruning_theory>

## Why Pruning Works

Traditional documentation asks: "What does someone need to know?" SkogAI documentation asks: "What can't someone infer?"

The difference is profound:

**Traditional approach produces:**

```markdown
## Authentication

This service uses JWT tokens for authentication. JWT (JSON Web Tokens)
are an open standard (RFC 7519) that defines a compact way to securely
transmit information between parties as a JSON object...
[500 more words of RFC explanation]

Configuration:

- JWT_SECRET: Your secret key
- JWT_EXPIRY: Token expiration time
```

**SkogAI pruned approach produces:**

```markdown
## Authentication

- JWT_SECRET: Must match gateway service (see @config/shared-secrets)
- JWT_EXPIRY: 15m (shortened from default 1h due to compliance requirement ACME-2024-07)
- Non-standard: Tokens include `department_id` claim for row-level security
```

The second version is 90% shorter and 100% more useful. Claude already knows what JWT is. Claude doesn't know your compliance requirements or custom claims.

## The Differential Documentation Engine

The concrete tool for pruning documentation:

**Pass 1 (Full Context)**: Write comprehensive docs with all project knowledge **Pass 2 (Starved Context)**: Write the same docs knowing nothing about the project\
**Pass 3 (Delta Extraction)**: Keep only what's in Pass 1 but not Pass 2

Real results from testing: 450 lines → 95 lines (79% reduction), 100% actionable info preserved.

See `@references/differential-documentation-engine.md` for the full prompt template.

## Applying Pruning Beyond Docs

The same principle applies to:

**Code comments:**

```python
# BAD: Inferable
# This function calculates the sum of two numbers
def add(a, b): return a + b

# GOOD: Non-inferable
# Uses Kahan summation to avoid floating point drift in financial calculations
# Required by ACME-2024-03 audit findings
def add_precise(a, b): ...
```

**Skills/Prompts:**

```markdown
# BAD: Claude does this anyway

Be helpful and accurate. Think step by step.

# GOOD: Project-specific behavior

Use skogai-notation for all type signatures.
Never create files in /atoms directly - staging only.
```

**Architecture decisions:**

```markdown
# BAD: Obvious

We use a database to store data.

# GOOD: Non-obvious

PostgreSQL over MongoDB despite document-heavy data because
existing team expertise + JSONB columns + need for transactions
in the payment flow outweighed schema flexibility benefits.
```

\</pruning_theory>

\<current_examples>

## Real Examples from This Repo

**Explosive phase** (`.skogai/skogix/src/`):

- Personal projects
- Beta testing
- Rapid prototyping
- `@.skogai/skogix/src/agents/document-writer.md`

**Production phase** (`.skogai/claude/`):

- `@.skogai/claude/agents/code-simplicity-reviewer.md` - only core agent
- `@.skogai/claude/skills/skogai-argc/` - proven argc patterns
- `@.skogai/claude/workflows/` - 4 core workflows (plan, work, review, compound)
- `@.skogai/claude/hooks/post-tool-use.sh` - battle-tested automation

## Migration Examples

Skills that graduated from explosive to production:

- `skogai-argc` - started explosive, now core
- `skogai-docs` - started explosive, now core
- `skogai-jq` - started explosive, now core
- `skogai-todos` - started explosive, now core
- `skogai-worktrunk` - started explosive, now core

Skills still in explosive/validation:

- `skogai-developing-for-claude-code` - being validated
- `skogai-skill-creator` - being validated
- `skogai-git` (worktree workflows) - being validated

**Graduation criteria**: Can a context-starved Claude still use the skill effectively? If yes, it's been pruned enough for production.

\</current_examples>

\<success_criteria>

You understand:

- [ ] When the additive nature of LLMs is to your advantage (explosive) vs disadvantage (production)
- [ ] How to apply the "starved context test" to identify what's actually valuable
- [ ] What "pruning" means in practice: delete everything Claude can reconstruct
- [ ] Why "what the agent does NOT know" is the only thing worth documenting
- [ ] When to transition: working MVP + can articulate the delta = ready to prune
- [ ] How to use the Differential Documentation Engine for systematic pruning

\</success_criteria>

<references>

- `@references/differential-documentation-engine.md` - The 3-pass prompt for extracting project-specific documentation
- `@references/workflow-philosophy.md` - Deep dive on when to use which phase
- `@workflows/starting-explosive.md` - How to work in explosive phase
- `@workflows/pruning-to-production.md` - The transition process
- `@workflows/migration-path.md` - Moving to production

</references>
