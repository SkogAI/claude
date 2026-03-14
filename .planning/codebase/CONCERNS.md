# Codebase Concerns

**Analysis Date:** 2026-03-14

## Large Agent Definitions

**GSD Agents complexity:**
- Files: `~/.claude/agents/gsd-planner.md` (1309 lines), `~/.claude/agents/gsd-debugger.md` (1257 lines), `~/.claude/agents/gsd-executor.md` (489 lines)
- Issue: These are substantial workflow definitions that couple logic and documentation tightly. Any change requires careful context management.
- Impact: Hard to iterate on agent behavior without reading 1300+ lines of context; difficult to test changes in isolation.
- Safe modification: Extract specific workflow sections into separate reference files in `~/.claude/get-shit-done/references/` and `@` reference them in the agent files.
- Test coverage: No automated tests for agent logic — workflow execution is verified only at runtime.

## Large Monolithic Libraries

**GSD Core Libraries:**
- Files: `~/.claude/get-shit-done/bin/lib/phase.cjs` (901 lines), `~/.claude/get-shit-done/bin/lib/verify.cjs` (820 lines), `~/.claude/get-shit-done/bin/lib/state.cjs` (721 lines), `~/.claude/get-shit-done/bin/lib/init.cjs` (710 lines)
- Issue: Single-responsibility principle violated; each module handles multiple concerns (parsing, validation, transformation). Large functions with many branch paths.
- Impact: Hard to test individual functions; changes to one concern ripple across the module.
- Fragility: Complex state mutation in `state.cjs` and `init.cjs` without immutability guards. Parsing logic in `phase.cjs` has limited error handling.
- Safe modification: Before changing, understand all callers of the specific function. Add test cases for edge cases (empty files, malformed YAML, missing sections).
- Priority: **High** — These are load-bearing paths for all GSD operations.

## Missing Test Infrastructure

**Testing gaps:**
- What's not tested: No automated tests for `gsd-tools.cjs` CLI or its library modules. No test suite for agent decision-making logic.
- Files affected: All of `~/.claude/get-shit-done/bin/lib/` and `~/.claude/agents/`.
- Risk: Refactoring these files carries high regression risk. Bugs in core utilities will cascade across multiple workflows.
- Current approach: Manual testing through actual GSD operations (new-project, plan-phase, execute-phase).
- Priority: **Medium** — Automated tests would dramatically improve safety when modifying core utilities.

## Hook Reliability Dependencies

**Status hook architecture:**
- Files: `~/.claude/hooks/gsd-statusline.js`, `~/.claude/hooks/gsd-context-monitor.js`, `~/.claude/hooks/gsd-check-update.js`
- Issue: Hooks depend on persistent temp files (`/tmp/claude-ctx-*.json`, `claude-ctx-*-warned.json`) for context tracking and debouncing. These files can be lost between sessions or cleared by system cleanup.
- Impact: Context warnings may not fire or may fire repeatedly if temp files are orphaned. Update checks rely on cache files that persist across sessions.
- Fragility: `gsd-context-monitor.js` reads metrics written by the statusline hook with 3-second stdin timeout (Windows/Git Bash workaround). If timing changes, silent failures occur.
- Safe modification: Any changes to hook logic must preserve the stdin timeout guard (line 33 in `gsd-context-monitor.js`) and debounce logic (lines 89-96).
- Risk: Silent failures — hooks catch all exceptions and exit(0) without logging, making bugs invisible.

## Configuration Drift Risk

**Settings management:**
- Files: `~/.claude/.claude/settings.json`, `.planning/config.json` (per-project)
- Issue: Settings are split across global (`~/.claude/settings.json`) and local (`.planning/config.json`) configs with migration logic in `~/.claude/get-shit-done/bin/lib/core.cjs` (lines 89-95).
- Impact: Old "depth" key auto-migrates to "granularity" silently. If migration logic breaks, configs become inconsistent.
- Fragility: The migration is one-way; no validation that migration succeeded. If write fails, corrupted state persists.
- Dependencies at risk: `phase_branch_template` and `milestone_branch_template` in config.json have no validation against git constraints (invalid characters, reserved names).
- Recommendation: Add validation when loading config; warn on deprecated keys rather than auto-migrate.

## Agent Spawning Complexity

**Sub-agent orchestration:**
- Files: `~/.claude/agents/gsd-planner.md` (spawns research agents), `~/.claude/agents/gsd-executor.md` (spawns verification agents), various workflow markdown files
- Issue: Multiple agents spawn in parallel with implicit dependencies (e.g., gsd-executor waits for all plan files before spawning verification agents). No explicit DAG or dependency graph.
- Impact: If one spawned agent fails silently, parent agent doesn't know and continues as if it succeeded.
- Fragility: Agents communicate via file system (writing to `.planning/` directories). No atomic operations or transaction logs; partial writes can corrupt state.
- Safe modification: When adding new spawned agents, document the dependency chain explicitly in parent agent's frontmatter.
- Test coverage: Agent spawning logic is not tested; verified only through full GSD workflow execution.
- Priority: **High** — A crash or timeout in a spawned agent can leave the project in an undefined state.

## Implicit Markdown Dependencies

**Documentation-as-code approach:**
- Files: All `~/.claude/agents/*.md`, `~/.claude/commands/*.md`, `~/.claude/get-shit-done/workflows/*.md`
- Issue: Agents and workflows reference each other via hardcoded `@./.claude/get-shit-done/...` paths. If a file is moved, renamed, or deleted, references break silently (they just become dead links).
- Impact: An agent that should load verification patterns (`@./.claude/get-shit-done/references/verification-patterns.md`) silently skips that context if the file moves.
- Fragility: No validation that `@file:` references exist. No build step to detect broken links.
- Safe modification: When moving/renaming files, grep for all references: `grep -r "get-shit-done/references/verification-patterns" ~/.claude/`
- Recommendation: Add a lint step that validates all `@file:` and `@./.claude/` references before commit.

## Model Profile Resolution Uncertainty

**Model selection logic:**
- Files: `~/.claude/get-shit-done/bin/lib/core.cjs` (lines 18-31 define MODEL_PROFILES table)
- Issue: Model profiles (quality, balanced, budget) are hardcoded for each agent type. If a new agent is added without an entry in MODEL_PROFILES, it silently defaults to undefined behavior.
- Impact: New agents won't be able to resolve their model; CLI output may be JSON with null model field, confusing downstream operations.
- Current behavior: `resolveModelInternal()` doesn't validate that a profile name exists; it just returns whatever is in the table or null.
- Safe modification: Always add MODEL_PROFILES entry when adding a new agent to `~/.claude/agents/`.
- Recommendation: Add validation that every referenced agent has an entry in MODEL_PROFILES.

## Path Handling Cross-Platform Issues

**Path normalization:**
- Files: `~/.claude/get-shit-done/bin/lib/core.cjs` (line 12, `toPosixPath()` function)
- Issue: Core utilities convert paths to POSIX format (forward slashes), but some operations still use `path.join()` which produces platform-specific separators.
- Impact: On Windows, mixed path separators may cause subtle breakage in path comparisons or file lookups. Tests may pass on Linux/Mac and fail on Windows.
- Fragility: Path handling is scattered across multiple modules; no consistent strategy.
- Safe modification: Audit all path operations in `phase.cjs`, `init.cjs`, and `state.cjs` to ensure consistent use of either `toPosixPath()` or explicit path.join().

## State File Concurrency

**STATE.md mutations:**
- Files: `~/.claude/get-shit-done/bin/lib/state.cjs`
- Issue: Multiple agents may read/write STATE.md concurrently when running in parallel. The library uses simple fs.readFileSync/writeFileSync with no locking.
- Impact: Race conditions possible when two agents try to update different fields simultaneously; last write wins, potentially losing data.
- Example: Phase executor reads STATE.md, spawns two verification agents in parallel. Both agents try to update different plan summaries. One write may overwrite the other.
- Safe modification: Difficult without introducing significant complexity. Current workaround: document that parallel state mutations must target different top-level sections.
- Recommendation: Add a simple file-based lock in state.cjs before any write operation.

## Frontmatter Parsing Robustness

**YAML frontmatter parsing:**
- Files: `~/.claude/get-shit-done/bin/lib/frontmatter.cjs`
- Issue: Extracts YAML frontmatter using regex-based parsing, not a full YAML parser. Handles edge cases like escape sequences inconsistently.
- Impact: Malformed frontmatter (tabs instead of spaces, quoted keys) may not parse correctly, causing silent failures or incorrect data extraction.
- Example: `must_haves: |` (literal block) will confuse the regex parser.
- Safe modification: Add comprehensive tests for frontmatter edge cases before modifying parsing logic.
- Test coverage: No automated tests for frontmatter parsing.

## Bash Injection in Config

**Git commit construction:**
- Files: `~/.claude/get-shit-done/bin/lib/commands.cjs` (git commit command)
- Issue: Commit messages are constructed from user-provided data (phase names, milestone names) and passed to shell without proper escaping in some cases.
- Impact: User data from ROADMAP.md titles could potentially inject shell commands if not escaped.
- Current status: Safe guards exist (comment in earlier commit: "Rewrite wrapup command with bash injection and safety guards"), but worth auditing.
- Safe modification: Any changes to commit message construction must use shell-safe quoting (single quotes or proper escaping).

## Cache Invalidation Complexity

**GSD file manifest:**
- Files: `~/.claude/.claude/gsd-file-manifest.json` (stores SHA256 hashes of all GSD files)
- Issue: Manual file manifest tracking. If a GSD file is updated but manifest not regenerated, downstream operations may use stale logic.
- Impact: Updates to agent definitions or workflow files take effect only after manifest is rebuilt. No automatic detection of changes.
- Current workaround: Manifest is updated on plugin install/update, but local edits may not trigger rebuild.
- Risk: Difficult to diagnose "my changes aren't taking effect" issues.

## Documentation Audience Mismatch

**Agent instructions complexity:**
- Files: All `~/.claude/agents/*.md` files
- Issue: Agents are written for Claude, not humans. Extensive internal logic, hypothesis testing frameworks, and meta-instructions make these files useless as reference documentation for users.
- Impact: When users encounter agent behavior that seems wrong, they can't read the agent file to understand why. Bug reports will lack context.
- Safe modification: Separate agent logic from user-facing documentation. Create human-readable guides in `docs/` directory that explain agent decision-making at a high level.

## Symlink Dependencies

**Project linking strategy:**
- Files: `~/.claude/projects/` (symlinks to `~/.local/src/`) and `~/.claude/marketplaces/` (symlinks to marketplace sources)
- Issue: Codebase depends on symlinks that point outside the repository. If symlink targets are deleted or moved, the workspace breaks silently.
- Impact: If a project is deleted from `~/.local/src/`, it remains in the workspace as a broken link. No warning or cleanup.
- Current status: CLAUDE.md documents this architecture, but no validation that symlinks are valid.
- Safe modification: When managing symlinks, verify targets exist before creating links. Add periodic link validation.
- Recommendation: Add a health check command that validates all symlink targets.

## Version Pinning Uncertainty

**GSD version tracking:**
- Files: `~/.claude/.claude/get-shit-done/VERSION` (contains "1.22.4")
- Issue: Version is stored as a string in a single file. No semantic versioning guarantees or breaking change tracking between versions.
- Impact: Upgrading GSD (via `/gsd:update`) may introduce incompatible changes. No explicit migration path documented.
- Current workaround: Update hook (`gsd-check-update.js`) checks for newer versions but provides no upgrade safety guarantees.
- Risk: Users may end up running mixed versions (old project config with new GSD agent logic), causing unpredictable failures.

## Missing Error Logs

**Silent failure patterns:**
- Files: `~/.claude/hooks/gsd-context-monitor.js` (line 137-140), `~/.claude/hooks/gsd-check-update.js`
- Issue: All hook errors are caught and silently swallowed (`catch (e) { process.exit(0) }`). No logging to file or stderr.
- Impact: When a hook fails, there's no trace of what went wrong. Debugging hook issues requires guessing.
- Safe modification: Never remove error handling from hooks (they must not block tool execution), but consider writing errors to a log file for diagnostic purposes.
- Recommendation: Add optional hook logging to `~/.claude/logs/hooks.log` for post-mortem debugging.

## Planning Dependency Documentation

**ROADMAP.md format stability:**
- Files: `.planning/ROADMAP.md` (used by all agents to understand phases)
- Issue: ROADMAP format is parsed via regex in multiple places (phase.cjs, roadmap.cjs). If format changes, all parsers break.
- Impact: Adding new fields to phase sections requires coordinated changes across multiple libraries.
- Fragility: No schema validation for ROADMAP structure; invalid markdown will be parsed as empty sections silently.
- Safe modification: Before changing ROADMAP format, update the parsing logic in all affected libraries. Add comprehensive tests for parsing.
- Recommendation: Consider adopting a standard format (JSON frontmatter in ROADMAP.md) for more robust parsing.

## Unvalidated Template Substitution

**Branching strategy templates:**
- Files: `~/.claude/get-shit-done/bin/lib/init.cjs` (lines 55-63)
- Issue: Branch name templates are user-configurable in config.json (`phase_branch_template`, `milestone_branch_template`). Template substitution is simple string.replace() with no validation.
- Impact: Invalid placeholder names or special characters in templates will produce invalid git branch names, causing git commands to fail cryptically.
- Safe modification: Add validation when loading config that branch templates contain only valid placeholder names (`{phase}`, `{slug}`, `{milestone}`).

---

*Concerns audit: 2026-03-14*
