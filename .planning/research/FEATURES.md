# Feature Research

**Domain:** Claude Code skill/plugin tutorial system (chapter-based, learning-by-doing)
**Researched:** 2026-03-14
**Confidence:** HIGH (sources: official Claude Code docs, existing skill codebase, project context)

---

## Context

This is not a conventional software product with a user acquisition funnel. The "user" is an agent (any size) or a human developer who has the SkogAI workspace installed. The "product" is a Claude Code plugin that teaches the SkogAI workflow by doing it — going through Chapter 1 IS learning the pattern.

The plugin has two consumers simultaneously:
1. **Agents** who invoke skills to do work (8K–200K context)
2. **Humans** who read the plugin to understand what was built and why

Features must serve both.

---

## Feature Landscape

### Table Stakes (Users Expect These)

Features that must exist for the plugin to feel complete and usable.

| Feature | Why Expected | Complexity | Notes |
|---------|--------------|------------|-------|
| Valid plugin manifest (`.claude-plugin/plugin.json`) | Without this, the plugin cannot be installed or loaded via `--plugin-dir` | LOW | `name`, `description`, `version` required |
| At least one invocable skill | A plugin with no skills provides nothing to invoke | LOW | Chapter 1 overview skill as entry point |
| YAML frontmatter on every SKILL.md | Claude uses `description` to decide when to load the skill; missing = never triggers | LOW | `name` + `description` are load-bearing |
| XML semantic structure (not markdown headings) | Established convention in this codebase; agents parse by tag, not by heading | LOW | `<objective>`, `<quick_start>`, `<success_criteria>` minimum |
| Progressive disclosure (SKILL.md < 500 lines) | Agents with 8K context cannot afford bloated skill roots | MEDIUM | Heavy content goes in `workflows/`, `references/` |
| Clear routing in SKILL.md | If SKILL.md doesn't tell the agent where to go next, the agent has to guess | MEDIUM | Intent-based routing table, not forced menus |
| `<success_criteria>` in every skill | Agent needs to know when it's done; without this, tasks drift | LOW | Checklist format works well |
| Chapter overview skill | Entry point explaining what this chapter does and what the series is | LOW | Sets expectations, provides navigation |
| Skills that actually run (testable) | Tutorial claims the workflow works; skills must be exercisable | MEDIUM | Can use `skill-creator` eval pattern |

### Differentiators (Competitive Advantage)

Features that distinguish this plugin from generic skill documentation.

| Feature | Value Proposition | Complexity | Notes |
|---------|-------------------|------------|-------|
| "Filesystem as memory" RAM-file pattern | Teaches small-context agents how to stay oriented across long tasks — the core SkogAI insight | HIGH | Must be concrete: a working pattern agents can copy, not just prose about it |
| Dogfooding: plugin was built with GSD | The tutorial is a living artifact of its own process; going through it is doing the workflow | MEDIUM | Requires linking to `.planning/` artifacts from the plugin |
| skogai-routing as foundational pattern | Teaches progressive disclosure as first principle, not as an implementation detail | MEDIUM | Chapter 1 must demonstrate the pattern it's teaching |
| Agent-size-agnostic design | Explicit constraint: must work with 8K context agents, not just 200K | LOW | Each skill must state its context budget assumptions |
| `skill-creator` compatibility | Skills designed to pass `skill-creator` evals — the plugin teaches quality by exemplifying it | HIGH | Needs test cases in `evals/evals.json` per skill |
| Skills that improve themselves | Templates + `skogai-routing` patterns enable agents to expand the plugin over time | MEDIUM | Provide templates so agents have a structure to fill |
| Chapter series architecture | Plugin is the shell for future chapters; Chapter 1 must not trap future chapters | MEDIUM | Namespacing and inter-chapter navigation must be designed in from the start |

### Anti-Features (Commonly Requested, Often Problematic)

Features that seem useful but would undermine the core value.

| Feature | Why Requested | Why Problematic | Alternative |
|---------|---------------|-----------------|-------------|
| Step-by-step wizard UI | Feels like a structured tutorial | Claude Code has no interactive wizard UI; faking one with markdown creates brittle workflows that break when agents skip steps | Use intent-based routing: agent states what it wants, SKILL.md routes to the right workflow |
| Comprehensive reference documentation in SKILL.md | "Put everything in one place" | Defeats progressive disclosure; bloats context for agents with small windows; makes skills harder to maintain | Use `references/` subdirectory; reference from SKILL.md with when-to-load guidance |
| Progress tracking / completion state in the plugin | Gamification, sense of progress | State belongs in the filesystem (planning-with-files pattern), not in the plugin itself; plugin is stateless | Teach agents to create `.skogai/plan/` files for their own state tracking |
| One skill per concept (granular decomposition) | Seems modular | Each skill load costs context budget; too many small skills = 20 skill descriptions in context eating the budget | Compose related concepts into one skill with routing to sub-workflows |
| Hardcoded paths and assumptions | Simpler to write | Breaks when workspace layout changes or when another user installs the plugin | Use `${CLAUDE_SKILL_DIR}` for bundle-relative paths, `$ARGUMENTS` for user-provided context |
| Passive reference content only (no tasks) | Documentarian instinct | A "learning by doing" plugin that only documents patterns without actionable tasks teaches nothing | Every skill must have at least one executable task pattern, not just reading material |
| Chapter prerequisites enforcement | Enforcing order feels pedagogically correct | Claude Code has no session state between skill invocations; "require chapter 1 before chapter 2" cannot be enforced at the platform level | Make each chapter independently useful; use `<context>` tags to explain what prior knowledge is assumed |

---

## Feature Dependencies

```
[Plugin manifest]
    └──required-by──> [Any skill invocation]
                          └──required-by──> [Chapter overview skill]
                          └──required-by──> [skogai-routing integration]

[skogai-routing integration]
    └──required-by──> [Progressive disclosure in chapter skills]
    └──enables──> [Agent self-expansion of skills]

[Chapter overview skill]
    └──enables──> [Chapter series architecture]
    └──requires──> [Filesystem as memory pattern defined]

[Filesystem as memory pattern]
    └──requires──> [planning-with-files absorption decision]
    └──enables──> [Agent-size-agnostic design]

[skill-creator compatibility]
    └──requires──> [YAML frontmatter correct]
    └──requires──> [Success criteria defined]
    └──enables──> [Differentiator: skills that pass evals]

[XML semantic structure]
    └──required-by──> [Progressive disclosure]
    └──required-by──> [Routing tables]
```

### Dependency Notes

- **Plugin manifest required by everything**: Without `.claude-plugin/plugin.json`, no skills load. This is the first deliverable.
- **skogai-routing integration required by chapter skills**: The routing pattern is both what chapter 1 teaches AND how chapter 1 is implemented. The skill teaching the pattern must itself use the pattern.
- **Filesystem as memory pattern requires planning-with-files absorption decision**: Until the team decides what to keep from `planning-with-files`, the RAM-file pattern cannot be fully specified. This is a declared dependency in PROJECT.md.
- **Chapter series architecture requires chapter overview skill**: The overview skill is where future chapter navigation lives. Must be designed for extensibility from day one.

---

## MVP Definition

### Launch With (v1 — Chapter 1)

Minimum needed to validate the concept and use the plugin for real work.

- [ ] Plugin manifest — required to load via `--plugin-dir` or marketplace install
- [ ] Chapter 1 overview skill — entry point, big picture, series navigation stub
- [ ] Cleaned `skogai-routing` skill integrated into plugin — foundational pattern demonstration
- [ ] Filesystem as memory pattern (absorbed from `planning-with-files`, concrete RAM-file template) — core SkogAI insight that is unique to this plugin
- [ ] At least one skill with `<success_criteria>` that an agent can actually complete — validates the "learning by doing" claim

### Add After Validation (v1.x)

Once the core is working and used for real tasks.

- [ ] `skill-creator`-compatible evals for chapter 1 skills — trigger: when someone asks "does this actually work better than no skill?"
- [ ] Inter-chapter navigation stubs — trigger: when Chapter 2 is being planned
- [ ] Agent-size annotations on skills (explicit context budget guidance) — trigger: when a small-context agent gets lost

### Future Consideration (v2+)

Defer until Chapter 2 is in scope.

- [ ] `skill-creator` description optimization loop — requires subagent support, significant overhead for Chapter 1
- [ ] Blind comparison testing between skill versions — requires eval infrastructure not yet built
- [ ] Automated skill health checks via `skogai-bats-testing` — useful but not needed to validate Chapter 1

---

## Feature Prioritization Matrix

| Feature | User Value | Implementation Cost | Priority |
|---------|------------|---------------------|----------|
| Plugin manifest | HIGH | LOW | P1 |
| Chapter overview skill | HIGH | LOW | P1 |
| XML semantic structure throughout | HIGH | LOW | P1 |
| Progressive disclosure (SKILL.md < 500 lines) | HIGH | LOW | P1 |
| skogai-routing integrated into plugin | HIGH | MEDIUM | P1 |
| Filesystem as memory RAM-file pattern | HIGH | MEDIUM | P1 |
| `<success_criteria>` on every skill | HIGH | LOW | P1 |
| Intent-based routing (not wizard menus) | MEDIUM | LOW | P2 |
| Chapter series architecture (extensibility) | MEDIUM | MEDIUM | P2 |
| Agent-size-agnostic annotations | MEDIUM | LOW | P2 |
| `skill-creator` eval compatibility | MEDIUM | HIGH | P3 |
| Dogfooding artifacts linked from plugin | LOW | LOW | P2 |

**Priority key:**
- P1: Must have for launch
- P2: Should have, add when possible
- P3: Nice to have, future consideration

---

## Landscape Analysis

No direct competitors exist in the "Claude Code tutorial plugin" space — this format is novel. Adjacent patterns inform the design:

| Feature | skill-creator (Anthropic) | planning-with-files | GSD plugin | Our Approach |
|---------|--------------------------|---------------------|------------|--------------|
| Teaching mechanism | Draft-test-eval loop | 3-file pattern docs | Phase-based planning | Chapter-based doing |
| Context management | Not addressed | Explicit (3-file RAM) | STATE.md + PLAN.md | RAM-file pattern (absorbed) |
| Routing | None | None | Workflow routing | skogai-routing as first principle |
| Agent-size awareness | Not addressed | Not addressed | Not addressed | Explicit constraint, per-skill |
| Extensibility pattern | Via evals | Not applicable | Via phases | Via chapter shell |
| Self-improvement | Yes (eval loop) | No | No | Templates enable agent expansion |

Key insight from this comparison: `planning-with-files` solves the context management problem for long tasks but has no routing, no skill structure, and no teaching mechanism. The valid principle ("filesystem as memory") belongs in Chapter 1 as the RAM-file pattern. The rest is superseded by GSD.

---

## Sources

- Official Claude Code skills documentation: `/home/skogix/claude/docs/claude-code/skills.md`
- Official Claude Code plugins documentation: `/home/skogix/claude/docs/claude-code/plugins.md`
- Existing skill codebase: `.claude/skills/{skogai-routing,skill-creator,planning-with-files,skogai-bats-testing}/SKILL.md`
- Project context: `.planning/PROJECT.md`
- Codebase conventions: `.planning/codebase/CONVENTIONS.md`

---
*Feature research for: SkogAI Skills Chapter 1 Plugin*
*Researched: 2026-03-14*
