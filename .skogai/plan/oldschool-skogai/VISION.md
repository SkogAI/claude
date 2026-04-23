# Project Vision: SkogAI/claude — Agent Instruction Architecture

## Problem Statement

The current instruction architecture was written before skogai-routing, skogparse, and the three-file working memory workflow existed. Monolithic CLAUDE.md files explain everything inline, producing agents that either flood the context with filler narration or ask for clarification instead of acting. An agent reading 300 lines of policy is not reasoning — it is auto-completing. The system rewards verbosity over decision-making.

## Users and Core Use Cases

### Primary Users

- **Claude (main orchestrator)**: needs to orient fast, plan, delegate, and make decisions without re-reading everything each turn
- **Subagents / implementers**: need enough context to act correctly without clarification or wrong assumptions
- **Skogix**: wants to see deliberate actions and sharp outputs, not narrated reasoning

### Core Use Cases

1. A fresh agent drops in, reads the entry point, and knows where it is and what to do next — in three hops or fewer
2. A subagent receives a delegated task and implements it correctly without asking for clarification
3. The main agent orchestrates a multi-step task by writing to the three tracking files and taking one concrete action per turn
4. An agent resumes mid-session by reading the dynamic CONTEXT.md and continuing without re-reading static docs

## Success Criteria

### Definition of Done

Subagents implement without asking for clarification. The main orchestrator takes small, high-value actions every turn and writes to file on every tool call. No agent narrates what it is about to do for 10 messages before doing it.

### Quality Bar

Internal production system. Everything from the entry-point CLAUDE.md to lore and roleplay content must fit the same architecture: thin routers, lazy loading, filesystem-as-working-memory.

### Signals

- Subagent clarification requests drop to near zero
- Each agent turn produces at least one file write alongside the action
- A fresh session can orient in ≤3 router hops
- CONTEXT.md accurately reflects active state without manual updates

## Design Principles

1. **Thin routers, not monoliths**: CLAUDE.md files route to content. They do not contain it. One screen maximum.
2. **Filesystem is working memory**: Every tool call that reads or acts should be paired with a write to one of the three tracking files (tasks, findings, decisions). If you cannot find a reason to write — that observation belongs in the findings file.
3. **10,000 sharp tokens beat 1,000,000 filler tokens**: Agents are reasoning engines. Token budget goes to inference and decision, not narration.
4. **Lazy loading everywhere**: Load what the current task needs. Do not preload the world.
5. **Dynamic context over static state**: CONTEXT.md is generated from the decisions file every turn. It is the bridge between durable storage and active working memory.

## Tradeoffs and Defaults

- When choosing between comprehensive docs and sharp routers, prefer sharp routers. The detail lives one hop away.
- Optimize for agent decision speed over human readability of individual files. The router is for humans; the workflows are for agents.
- Accept smaller individual files in order to preserve lazy-loading integrity. Do not consolidate into one large file to save hops.
- When a principle would be too abstract to apply, add one concrete example — not a paragraph of justification.

## Anti-goals

- We are not trying to explain everything in the top-level CLAUDE.md.
- We are not trying to make agents self-sufficient without reading further — that is what routing is for.
- We are not trying to reduce file count. More small, focused files is correct.
- We should not design for hypothetical future agents or edge cases not yet encountered.
- Token quantity is not a proxy for quality. Verbose output is a failure mode, not thoroughness.

## Constraints

- Technical: Arch Linux, zsh, Claude Code CLI, skogai-routing pattern (`@path` lazy references), skogparse for `[@agent:"msg"]` routing
- The three tracking files must be writable by the agent every turn — they are ephemeral working memory, not permanent docs
- CONTEXT.md is dynamically generated and must remain the single source of active session state
- Scope spans the full stack: entry CLAUDE.md → skill routers → workflow files → lore/roleplay content at the far end

## Decision Framework

- If a doc is more than one screen, it is doing too much — split or route.
- If an agent would need to ask a clarification, the router or workflow is missing a pointer — add it.
- If two files contain similar content, check whether they serve different loading contexts before consolidating.
- Escalate to Skogix only when a choice would materially change scope, users, or principles — everything else is resolvable from this document.

## Open Questions

- Three-file working memory naming conventions (tasks / findings / decisions vs other names) — TBD as skogai-file-based-workflow matures
- Whether lore/roleplay content follows the same router pattern or uses a different convention at that end of the stack
