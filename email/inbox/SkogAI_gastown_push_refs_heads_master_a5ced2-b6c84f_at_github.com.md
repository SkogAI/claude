MIME-Version: 1.0
From: Skogix <noreply@github.com>
To: Emil@skogsund.se
Date: Sat, 17 Jan 2026 08:00:07 -0800
Subject: [SkogAI/gastown] 32b41b: fix: improve rig name validation error message
Message-ID: <SkogAI/gastown/push/refs/heads/master/a5ced2-b6c84f@github.com>
Content-Type: text/plain; charset="UTF-8"

  Branch: refs/heads/master
  Home:   https://github.com/SkogAI/gastown
  Commit: 32b41b80bee5a154265fc44ed76247c81efa6f62
      https://github.com/SkogAI/gastown/commit/32b41b80bee5a154265fc44ed76247c81efa6f62
  Author: Olivier Debeuf De Rijcker <olivier@markov.bot>
  Date:   2026-01-04 (Sun, 04 Jan 2026)

  Changed paths:
    M internal/rig/manager.go

  Log Message:
  -----------
  fix: improve rig name validation error message

Suggest underscore-based alternatives instead of just removing invalid chars:
- MyProject.jl → myproject_jl (instead of MyProjectjl)
- op-baby → op_baby (instead of opbaby)
- my rig → my_rig (instead of myrig)

Clarifies that underscores are allowed, making the message more helpful
for Julia projects and similar naming conventions.

Closes #97

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: 7674103172381684be8455ea04865d622a601f86
      https://github.com/SkogAI/gastown/commit/7674103172381684be8455ea04865d622a601f86
  Author: Olivier Debeuf De Rijcker <olivier@markov.bot>
  Date:   2026-01-04 (Sun, 04 Jan 2026)

  Changed paths:
    M .github/workflows/ci.yml
    A .github/workflows/integration.yml

  Log Message:
  -----------
  ci: add go generate steps for formula embed files

Cherry-pick CI fixes from PR #93 to fix broken CI on main.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: eb89a6a6fb12021cf4334a8a3568501fb1233906
      https://github.com/SkogAI/gastown/commit/eb89a6a6fb12021cf4334a8a3568501fb1233906
  Author: gus <steve.yegge@gmail.com>
  Date:   2026-01-04 (Sun, 04 Jan 2026)

  Changed paths:
    M .beads/formulas/mol-witness-patrol.formula.toml
    M .beads/issues.jsonl
    M .beads/last-touched
    M .github/workflows/integration.yml
    M .gitignore
    M .golangci.yml
    M Makefile
    M README.md
    A docs/architecture.md
    M docs/operational-state.md
    M go.mod
    M go.sum
    A internal/activity/activity.go
    A internal/activity/activity_test.go
    A internal/beads/agent_ids.go
    A internal/beads/agent_ids_test.go
    M internal/beads/audit.go
    M internal/beads/beads.go
    M internal/beads/catalog.go
    M internal/beads/daemon.go
    M internal/beads/routes.go
    M internal/boot/boot.go
    M internal/checkpoint/checkpoint.go
    M internal/claude/settings.go
    M internal/cmd/agents.go
    M internal/cmd/audit.go
    M internal/cmd/boot.go
    M internal/cmd/callbacks.go
    M internal/cmd/convoy.go
    M internal/cmd/costs.go
    M internal/cmd/costs_test.go
    M internal/cmd/crew_helpers.go
    M internal/cmd/crew_lifecycle.go
    M internal/cmd/cycle.go
    A internal/cmd/dashboard.go
    A internal/cmd/dashboard_test.go
    M internal/cmd/deacon.go
    M internal/cmd/dnd_test.go
    M internal/cmd/doctor.go
    M internal/cmd/dog.go
    M internal/cmd/done.go
    M internal/cmd/down.go
    M internal/cmd/feed.go
    M internal/cmd/formula.go
    M internal/cmd/gitinit.go
    M internal/cmd/handoff.go
    M internal/cmd/hook.go
    M internal/cmd/install.go
    M internal/cmd/install_integration_test.go
    M internal/cmd/issue.go
    M internal/cmd/mail.go
    M internal/cmd/mayor.go
    A internal/cmd/migrate_agents.go
    A internal/cmd/migrate_agents_test.go
    M internal/cmd/molecule_attach.go
    M internal/cmd/molecule_await_signal.go
    M internal/cmd/molecule_status.go
    M internal/cmd/molecule_step.go
    M internal/cmd/nudge.go
    M internal/cmd/nudge_test.go
    M internal/cmd/polecat_cycle.go
    M internal/cmd/polecat_cycle_test.go
    M internal/cmd/prime.go
    M internal/cmd/prime_test.go
    M internal/cmd/rig.go
    M internal/cmd/rig_integration_test.go
    M internal/cmd/session.go
    M internal/cmd/sling.go
    M internal/cmd/start.go
    M internal/cmd/status.go
    M internal/cmd/statusline.go
    M internal/cmd/stop.go
    M internal/cmd/swarm.go
    M internal/cmd/synthesis.go
    M internal/cmd/theme.go
    M internal/cmd/town_cycle.go
    M internal/cmd/up.go
    M internal/cmd/version.go
    M internal/cmd/witness.go
    M internal/config/loader.go
    M internal/config/loader_test.go
    M internal/config/overseer.go
    M internal/config/types.go
    M internal/connection/local.go
    M internal/constants/constants.go
    M internal/crew/manager.go
    M internal/crew/manager_test.go
    M internal/daemon/daemon.go
    M internal/daemon/lifecycle.go
    M internal/daemon/lifecycle_test.go
    M internal/deacon/heartbeat.go
    M internal/deacon/stuck.go
    M internal/doctor/agent_beads_check.go
    M internal/doctor/bd_daemon_check.go
    M internal/doctor/commands_check.go
    M internal/doctor/hook_check.go
    M internal/doctor/lifecycle_check.go
    M internal/doctor/orphan_check.go
    M internal/doctor/patrol_check.go
    M internal/doctor/rig_check.go
    M internal/doctor/tmux_check.go
    M internal/doctor/workspace_check.go
    M internal/dog/manager.go
    M internal/events/events.go
    M internal/feed/curator.go
    A internal/formula/embed.go
    M internal/formula/parser.go
    M internal/git/git.go
    M internal/git/git_test.go
    M internal/lock/lock.go
    M internal/mail/mailbox.go
    M internal/mail/router.go
    M internal/mail/router_test.go
    M internal/mrqueue/events.go
    M internal/mrqueue/mrqueue.go
    M internal/polecat/manager.go
    M internal/protocol/refinery_handlers.go
    M internal/protocol/witness_handlers.go
    M internal/refinery/engineer.go
    M internal/refinery/manager.go
    M internal/rig/manager.go
    M internal/rig/manager_test.go
    M internal/rig/types.go
    M internal/session/identity.go
    M internal/session/identity_test.go
    M internal/session/manager.go
    M internal/session/names.go
    M internal/session/names_test.go
    M internal/swarm/landing.go
    M internal/swarm/manager.go
    M internal/swarm/types.go
    M internal/swarm/types_test.go
    M internal/templates/roles/boot.md.tmpl
    M internal/templates/roles/deacon.md.tmpl
    M internal/templates/templates.go
    M internal/templates/templates_test.go
    M internal/tmux/theme.go
    M internal/tmux/tmux.go
    M internal/townlog/logger.go
    M internal/tui/convoy/model.go
    M internal/tui/feed/convoy.go
    M internal/tui/feed/events.go
    M internal/tui/feed/mq_source.go
    A internal/web/fetcher.go
    A internal/web/handler.go
    A internal/web/handler_test.go
    A internal/web/templates.go
    A internal/web/templates/convoy.html
    A internal/web/templates_test.go
    M internal/wisp/io.go
    M internal/witness/handlers.go
    M internal/witness/protocol.go
    M internal/workspace/find.go
    M internal/workspace/find_test.go

  Log Message:
  -----------
  Merge origin/main into fix/improve-rig-name-error-message

Resolved conflicts:
- .github/workflows/ci.yml: Keep go generate step
- .github/workflows/integration.yml: Merge beads setup + broader test path
- internal/rig/manager.go: Use main's 3-param initAgentBeads signature


  Commit: 5592811eb2e1723b9cc19c2c9bf0bcf8dbd512ab
      https://github.com/SkogAI/gastown/commit/5592811eb2e1723b9cc19c2c9bf0bcf8dbd512ab
  Author: julianknutsen <julianknutsen@users.noreply.github.com>
  Date:   2026-01-07 (Wed, 07 Jan 2026)

  Changed paths:
    M internal/doctor/claude_settings_check.go
    M internal/doctor/claude_settings_check_test.go

  Log Message:
  -----------
  fix(doctor): warn instead of killing sessions for stale town-root settings

When gt doctor --fix detects stale Claude settings at town root, it was
automatically killing ALL Gas Town sessions (gt-* and hq-*). This is too
disruptive because:

1. Deacon runs gt doctor automatically, creating a restart loop
2. Active crew/polecat work could be lost mid-task
3. Settings are only read at startup, so running agents already have
   the config loaded in memory

Instead, warn the user and tell them to restart agents manually:
"Town-root settings were moved. Restart agents to pick up new config:
    gt up --restart"

Addresses PR #239 feedback.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


  Commit: db75c2b0d353cb156afc9b139d540372121f757b
      https://github.com/SkogAI/gastown/commit/db75c2b0d353cb156afc9b139d540372121f757b
  Author: Emil Skogsund <emil@skogsund.se>
  Date:   2026-01-17 (Sat, 17 Jan 2026)

  Changed paths:

  Log Message:
  -----------
  Merge remote-tracking branch 'origin/fix/settings-restart-warning'


  Commit: b6c84f44ad101f339be2d95b51c5415db7262665
      https://github.com/SkogAI/gastown/commit/b6c84f44ad101f339be2d95b51c5415db7262665
  Author: Emil Skogsund <emil@skogsund.se>
  Date:   2026-01-17 (Sat, 17 Jan 2026)

  Changed paths:
    M .github/workflows/ci.yml

  Log Message:
  -----------
  Merge remote-tracking branch 'origin/fix/improve-rig-name-error-message'


Compare: https://github.com/SkogAI/gastown/compare/a5ced2eb8b4e...b6c84f44ad10

To unsubscribe from these emails, change your notification settings at https://github.com/SkogAI/gastown/settings/notifications

