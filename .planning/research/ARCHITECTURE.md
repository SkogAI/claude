# Architecture Research

**Domain:** Claude Code plugin/skill systems — chapter-based tutorial plugin
**Researched:** 2026-03-14
**Confidence:** HIGH (sourced from official Claude Code docs at `/docs/claude-code/` + direct codebase analysis)

## Standard Architecture

### System Overview

```
┌─────────────────────────────────────────────────────────────────────┐
│                     Claude Code Runtime                              │
│  ┌────────────────┐  ┌─────────────────┐  ┌──────────────────────┐ │
│  │  Session Router │  │  Plugin Manager  │  │  Subagent Dispatcher │ │
│  │  (CLAUDE.md)    │  │  (settings.json) │  │  (Agent tool)        │ │
│  └───────┬─────────┘  └────────┬────────┘  └──────────┬───────────┘ │
│          │                     │                       │             │
├──────────┴─────────────────────┴───────────────────────┴────────────┤
│                     Skill Resolution Layer                           │
│  Priority: enterprise > personal > project > plugin (namespaced)    │
│                                                                      │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────────────────┐  │
│  │ ~/.claude/    │  │ .claude/     │  │ plugin-name/skills/       │  │
│  │ skills/       │  │ skills/      │  │ (namespaced: plugin:name) │  │
│  └──────────────┘  └──────────────┘  └──────────────────────────┘  │
├─────────────────────────────────────────────────────────────────────┤
│                       Skill Structure Layer                          │
│  ┌───────────────────────────────────────────────────────────────┐  │
│  │  skill-name/                                                   │  │
│  │  ├── SKILL.md       ← frontmatter (invocation control)         │  │
│  │  │                    + instructions (context-loaded)          │  │
│  │  ├── workflows/     ← step-by-step procedures (loaded on need) │  │
│  │  ├── references/    ← domain knowledge (loaded on need)        │  │
│  │  ├── templates/     ← output structures (copied + filled)      │  │
│  │  └── scripts/       ← executables (run, not loaded)            │  │
│  └───────────────────────────────────────────────────────────────┘  │
├─────────────────────────────────────────────────────────────────────┤
│                  Plugin Distribution Layer                           │
│  ┌───────────────────────────────────────────────────────────────┐  │
│  │  plugin-name/                                                  │  │
│  │  ├── .claude-plugin/plugin.json  ← manifest + namespace        │  │
│  │  ├── skills/                     ← namespaced skill entries    │  │
│  │  ├── agents/                     ← subagent definitions        │  │
│  │  ├── hooks/hooks.json            ← lifecycle hooks             │  │
│  │  └── settings.json               ← plugin defaults             │  │
│  └───────────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────┘
```

### Component Responsibilities

| Component | Responsibility | Typical Implementation |
|-----------|----------------|------------------------|
| SKILL.md frontmatter | Invocation control: `disable-model-invocation`, `context`, `allowed-tools`, `agent` | YAML, ~10-20 lines |
| SKILL.md body | Instructions loaded into context when skill triggers; routing table for complex skills | Markdown with XML sections, <500 lines |
| workflows/ | Multi-step procedures that reference specific knowledge — not loaded until needed | Markdown with `<required_reading>`, `<process>`, `<success_criteria>` |
| references/ | Domain knowledge and pattern libraries — loaded on demand by workflows | Markdown, any length |
| templates/ | Output structures agents copy and fill — reduces hallucinated formats | Markdown template files |
| scripts/ | Executable code bundled with skill — run once, reused indefinitely | Python, bash, Node.js |
| plugin.json | Plugin identity: name (becomes namespace), description, version, author | JSON manifest |
| agents/ | Subagent definitions: specialized contexts with custom tools, models, permissions | Markdown with YAML frontmatter |
| hooks/hooks.json | Session lifecycle automation: PostToolUse, PreToolUse, SessionStart | JSON hook configuration |

## Recommended Project Structure

For the SkogAI Skills tutorial plugin, this is the target structure:

```
skogai-skills/                          # Plugin root (git repo)
├── .claude-plugin/
│   └── plugin.json                     # Name: "skogai-skills", version tracking
├── skills/
│   ├── chapter-1-workspace-setup/      # Chapter 1 skill
│   │   ├── SKILL.md                    # Entry point + routing table
│   │   ├── workflows/
│   │   │   ├── 01-overview.md          # Big picture, goals, what to expect
│   │   │   ├── 02-clean-skills-dir.md  # Integrate 4 existing skills
│   │   │   └── 03-establish-ram-files.md # Filesystem-as-memory pattern
│   │   ├── references/
│   │   │   ├── skogai-routing.md       # The foundational skill pattern
│   │   │   └── ram-file-pattern.md     # Working memory for small-context agents
│   │   └── templates/
│   │       └── ram-file.md             # Template for agent working memory file
│   └── (future chapters as separate skill directories)
├── agents/                             # (optional) chapter-specific agents
└── README.md                           # Installation and usage guide
```

### Structure Rationale

- **Each chapter = one skill directory:** Chapters are independently invocable via `/skogai-skills:chapter-1-workspace-setup`. Users can run them in order or jump to specific chapters.
- **workflows/ for chapter flow:** Each major step in a chapter becomes a workflow file. Users move through them sequentially; agents load only what's needed.
- **references/ for accumulated knowledge:** Distilled patterns from existing skills (skogai-routing, planning-with-files) live here, not in workflow steps.
- **templates/ for consistency:** The RAM file pattern needs a template so every agent produces the same structure.
- **No scripts/ in chapter 1:** Chapter 1 is about reading/understanding existing skills and establishing patterns, not executing build tools. Scripts become relevant in later chapters.

## Architectural Patterns

### Pattern 1: Progressive Disclosure Router

**What:** SKILL.md acts as a router. It contains essential principles always loaded into context (~500 lines max), asks "what do you want to do?", and maps answers to workflow files. Detailed knowledge lives in references/, loaded only when that path is taken.

**When to use:** Any skill with more than one purpose or more than ~300 lines of content. Chapter-based tutorials are inherently router skills.

**Trade-offs:** Adds indirection (routing step before content) but dramatically reduces context consumption. A 7-choice router at each level covers 7³ = 343 paths using ~3500 tokens instead of loading everything.

**Example:**
```yaml
---
name: chapter-1-workspace-setup
description: Set up the SkogAI workspace. Use when starting the SkogAI tutorial, cleaning the skills directory, or learning the filesystem-as-memory pattern.
---

<essential_principles>
## What This Chapter Builds
[core concepts always loaded]
</essential_principles>

<intake>
Where are you in chapter 1?
1. Start from the beginning (overview)
2. Clean the skills directory
3. Set up the RAM file pattern
4. Already done — what's next?
</intake>

<routing>
| Response | Workflow |
|----------|----------|
| 1, "start", "overview" | workflows/01-overview.md |
| 2, "clean", "skills" | workflows/02-clean-skills-dir.md |
| 3, "ram", "memory", "filesystem" | workflows/03-establish-ram-files.md |
| 4, "done", "next" | Explain chapter 2 scope |
</routing>
```

### Pattern 2: Filesystem-as-Memory (RAM Files)

**What:** Small-context agents (Haiku at 8K) cannot hold an entire session in context. The solution is a working memory file the agent reads at the start of each action and updates after each action. This file is the agent's "current state of mind" — not a log, but a live scratchpad.

**When to use:** Any multi-step workflow where an agent might lose context between tool calls. Essential for chapter-based tutorials where users may pause and resume.

**Trade-offs:** Requires discipline from the agent to update the file. Small overhead per action, but prevents massive failures from context loss.

**Example RAM file structure:**
```markdown
# Current State — [chapter-1-workspace-setup]

## Where I Am
Step: 02-clean-skills-dir.md
Status: in_progress

## What I Know
- skogai-routing/: foundational, keep as-is
- planning-with-files/: absorb "filesystem as memory" principle, then archive
- skill-creator/: keep as-is (Anthropic's official tool)
- skogai-bats-testing/: keep as-is

## What I'm Doing Next
Move planning-with-files key insight to references/ram-file-pattern.md

## Blockers
None
```

### Pattern 3: Skill Invocation Control

**What:** Two frontmatter flags control who can invoke a skill. `disable-model-invocation: true` means only the user can trigger it with `/skill-name`. `user-invocable: false` means only Claude can load it automatically (invisible to users).

**When to use:** Tutorial steps that must be run in order should use `disable-model-invocation: true` so Claude doesn't trigger them out of sequence. Background knowledge skills (like RAM file patterns) that Claude should load contextually use the default (both can invoke).

**Trade-offs:** Manual-only invocation reduces "magic" but gives users control over when chapter steps execute. Important for tutorials where sequence matters.

### Pattern 4: Subagent for Isolated Work

**What:** Skills with `context: fork` run in an isolated subagent context. The skill content becomes the subagent's task. It does not inherit the main conversation history.

**When to use:** Research tasks, bulk operations, anything where verbose output would pollute the main context. Chapter 1's skill-directory cleanup could benefit — spawn a subagent to read and categorize all existing skills, return a summary.

**Trade-offs:** No access to conversation history. Results are summarized before returning. Good for "go explore and report back" tasks, bad for interactive back-and-forth.

## Data Flow

### Chapter Execution Flow

```
User types: /skogai-skills:chapter-1-workspace-setup
    ↓
Claude Code resolves skill from plugin namespace
    ↓
SKILL.md loaded into context (frontmatter + body, <500 lines)
    ↓
Skill description + essential_principles + routing table in context
    ↓
User picks step (e.g., "2. Clean the skills directory")
    ↓
SKILL.md routes to: workflows/02-clean-skills-dir.md
    ↓
Workflow specifies <required_reading>
    ↓
references/skogai-routing.md loaded (the skill this chapter is about)
    ↓
Workflow's <process> steps execute
    ↓
Agent reads/writes skills, updates RAM file, follows workflow
    ↓
Workflow's <success_criteria> checked
    ↓
Agent reports completion, suggests next step
```

### State Management Flow (RAM File Pattern)

```
Start of action:
    Read RAM file → load current state into context
    ↓
Execute action (Read, Write, Bash, etc.)
    ↓
End of action:
    Update RAM file → write current state to disk
    ↓
Context window can be cleared safely — state is on disk
```

### Skill Content Loading

```
Session start:
    Skill description (frontmatter) → always in context
    Full SKILL.md body → loaded when skill is invoked
    Supporting files → loaded only when referenced from workflow
    Scripts → executed without loading into context
```

### Plugin Distribution Flow

```
Development:
    .claude/skills/ (standalone) → test locally with /skill-name
    ↓
Ready to package:
    Create plugin-name/.claude-plugin/plugin.json
    Move skills/ to plugin-name/skills/
    ↓
Test as plugin:
    claude --plugin-dir ./skogai-skills
    /skogai-skills:chapter-1-workspace-setup
    ↓
Distribute:
    Push to GitHub repo
    Users: /plugin marketplace add owner/repo
    Users: /plugin install skogai-skills@marketplace-name
```

## Scaling Considerations

| Scale | Architecture Adjustments |
|-------|--------------------------|
| 1 chapter | Single skill in `.claude/skills/`, no plugin packaging needed |
| 2-5 chapters | Package as plugin; each chapter = one skill directory |
| 6+ chapters | Add an index skill (`/skogai-skills:index`) that routes to chapters; chapters become deeply nested routers |
| Multi-author | Git-based marketplace; each chapter can be separate plugin if contributors diverge |

### Scaling Priorities

1. **First constraint: context window.** Each skill competes for context budget. SKILL.md descriptions always load (2% of context window budget). Keep descriptions tight and under 100 words. If a session has 50+ skills, some get cut.
2. **Second constraint: chapter ordering.** Later chapters depend on earlier chapters' output. The RAM file pattern solves this: each chapter's final state is written to disk, and the next chapter reads it as a starting point.

## Anti-Patterns

### Anti-Pattern 1: Front-Loading Knowledge

**What people do:** Put everything in SKILL.md — all reference material, all workflows, all examples — to avoid the complexity of subdirectories.

**Why it's wrong:** SKILL.md loads on every invocation. A 2000-line SKILL.md burns context that could go to actual work. Claude Code documentation explicitly recommends keeping SKILL.md under 500 lines.

**Do this instead:** SKILL.md contains routing table and essential principles only. Detailed content goes in workflows/ and references/. Progressive disclosure is the architecture.

### Anti-Pattern 2: One Chapter = One SKILL.md File (no subdirectories)

**What people do:** Build a tutorial chapter as a flat SKILL.md with all steps inline, skipping the router pattern.

**Why it's wrong:** Works for simple 3-step chapters but doesn't scale. Users can't resume mid-chapter. Agents can't navigate to specific steps without reading everything. The 500-line limit becomes a real constraint quickly.

**Do this instead:** Even simple chapters should have a `workflows/` directory with one file per major step. Users can jump to any step. Agents load only what's needed.

### Anti-Pattern 3: Relying on Context Window as Memory

**What people do:** Let the agent accumulate context over a chapter session, trusting it to remember earlier steps.

**Why it's wrong:** Small-context agents (Haiku) have ~8K tokens. After a few Read/Write operations, early context is gone. The chapter state is lost. The agent hallucates what it previously found.

**Do this instead:** The RAM file pattern (from `planning-with-files`). Write current state to disk after every action. Read state from disk at the start of every action. Context window is volatile; files persist.

### Anti-Pattern 4: Plugin Skills Without Namespace Awareness

**What people do:** Name plugin skills the same as standalone project skills, expecting them to work identically.

**Why it's wrong:** Plugin skills are namespaced: `/skogai-skills:chapter-1`. If a user also has a standalone `.claude/skills/chapter-1/`, that one wins (project > plugin priority). Confusing for users who have both.

**Do this instead:** Plugin skill names should be designed with the namespace in mind. Short, clear names that make sense as `/plugin-name:skill-name`. The tutorial chapters work well: `/skogai-skills:chapter-1-workspace-setup`.

### Anti-Pattern 5: Mixing Tutorial Content with Working Memory

**What people do:** Put the RAM file in the plugin's skill directory (e.g., `skills/chapter-1/ram.md`).

**Why it's wrong:** Plugin files are copied to a read-only cache on install. The agent can't write to them. RAM files must live in the user's workspace (e.g., `.skogai/plan/chapter-1/ram.md`), not inside the plugin.

**Do this instead:** The workflow specifies where to create the RAM file (always in the user's workspace). The plugin provides a template for the RAM file's structure, not the file itself.

## Integration Points

### Internal Boundaries

| Boundary | Communication | Notes |
|----------|---------------|-------|
| SKILL.md ↔ workflows/ | Agent reads workflow file by path referenced in SKILL.md routing table | Explicit file path references, not automatic discovery |
| workflows/ ↔ references/ | Workflow specifies `<required_reading>` listing reference files to load | Reference files must be explicitly listed; agent won't auto-discover |
| skills/ ↔ scripts/ | Agent invokes scripts via Bash tool using `${CLAUDE_SKILL_DIR}` variable | `${CLAUDE_SKILL_DIR}` resolves to skill directory regardless of working dir |
| Chapter skill ↔ RAM file | Agent reads/writes RAM file in user workspace (`.skogai/plan/<chapter>/`) | Template in skill's templates/ defines structure; actual file lives outside plugin |
| Plugin skill ↔ parent session | Results summarized and returned via Agent tool completion | Subagent context (context: fork) is isolated; no conversation history access |

### External Integrations

| Integration | Pattern | Notes |
|-------------|---------|-------|
| Existing skills (skogai-routing, etc.) | Chapter 1 reads them via the Read tool during execution | Skills live in `.claude/skills/` — not bundled with plugin |
| GSD framework | Tutorial uses GSD for its own development planning; not a runtime dependency | GSD manages this project; the plugin itself doesn't depend on GSD |
| Marketplace distribution | `plugin.json` + GitHub repo + marketplace catalog | Future concern; Chapter 1 can be tested standalone via `--plugin-dir` |

## Build Order Implications

The downstream consumer (roadmap) should note these phase dependencies:

**Phase 1 must establish before Phase 2 can start:**
- Plugin shell (`.claude-plugin/plugin.json` + `skills/` directory structure)
- The routing skill structure in SKILL.md (the pattern that all chapters follow)
- Decision on RAM file format (template must exist before any chapter workflow references it)

**Phase 2 can then:**
- Clean and integrate each of the 4 existing skills
- Move the "filesystem as memory" insight from planning-with-files into the chapter's references/
- Write the chapter overview workflow

**What does not require sequencing:**
- Individual workflow files within a chapter are independent (they share templates/references but don't call each other)
- scripts/ additions are always additive and don't block other work

## Sources

- Official docs: `/home/skogix/claude/docs/claude-code/skills.md` (HIGH confidence — current docs)
- Official docs: `/home/skogix/claude/docs/claude-code/plugins.md` (HIGH confidence — current docs)
- Official docs: `/home/skogix/claude/docs/claude-code/sub-agents.md` (HIGH confidence — current docs)
- Official docs: `/home/skogix/claude/docs/claude-code/plugin-marketplaces.md` (HIGH confidence — current docs)
- Codebase analysis: `/home/skogix/claude/.planning/codebase/ARCHITECTURE.md` (HIGH confidence — written 2026-03-14 by mapper agent from live codebase)
- Existing skills: `.claude/skills/skogai-routing/SKILL.md`, `.claude/skills/planning-with-files/SKILL.md`, `.claude/skills/skill-creator/SKILL.md` (HIGH confidence — primary source material for this project)

---
*Architecture research for: Claude Code chapter-based tutorial plugin (SkogAI Skills)*
*Researched: 2026-03-14*
