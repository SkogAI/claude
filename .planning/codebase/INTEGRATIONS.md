# External Integrations

**Analysis Date:** 2026-03-14

## APIs & External Services

**Web Search:**
- Brave Search API - Web search capability for phase research
  - SDK/Client: Native `fetch()` API
  - Auth: `BRAVE_API_KEY` environment variable
  - Location: `~/.gsd/brave_api_key` (managed on disk)
  - Implementation: `.claude/get-shit-done/bin/lib/commands.cjs`
  - Endpoint: `https://api.search.brave.com/res/v1/web/search`
  - Enabled: Controlled by `brave_search` config flag

**GitHub API:**
- GitHub REST API - Repository management, PR creation, issue tracking
  - SDK/Client: `gh` CLI (GitHub CLI)
  - Purpose: PR operations, issue tracking, repository metadata
  - Permission: `Bash(gh *)` (pre-approved)
  - Integration: `.planning/config.json` configuration

**npm Registry:**
- npm Public Registry - Package management and version checking
  - Client: Node.js `execSync()` to `npm` CLI
  - Purpose: Check for GSD updates (`npm view get-shit-done-cc version`)
  - Implementation: `.claude/hooks/gsd-check-update.js`
  - Timeout: 10 seconds per request

## Data Storage

**Databases:**
- None configured or used

**File Storage:**
- Local filesystem only
  - Config storage: `.planning/` directory
  - GSD state: `.planning/STATE.md` (frontmatter format)
  - Planning docs: `.planning/{project}/ROADMAP.md`, `REQUIREMENTS.md`, phases/
  - Knowledge base: `.skogai/` (in symlinked context)
  - Cache: `~/.claude/cache/`, `/tmp/claude-ctx-{session_id}.json`

**Caching:**
- Session cache: `/tmp/claude-ctx-{session_id}.json`
  - Purpose: Context metrics bridge between statusline and agent hooks
  - Contents: token usage, remaining context percentage
  - Created by: `gsd-statusline.js`
  - Consumed by: `gsd-context-monitor.js`

- Update cache: `~/.claude/cache/gsd-update-check.json`
  - Purpose: GSD version update check results
  - Created by: `gsd-check-update.js`
  - Contains: installed version, latest version, check timestamp
  - Refresh: Background process, non-blocking

## Authentication & Identity

**Auth Provider:**
- Custom/None - No centralized authentication
- GitHub: User authenticated via `gh` CLI (system credential store)
- API Keys: Manual management
  - Brave Search: Stored at `~/.gsd/brave_api_key`
  - Claude Code: Managed via `.claude/settings.json` (not user-readable)

**Service Account:**
- Not applicable (workspace environment, not application)

## Monitoring & Observability

**Error Tracking:**
- None configured
- Errors logged in planning documents
  - Location: `.planning/*/STATE.md` (state tracking)
  - Manual error recording in phase retrospectives

**Logs:**
- Session logs: `.claude/session-env/` directory
  - Contains shell snapshot data
  - Persists environment state across sessions

- History: `~/.claude/history.jsonl`
  - Session activity history
  - Managed by Claude Code

- File history: `~/.claude/file-history/`
  - Change tracking for edited files

- GSD validation: Inline in planning docs
  - `.planning/*/VERIFICATION.md` - Phase verification reports
  - `.planning/*/DEBUG.md` - Debugging logs per phase

## CI/CD & Deployment

**Hosting:**
- Not applicable (workspace, not deployable application)

**CI Pipeline:**
- None configured
- Manual validation via:
  - `gsd-tools.cjs validate consistency` - Check phase numbering
  - `gsd-tools.cjs validate health` - Check `.planning/` integrity

**Version Control Integration:**
- Git workflow: Feature branches via worktrees
  - Configured in `.planning/config.json`:
    - `branching_strategy: "none"` (no automatic branching)
    - `phase_branch_template: "gsd/phase-{phase}-{slug}"`
    - `milestone_branch_template: "gsd/{milestone}-{slug}"`
  - Commit docs: Controlled by `commit_docs` config flag
  - Planning directory: `.planning/` respects `.gitignore`

## Environment Configuration

**Required Environment Variables:**
- `BRAVE_API_KEY` - Optional, for web search capability
  - Stored: `~/.gsd/brave_api_key`
  - Used by: `gsd-tools.cjs websearch` command
  - Missing: Web search disabled silently

- `CLAUDE_CONFIG_DIR` - Optional, for multi-account support
  - Detected directories (fallback order):
    1. `$CLAUDE_CONFIG_DIR` (env override)
    2. `.claude/` (current project)
    3. `.config/opencode/`, `.opencode/`, `.gemini/` (supported runtimes)
    4. Default to `~/.claude/`

- `GPTODO_TASKS_DIR` - Task storage for gptodo integration
  - Default: `~/.gptodo/tasks`
  - Used by: gptodo task management

**Secrets Location:**
- `.gsd/brave_api_key` - Brave API authentication (on disk)
- `~/.claude/.credentials.json` - GitHub/service credentials (encrypted by Claude Code)
- `.claude/settings.local.json` - Local overrides (git-ignored)

**Configuration Files:**
- `.planning/config.json` - GSD project configuration (committed)
- `.claude/settings.json` - Claude Code workspace settings (symlink to project)
- `.claude/settings.local.json` - Local overrides (git-ignored)
- `.claude/gsd-file-manifest.json` - SHA256 hash verification

## Webhooks & Callbacks

**Incoming:**
- None configured

**Outgoing:**
- GitHub: PR creation workflow
  - Via `gh pr create` command
  - Triggered manually or via workspace commands
  - No automated webhook events

## Plugin Ecosystem

**Installed Plugins:**
- **claude-memory@skogai-marketplace** (enabled)
  - Purpose: Persistent memory across sessions
  - Used in: Context recovery, session resumption

**Marketplace Sources:**
1. **worktrunk** - Local directory at `~/.local/src/worktrunk`
2. **skogai-marketplace** - Local directory at `~/.local/src/marketplace`
3. **superpowers-marketplace** - GitHub: `obra/superpowers-marketplace`

**Skills (Active):**
- `gsd:*` - GSD workflow commands (pre-approved)
- `skogai-routing:*` - Routing and navigation (pre-approved)
- `skogai-bats-testing:*` - Bash test automation (pre-approved)

## Agent Teams

**Configuration:**
- `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS: 1` (enabled)
- Used for: Multi-agent GSD workflows
- Sub-agents defined in: `.claude/agents/` directory

**Known Agents:**
- `gsd-codebase-mapper` - Analyze codebases
- `gsd-planner` - Create implementation plans
- `gsd-executor` - Execute phase implementations
- `gsd-debugger` - Debug issues
- `gsd-plan-checker` - Validate plans
- `gsd-verifier` - Verify completeness
- `gsd-integration-checker` - Check integrations
- `gsd-project-researcher` - Research projects
- `gsd-phase-researcher` - Research phases
- `gsd-nyquist-auditor` - Audit work quality

## Status Line & Context Monitoring

**Metrics Bridge:**
- File: `/tmp/claude-ctx-{session_id}.json`
- Written by: `gsd-statusline.js` (reads from Claude Code environment)
- Read by: `gsd-context-monitor.js` (injects context warnings)
- Data: Token usage, remaining context percentage, stale threshold (60s)
- Debounce: 5 tool uses between warnings (escalation bypasses debounce)

**Context Thresholds:**
- WARNING (remaining <= 35%) - Agent should wrap up
- CRITICAL (remaining <= 25%) - Agent should stop and save state
- Stale: Metrics older than 60 seconds ignored

---

*Integration audit: 2026-03-14*
