# Architecture

**Analysis Date:** 2026-03-14

## Pattern Overview

**Overall:** Hub-and-spoke routing system with plugin lifecycle management and specialized agent framework.

**Key Characteristics:**
- Filesystem-based routing through CLAUDE.md files for context discovery
- Modular skill system with progressive disclosure (workflows, references, templates, scripts)
- Autonomous agent framework for project planning and execution (GSD: Get Shit Done)
- Hook-based extensibility for session start, post-tool-use, and status line rendering
- Configuration-driven behavior with settings.json controlling permissions, plugins, and workflows

## Layers

**Router Layer:**
- Purpose: Provides entry points and routing guidance through CLAUDE.md files
- Location: `CLAUDE.md`, `.skogai/CLAUDE.md` (referenced externally)
- Contains: Navigation maps, decision trees, cross-references
- Depends on: Filesystem structure (directory presence)
- Used by: All components that need to discover relevant resources

**GSD Framework Layer:**
- Purpose: Orchestrates project planning, research, execution, verification, and debugging workflows
- Location: `.claude/get-shit-done/`
- Contains: Agent definitions, workflow templates, reference documentation, executable tools
- Depends on: Node.js, filesystem state management, git integration
- Used by: Skills and workflows to manage project phases, milestones, and tasks

**Skills & Agents Layer:**
- Purpose: Domain expertise modules and autonomous agents that execute specific responsibilities
- Location: `.claude/skills/` (complex routers) and `.claude/agents/` (autonomous agents)
- Contains: SKILL.md files with routing, workflows/, references/, templates/, scripts/ subdirectories
- Depends on: GSD framework, Claude Code tools (Read, Write, Bash, Grep, Glob, Task)
- Used by: User invocations and GSD orchestrator coordination

**Configuration & Hooks Layer:**
- Purpose: Manages permissions, plugins, integrations, and session lifecycle behaviors
- Location: `.claude/settings.json`, `.claude/hooks/`, marketplace configuration
- Contains: Permission rules, hook commands, plugin enablement, environment variables
- Depends on: Claude Code settings schema, Node.js hooks
- Used by: Session initialization, post-tool monitoring, status line rendering

**Planning & Documentation Layer:**
- Purpose: Maintains project state, planning documents, and codebase analysis
- Location: `.planning/` (config, phases, milestones, codebase analysis)
- Contains: JSON configuration, markdown plans, state tracking
- Depends on: File system, GSD tools for state initialization
- Used by: Orchestrators for context, executors for implementation guidance

**Tools & Integration Layer:**
- Purpose: Provides executable scripts and external service integrations
- Location: `.claude/get-shit-done/bin/`, marketplace external integrations
- Contains: Node.js CommonJS tools, bash scripts, integration clients
- Depends on: Node.js, external CLIs (gita, gptodo, gh, argc, wt), git
- Used by: Hooks, skills, agents for automation

## Data Flow

**GSD Workflow Initiation:**

1. User invokes `/gsd:command` via Claude Code
2. Orchestrator loads GSD workflow from `.claude/get-shit-done/workflows/`
3. Orchestrator calls `gsd-tools.cjs` via Node.js to initialize state
4. State is written to `.planning/config.json`, `.planning/STATE.md`
5. Orchestrator spawns specialized agents (mapper, planner, executor, etc.) with Task tool

**Codebase Analysis Flow (Map-Codebase Example):**

1. User runs `/gsd:map-codebase`
2. `map-codebase` orchestrator loads and spawns 4 `gsd-codebase-mapper` agents in parallel
3. Each mapper agent (tech, arch, quality, concerns focus) independently explores codebase
4. Mapper agents write analysis directly to `.planning/codebase/{STACK,INTEGRATIONS,ARCHITECTURE,STRUCTURE,CONVENTIONS,TESTING,CONCERNS}.md`
5. Orchestrator reads confirmation messages only
6. Documents are then available to other commands (plan-phase, execute-phase)

**Skill Invocation Flow:**

1. User calls skill name or intent is detected from context
2. `.claude/skills/{skill-name}/SKILL.md` is loaded (frontmatter + essential_principles)
3. If skill has routing table, answer maps to `workflows/{specific-workflow}.md`
4. Workflow specifies `<required_reading>` which loads appropriate `references/*.md`
5. Workflow provides `<process>` steps that may execute `scripts/` or reference `templates/`
6. Progressive disclosure ensures only relevant content is loaded per context window

**State Management Flow:**

1. GSD tools initialize project state: `node .claude/get-shit-done/bin/gsd-tools.cjs init {phase}`
2. State written to `.planning/STATE.md`, `.planning/ROADMAP.md`, `.planning/phases/{phase}/`
3. Executor reads state before implementation
4. Executor creates commits with prefix from frontmatter
5. Executor updates state after each task and creates `.planning/phases/{phase}/SUMMARY.md`

**Plugin & Skill Lifecycle:**

1. Skills/agents developed in project root: `skills/`, `agents/`, `commands/`, `hooks/`
2. Symlinks in `.claude/` reference back to project root (live development)
3. `settings.json` controls which plugins are enabled
4. Hooks fire at SessionStart, PostToolUse, StatusLine
5. When stable, skills graduate to `~/.claude/` or marketplace

## Key Abstractions

**Skill (Filesystem-based capability):**
- Purpose: Encapsulates domain expertise or task execution capability with progressive disclosure
- Examples: `.claude/skills/skogai-routing/`, `.claude/skills/planning-with-files/`, `.claude/skills/skill-creator/`
- Pattern: SKILL.md (frontmatter + routing) → workflows/ (procedures) → references/ (knowledge) + templates/ (outputs) + scripts/ (executables)

**Workflow (Multi-step procedure):**
- Purpose: Step-by-step guidance for accomplishing a specific task
- Examples: `.claude/get-shit-done/workflows/execute-phase.md`, `map-codebase.md`
- Pattern: XML sections (required_reading, process, success_criteria) with numbered steps and tool invocations

**Agent (Autonomous personality with specialized role):**
- Purpose: Autonomous entity spawned by orchestrators with specific responsibilities and capabilities
- Examples: `.claude/agents/gsd-codebase-mapper.md`, `gsd-planner.md`, `gsd-executor.md`
- Pattern: Frontmatter (name, description, tools, color, skills) + role + philosophy + process

**Milestone (Project container):**
- Purpose: Groups phases into semantic project chunks with roadmap entries
- Location: `.planning/milestones/{milestone}/`
- Pattern: Phases ordered under milestone, state tracked in `.planning/ROADMAP.md`

**Phase (Atomic executable chunk):**
- Purpose: Self-contained unit of work with planning, execution, and verification
- Location: `.planning/phases/{phase}/`
- Pattern: PLAN.md (what to do) → STATE.md (progress) → SUMMARY.md (what happened)

## Entry Points

**CLI Entry Point (GSD Commands):**
- Location: `.claude/get-shit-done/workflows/` (via CLI skill invocation)
- Triggers: User typing `/gsd:{command}` in Claude Code
- Responsibilities: Load workflow, initialize state, spawn agents, coordinate execution

**Skill Entry Point:**
- Location: `.claude/skills/{skill}/SKILL.md`
- Triggers: Skill name invocation, intent detection, or user explicit request
- Responsibilities: Route user to appropriate workflow, provide domain guidance

**Session Initialization:**
- Location: `.claude/hooks/gsd-check-update.js` (SessionStart hook)
- Triggers: Claude Code session starts
- Responsibilities: Check for GSD updates, display relevant context

**Status Line:**
- Location: `.claude/hooks/gsd-statusline.js`
- Triggers: Status line render event
- Responsibilities: Display current project state, active phase, progress metrics

## Error Handling

**Strategy:** Checkpoint-based recovery with persistent state files. Errors trigger STATE.md updates, checkpoints pause execution for user input.

**Patterns:**
- State is always written before risky operations (state before action)
- Errors are caught and logged to progress tracking files
- Deviations from plan trigger user checkpoint prompts
- Incomplete plans are tracked and can be resumed

## Cross-Cutting Concerns

**Logging:**
- Approach: File-based progress tracking in `.planning/phases/{phase}/progress.md` and session logs
- Tools: Node.js file writes, markdown section appends

**Validation:**
- Approach: Pre-execution plan checking via gsd-plan-checker agent, post-execution verification via gsd-verifier agent
- Pattern: Checkpoints pause execution when validation issues found

**Authentication:**
- Approach: Environment variable based for external services (gh, gita, gptodo)
- Pattern: Permissions in settings.json control which tools can be invoked

**Git Integration:**
- Approach: Commits created per-phase with structured frontmatter, planning commits before work begins
- Pattern: PLAN.md created and committed before execute phase starts

---

*Architecture analysis: 2026-03-14*
