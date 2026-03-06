# marketplaces/

This directory contains cloned plugin repositories for the Claude Code plugin ecosystem, all from the **superpowers** suite by Jesse Vincent (obra). Each subdirectory is a self-contained git repo that can be installed as a Claude Code plugin.

## Plugin System Basics

Claude Code plugins are installed via the `/plugin` command and activate skills, commands, hooks, and MCP servers. What is currently installed and active is tracked in:

- **`~/.claude/plugins/installed_plugins.json`** — authoritative list of installed plugins, versions, and install paths
- **`~/.claude/settings.json`** (or `.claude/settings.json` in a project) — configures marketplaces, permissions, env vars, and hook overrides

To check what is installed: read `~/.claude/plugins/installed_plugins.json`.

Currently confirmed installed: `superpowers@superpowers-dev` v4.3.1.

---

## Directory Contents

### superpowers-marketplace

**Type:** Marketplace registry (not a plugin itself)
**Repo:** `github.com/obra/superpowers-marketplace`

A curated catalog of available plugins. Adding this marketplace makes its plugins discoverable and installable by name. Does not install anything on its own.

**Install the marketplace:**
```bash
/plugin marketplace add obra/superpowers-marketplace
```

**Plugins listed in this marketplace:**
| Plugin | Install command |
|--------|----------------|
| superpowers | `/plugin install superpowers@superpowers-marketplace` |
| elements-of-style | `/plugin install elements-of-style@superpowers-marketplace` |
| superpowers-developing-for-claude-code | `/plugin install superpowers-developing-for-claude-code@superpowers-marketplace` |
| episodic-memory | `/plugin install episodic-memory@superpowers-marketplace` |
| claude-session-driver | `/plugin install claude-session-driver@superpowers-marketplace` |
| double-shot-latte | `/plugin install double-shot-latte@superpowers-marketplace` |

---

### superpowers

**Type:** Plugin — core skills library
**Version:** 4.3.1 (currently installed)
**Author:** Jesse Vincent
**Repo:** `github.com/obra/superpowers`

The foundational workflow plugin. Installs a suite of composable skills that guide Claude through a complete software development lifecycle: from brainstorming an idea through design, planning, implementation (with TDD), code review, and branch completion. Skills trigger automatically based on what you are doing — no explicit invocation needed.

**Install:**
```bash
/plugin install superpowers@superpowers-marketplace
```

**Hooks:**
| Hook | Trigger | What it does |
|------|---------|--------------|
| `SessionStart` | `startup`, `resume`, `clear`, `compact` | Injects the `using-superpowers` skill content into context so Claude knows the skill system exists and how to use it |

**Commands:**
| Command | What it does |
|---------|--------------|
| `/brainstorm` | Manually trigger the brainstorming skill |
| `/write-plan` | Manually trigger the write-plan skill |
| `/execute-plan` | Manually trigger the execute-plan skill |

**Skills:**

#### `using-superpowers`
- **Trigger:** Session start (always injected via hook)
- **What it does:** Establishes the meta-skill system. Teaches Claude how to find and invoke skills, which skills are available, and the hard rule that skills must be invoked before any response or action when they apply. The entry point for the entire superpowers system.

#### `brainstorming`
- **Trigger:** Before any creative/implementation work — adding features, building components, modifying behavior
- **What it does:** Prevents jumping straight into code. Guides Claude through a structured design process: explore project context, ask clarifying questions one at a time, propose 2-3 approaches with trade-offs, present design sections for user approval, write a design doc to `docs/plans/YYYY-MM-DD-<topic>-design.md`, then hand off to `writing-plans`.

#### `writing-plans`
- **Trigger:** After design is approved; when a spec or requirements exist for a multi-step task
- **What it does:** Breaks an approved design into a granular implementation plan. Each task is sized at 2-5 minutes, has exact file paths, complete code examples, and explicit verification steps. Output is an implementation plan file. Designed to be detailed enough for a subagent to execute without ambiguity.

#### `executing-plans`
- **Trigger:** When an implementation plan exists and needs to be executed with human checkpoints
- **What it does:** Executes a written plan in batches, pausing at defined checkpoints for human review. Alternative to `subagent-driven-development` — less autonomous, more checkpoints.

#### `subagent-driven-development`
- **Trigger:** When an implementation plan needs to be executed autonomously with automated review
- **What it does:** Dispatches fresh subagents per task from the plan. Each task goes through two-stage review: spec compliance check, then code quality review. Allows Claude to work autonomously for extended periods without deviating from the plan. Faster and more autonomous than `executing-plans`.

#### `test-driven-development`
- **Trigger:** During implementation of any feature or bugfix, before writing implementation code
- **What it does:** Enforces strict RED-GREEN-REFACTOR cycle. Write a failing test first, verify it fails, write minimal code to pass it, verify it passes, refactor, commit. Will delete code written before tests exist. Includes a reference of testing anti-patterns to avoid.

#### `systematic-debugging`
- **Trigger:** When encountering any bug, test failure, or unexpected behavior, before proposing fixes
- **What it does:** Four-phase root cause process: reproduce the issue reliably, isolate the failure, identify root cause (not symptoms), then fix and verify. Includes sub-references for root-cause-tracing, defense-in-depth strategies, condition-based waiting for async issues, and a script (`find-polluter.sh`) for finding test pollution.

#### `verification-before-completion`
- **Trigger:** Before claiming work is complete, fixed, or passing; before committing or creating PRs
- **What it does:** Requires running actual verification commands and confirming output before making any success claims. Evidence before assertions — cannot declare "tests pass" without running them and showing the output.

#### `requesting-code-review`
- **Trigger:** Between implementation tasks; when completing features; before merging
- **What it does:** Pre-review checklist. Reviews code against the plan, reports issues by severity. Critical issues block progress. Uses a `code-reviewer` agent.

#### `receiving-code-review`
- **Trigger:** When receiving code review feedback, before implementing suggestions
- **What it does:** Requires technical rigor and verification before acting on feedback. Prevents blind agreement or blind implementation of suggestions that may be incorrect. Requires verifying that suggested fixes are actually correct before applying.

#### `using-git-worktrees`
- **Trigger:** Starting feature work that needs isolation; before executing implementation plans
- **What it does:** Creates isolated git worktrees on new branches, runs project setup, and verifies a clean test baseline before implementation begins. Prevents feature work from contaminating the main workspace.

#### `finishing-a-development-branch`
- **Trigger:** When implementation is complete and all tests pass
- **What it does:** Verifies tests, then presents structured options: merge to main, create a PR, keep the branch for later, or discard it. Cleans up the worktree after a decision is made.

#### `dispatching-parallel-agents`
- **Trigger:** When facing 2+ independent tasks that can be parallelized
- **What it does:** Guides dispatching multiple subagents concurrently for tasks without shared state or sequential dependencies. Increases throughput for independent workstreams.

#### `writing-skills`
- **Trigger:** When creating new skills, editing existing skills, or verifying skills work before deployment
- **What it does:** Meta-skill for skill authorship. Covers skill file format, frontmatter schema, persuasion principles (skills must convince Claude to use them), testing methodology with subagents, and Anthropic best practices. Includes graphviz conventions for skill flow diagrams.

---

### episodic-memory

**Type:** Plugin — conversation memory with MCP server
**Repo:** `github.com/obra/episodic-memory`
**Dependencies:** Node.js (for CLI and MCP server); embeddings run locally via Transformers.js; storage via SQLite

Gives Claude searchable memory across past conversations. At session start (or end, configurable), conversations are synced from `~/.claude/projects`, parsed, embedded locally (offline, no external API), and indexed in SQLite. Claude can then search past discussions semantically — finding not just keyword matches but meaning-level matches (e.g., "provider catalog" surfaces conversations about API design patterns).

**Install:**
```bash
/plugin install episodic-memory@superpowers-marketplace
```

**Hooks:**
| Hook | Trigger | What it does |
|------|---------|--------------|
| `SessionStart` | `startup`, `resume` | Runs `episodic-memory sync --background` asynchronously — copies new conversations from `~/.claude/projects` to archive and indexes them |

**MCP Tools (exposed to Claude):**
| Tool | What it does |
|------|--------------|
| `episodic_memory_search` | Semantic or text search over indexed conversations. Supports single-concept or multi-concept AND search, date filtering, result limits. Returns ranked conversation excerpts. |
| `episodic_memory_show` | Display a full conversation file (JSONL) in readable markdown format |

**Commands:**
| Command | What it does |
|---------|--------------|
| `/search-conversations` | Trigger a conversation history search |

**Skills:**

#### `remembering-conversations`
- **Trigger:** User asks "how should I..." or "what's the best approach..." after exploring code; when stuck on a problem; when user references past work ("last time", "we discussed", "do you remember")
- **What it does:** Mandates dispatching a `search-conversations` subagent rather than using MCP tools directly (saves context). The subagent searches with the `search` tool, reads top 2-5 results with the `show` tool, synthesizes findings (200-1000 words), and returns actionable insights with sources. Saves 50-100x context vs loading raw conversations.

**CLI (standalone use outside Claude):**
```bash
episodic-memory sync           # Sync and index new conversations
episodic-memory search "query" # Semantic search
episodic-memory show file.jsonl # Display a conversation
episodic-memory stats          # Index statistics
episodic-memory index --cleanup # Manual bulk indexing
```

**Excluding conversations from indexing:** Add this marker anywhere in a conversation:
```
<INSTRUCTIONS-TO-EPISODIC-MEMORY>DO NOT INDEX THIS CHAT</INSTRUCTIONS-TO-EPISODIC-MEMORY>
```

**Configuration env vars:**
| Variable | Default | Purpose |
|----------|---------|---------|
| `EPISODIC_MEMORY_API_MODEL` | `haiku` | Model used for summarization |
| `EPISODIC_MEMORY_API_MODEL_FALLBACK` | `sonnet` | Fallback model on error |
| `EPISODIC_MEMORY_API_BASE_URL` | (Claude Code auth) | Custom Anthropic-compatible endpoint |
| `EPISODIC_MEMORY_API_TOKEN` | (Claude Code auth) | Token for custom endpoint |
| `EPISODIC_MEMORY_API_TIMEOUT_MS` | `3000000` | Timeout for slow endpoints |

---

### superpowers-lab

**Type:** Plugin — experimental skills
**Repo:** `github.com/obra/superpowers-lab`
**Dependencies:** `tmux` (required for `using-tmux-for-interactive-commands`); `go` build toolchain (required to build `mcp-cli` binary); `slackcli` binary (required for `slack-messaging`)

Experimental skills that extend Claude Code with techniques still being refined. Functional and tested, but may evolve based on real-world usage and feedback.

**Install:**
```bash
/plugin install superpowers-lab@superpowers-marketplace
# (or directly from GitHub if not in marketplace)
```

**Hooks:** None

**Skills:**

#### `finding-duplicate-functions`
- **Trigger:** Auditing a codebase for semantic duplication; before major refactoring; when utility functions may have been reimplemented multiple times; after jscpd has handled syntactic duplicates
- **What it does:** Two-phase LLM-powered duplicate detection. Phase 1: classical shell script (`extract-functions.sh`) extracts function catalog to JSON. Phase 2: Haiku subagent categorizes functions by domain, then Opus subagents analyze each category for semantic duplicates (same intent, different implementation). Generates a prioritized markdown report grouped by confidence level. Targets high-risk zones: `utils/`, `helpers/`, validation code, error formatting, path manipulation, string/date formatting, API response shaping.
- **Scripts:** `extract-functions.sh`, `categorize-prompt.md`, `prepare-category-analysis.sh`, `find-duplicates-prompt.md`, `generate-report.sh`

#### `mcp-cli`
- **Trigger:** When needing to use MCP servers on-demand without permanent configuration; exploring an MCP server's capabilities; making one-off MCP tool calls; testing or debugging MCP servers
- **What it does:** Uses the `mcp` CLI tool (`~/.local/bin/mcp`, built from `github.com/f/mcptools`) to dynamically discover and invoke MCP server tools, resources, and prompts without pre-configuring them. Avoids polluting the context window with pre-loaded integrations. Supports stdio, HTTP, and SSE transports; bearer/basic auth; server aliases for repeated use; output in table, JSON, or pretty-JSON format.
- **Prerequisites:** Build from source: `cd /tmp && git clone --depth 1 https://github.com/f/mcptools.git && cd mcptools && CGO_ENABLED=0 go build -o ~/.local/bin/mcp ./cmd/mcptools`

#### `using-tmux-for-interactive-commands`
- **Trigger:** When needing to run interactive CLI tools that require real-time terminal input — vim, nano, git rebase -i, git add -p, Python/Node REPLs, htop, menuconfig, or any tool requiring readline/terminal control codes
- **What it does:** Uses tmux detached sessions to control interactive programs programmatically. Pattern: create detached session → wait for init → send keystrokes via `send-keys` → capture screen state via `capture-pane` → repeat → kill session. Includes a helper wrapper script (`tmux-wrapper.sh`) and reference for special key names (Enter, Escape, C-c, arrow keys, etc.).
- **Prerequisites:** `tmux` must be installed

#### `slack-messaging`
- **Trigger:** When asked to send or read Slack messages, check channels, test Slack integrations, or interact with a Slack workspace from the command line
- **What it does:** Uses `slackcli` (shaharia-lab/slackcli) to send messages, read channels, list conversations, and reply in threads. Authenticates via browser session tokens (xoxc + xoxd) — no Slack app creation required. Supports multiple workspaces. An `extract-tokens` helper script walks through extracting tokens from browser DevTools.
- **Prerequisites:** `slackcli` binary installed; browser session tokens extracted and configured
- **Note:** `user-invocable: false` — triggered by task context, not directly invoked

---

### claude-session-driver

**Type:** Plugin — multi-session orchestration
**Repo:** `github.com/obra/claude-session-driver`
**Dependencies:** `tmux`, `jq`, `claude` CLI

Turns one Claude Code session into a project manager that orchestrates other Claude Code sessions as workers. A controller session launches workers in tmux, assigns tasks, monitors their lifecycle events, reviews their tool calls, and collects results. Workers run in parallel. Event-driven architecture via JSONL files.

**Install:**
```bash
/plugin install claude-session-driver@superpowers-marketplace
```

**Hooks (installed on worker sessions, not the controller):**
| Hook | Trigger | What it does |
|------|---------|--------------|
| `PreToolUse` | Every tool call | Emits `pre_tool_use` event to JSONL; pauses up to 30s for controller approval before proceeding |
| `SessionStart` | Session start | Emits `session_start` event |
| `UserPromptSubmit` | Each prompt | Emits `user_prompt_submit` event |
| `Stop` | Worker stops | Emits `stop` event |
| `SessionEnd` | Session ends | Emits `session_end` event |

**Skills:**

#### `driving-claude-code-sessions`
- **Trigger:** When acting as a project manager delegating tasks to other Claude Code sessions; orchestrating parallel workstreams
- **What it does:** Provides shell script-based orchestration for launching, communicating with, monitoring, and stopping worker Claude sessions. Workers run with `--dangerously-skip-permissions` (permission dialog replaced by the PreToolUse hook approval system).

**Orchestration patterns:**
| Pattern | Description |
|---------|-------------|
| Delegate and wait | Launch one worker, assign a task, read the result |
| Fan-out | Launch several workers on independent tasks, wait for all to finish |
| Pipeline | Chain workers — each builds on the previous worker's output via shared files |
| Supervised multi-turn | Hold a multi-turn conversation with a worker, reviewing each response |
| Hand-off | Pass a running worker session to a human operator via tmux attach |

**Scripts reference:**
| Script | Purpose |
|--------|---------|
| `launch-worker.sh` | Start a worker session in tmux, wait for `session_start` |
| `converse.sh` | Send prompt, wait for `stop` event, return assistant response |
| `send-prompt.sh` | Send a prompt without waiting |
| `wait-for-event.sh` | Block until a specific lifecycle event or timeout |
| `read-events.sh` | Read/filter/follow the event stream |
| `read-turn.sh` | Format the last worker turn as markdown |
| `stop-worker.sh` | Gracefully stop and clean up a worker |
| `approve-tool.sh` | Approve or deny a pending tool call |

**Event types emitted:**
`session_start`, `user_prompt_submit`, `pre_tool_use` (with `tool` + `tool_input`), `stop`, `session_end`

**Tool approval:** Every worker tool call pauses up to 30s (configurable via `CLAUDE_SESSION_DRIVER_APPROVAL_TIMEOUT`) before auto-approving. The controller can explicitly approve or deny via `approve-tool.sh`.

---

### double-shot-latte

**Type:** Plugin — autonomous continuation
**Repo:** `github.com/obra/double-shot-latte`
**Dependencies:** `jq`

Eliminates mid-task interruptions where Claude stops to ask "Would you like me to continue?" when next steps are obvious. A separate Claude instance (judge) evaluates each stop attempt and decides whether continuation makes sense — if you could just type "continue" and Claude would know what to do, the plugin continues automatically.

**Install:**
```bash
/plugin install double-shot-latte@superpowers-marketplace
```

**Hooks:**
| Hook | Trigger | What it does |
|------|---------|--------------|
| `Stop` | Every time Claude tries to stop | Extracts last 10 transcript entries, dispatches a judge Claude instance to evaluate the stop, blocks the stop if continuation is appropriate |

**No skills.** Operates entirely through the Stop hook.

**Continue conditions** (judge allows continuation):
- Work is incomplete with obvious next steps
- Claude explicitly stated follow-up work it would do
- Implementation has TODOs or placeholders
- Multi-step process has remaining steps

**Stop conditions** (judge allows stopping):
- Claude is asking for a user decision
- Claude needs requirement clarification
- Work is complete and documented
- Claude explicitly needs user input

**Configuration:**
```json
// ~/.claude/settings.json
{
  "env": {
    "DOUBLE_SHOT_LATTE_MODEL": "haiku"  // or "sonnet" or "opus"
  }
}
```

**Throttling:** Max 3 auto-continuations per 5-minute window (tracked via `/tmp/.claude-continue-throttle-*` files) to prevent runaway loops. Judge Claude has recursion prevention so it cannot trigger its own hooks. Falls back to allowing stops gracefully if evaluation fails.

---

### superpowers-developing-for-claude-code

**Type:** Plugin — Claude Code plugin development reference
**Repo:** `github.com/obra/superpowers-developing-for-claude-code`

Provides skills and comprehensive documentation for building Claude Code plugins, skills, MCP servers, and extensions. Two skills: one for official Claude Code documentation access, one for plugin development workflows.

**Install:**
```bash
/plugin install superpowers-developing-for-claude-code@superpowers-marketplace
```

**Hooks:** None

**Skills:**

#### `working-with-claude-code`
- **Trigger:** Working with Claude Code CLI, plugins, hooks, MCP servers, skills, configuration, or any Claude Code feature
- **What it does:** Provides access to 42+ official documentation files covering all Claude Code features. Acts as a reference library — when uncertain about configuration paths, API structures, or feature capabilities, read the relevant file instead of guessing. Includes a self-update script that fetches latest docs from docs.claude.com.
- **Documentation files include:** `plugins.md`, `plugins-reference.md`, `plugin-marketplaces.md`, `skills.md`, `mcp.md`, `hooks.md`, `hooks-guide.md`, `slash-commands.md`, `sub-agents.md`, `settings.md`, `cli-reference.md`, `memory.md`, `checkpointing.md`, `security.md`, `github-actions.md`, `vs-code.md`, `jetbrains.md`, and many more
- **Update docs:** `node ~/.claude/skills/working-with-claude-code/scripts/update_docs.js`

#### `developing-claude-code-plugins`
- **Trigger:** Creating a new Claude Code plugin; adding components to an existing plugin (skills, commands, hooks, MCP servers); setting up a dev marketplace; troubleshooting plugin structure; releasing or maintaining plugins
- **What it does:** Streamlined plugin development workflow across 6 phases: Plan (choose pattern, review examples) → Create structure → Add components → Test locally via dev marketplace → Debug → Release and distribute. Covers semantic versioning, git tagging, and three distribution options (direct GitHub, marketplace, private/team). Includes working examples: `examples/simple-greeter-plugin/` (minimal) and `examples/full-featured-plugin/` (all components).
- **Critical rules enforced:** `.claude-plugin/` contains only manifests; use `${CLAUDE_PLUGIN_ROOT}` for all paths; use relative paths in `plugin.json`; make scripts executable

---

## Relationship Between Plugins

```
superpowers-marketplace  ← registry that lists the others for easy /plugin install

superpowers              ← core workflow: brainstorm → plan → implement (TDD) → review → finish
  └─ episodic-memory     ← gives superpowers cross-session memory via remembering-conversations skill
  └─ double-shot-latte   ← removes stop interruptions during subagent-driven-development runs
  └─ claude-session-driver ← replaces subagent-driven-development with full session orchestration

superpowers-lab          ← experimental extensions to superpowers (duplicate detection, tmux control, MCP CLI, Slack)

superpowers-developing-for-claude-code ← meta: use when building new plugins for this ecosystem
```

## Quick Install (full suite)

```bash
# Add the marketplace
/plugin marketplace add obra/superpowers-marketplace

# Core workflow
/plugin install superpowers@superpowers-marketplace

# Memory across sessions
/plugin install episodic-memory@superpowers-marketplace

# Autonomous continuation
/plugin install double-shot-latte@superpowers-marketplace

# Multi-session orchestration
/plugin install claude-session-driver@superpowers-marketplace

# Experimental skills
/plugin install superpowers-lab@superpowers-marketplace

# Plugin development tools
/plugin install superpowers-developing-for-claude-code@superpowers-marketplace
```
