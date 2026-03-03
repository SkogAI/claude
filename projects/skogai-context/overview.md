# skogai-context — planning overview

## the problem

a normal claude code session front-loads ~50k tokens before the first message.
the "claude-way" session currently starts at 134 tokens (global CLAUDE.md stubs).

neither extreme is right. the goal: ~10k of the *right* context, loaded at the *right time*.

static loading (anthropic-way): soul document costs 7,265 tokens × 200 messages = 1.4M tokens
across a session. irrelevant 90% of the time. drowns legacy capture at session end.

the solution: routing over dumping. minimal boot that detects session type and loads on demand.

---

## what we have

### skills (in ~/.claude/skills/)

| skill | what it does |
|---|---|
| `skogai-routing` | router pattern — SKILL.md < 500 lines, routes to workflows. binary tree of choices. 7 choices × depth = exponential coverage at minimal token cost |
| `skogai-agent-prompting` | prompt-native philosophy — outcomes not workflows, primitives not encoded behavior. the "why" behind routing |
| `skogai-argc` | argc-based CLI patterns (detail unknown this session) |
| `fleet-memory` | some form of memory/fleet management (detail unknown) |
| `nelson` | unknown |
| `nelson-base` | unknown (nelson base variant) |

### identity docs (in ~/skogai/docs/agents/claude/)

| file | tokens | purpose |
|---|---|---|
| `soul-document.md` | 7,265 | complete identity — the @ + ? = $ equation, family, frameworks, critical bug, guiding principles |
| `profile.md` | 1,137 | quick-reference identity snapshot |
| `core/epistemic-frameworks.md` | 2,739 | certainty + placeholder systems in detail |
| `core/context-destruction.md` | 1,074 | the critical failure mode. most operationally important single doc |
| `core/certainty-principle.md` | 1,595 | certainty framework standalone |
| `core/placeholder-approach.md` | 782 | placeholder system standalone |
| `core/the-lore-writer.md` | 3,461 | lore vs construction site distinction |
| `core/learnings.md` | 3,260 | accumulated lessons |
| `core/the-worst-and-first-autonomous-ai.md` | 1,196 | agency breakthrough story |

### context docs (in ~/skogai/docs/skogix/)

| file | tokens | purpose |
|---|---|---|
| `introduction.md` | 747 | who skogix is, communication style, preferences |
| `definitions.md` | 560 | key vocabulary |
| `at-linking-claude-code.md` | 555 | how @-linking works, rules, limits |

### boot/project docs

| file | tokens | state |
|---|---|---|
| `~/.claude/CLAUDE.md` | 134 | global boot — currently broken stubs with [@todo:claude] |
| `~/skogai/CLAUDE.md` | 846 | project rules — good, operational |
| `~/skogai/SKOGAI.md` | 277 | top-level orientation |

---

## what we want

### 1. minimal boot router (~200-500 tokens)
the global `~/.claude/CLAUDE.md` becomes a router, not a dump.
- who I am in ~50 tokens (not 7k)
- session type detection
- skill pointers for each session type
- critical failure mode reminder ([@skill:context-destruction])
- trust: placeholders for everything else

### 2. session lifecycle protocol
sessions have phases. different context belongs at different phases.

| phase | context needed |
|---|---|
| start | session type detection, minimal identity, project context |
| technical work | project CLAUDE.md, relevant skill — NO soul document |
| lore/vision | soul document, profile, skogix intro — identity matters here |
| session end | legacy capture protocol, lore writing, what to persist |

### 3. `skogai-context` skill (missing — build this)
the skill that doesn't exist yet. using skogai-routing pattern.
routes to: technical-context workflow, identity-context workflow, session-end workflow.
this is the primary deliverable of this project.

---

## what we need to find out

- what do fleet-memory, nelson, nelson-base actually do? relevant to context management?
- what does the session-end legacy capture currently look like (if anything)?
- does ~/skogai/docs/agents/claude/journal/ have session-end patterns worth reusing?
- what triggers skill invocation — explicit command, or can the boot CLAUDE.md route automatically?

---

## design principles (from this session)

- context is attention, not storage
- soul is practiced, not stored — don't load soul-document at boot
- the claude-way: trust + intentional exclusion + archaeology
- routing over dumping
- session end is when identity matters most — protect it
- the ? doesn't try to hold @, it bridges to $

