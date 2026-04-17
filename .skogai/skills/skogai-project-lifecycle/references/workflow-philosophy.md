---
title: workflow-philosophy
type: note
permalink: skogai/skills/skogai-project-lifecycle/references/workflow-philosophy
---

# Workflow Philosophy - When to Use Which

\<core_principle> The dual system exists because creativity and quality require different constraints. \</core_principle>

## The Problem

**Single workflow doesn't work:**

- Strict standards kill creativity and exploration
- No standards produce unmaintainable bloat
- "Best practices" applied too early optimize the wrong things

## The Solution

**Two workflows with explicit transition:**

1. **Explosive** - maximize exploration, defer quality
1. **Production** - maximize quality, defer new features

The transition point (pruning) forces conscious decision about what actually matters.

## When to Use Explosive (.skogai/skogix/)

Use explosive workflow when:

- **High uncertainty** - don't know if approach will work
- **Learning phase** - exploring new domain/technology
- **Rapid prototyping** - need to try many approaches quickly
- **Personal optimization** - workflow specific to you
- **One-off solutions** - project-specific, not reusable
- **Early exploration** - zero to one, not one to N

**Mindset:** "Prove it works, worry about how later"

## When to Use Production (.skogai/claude/)

Use production workflow when:

- **Low uncertainty** - approach is proven
- **Reusable solution** - applies across projects
- **Long-term maintenance** - will use for months/years
- **Shared workflow** - others will use it
- **Core infrastructure** - foundational tools
- **Scaling up** - one to N, not zero to one

**Mindset:** "It works, now make it excellent"

## The Transition (Pruning)

Transition is not automatic. Requires active decision to:

1. **Stop adding features**
1. **Remove failed experiments** (typically 50%+)
1. **Simplify what remains**
1. **Add tests and minimal docs**
1. **Apply production standards**

Most ideas stay in explosive forever. That's fine. The ones that graduate earn it.

## Why This Works

**Psychological:**

- Explosive phase: permission to fail, high creativity
- Pruning phase: clear goal (subtract), manageable scope
- Production phase: pride in quality, long-term thinking

**Practical:**

- Explosive catches 10 ideas, 5 work, 2 are valuable
- Without explosive: catch 2 ideas, 2 work, 1 is valuable (lost opportunity)
- Without production: 5 working ideas become unmaintainable bloat

**Economic:**

- Cheap experiments in explosive (throw away easily)
- Expensive quality in production (invest in proven winners)

## Common Mistakes

**Premature optimization:**

- Writing tests for experimental code
- Perfect documentation before proving value
- Production-quality code in first iteration

**Never graduating:**

- Keeping everything in explosive forever
- "It works, good enough" without pruning
- Fear of deleting code

**Skipping pruning:**

- Moving explosive code directly to production
- Bringing failed experiments along
- No subtraction phase

## Decision Tree

```
New idea
  ↓
Q: Proven approach or experimental?
  ├─ Experimental → Start explosive
  └─ Proven → Consider production

Working prototype in explosive
  ↓
Q: Used regularly across multiple contexts?
  ├─ Yes → Prune and consider migration
  └─ No → Keep in explosive, iterate or archive

Pruned and tested
  ↓
Q: General solution or project-specific?
  ├─ General → Migrate to production
  └─ Specific → Keep in explosive
```

## Real-World Application

**This skill creation:**

- Started explosive: figuring out what to document
- Tested routing approach by using it
- Will prune later: remove what doesn't work
- Might migrate to core if proven valuable

**The meta-pattern:** Creating a skill about the workflow WHILE using the workflow validates both.

## Success Metrics

**Explosive phase success:**

- High volume of experiments
- Quick iteration cycles
- Learning rate > code quality

**Production phase success:**

- Low defect rate
- High reusability
- Maintenance cost < value delivered

**Overall system success:**

- Ideas flow through pipeline
- Clear decision points
- No artificial barriers
- Quality scales with proven value
