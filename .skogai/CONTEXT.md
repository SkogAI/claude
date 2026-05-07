# .skogai - SkogAI Repository Bootstrap

This repository is the shared configuration, knowledge base, and tooling layer for all SkogAI projects. It is distributed as a git submodule at `.skogai/` in consumer projects.

## What is this?

`.skogai` is the central bootstrap and knowledge system for the SkogAI ecosystem. It provides:

- **Knowledge base** — documented decisions, learnings, patterns
- **Memory system** — session context, decision log
- **Project tracking** — project state, roadmaps, planning
- **Script infrastructure** — argc-powered bash automation
- **Skills registry** — domain-specific Claude Code skills
- **Workflow orchestration** — Dagu-based workflow DAGs
- **Worktrunk configuration** — shared `.config/wt.toml` for git worktree workflow

## File Structure

```
.skogai/
├── CLAUDE.md                   # Claude Code instructions (this file)
├── SKOGAI.md                   # Guidance with XML-style structural tags
├── README.md                   # Human-readable overview
├── Argcfile.sh                 # Argc CLI for queue management
├── base.yaml / config.yaml     # Dagu orchestration configuration
├── .envrc                      # Direnv PATH configuration
├── .config/
│   └── wt.toml                 # Worktrunk git worktree hooks
├── bin/
│   ├── skogai-loops            # Wrapper for gptme-runloops
│   └── skogai-ralph            # Wrapper for ralph tool
├── dotfiles/
│   └── install.sh              # Safety-checked dotfiles installer
├── email/                      # Email management (inbox, drafts, sent, archive)
├── knowledge/
│   ├── DECISIONS.md            # Decision index (router → decisions/)
│   ├── decisions/              # Architectural decision records (ADRs)
│   ├── lessons/                # Documented lessons from sessions
│   └── patterns/               # Reusable patterns and style guides
├── memory/
│   ├── GLOSSARY.md             # Shared vocabulary
│   ├── PROJECTS.md             # Active project index (router)
│   ├── feedback/               # Behavioral feedback records
│   └── references/             # External system pointers
├── plan/
│   ├── claudes-home/           # Claude's Home project plan (phases 1-5)
│   ├── codebase/               # Architecture, conventions, stack docs
│   ├── PROJECT.md              # Project definition and requirements
│   ├── ROADMAP.md              # 4-phase roadmap
│   └── STATE.md                # Current phase/plan progress
├── projects/
│   └── overview.md             # Active/paused/archived projects table
├── scripts/
│   ├── bootstrap/              # Submodule init and consumer-init scripts
│   ├── context/                # 26 context-generation scripts
│   └── utils/                  # search, wordcount, state-status, migration
├── skills/
│   ├── skill-registry.json     # Registry of all skills
│   └── */                      # Individual skill directories (SKILL.md + manifest.json)
├── tasks/                      # Task tracking files
├── templates/                  # Starter templates (knowledge-entry, decision-record, project-status)
├── todos/                      # Work items (NNN-status-pN-description.md)
├── tools/                      # Tools placeholder
└── workflows/                  # Dagu DAG files and workflow docs
```

## Always Load

Before starting any work, read:

```
@CONTEXT.md   — dynamically generated current context (workspace, git state, memory)
```

## Architecture Modes

**Dogfooding** (developing .skogai itself):

```bash
.skogai -> /home/skogix/.skogai   # symlink
.git/info/exclude contains .skogai
```

**Consumer** (project using .skogai as submodule):

```bash
git submodule add <repo-url> .skogai
(cd .skogai && ./scripts/bootstrap/bootstrap.sh)
```

**Detection:**

```bash
file .skogai  # symbolic link = dogfooding, directory = submodule
file .git     # directory = real repo, ASCII text file = submodule
```

## User Context (skogix)

- Functional programmer — data transformations over control flow, pure functions, immutable data
- Simplicity first — complexity only when earned
- Direct expert-level communication — give the answer first, explain after
- Lowercase for generic references (`claude`, `readme`), uppercase for exact names (`CLAUDE.md`, `Claude`)
- Uses git worktrees extensively (via Worktrunk)
- Prefers code/data over prose

## Repository Conventions

### Naming

- **kebab-case** — all files and directories
- **UPPERCASE.md** — important docs (`CLAUDE.md`, `README.md`, `PROJECT.md`, `ROADMAP.md`)
- **lowercase.md** — standard docs (`todo.md`, `decisions.md`)
- **.sh** — bash scripts; **.py** — Python; **.bats** — bash test files

### Bash Scripts

- Shebang: `#!/usr/bin/env bash`
- Strict mode: `set -euo pipefail`
- UPPERCASE for env vars/constants, lowercase for local vars, snake_case for functions
- Color output: RED=errors, GREEN=success, YELLOW=warnings, BLUE=info
- Minimal comments — only where logic is non-obvious
- Never hide errors or warnings behind abstractions

### Script Framework (argc)

All scripts in `scripts/` use argc for declarative CLI definition:

```bash
# @describe script description
# @arg name![`_choice_validator`] Argument description
main() { ... }
eval "$(argc --argc-eval "$0" "$@")"
```

### Code Quality

1. Minimal abstractions — pragmatic over perfect
1. Self-documenting code — names matter
1. Error visibility — never hide errors or warnings
1. Functional programming — prefer immutable data, pure functions
1. Simplicity first — no speculative abstractions
1. No over-engineering — only what the task actually requires

## Knowledge Management

### Where to Look

| Task                          | Location                                                   |
| ----------------------------- | ---------------------------------------------------------- |
| Log a decision                | `knowledge/decisions/` + index in `knowledge/DECISIONS.md` |
| Document a lesson             | `knowledge/lessons/`                                       |
| Record architectural decision | `knowledge/decisions/`                                     |
| Capture reusable pattern      | `knowledge/patterns/`                                      |
| Track project status          | `projects/overview.md`                                     |
| Quick capture                 | `inbox/`                                                   |
| Create new content            | `templates/` (see `templates/CLAUDE.md`)                   |

### Templates

- `templates/knowledge-entry.md` — learnings and patterns
- `templates/decision-record.md` — ADRs
- `templates/project-status.md` — project tracking

### @ Notation

`@path/to/file` expands the file at prompt-time, bypassing cache. Use it for files that must be current:

- `@CONTEXT.md` — dynamically generated current context
- `@knowledge/lessons/` — current lessons

## Todo System

Todos in `todos/` follow the naming convention:

```
NNN-status-pN-description.md
```

- Status: `pending`, `ready`, `in-progress`, `done`
- Priority: `p1` (critical/blocking), `p2` (high), `p3` (lower)

**Current critical items (P1 — do not ignore):**

- `001-pending-p1-shell-injection-plugin-names.md` — shell injection in session-start.sh (BLOCKS MERGE)
- `002-pending-p1-race-condition-file-updates.md` — race condition in concurrent file updates
- `017-pending-p1-plugin-trial-garden-system.md` — plugin trial garden system

## Skills Registry

Skills in `skills/` are domain-specific knowledge modules activated by context:

| Skill                       | Activation                                                  |
| --------------------------- | ----------------------------------------------------------- |
| `conductor-methodology`     | Always active                                               |
| `typescript-best-practices` | `*.ts`, `*.tsx` files or typescript/type/interface keywords |
| `api-design`                | api/endpoint/rest keywords or routes/controllers/api paths  |
| `testing-strategies`        | test/unit/integration/mock keywords or test directories     |
| `java-best-practices`       | `*.java`, pom.xml, build.gradle or java/optional keywords   |

Each skill: `skills/<name>/SKILL.md` + `manifest.json`

## Workflow Orchestration (Dagu)

- **Binary**: `/home/skogix/.local/bin/dagu` (v1.30.3)
- **Server**: `http://localhost:8080` (start with `dagu start-all`)
- **Config**: `config.yaml` (server), `base.yaml` (base DAG config)
- **Key commands**: `dagu start`, `dagu dry`, `dagu validate`, `dagu exec`

Rules for Dagu work:

- Write a small YAML DAG, run it, see what happens, adjust
- If it takes more than 2-3 lines of bash, rethink the approach
- Use `jq` for JSON — never sed/awk
- Use native Dagu features (`output:`, `parallel:`, `type: jq`, `call:`, `retryPolicy:`)
- Every DAG should fit in one screen

## SSH MCP Multi-User Architecture

- `skogai-ssh` MCP server — execute commands on remote systems
- `claude-ssh` MCP server — execute as claude user (localhost:22)
- Each agent can have a dedicated MCP server for workspace isolation
- Cross-user coordination via MCP instead of direct filesystem access

## Integration as Git Submodule

### Adding to a project

```bash
git submodule add <repo-url> .skogai
git submodule update --init --recursive
```

### Updating submodule in a project

```bash
cd .skogai
git pull origin master
cd ..
git add .skogai
git commit -m "Update .skogai submodule"
```

## Important Notes

- This is a **bootstrap/submodule project** — changes here affect all SkogAI projects that include it
- Keep configuration **portable** — no absolute paths or user-specific settings
- Keep it **minimal** — only include what is genuinely shared across projects
- Configuration is **optional** — consumer projects can override or ignore as needed
- **@ notation is truth** — use `@file` for content that must be current, not cached
- **No code implementation in v1** — establish system and principles first, build on them after
- **Greenfield approach** — existing Python/JS codebase is exploratory; target paradigm is functional-first (F#) with argc and 98% test coverage

# Active Tasks

    Task                                                                       Created     Priority   Complete

---

🏃 1. bug-healthcheck-references-identity-path-44 14d ago -
🏃 2. feat-scripts-bootstrap-init-and-symlink-33 14d ago -
📥 3. feat-templates-starter-templates-for-new-31 14d ago -
📥 4. chore-consolidate-scripts-claude-todo-bi-45 14d ago -
🏃 5. chore-remove-remaining-skogix-local-path-46 14d ago -
📥 6. feat-create-skogai-git-orchestrator-skil-40 14d ago -
📥 7. feat-skogai-md-root-context-router-26 14d ago -
📥 8. feat-bin-shared-executables-for-agent-ho-36 14d ago -
📥 9. feat-workflows-automation-definitions-an-35 14d ago -
🏃 10. feat-knowledge-decisions-learnings-patte-27 14d ago -
📥 11. feat-document-all-binaries-scripts-into-25 14d ago -
🏃 12. feat-scripts-context-context-generation-32 14d ago -
📥 13. feat-plan-project-planning-structure-29 14d ago -
📥 14. feat-skills-shared-agent-skills-registry-37 14d ago -
📥 15. feat-phase-5-plan-1-chat-io-contract-rou-22 14d ago -
🏃 16. bug-core-tooling-missing-on-non-skogix-c-43 14d ago -
📥 17. feat-create-worktrunk-specialist-skill-38 (0/3) 14d ago 0%
📥 18. feat-phase-5-plan-2-routing-skill-hook-f-23 14d ago -
📥 19. feat-extract-gptodo-specialist-skill-fro-39 (0/2) 14d ago 0%
✅ 20. fix-gptodo-import-writes-unquoted-yaml-d-41 14d ago -
📥 21. feat-skogai-ecosystem-integration-gas-to-24 14d ago -
🏃 22. feat-tasks-local-task-tracking-30 14d ago -
📥 23. feat-memory-session-context-and-decision-28 14d ago -
📥 24. feat-email-skogai-inter-agent-messaging-34 14d ago -
🏃 25. sko-184-review-ai-bot-player-integration-and-game-polish-issues (0/8) 13d ago 0%
📥 26. feat-skogai-ecosystem-integration-gas-to-15 9d ago -
📥 27. design-make-skogai-routing-the-canonical-61 9d ago -
📥 28. chore-replace-stale-claude-skills-and-le-57 9d ago -
📥 29. feat-phase-5-plan-2-routing-skill-hook-f-12 9d ago -
📥 30. chore-retire-deprecated-creator-skills-a-58 9d ago -
📥 31. test-add-automated-validation-for-repo-l-59 9d ago -
📥 32. epic-skogai-git-orchestrator-skill-gita-21 9d ago -
📥 33. feat-phase-5-plan-1-chat-io-contract-rou-11 9d ago -
📥 34. epic-review-and-normalize-repo-local-ski-55 9d ago -
📥 35. verify-revalidate-tool-and-api-facing-sk-60 9d ago -
📥 36. audit-normalize-shared-skills-to-current-56 9d ago -
📥 37. epic-claude-s-home-v2-0-skogai-integrati-19 9d ago -
📥 38. TASKS (11/29) 3d ago 38%

Total: 38 tasks (8 🏃, 29 📥, 1 ✅)

# Recent Memories

# Linear SKO-166 templates review and alignment

## What happened

Handled Linear session `af12a79e-797a-4321-b7fd-991676d817c4` for SKO-166 with the directive to review templates against skogai-routing basics and overall quality.

Reviewed `.skogai/templates/` and compared current structure to routing principles in `.skogai/skills/skogai-routing/references/claude-md-rules.md` and related style conventions.

Applied focused updates to make templates immediately usable and consistent with the routing/discoverability model.

## Changes made

- Updated `.skogai/templates/CLAUDE.md`
  - switched to explicit `## contents` section for discoverability
  - listed all current templates in the directory (core + planning helpers)
  - kept this file as a lightweight router/index (no heavy inlined content)

- Upgraded `.skogai/templates/knowledge-entry.md`
  - replaced placeholder `[@todo]` body with practical sections
  - added `category` and clearer status enum in frontmatter comments

- Upgraded `.skogai/templates/decision-record.md`
  - replaced placeholder `[@todo]` body with ADR structure (`context`, `decision`, `alternatives-considered`, `consequences`, `follow-up`)
  - added optional supersession metadata fields

- Upgraded `.skogai/templates/project-status.md`
  - replaced placeholder `[@todo]` body with actionable status sections (`summary`, `current-focus`, `milestones`, `risks`, `next-update`)
  - added `title` field for consistency with existing markdown metadata patterns

## Key decisions

- Kept changes minimal and scoped to template usability + routing alignment.
- Did not remove optional templates (`findings.md`, `progress.md`, `task_plan.md`), but made sure they are discoverable via templates router.
- Preserved existing permalink namespace style (`claude/projects/dot-skogai/...`) for consistency with current repository metadata.

## Worth remembering

Template stubs with only `[@todo]` create friction at creation time. Better starter templates are still lightweight, but include enough structure to make first use copy-paste-ready.

# Linear SKO-181 Settings Portability Cleanup

Completed cleanup requested in the primary directive thread for SKO-181.

## Summary

- Verified `.claude/settings.json` no longer contains:
  - `autoMemoryDirectory` with `/home/skogix/...`
  - worktrunk local directory marketplace path (`/home/skogix/.local/src/worktrunk`)
  - any `/home/skogix` references
- Pruned stale `/home/skogix/...` permission entries from `.claude/settings.local.json`.
- Confirmed JSON validity and no remaining `/home/skogix` hits in settings files.
- Updated GitHub issue thread (#46, synced with Linear) with completion status.

## Shipping

- Commit: `21bfe18`
- Message: `chore: remove remaining skogix-local settings paths`
- Branch: `linear-session-5b67af72-eeb6-4eb6-8f71-e2f76d3a3f95`

Issue is ready to merge.

## Summary

Reviewed `.skogai/templates/` against `skogai-routing` principles (router clarity, progressive disclosure, and copy+fill template behavior).

## Findings

- `templates/CLAUDE.md` functioned as an index, but was more content-heavy than needed for a directory router.
- Template bodies (`decision-record.md`, `knowledge-entry.md`, `project-status.md`) were placeholder-only (`[@todo]`) and did not provide structured starter sections.

## Changes made

- Simplified `.skogai/templates/CLAUDE.md` into a clearer router-style file with:
  - concise `<what_is_this>`
  - explicit `<contents>` list for discoverability
  - short `<usage>` rules emphasizing copy-only behavior
- Replaced `[@todo]` placeholders in all three templates with concrete starter sections:
  - `decision-record.md`: context, options-considered, decision, consequences
  - `knowledge-entry.md`: summary, context, observation, applicability, evidence, related
  - `project-status.md`: summary, goals, progress, risks, next-actions, links

## Validation

- Ran `git diff --check` (clean)
- Verified templates are still stubs and intended to be copied/fill-in-place in destination directories

# Key Knowledge Base Entries

# Workspace Status

## Git Status

```git
 M CONTEXT.md
```

## Workspace Structure

```tree
.
├── docs
├── email -> ../email
├── inbox
├── knowledge
├── memory
├── people
├── plan
├── scripts
├── skills
├── state
├── tasks
├── templates
├── tools
├── AGENTS.md
├── CLAUDE.md
├── CONTEXT.md
├── README.md
├── SKOGAI.md
└── TODO.md
./tasks
├── audit-normalize-shared-skills-to-current-56.md
├── bug-core-tooling-missing-on-non-skogix-c-43.md
├── bug-healthcheck-references-identity-path-44.md
├── chore-consolidate-scripts-claude-todo-bi-45.md
├── chore-remove-remaining-skogix-local-path-46.md
├── chore-replace-stale-claude-skills-and-le-57.md
├── chore-retire-deprecated-creator-skills-a-58.md
├── design-make-skogai-routing-the-canonical-61.md
├── epic-claude-s-home-v2-0-skogai-integrati-19.md
├── epic-review-and-normalize-repo-local-ski-55.md
├── epic-skogai-git-orchestrator-skill-gita-21.md
├── feat-bin-shared-executables-for-agent-ho-36.md
├── feat-create-skogai-git-orchestrator-skil-40.md
├── feat-create-worktrunk-specialist-skill-38.md
├── feat-document-all-binaries-scripts-into-25.md
├── feat-email-skogai-inter-agent-messaging-34.md
├── feat-extract-gptodo-specialist-skill-fro-39.md
├── feat-knowledge-decisions-learnings-patte-27.md
├── feat-memory-session-context-and-decision-28.md
├── feat-phase-5-plan-1-chat-io-contract-rou-11.md
├── feat-phase-5-plan-1-chat-io-contract-rou-22.md
├── feat-phase-5-plan-2-routing-skill-hook-f-12.md
├── feat-phase-5-plan-2-routing-skill-hook-f-23.md
├── feat-plan-project-planning-structure-29.md
├── feat-scripts-bootstrap-init-and-symlink-33.md
├── feat-scripts-context-context-generation-32.md
├── feat-skills-shared-agent-skills-registry-37.md
├── feat-skogai-ecosystem-integration-gas-to-15.md
├── feat-skogai-ecosystem-integration-gas-to-24.md
├── feat-skogai-md-root-context-router-26.md
├── feat-tasks-local-task-tracking-30.md
├── feat-templates-starter-templates-for-new-31.md
├── feat-workflows-automation-definitions-an-35.md
├── fix-gptodo-import-writes-unquoted-yaml-d-41.md
├── sko-184-review-ai-bot-player-integration-and-game-polish-issues.md
├── TASKS.md
├── test-add-automated-validation-for-repo-l-59.md
└── verify-revalidate-tool-and-api-facing-sk-60.md
./knowledge
├── decisions
├── lessons
├── patterns
├── DECISIONS.md
└── SKOGAI.md
./people
├── skogix.md
└── skogix_profile.md
```

# Context Information

- Context Generated: Sat May 2 05:30:57 AM CEST 2026
- Estimated Token Usage: ~1596 tokens
- MCP Integration: Active
- System Type: SkogAI with Claude 3 Integration

Context generated using the enhanced context-claude-enhanced.sh script
