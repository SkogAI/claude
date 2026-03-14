# Codebase Structure

**Analysis Date:** 2026-03-14

## Directory Layout

```
/home/skogix/claude/
├── .claude/                                # Active Claude Code environment
│   ├── agents/                             # Autonomous agent definitions
│   │   ├── gsd-codebase-mapper.md
│   │   ├── gsd-debugger.md
│   │   ├── gsd-executor.md
│   │   ├── gsd-integration-checker.md
│   │   ├── gsd-nyquist-auditor.md
│   │   ├── gsd-phase-researcher.md
│   │   ├── gsd-plan-checker.md
│   │   ├── gsd-planner.md
│   │   ├── gsd-project-researcher.md
│   │   ├── gsd-research-synthesizer.md
│   │   ├── gsd-roadmapper.md
│   │   └── gsd-verifier.md
│   ├── skills/                             # Skill modules (staging area)
│   │   ├── planning-with-files/            # Manus-style file-based planning
│   │   │   └── SKILL.md
│   │   ├── skill-creator/                  # Skill creation guidance
│   │   │   └── SKILL.md
│   │   ├── skogai-bats-testing/            # BATS testing framework
│   │   │   └── SKILL.md
│   │   └── skogai-routing/                 # Progressive disclosure routing patterns
│   │       ├── SKILL.md
│   │       ├── workflows/
│   │       ├── references/
│   │       ├── templates/
│   │       └── scripts/
│   ├── hooks/                              # Claude Code hook handlers
│   │   ├── gsd-check-update.js             # SessionStart hook: Check GSD updates
│   │   ├── gsd-context-monitor.js          # PostToolUse hook: Monitor context usage
│   │   └── gsd-statusline.js               # StatusLine hook: Display project status
│   ├── commands/                           # Custom Claude Code commands
│   │   └── (currently minimal)
│   ├── get-shit-done/                      # GSD framework (v1.22.4)
│   │   ├── bin/
│   │   │   ├── gsd-tools.cjs               # Main CLI tool (CommonJS)
│   │   │   └── lib/                        # Tool libraries
│   │   │       ├── commands.cjs
│   │   │       ├── config.cjs
│   │   │       ├── core.cjs
│   │   │       ├── frontmatter.cjs
│   │   │       ├── init.cjs
│   │   │       ├── milestone.cjs
│   │   │       ├── phase.cjs
│   │   │       ├── roadmap.cjs
│   │   │       ├── state.cjs
│   │   │       ├── template.cjs
│   │   │       ├── verify.cjs
│   │   │       └── (others)
│   │   ├── workflows/                      # GSD workflow templates
│   │   │   ├── map-codebase.md             # Spawn mapper agents
│   │   │   ├── plan-phase.md               # Create phase plan
│   │   │   ├── execute-phase.md            # Execute plan atomically
│   │   │   ├── new-project.md              # Initialize new project
│   │   │   ├── new-milestone.md            # Create milestone
│   │   │   ├── verify-phase.md             # Verify completion
│   │   │   └── (30+ more workflows)
│   │   ├── references/                     # Framework documentation
│   │   │   ├── checkpoints.md
│   │   │   ├── continuation-format.md
│   │   │   ├── decimal-phase-calculation.md
│   │   │   ├── git-integration.md
│   │   │   ├── model-profile-resolution.md
│   │   │   ├── phase-argument-parsing.md
│   │   │   └── (more)
│   │   ├── templates/                      # Output templates
│   │   │   ├── PLAN.md
│   │   │   ├── ROADMAP.md
│   │   │   ├── STATE.md
│   │   │   └── (others)
│   │   ├── VERSION                         # 1.22.4
│   │   └── gsd-file-manifest.json          # Manifest of all GSD files
│   ├── settings.json                       # Claude Code configuration
│   ├── settings.local.json                 # Local overrides
│   ├── settings.schema.example.json        # Schema reference
│   ├── package.json                        # Node.js project (CommonJS)
│   └── worktrees/                          # Git worktree management
├── .planning/                              # Project planning & state
│   ├── codebase/                           # Codebase analysis documents (written by mappers)
│   │   ├── STACK.md                        # Technology stack
│   │   ├── INTEGRATIONS.md                 # External service integrations
│   │   ├── ARCHITECTURE.md                 # Architecture patterns
│   │   ├── STRUCTURE.md                    # This file
│   │   ├── CONVENTIONS.md                  # Coding conventions
│   │   ├── TESTING.md                      # Testing patterns
│   │   └── CONCERNS.md                     # Technical debt & issues
│   ├── config.json                         # GSD configuration (model, workflow settings)
│   ├── ROADMAP.md                          # Project milestone/phase roadmap
│   ├── STATE.md                            # Current execution state
│   ├── phases/
│   │   └── {phase-name}/
│   │       ├── PLAN.md                     # What to do (created by planner)
│   │       ├── STATE.md                    # Progress tracking
│   │       ├── SUMMARY.md                  # What happened (created by executor)
│   │       └── progress.md                 # Session logs
│   └── milestones/
│       └── {milestone-name}/
│           └── (phases grouped under milestone)
├── .skogai/                                # User knowledge base (externally managed)
│   ├── knowledge/                          # Pattern libraries, references
│   ├── memory/                             # User memory, decisions, context
│   ├── templates/                          # Project templates
│   └── tasks/                              # Task definitions (gptodo)
├── docs/                                   # Fetched reference documentation
│   ├── fetch-docs.sh                       # Script to fetch Claude Code docs
│   └── claude-code/                        # Downloaded documentation
├── .git/                                   # Git repository
├── CLAUDE.md                               # Root router file (entry point for context)
└── Argcfile.sh (external reference)        # Workspace CLI commands (in ~/.local/src/)
```

## Directory Purposes

**.claude/agents/**
- Purpose: Autonomous agent definitions for GSD framework
- Contains: 12 agent definition markdown files (YAML frontmatter + role + philosophy + process)
- Key files:
  - `gsd-codebase-mapper.md`: Explores and documents codebase
  - `gsd-planner.md`: Creates implementation plans from phases
  - `gsd-executor.md`: Executes plans atomically with commits
  - `gsd-verifier.md`: Validates work completion

**.claude/skills/**
- Purpose: Modular skill capabilities with progressive disclosure routing
- Contains: SKILL.md routers with subdirectories for workflows, references, templates, scripts
- Key examples:
  - `skogai-routing/`: Teaches skill creation patterns
  - `planning-with-files/`: Manus-style persistent planning methodology
  - `skill-creator/`: Guidance for building new skills

**.claude/hooks/**
- Purpose: Session lifecycle and tool monitoring
- Contains: Node.js hook handlers
- Firing points:
  - `gsd-check-update.js`: SessionStart (check for framework updates)
  - `gsd-context-monitor.js`: PostToolUse (monitor context usage)
  - `gsd-statusline.js`: StatusLine render (show project state)

**.claude/get-shit-done/**
- Purpose: GSD project management framework
- Contains: CLI tools (Node.js), 30+ workflow templates, references, templates
- Critical files:
  - `bin/gsd-tools.cjs`: Main tool that initializes state and manages project structure
  - `workflows/`: Templates for all GSD commands (map-codebase, plan-phase, execute-phase, etc.)

**.planning/codebase/**
- Purpose: Structured analysis of codebase architecture and conventions
- Contains: 7 markdown documents written by mapper agents
- Generated by: `/gsd:map-codebase` command with four parallel agents
- Consumed by: `/gsd:plan-phase` and `/gsd:execute-phase` commands for context

**.planning/phases/{phase}/**
- Purpose: Container for phase planning and execution
- Contains:
  - `PLAN.md`: Detailed task list with checkpoints (created by planner)
  - `STATE.md`: Current progress tracking
  - `SUMMARY.md`: Execution summary (created by executor)
  - `progress.md`: Session logs with tool calls and results

**.planning/milestones/{milestone}/**
- Purpose: Groups related phases into semantic project units
- Contains: Phase ordering, status tracking, completion markers

## Key File Locations

**Entry Points:**
- `CLAUDE.md`: Root router - directs to knowledge and resources
- `.claude/settings.json`: Configuration entry point for Claude Code environment
- `.planning/config.json`: GSD workflow configuration (model profiles, validation rules)

**Configuration:**
- `.claude/settings.json`: Permissions, hooks, plugins, environment variables
- `.claude/settings.local.json`: Local environment overrides
- `.planning/config.json`: GSD-specific configuration (model_profile, branching_strategy, workflow options)

**Core Logic:**
- `.claude/get-shit-done/bin/gsd-tools.cjs`: State initialization and management
- `.claude/get-shit-done/workflows/`: Orchestration templates for all GSD commands
- `.claude/agents/*.md`: Agent implementations with specialized responsibilities

**Documentation & Templates:**
- `.claude/get-shit-done/templates/`: Output structures (PLAN.md, STATE.md, ROADMAP.md)
- `.claude/get-shit-done/references/`: Framework documentation
- `.claude/skills/*/references/`: Domain knowledge per skill

## Naming Conventions

**Files:**
- Workflow templates: `kebab-case.md` (e.g., `map-codebase.md`, `execute-phase.md`)
- Agent definitions: `gsd-{type}.md` (e.g., `gsd-executor.md`, `gsd-debugger.md`)
- Skill definitions: `SKILL.md` in skill directory root
- Planning files: UPPERCASE.md (PLAN.md, STATE.md, ROADMAP.md, SUMMARY.md)
- Codebase analysis: UPPERCASE.md (ARCHITECTURE.md, STRUCTURE.md, CONVENTIONS.md)

**Directories:**
- Skills: `kebab-case-name/` matching YAML frontmatter name (e.g., `planning-with-files/`, `skogai-routing/`)
- Phases: `{phase-name}/` using phase identifier from frontmatter
- Milestones: `{milestone-name}/` using milestone identifier

**Variables & Constants:**
- Environment: UPPERCASE_WITH_UNDERSCORES (e.g., `GPTODO_TASKS_DIR`, `ENABLE_CLAUDEAI_MCP_SERVERS`)

## Where to Add New Code

**New Skill:**
- Primary code: `.claude/skills/{skill-name}/`
- Structure: SKILL.md (frontmatter + routing) → workflows/ → references/ + templates/ + scripts/
- Enable in: `.claude/settings.json` under `enabledPlugins`

**New Agent:**
- Implementation: `.claude/agents/{agent-name}.md`
- Format: YAML frontmatter (name, description, tools, color, skills) + role + philosophy + process
- Register in: GSD tools and agent team configuration

**New Workflow:**
- Location: `.claude/get-shit-done/workflows/{workflow-name}.md`
- Format: XML sections (purpose, process, step-by-step) + tool invocations
- Entry: Linked from routing tables in skills or orchestrator workflows

**New Hook:**
- Location: `.claude/hooks/{hook-name}.js`
- Format: Node.js CommonJS returning hook payload
- Register in: `.claude/settings.json` under `hooks` section

**GSD Framework Extensions:**
- Core tool additions: `.claude/get-shit-done/bin/lib/{module}.cjs`
- Reference docs: `.claude/get-shit-done/references/{topic}.md`
- Templates: `.claude/get-shit-done/templates/{output-type}.md`

## Special Directories

**.claude/ (Staging Area):**
- Purpose: Live development of skills, agents, hooks (symlinked from ~/.claude/)
- Generated: No (manually edited)
- Committed: Yes
- Live reload: Yes (symlinks allow immediate activation)

**.planning/ (Project State):**
- Purpose: Persistent project planning and execution state
- Generated: Partially (by orchestrators and mappers)
- Committed: Yes (part of git history)
- Structure: Phases, milestones, codebase analysis, configuration

**docs/claude-code/ (Fetched Docs):**
- Purpose: Reference documentation for Claude Code features
- Generated: Yes (by fetch-docs.sh script)
- Committed: No (in .gitignore)
- Update: Run `docs/fetch-docs.sh` to refresh

**.config/ (Empty Placeholder):**
- Purpose: Reserved for future configuration
- Generated: No
- Committed: No

## Workspace Structure Philosophy

This is a **workspace**, not an application. The architecture is hub-and-spoke routing:

1. **Hub:** CLAUDE.md and `.claude/settings.json` provide central entry points
2. **Spokes:** Each directory has clear responsibility (agents, skills, GSD, planning)
3. **Lazy Loading:** Read the right file at the right time, never bulk pre-load
4. **Symlinks:** `.claude/` symlinks out to project-root components for live development
5. **Parallel Agents:** GSD spawns specialized agents with fresh context for different concerns

New files and directories should follow these patterns:
- Clear responsibility (one concern per directory)
- CLAUDE.md routing in top-level directories
- Progressive disclosure in complex skills (workflows/ → references/ + templates/ + scripts/)
- Naming conventions that make file purposes obvious

---

*Structure analysis: 2026-03-14*
