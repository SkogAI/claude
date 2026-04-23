MIME-Version: 1.0
From: Skogix <noreply@github.com>
To: Emil@skogsund.se
Date: Sat, 17 Jan 2026 07:59:34 -0800
Subject: [SkogAI/gastown] 723c85: test: add comprehensive doctor integration tests
Message-ID: <SkogAI/gastown/push/refs/heads/master/718ace-a5ced2@github.com>
Content-Type: text/plain; charset="UTF-8"

  Branch: refs/heads/master
  Home:   https://github.com/SkogAI/gastown
  Commit: 723c85428e94b4c74c6c1e85610a4f3967fec329
      https://github.com/SkogAI/gastown/commit/723c85428e94b4c74c6c1e85610a4f3967fec329
  Author: mayor <erik.labianca@gmail.com>
  Date:   2026-01-10 (Sat, 10 Jan 2026)

  Changed paths:
    A internal/doctor/integration_test.go
    M internal/doctor/orphan_check_test.go

  Log Message:
  -----------
  test: add comprehensive doctor integration tests

Add integration tests for doctor functionality covering:
- Town setup validation
- Orphan session detection accuracy (false positive prevention)
- Crew session protection (never auto-killed)
- BEADS_DIR per-rig level validation
- Environment variable mismatch detection
- Fix reliability (idempotency, no breaking working state)
- Session naming consistency

These tests help ensure doctor accurately diagnoses issues without
false positives, and that --fix reliably resolves problems without
breaking working configurations.

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: 6ef9a8b31f9cb33816170d230f191c51c69320f1
      https://github.com/SkogAI/gastown/commit/6ef9a8b31f9cb33816170d230f191c51c69320f1
  Author: mayor <erik.labianca@gmail.com>
  Date:   2026-01-10 (Sat, 10 Jan 2026)

  Changed paths:
    M internal/beads/beads.go
    M internal/polecat/manager.go

  Log Message:
  -----------
  fix: prevent inherited BEADS_DIR from causing prefix mismatch

The beads.run() function now always explicitly sets BEADS_DIR based on
the working directory or explicit override. This prevents inherited
env vars (e.g., from mayor session) from causing prefix mismatch errors
when creating agent beads for rigs.

Root cause: When BEADS_DIR=/home/erik/gt/.beads was set in parent
environment, all bd commands used town database (hq- prefix) instead
of rig database (gt- prefix), causing "prefix mismatch: database uses
'hq' but you specified 'gt'" errors.

Also updated polecat manager to use NewWithBeadsDir for explicitness.

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: 2b81d9c7db0b1cd0e246a9cd5f5bc28fa0522630
      https://github.com/SkogAI/gastown/commit/2b81d9c7db0b1cd0e246a9cd5f5bc28fa0522630
  Author: mayor <erik.labianca@gmail.com>
  Date:   2026-01-10 (Sat, 10 Jan 2026)

  Changed paths:
    M internal/cmd/beads_routing_integration_test.go
    M internal/rig/manager_test.go

  Log Message:
  -----------
  test: improve BEADS_DIR validation and routing tests

Recovered from polecats slit and rictus:

- manager_test.go: Add assertBeadsDirLog helper and assertions to verify
  BEADS_DIR is correctly set when initializing agent beads (from slit)

- beads_routing_integration_test.go: Convert log-only tests to asserting
  tests that actually verify routing behavior (from rictus)

Addresses gt-c2v (BEADS_DIR tests need actual env validation) and
gt-ce4 (Convert log-only integration tests to asserting).

Co-Authored-By: slit (gastown/slit) <polecat@gastown.local>
Co-Authored-By: rictus (gastown/rictus) <polecat@gastown.local>
Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: 89180a84e0b6719a166254ea3112d5169bf039bb
      https://github.com/SkogAI/gastown/commit/89180a84e0b6719a166254ea3112d5169bf039bb
  Author: mayor <erik.labianca@gmail.com>
  Date:   2026-01-10 (Sat, 10 Jan 2026)

  Changed paths:
    M internal/doctor/orphan_check.go
    M internal/doctor/orphan_check_test.go

  Log Message:
  -----------
  test: add deterministic orphan session check test

Add SessionLister interface and mock for dependency injection, enabling
deterministic testing of OrphanSessionCheck.Run() without depending on
real tmux state.

New test: TestOrphanSessionCheck_Run_Deterministic verifies:
- Valid sessions (existing rigs) are not marked as orphans
- Invalid sessions (unknown rigs) are correctly detected as orphans
- Non-gt sessions are ignored
- FixHint and Details are properly populated

Addresses gt-mi4 (Add deterministic orphan session Run path test).

Co-Authored-By: dementus (gastown/dementus) <polecat@gastown.local>
Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: 3ce5e3b3a9833753bb29dd33dd37bf410539ddf0
      https://github.com/SkogAI/gastown/commit/3ce5e3b3a9833753bb29dd33dd37bf410539ddf0
  Author: george <steve.yegge@gmail.com>
  Date:   2026-01-10 (Sat, 10 Jan 2026)

  Changed paths:
    M internal/beads/beads_agent.go

  Log Message:
  -----------
  fix(beads): set --type=agent when creating agent beads

CreateAgentBead was creating beads with only --labels=gt:agent but
bd create defaults to --type=task. The bd slot set command requires
type=agent to set slots, causing warnings during gt install and
gt rig add.

Fixes #315

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: d4e8c9264215d390be7d400b01ce5b226f5f1485
      https://github.com/SkogAI/gastown/commit/d4e8c9264215d390be7d400b01ce5b226f5f1485
  Author: Erik LaBianca <erik.labianca@gmail.com>
  Date:   2026-01-10 (Sat, 10 Jan 2026)

  Changed paths:
    M internal/witness/manager.go

  Log Message:
  -----------
  fix(witness): use town-level beads for role config lookup (#320)

The witness manager was using rig-level beads path to look up role
configuration, but role beads use the hq- prefix and live in town-level
beads. This caused "unexpected end of JSON input" errors when starting
witnesses because the rig database (with gt- prefix) couldn't find
hq-witness-role.

Changed roleConfig() to use townRoot instead of rig.BeadsPath() to
correctly resolve town-level role beads.

Co-authored-by: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: 6e01ecfc8e2fe3d2f67581c7eac5d7826f59155e
      https://github.com/SkogAI/gastown/commit/6e01ecfc8e2fe3d2f67581c7eac5d7826f59155e
  Author: tanevanwifferen <tanevanwifferen@gmail.com>
  Date:   2026-01-10 (Sat, 10 Jan 2026)

  Changed paths:
    M internal/dog/manager.go
    M internal/polecat/manager.go

  Log Message:
  -----------
  fix(worktree): use rig's configured default branch for polecat/dog worktrees (#325)

When a rig is added with --branch <non-default>, polecats and dogs now
correctly create worktrees from origin/<configured-branch> instead of
always using main/HEAD.

Co-authored-by: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: 165811aff797fd9fdf5214da83b04e14bbc61be7
      https://github.com/SkogAI/gastown/commit/165811aff797fd9fdf5214da83b04e14bbc61be7
  Author: dennis <steve.yegge@gmail.com>
  Date:   2026-01-10 (Sat, 10 Jan 2026)

  Changed paths:
    M internal/tmux/tmux.go
    M internal/tmux/tmux_test.go

  Log Message:
  -----------
  fix(crew): detect running sessions started with shell compound commands

IsClaudeRunning now checks for child processes when the pane command is
a shell (bash/zsh). This fixes gt crew start --all killing running crew
members that were started with "export ... && claude ..." commands.

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: 5c95254b0c9573bc800f57a2163482f78f947204
      https://github.com/SkogAI/gastown/commit/5c95254b0c9573bc800f57a2163482f78f947204
  Author: gus <steve.yegge@gmail.com>
  Date:   2026-01-10 (Sat, 10 Jan 2026)

  Changed paths:
    A .beads/formulas/mol-polecat-code-review.formula.toml
    A .beads/formulas/mol-polecat-review-pr.formula.toml
    M .beads/formulas/mol-polecat-work.formula.toml
    M docs/polecat-lifecycle.md
    A internal/formula/formulas/mol-polecat-code-review.formula.toml
    A internal/formula/formulas/mol-polecat-review-pr.formula.toml
    M internal/formula/formulas/mol-polecat-work.formula.toml
    M templates/polecat-CLAUDE.md

  Log Message:
  -----------
  feat(polecat): self-cleaning model and new review formulas

Polecats now self-clean when done:
- gt done always exits session (no more --exit flag needed)
- gt done requests self-nuke (sandbox cleanup)
- No idle polecats - done means gone
- Refinery re-implements on conflict (never sends work back)

New formulas:
- mol-polecat-review-pr: review external PRs, approve/reject
- mol-polecat-code-review: review code, file beads for findings

Docs updated:
- polecat-lifecycle.md: self-cleaning model, identity vs session
- polecat-CLAUDE.md: updated contract and completion protocol
- mol-polecat-work: updated for self-cleaning

Implementation beads filed:
- gt-yrz4k: gt done always exits
- gt-fqcst: polecat self-nuke mechanism
- gt-zdmde: abstract work unit completion

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: d3ae01f47658c811a5761f7888340a78f2b9d158
      https://github.com/SkogAI/gastown/commit/d3ae01f47658c811a5761f7888340a78f2b9d158
  Author: george <steve.yegge@gmail.com>
  Date:   2026-01-10 (Sat, 10 Jan 2026)

  Changed paths:
    M internal/cmd/prime.go
    A internal/cmd/prime_molecule.go
    A internal/cmd/prime_output.go
    A internal/cmd/prime_session.go
    A internal/cmd/prime_state.go

  Log Message:
  -----------
  refactor(prime): split 1833-line file into logical modules

Extract prime.go into focused files:
- prime_session.go: session ID handling, hooks, persistence
- prime_output.go: all output/rendering functions
- prime_molecule.go: molecule workflow context
- prime_state.go: handoff markers, session state detection

Main prime.go now ~730 lines with core flow visible as "table of contents".
No behavior changes - pure file organization following Go idioms.

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: acef1d4de497b737dbbc2b4e7d609c65485eff71
      https://github.com/SkogAI/gastown/commit/acef1d4de497b737dbbc2b4e7d609c65485eff71
  Author: george <steve.yegge@gmail.com>
  Date:   2026-01-10 (Sat, 10 Jan 2026)

  Changed paths:
    M internal/cmd/prime.go

  Log Message:
  -----------
  fix(prime): add --state flag exclusivity validation

The --state flag is meant for quick state checks and cannot be
combined with --hook, --dry-run, or --explain flags.

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: 74d0832a2b1d65ab8142c5a0d9eb2b4e43f4fda7
      https://github.com/SkogAI/gastown/commit/74d0832a2b1d65ab8142c5a0d9eb2b4e43f4fda7
  Author: dementus <erik.labianca@gmail.com>
  Date:   2026-01-10 (Sat, 10 Jan 2026)

  Changed paths:
    M AGENTS.md

  Log Message:
  -----------
  docs(agents): trim AGENTS.md to bootstrap pointer

Replace verbose instructions with concise 9-line file directing
agents to run `bd onboard` for setup.

Closes: gt-4oi

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: 00c68cfa9034c1217881ad62d89e2d4818e4b8ba
      https://github.com/SkogAI/gastown/commit/00c68cfa9034c1217881ad62d89e2d4818e4b8ba
  Author: cheedo <erik.labianca@gmail.com>
  Date:   2026-01-10 (Sat, 10 Jan 2026)

  Changed paths:
    M internal/cmd/install.go
    M internal/cmd/install_integration_test.go

  Log Message:
  -----------
  fix(install): allow --wrappers in existing town without recreating HQ

When running `gt install --wrappers` in an existing Gas Town HQ,
the command now installs wrappers directly without requiring --force
or recreating the entire HQ structure.

Previously, `gt install --wrappers` would fail with "directory is
already a Gas Town HQ" unless --force was used, which would then
unnecessarily reinitialize the entire workspace.

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: cb70ea4b3533e097fbbb46262f9e4767705a10ed
      https://github.com/SkogAI/gastown/commit/cb70ea4b3533e097fbbb46262f9e4767705a10ed
  Author: morsov <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    A .beads/issues/hq-gxwn/investigation-report.md
    A .beads/issues/hq-gxwn/local-fix-proposal.md
    A .beads/issues/hq-gxwn/upstream-issue.md

  Log Message:
  -----------
  docs(hq-gxwn): investigation of tmux/Claude zombie sessions

Investigation findings:
- 12 orphaned Claude processes found consuming ~5.8GB memory
- 115 MCP server processes accumulated without cleanup
- Root cause: Claude Code doesn't handle SIGHUP from tmux properly
- Related upstream issues: #1935, #13126, #5545

Deliverables:
- investigation-report.md: Full technical analysis
- upstream-issue.md: Ready-to-file bug report
- local-fix-proposal.md: Gas Town mitigation proposals

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: 74fcf449ae0755c44510ae858ce1b58879f80ea6
      https://github.com/SkogAI/gastown/commit/74fcf449ae0755c44510ae858ce1b58879f80ea6
  Author: organic <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    M internal/beads/beads.go
    M internal/cmd/down.go
    M internal/cmd/install.go
    M internal/cmd/root.go
    M internal/doctor/priming_check.go
    M internal/polecat/manager.go

  Log Message:
  -----------
  fix: prevent inherited BEADS_DIR from causing prefix mismatch


  Commit: 16ed5272cbd234269304538f9023ef89253a08f3
      https://github.com/SkogAI/gastown/commit/16ed5272cbd234269304538f9023ef89253a08f3
  Author: angharad <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    M internal/cmd/deacon.go
    M internal/config/loader.go
    M internal/config/loader_test.go
    M internal/deacon/manager.go
    M internal/mayor/manager.go
    M internal/witness/manager.go

  Log Message:
  -----------
  fix(mayor): respect default account from gt account default

When running gt mayor attach (or gt deacon attach, gt witness), sessions
now use CLAUDE_CONFIG_DIR from the default account configured via
'gt account default'.

The fix:
- Added claudeConfigDir parameter to BuildAgentStartupCommandWithAgentOverride
- Resolves account config dir in mayor, deacon, witness, and cmd/deacon startup
- Sets CLAUDE_CONFIG_DIR in both the startup command exports and AgentEnv

Previously, these agents launched without CLAUDE_CONFIG_DIR set, falling back
to ~/.claude instead of using the configured account (e.g., ~/.claude-accounts/syn).

Closes: hq-o72h

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: 54dd9ff134a95a922dc35a5f306e985f850d7c48
      https://github.com/SkogAI/gastown/commit/54dd9ff134a95a922dc35a5f306e985f850d7c48
  Author: max <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    M internal/refinery/manager.go

  Log Message:
  -----------
  fix(refinery): use default Claude account and resolve config dir

Refineries were not properly initializing:
- Not using the default Claude account configured via 'gt account default'
- Not setting RuntimeConfigDir in AgentEnv, preventing CLAUDE_CONFIG_DIR
  from being set correctly

This aligns refinery spawn with how polecats and crew handle account
resolution (via config.ResolveAccountConfigDir).

The SessionStart hook with 'gt prime' was already present in the
autonomous template - this fix ensures the account context is correct.

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: 9f13b709a72df4abf2e57e9e90be396f36d4a420
      https://github.com/SkogAI/gastown/commit/9f13b709a72df4abf2e57e9e90be396f36d4a420
  Author: gastown/refinery <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    M AGENTS.md
    M internal/cmd/beads_routing_integration_test.go
    M internal/cmd/install.go
    M internal/cmd/install_integration_test.go
    A internal/doctor/integration_test.go
    M internal/doctor/orphan_check.go
    M internal/doctor/orphan_check_test.go
    M internal/refinery/manager.go
    M internal/rig/manager_test.go

  Log Message:
  -----------
  Merge remote-tracking branch 'origin/polecat/max-mka07c8j'


  Commit: 12811b83ed109ff20ed81c09a43abb4d81058e3e
      https://github.com/SkogAI/gastown/commit/12811b83ed109ff20ed81c09a43abb4d81058e3e
  Author: immortan <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    M internal/cmd/root.go
    A internal/cmd/update.go
    M internal/doctor/stale_binary_check.go

  Log Message:
  -----------
  feat: add gt update command for binary rebuilds

The gt install command creates new workspaces, not update binaries.
This was confusing when stale binary warnings suggested running
'gt install' to update.

This commit adds a new gt update command that:
- Rebuilds gt binary from the local repository
- Installs to the current binary location
- Includes proper version info (git tag, commit, build time)
- Handles replacing running executables atomically
- Supports --dry-run and --force flags

Also updated stale binary warnings and doctor check to reference
'gt update' instead of 'gt install'.

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>


  Commit: ab3252336248e3cd8bc3d8ed901cd4f9ecbfa97a
      https://github.com/SkogAI/gastown/commit/ab3252336248e3cd8bc3d8ed901cd4f9ecbfa97a
  Author: toecutter <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    R .beads/issues.jsonl
    A internal/cmd/cleanup.go
    A internal/cmd/ps.go

  Log Message:
  -----------
  feat: add gt ps and gt cleanup commands for orphan process management

Implements two new commands for managing Gas Town processes:

1. gt ps - List all tmux sessions with process information
   - Shows session names, status (alive/dead), commands, PIDs
   - Displays work-on-hook status for polecats
   - Supports --json and --verbose flags
   - Highlights Gas Town sessions

2. gt cleanup - Manage orphaned processes and sessions
   - cleanup orphans: Find work assigned to dead agents
   - cleanup sessions: Clean up dead/zombie tmux sessions
   - cleanup stale: Clean up stale polecats (wraps gt polecat stale)
   - Supports --dry-run flag for safe inspection

Both commands integrate with existing daemon orphan detection logic
and provide manual inspection/triggering of cleanup operations.

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>


  Commit: 44ff380b8283ac6b455096e092bdcb43e9b37a4f
      https://github.com/SkogAI/gastown/commit/44ff380b8283ac6b455096e092bdcb43e9b37a4f
  Author: angharad <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    A docs/design/polecat-pooling.md

  Log Message:
  -----------
  docs(design): polecat pooling and capacity management

Comprehensive design document for managing polecat lifecycle and resources:

- Analysis of current gt sling behavior (always spawn fresh, no limits)
- Prior art research (K8s HPA, connection pooling, process pools, CI runners)
- Proposed capacity model: max_per_rig, max_total, max_concurrent
- Idle detection and reuse strategy (prefer_idle | always_fresh | always_reuse)
- Queue system for handling capacity exhaustion
- Auto-cleanup based on idle timeout and max age
- Configuration schema for town.yaml and rig.json
- Phased implementation plan

Closes: hq-0esz

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: cd9a3a8d1c49b8d3a647d217b9672983b99f4cf8
      https://github.com/SkogAI/gastown/commit/cd9a3a8d1c49b8d3a647d217b9672983b99f4cf8
  Author: max <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    A docs/design/mcp-role-config.md

  Log Message:
  -----------
  docs(design): role-based MCP server configuration to reduce process bloat

Analysis and design for reducing MCP server process accumulation:
- Currently 1000+ MCP processes across sessions
- Each session spawns 4 MCP servers (context7, playwright, filesystem, seq-thinking)
- Most roles don't need all servers

Proposes phased approach:
1. PreToolUse hook blocking (MVP) - blocks unnecessary tool calls
2. Role-specific settings templates - prevents server spawn entirely
3. Subagent inheritance (future) - addresses Task subagent spawning

Includes role-to-MCP mapping matrix and config format proposal.

Closes: hq-o6fm

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: 61e5341000b1dfee4f5b152f1826e04240b2e8e2
      https://github.com/SkogAI/gastown/commit/61e5341000b1dfee4f5b152f1826e04240b2e8e2
  Author: morsov <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    M internal/cmd/polecat_spawn.go
    M internal/cmd/sling.go
    M internal/git/git.go
    M internal/polecat/manager.go

  Log Message:
  -----------
  feat(sling): reuse idle polecats instead of always spawning new ones

When slinging to a rig, gt sling now prefers reusing idle polecats over
spawning new ones. This reduces process accumulation and provides faster
startup since the worktree already exists.

A polecat is considered idle when:
- State is 'done' (not working)
- Session is not running
- Hook is empty (no work attached)
- No unread mail

Changes:
- Add FindIdlePolecat() and CheckIdleness() to polecat manager
- Add RefreshForReuse() to prepare idle polecat for new work
- Add ResetHard() and CheckoutNewBranch() git helpers
- Add --fresh flag to force new polecat spawn
- Update SpawnPolecatForSling to check for idle polecats first
- Update help text and dry-run messages

Closes: hq-emog

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: bc8d0cf1cb23975554cd0f9f72e02ab52031a6b0
      https://github.com/SkogAI/gastown/commit/bc8d0cf1cb23975554cd0f9f72e02ab52031a6b0
  Author: gastown/refinery <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    A docs/design/mcp-role-config.md

  Log Message:
  -----------
  Merge polecat/max-mka07c8j: role-based MCP server configuration


  Commit: 436b0e509a91485df2fd2501527c6f374be3adca
      https://github.com/SkogAI/gastown/commit/436b0e509a91485df2fd2501527c6f374be3adca
  Author: gastown/refinery <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    A .beads/issues/hq-gxwn/investigation-report.md
    A .beads/issues/hq-gxwn/local-fix-proposal.md
    A .beads/issues/hq-gxwn/upstream-issue.md
    M internal/cmd/polecat_spawn.go
    M internal/cmd/sling.go
    M internal/git/git.go
    M internal/polecat/manager.go

  Log Message:
  -----------
  Merge polecat/morsov-mk9t9r6e: reuse idle polecats + zombie investigation docs


  Commit: c78e895fb228617a4c2afa03ab3b3ab26ee15b52
      https://github.com/SkogAI/gastown/commit/c78e895fb228617a4c2afa03ab3b3ab26ee15b52
  Author: gastown/refinery <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    R .beads/issues.jsonl
    A internal/cmd/cleanup.go
    A internal/cmd/ps.go

  Log Message:
  -----------
  Merge polecat/toecutter-mka3u2zy: gt ps and gt cleanup commands


  Commit: ffab8a2ce4939b2f5785d7f5cfba6d8d822ee597
      https://github.com/SkogAI/gastown/commit/ffab8a2ce4939b2f5785d7f5cfba6d8d822ee597
  Author: dementus <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    M internal/polecat/manager.go
    M internal/templates/templates.go

  Log Message:
  -----------
  feat(polecat): inject CLAUDE.md from template at spawn time

Polecats now receive Gas Town context via CLAUDE.md at spawn time,
ensuring they know their role and responsibilities even before the
SessionStart hook runs. This provides immediate context availability.

- Add CreatePolecatCLAUDEmd function to templates package
- Call it from AddWithOptions during polecat spawn
- Call it from RepairWorktreeWithOptions during worktree repair
- Call it from RefreshForReuse to keep context fresh on reuse

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: e73b5e539107b15958f25a9ab3d304e5e91ee36f
      https://github.com/SkogAI/gastown/commit/e73b5e539107b15958f25a9ab3d304e5e91ee36f
  Author: dementus <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    M internal/cmd/deacon.go
    M internal/deacon/manager.go

  Log Message:
  -----------
  fix(deacon): verify Claude session actually starts during startup

After WaitForCommand completes, explicitly verify that Claude is running
using IsClaudeRunning(). This ensures we detect cases where Claude fails
to start (e.g., binary missing, permissions issues) rather than silently
continuing with a broken session.

- Add IsClaudeRunning check after WaitForCommand in both startup paths
- Log warnings if verification fails (non-fatal, daemon handles retries)
- Updated both cmd/deacon.go and deacon/manager.go for consistency

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: 985533b4630aa86180442037560348c60a3d3224
      https://github.com/SkogAI/gastown/commit/985533b4630aa86180442037560348c60a3d3224
  Author: dementus <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    A internal/cmd/doctor_cache.go

  Log Message:
  -----------
  feat(doctor): add 'gt doctor cache' command for ~/.claude-cache management

Add subcommand to diagnose and clean up Claude's cache directory which can
grow large over time and cause inotify exhaustion (EMFILE) on startup.

Features:
- Cache diagnosis: size breakdown, age distribution, largest files
- Stale entry cleanup with --clean flag (default: >7 days old)
- Full cache wipe with --full flag
- Dry-run mode with --dry-run
- Safety: refuses to clean while Claude sessions are running
- Backup manifest created before full cleanup

Cleanable directories: debug, shell-snapshots, session-env, telemetry,
file-history (these contain transient data safe to remove when stale).

Resolves: inotify exhaustion from bloated cache directories

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: 20b39b1a7d5d5d308a46350c6106e4f72db47fd5
      https://github.com/SkogAI/gastown/commit/20b39b1a7d5d5d308a46350c6106e4f72db47fd5
  Author: dag <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    M internal/cmd/doctor.go
    A internal/doctor/limits_check.go

  Log Message:
  -----------
  feat(doctor): add limits check for file descriptors and inotify

Add comprehensive 'gt doctor limits' check that:

1. Diagnoses current state:
   - File descriptor soft/hard limits via getrlimit
   - inotify max_user_watches and max_user_instances
   - pam_limits.so enabled status
   - /etc/security/limits.conf entries
   - Open FD count per gt-related process (gt, node, claude, etc.)

2. Detects platform:
   - WSL (checks /proc/version for Microsoft)
   - macOS (uses launchctl)
   - Linux container (checks /.dockerenv and cgroups)
   - Linux bare metal (default)

3. Generates platform-specific fix script:
   - WSL: limits.conf + sysctl + wsl --shutdown reminder
   - macOS: launchctl limit + LaunchDaemon plist
   - Container: sysctl + Docker/K8s configuration hints
   - Bare metal: limits.conf + sysctl.d config

4. Target values (per bead spec):
   - nofile: 1048576 (soft and hard)
   - max_user_watches: 524288
   - max_user_instances: 1024

The check outputs a reviewable fix script rather than auto-executing
with sudo, allowing users to verify commands before running them.

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: 589a764c5365cc5d67c11ad4b5b6c91de944fb92
      https://github.com/SkogAI/gastown/commit/589a764c5365cc5d67c11ad4b5b6c91de944fb92
  Author: cheedo <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    M internal/cmd/deacon.go
    M internal/cmd/mayor.go
    M internal/cmd/witness.go
    M internal/mayor/manager.go
    M internal/witness/manager.go

  Log Message:
  -----------
  fix(attach): wait for Claude to fully initialize before sending input

When using attach commands (deacon, mayor, witness), keystrokes were
being sent before Claude was fully ready, causing input to be lost
while Claude was still in "Incubating..." state.

Changes:
- Add WaitForRuntimeReady calls before sending startup nudges
- Update attach commands to wait for ready state before attaching
- Apply consistent pattern across deacon, mayor, and witness

Fixes: gt-saj

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: d030690b865920415ee41ba435d575de4c69bb67
      https://github.com/SkogAI/gastown/commit/d030690b865920415ee41ba435d575de4c69bb67
  Author: mayor <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    A docs/design/polecat-pooling.md
    M internal/cmd/deacon.go
    M internal/config/loader.go
    M internal/config/loader_test.go
    M internal/deacon/manager.go
    M internal/mayor/manager.go
    M internal/witness/manager.go

  Log Message:
  -----------
  Merge polecat/angharad-mk9zipq4: pooling docs + default account fix


  Commit: 253f23bc5a29107a7db067e605fbfb219074af63
      https://github.com/SkogAI/gastown/commit/253f23bc5a29107a7db067e605fbfb219074af63
  Author: mayor <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    M internal/cmd/deacon.go
    M internal/cmd/mayor.go
    M internal/cmd/witness.go
    M internal/mayor/manager.go
    M internal/witness/manager.go

  Log Message:
  -----------
  Merge polecat/cheedo-mka6cpsg: attach wait for Claude init


  Commit: 864a103e0ac27d47b4362f2c8ec589291f56380a
      https://github.com/SkogAI/gastown/commit/864a103e0ac27d47b4362f2c8ec589291f56380a
  Author: mayor <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    M internal/cmd/doctor.go
    A internal/doctor/limits_check.go

  Log Message:
  -----------
  Merge polecat/dag-mka5up3t: doctor limits check


  Commit: e791b6019f4fbbe6008e4e1b4223a8348df897fa
      https://github.com/SkogAI/gastown/commit/e791b6019f4fbbe6008e4e1b4223a8348df897fa
  Author: mayor <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    M internal/polecat/manager.go
    M internal/templates/templates.go

  Log Message:
  -----------
  Merge polecat/dementus-mka5mqey: CLAUDE.md template injection


  Commit: 589022a44a5677de1db9ffe55b961313f417cba7
      https://github.com/SkogAI/gastown/commit/589022a44a5677de1db9ffe55b961313f417cba7
  Author: mayor <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    M internal/cmd/deacon.go
    M internal/deacon/manager.go

  Log Message:
  -----------
  Merge polecat/dementus-mka5zlyk: deacon startup verification


  Commit: 12283796258561d9478f5fd36dffee9702ec1f79
      https://github.com/SkogAI/gastown/commit/12283796258561d9478f5fd36dffee9702ec1f79
  Author: mayor <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    A internal/cmd/doctor_cache.go

  Log Message:
  -----------
  Merge polecat/dementus-mka696g6: doctor cache command


  Commit: f8b86d8d12d8cefeb9d023b06bd495730d36e178
      https://github.com/SkogAI/gastown/commit/f8b86d8d12d8cefeb9d023b06bd495730d36e178
  Author: mayor <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    M internal/cmd/root.go
    A internal/cmd/update.go
    M internal/doctor/stale_binary_check.go

  Log Message:
  -----------
  Merge polecat/immortan-mka3khd5: gt update command


  Commit: 317ee3a0602bd4a22d7a80997baf6a69ccf01178
      https://github.com/SkogAI/gastown/commit/317ee3a0602bd4a22d7a80997baf6a69ccf01178
  Author: cheedo <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    M internal/cmd/rig_dock.go

  Log Message:
  -----------
  fix(rig): resolve prefix mismatch for cross-rig identity beads

When docking/undocking a rig with a non-gt prefix (like grctool with
prefix grct), the code was defaulting to "gt" if r.Config.Prefix was
not set in rigs.json.

Now uses beads.GetPrefixForRig() to look up the correct prefix from
the town's routes table, which properly handles rigs like grctool,
pulseflow, and 7thsense that have their own beads prefixes.

Also simplified IsRigDocked() to resolve the prefix internally rather
than requiring callers to pass it.

Fixes: gt-e5q

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: 39afe736e854245079e1aef770346097ace085bc
      https://github.com/SkogAI/gastown/commit/39afe736e854245079e1aef770346097ace085bc
  Author: dag <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    M internal/polecat/manager.go

  Log Message:
  -----------
  fix: set workDir for bare repo to prevent worktrees from wrong repository

When creating polecat worktrees, the `repoBase()` method was passing an
empty string for the workDir parameter when creating a Git object for
the bare repository. This caused git commands to run in the current
working directory of the Go process.

If the current directory was inside a different rig's worktree (e.g.,
running gt sling from gastown/polecats/dag/gastown to create a beads
polecat), git would get confused and create the worktree from the
current rig's repository instead of the target rig's repository.

Fix: Set workDir to the rig's root directory (m.rig.Path) so git
commands run in a neutral context outside any existing worktree.

Fixes gt-u4l

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>


  Commit: cd7bd88e98fbaf351f0b3b25fd9eb9dd9e3cb59d
      https://github.com/SkogAI/gastown/commit/cd7bd88e98fbaf351f0b3b25fd9eb9dd9e3cb59d
  Author: mayor <erik.labianca@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    M internal/polecat/manager.go

  Log Message:
  -----------
  Merge: Fix workDir for bare repo worktrees (gt-u4l)


  Commit: 772c370321010abfd241ed4ceebc7db27444edfc
      https://github.com/SkogAI/gastown/commit/772c370321010abfd241ed4ceebc7db27444edfc
  Author: gastown/crew/joe <steve.yegge@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    M internal/cmd/down.go
    M internal/cmd/install.go
    M internal/cmd/root.go
    M internal/doctor/priming_check.go

  Log Message:
  -----------
  Merge origin/main into easel/main

Resolve conflicts by taking main's simpler error handling style.

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: e58429e4ad06b5d81d15de9e896b2987fabcb270
      https://github.com/SkogAI/gastown/commit/e58429e4ad06b5d81d15de9e896b2987fabcb270
  Author: mayor <steve.yegge@gmail.com>
  Date:   2026-01-11 (Sun, 11 Jan 2026)

  Changed paths:
    M internal/beads/routes.go
    M internal/cmd/beads_routing_integration_test.go

  Log Message:
  -----------
  wip: ShowWithRouting for cross-rig lookups

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: 1d0a04bd1f9b8f6c36908c7255780606094b3b65
      https://github.com/SkogAI/gastown/commit/1d0a04bd1f9b8f6c36908c7255780606094b3b65
  Author: Dylan <sigfawn@gmail.com>
  Date:   2026-01-13 (Tue, 13 Jan 2026)

  Changed paths:
    M internal/cmd/deacon.go

  Log Message:
  -----------
  fix(deacon): improve health check reliability and error handling


  Commit: 82b8010028c608b83ba5e2f1e6dc8e89f1b96a12
      https://github.com/SkogAI/gastown/commit/82b8010028c608b83ba5e2f1e6dc8e89f1b96a12
  Author: Emil Skogsund <emil@skogsund.se>
  Date:   2026-01-17 (Sat, 17 Jan 2026)

  Changed paths:

  Log Message:
  -----------
  Merge branch 'fix/deacon-reliability-rebased'


  Commit: cd27732d7c29d39938acfe3122a1c552ca27ecb8
      https://github.com/SkogAI/gastown/commit/cd27732d7c29d39938acfe3122a1c552ca27ecb8
  Author: Emil Skogsund <emil@skogsund.se>
  Date:   2026-01-17 (Sat, 17 Jan 2026)

  Changed paths:
    M internal/beads/routes.go
    M internal/cmd/beads_routing_integration_test.go

  Log Message:
  -----------
  Merge branch 'fix/beads-routing-show'


  Commit: a5ced2eb8b4e5901b11ad86cda5079dec2336571
      https://github.com/SkogAI/gastown/commit/a5ced2eb8b4e5901b11ad86cda5079dec2336571
  Author: Emil Skogsund <emil@skogsund.se>
  Date:   2026-01-17 (Sat, 17 Jan 2026)

  Changed paths:
    A .beads/issues/hq-gxwn/investigation-report.md
    A .beads/issues/hq-gxwn/local-fix-proposal.md
    A .beads/issues/hq-gxwn/upstream-issue.md
    M AGENTS.md
    A docs/design/mcp-role-config.md
    A docs/design/polecat-pooling.md
    M internal/cmd/beads_routing_integration_test.go
    A internal/cmd/cleanup.go
    M internal/cmd/deacon.go
    M internal/cmd/doctor.go
    A internal/cmd/doctor_cache.go
    M internal/cmd/install.go
    M internal/cmd/mayor.go
    M internal/cmd/polecat_spawn.go
    A internal/cmd/ps.go
    M internal/cmd/rig_dock.go
    M internal/cmd/root.go
    M internal/cmd/sling.go
    A internal/cmd/update.go
    M internal/cmd/witness.go
    M internal/config/loader.go
    M internal/config/loader_test.go
    M internal/deacon/manager.go
    A internal/doctor/limits_check.go
    M internal/doctor/stale_binary_check.go
    M internal/git/git.go
    M internal/mayor/manager.go
    M internal/polecat/manager.go
    M internal/refinery/manager.go
    M internal/rig/manager_test.go
    M internal/templates/templates.go
    M internal/witness/manager.go

  Log Message:
  -----------
  Merge branch 'easel/main'


Compare: https://github.com/SkogAI/gastown/compare/718ace2ec5db...a5ced2eb8b4e

To unsubscribe from these emails, change your notification settings at https://github.com/SkogAI/gastown/settings/notifications

