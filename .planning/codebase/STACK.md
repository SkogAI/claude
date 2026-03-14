# Technology Stack

**Analysis Date:** 2026-03-14

## Languages

**Primary:**
- JavaScript (Node.js) - Core runtime for GSD framework and hooks
- Bash/Shell - Environment configuration, scripting utilities
- Markdown - Knowledge base and planning documentation

**Secondary:**
- TypeScript (referenced, not actively used) - For plugin development support
- Python (referenced) - Project template detection in GSD init
- Go, Rust, Java, Swift (referenced) - Source file detection patterns in GSD tools

## Runtime

**Environment:**
- Node.js (LTS) - Executes `.cjs` CommonJS modules for GSD and hooks
- Bash/zsh - Shell environment for command execution
- Claude Code (Primary execution environment)

**Package Manager:**
- npm - Manages Node.js dependencies
- Lockfile: `package.json` present (minimal - CommonJS only)
  - Location: `.claude/package.json`
  - Type: commonjs

## Frameworks

**Core:**
- **get-shit-done (GSD)** v1.22.4 - AI-native project planning framework
  - Location: `.claude/get-shit-done/`
  - Purpose: Multi-agent workflow orchestration, phase management, planning docs
  - Components: CLI tools (`gsd-tools.cjs`), config system, state management

**Testing:**
- **BATS (Bash Automated Testing System)** - Bash testing framework
  - Package: `bats` (installed globally via npm)
  - Location: `.claude/skills/skogai-bats-testing/`
  - Usage: Shell script validation

**Build/Dev:**
- **Argcfile.sh** - argc CLI utility wrapper
  - Purpose: Workspace command interface (worktrees, git workflow, task management)
  - Commands: `workspace`, `debug interface`, and custom argc commands

- **Claude Code** - AI code generation and editing
  - Integration: SessionStart, PostToolUse hooks
  - Config: `.claude/settings.json`
  - Plugins: claude-memory@skogai-marketplace (enabled)

## Key Dependencies

**Critical:**
- **Node.js built-in modules** (no npm dependencies in package.json)
  - `fs`, `path`, `os` - File system and environment access
  - `child_process` - Subprocess management
  - `crypto` - Hash verification for GSD file integrity

**Infrastructure:**
- **npm (package manager)** - Installed globally, checks for `get-shit-done-cc` updates
  - Used in: `gsd-check-update.js` hook
  - Version check: `npm view get-shit-done-cc version`

- **git** - Version control integration
  - Used in: GSD phase/roadmap operations, commit verification
  - Commands: `git check-ignore`, `git commit`, arbitrary git workflows

- **GitHub CLI (gh)** - GitHub interaction
  - Allowed permission in settings: `Bash(gh *)`
  - Purpose: PR creation, issue tracking

- **gita** - Multi-repo management
  - Allowed permission: `Bash(gita *)`
  - Purpose: Workspace repository overview

- **gptodo** - Task management
  - Allowed permission: `Bash(gptodo *)`
  - Purpose: Task tracking, worktree creation

- **skogai/skogcli** - Personal CLI toolkit
  - Allowed permissions: `Bash(skogai *)`, `Bash(skogcli *)`
  - Purpose: Environment setup, context management

- **wt (worktree)** - Git worktree management
  - Allowed permission: `Bash(wt *)`
  - Purpose: Branch-based feature isolation

## Configuration

**Environment:**
- Configuration via `.planning/config.json` (GSD project config)
  - Key settings:
    - `model_profile`: AI model selection (balanced)
    - `commit_docs`: Whether planning docs are committed
    - `search_gitignored`: Include gitignored files in search
    - `branching_strategy`: Git branching approach
    - `workflow`: Research, planning, verification stages
    - `parallelization`: Enable concurrent operations
    - `brave_search`: Web search capability flag

- `.claude/settings.json` - Claude Code configuration
  - Permissions: Pre-approved CLI tools (gita, gptodo, gh, argc, wt)
  - Env vars:
    - `ENABLE_CLAUDEAI_MCP_SERVERS: false`
    - `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS: 1`
  - Hooks: SessionStart (update check), PostToolUse (context monitoring)
  - Enabled plugins: `claude-memory@skogai-marketplace`
  - Marketplaces: worktrunk, skogai-marketplace, superpowers-marketplace

- `.claude/settings.local.json` - Local overrides (secrets not included)

**Build:**
- No build configuration (workspace, not application)
- GSD version: 1.22.4 (defined in `.claude/get-shit-done/VERSION`)
- File integrity: SHA256 hashes in `gsd-file-manifest.json`

## Platform Requirements

**Development:**
- Node.js (LTS or later)
- Bash/zsh shell
- git (for version control)
- npm (for global package management)
- Claude Code (or compatible AI code editor)

**External Services:**
- Brave Search API (optional) - Web search capability
  - API key location: `~/.gsd/brave_api_key` (on disk, not in config)
  - Used in: `gsd-tools.cjs` via fetch API

**Workspace Directories:**
- `.claude/` - Local extensions, settings, cache
- `.planning/` - Project planning documents
- `.skogai/` - Personal knowledge base (in `~/.claude/projects/` context)
- `docs/` - Fetched Claude Code reference documentation
- `projects/` - Symlinks to active repositories
- `marketplaces/` - Plugin marketplace references

## Hooks & Monitoring

**SessionStart Hooks:**
- `gsd-check-update.js` - Background GSD version check
  - Uses: Node.js `spawn()` with detached process
  - Output: Cache file at `~/.claude/cache/gsd-update-check.json`

- `gsd-statusline.js` - Renders context usage statusline
  - Monitors: Token usage, session metrics
  - Output: Metrics to `/tmp/claude-ctx-{session_id}.json`

**PostToolUse Hooks:**
- `gsd-context-monitor.js` - Agent context awareness
  - Reads metrics from statusline bridge
  - Injects context warnings when usage > thresholds
  - Thresholds: WARNING (35%), CRITICAL (25%)

---

*Stack analysis: 2026-03-14*
