# The GSD Workflow — A Guided Tour

## The Problem

AI agents are powerful but forgetful. They lose context between conversations, make assumptions when instructions are vague, and drift from your intent the longer a project runs. The bigger the project, the worse it gets.

You've probably seen it: you describe what you want, the agent builds something close but not quite right, you correct it, it fixes one thing and breaks another. By the third session the agent has forgotten decisions you made in the first.

## The Insight

The fix isn't better memory or bigger context windows. It's **writing things down**.

Every important decision gets written to a file. Every phase of work reads the files from the phase before it. Agents don't need to remember your conversation from last Tuesday — they read `PROJECT.md` and know exactly what you're building and why.

This is the same principle that makes good documentation valuable for human teams. The difference is that AI agents will actually read every word, every time.

## The Loop

Every project follows the same cycle. Each step produces files that the next step reads:

```
new-project          → PROJECT.md, REQUIREMENTS.md, ROADMAP.md
    │
    ▼
discuss-phase        → CONTEXT.md (your decisions for this phase)
    │
    ▼
plan-phase           → RESEARCH.md, PLAN.md (what to build, how)
    │
    ▼
execute-phase        → Code + SUMMARY.md (what was built)
    │
    ▼
verify-work          → Did it actually work?
    │
    ▼
next phase...        → Repeat until done
```

No step works in isolation. `discuss-phase` reads PROJECT.md so it doesn't re-ask questions you already answered. `plan-phase` reads CONTEXT.md so it doesn't guess at decisions you already made. `execute-phase` reads PLAN.md so it builds exactly what was planned.

The files ARE the coordination mechanism.

## What This Tour Covers

We'll walk through the full lifecycle by building a real example project. Each step explains what a command does, why each artifact matters, and produces the actual file so you can see what it looks like.

By the end you'll have a `.planning/` directory with real artifacts and a commit history that tells the story of a project from idea to execution.

## Steps

1. [New Project](01-new-project.md) — From idea to roadmap
2. [Discuss Phase](02-discuss-phase.md) — Locking in decisions
3. [Plan Phase](03-plan-phase.md) — Research, planning, and verification
4. [Execute Phase](04-execute-phase.md) — Parallel execution in waves
5. [Verify and Iterate](05-verify-and-iterate.md) — Closing the loop
