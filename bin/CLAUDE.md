# bin/ -- Executable scripts

Scripts and tools for home directory operations.

## contents

- `healthcheck` -- verifies environment sanity: home dir, gt cli, bd/beads, dolt server, git config, claude_home rig. Run: `./bin/healthcheck`

### Context scripts

Generic context generation scripts (originally by Dot). Produce system prompt context for agents.

- `context.sh` -- main orchestrator, calls all component scripts. Usage: `./bin/context.sh [AGENT_DIR]`
- `context-journal.sh` -- journal entries (supports flat + subdirectory formats). Usage: `./bin/context-journal.sh [AGENT_DIR]`
- `context-git.sh` -- git status + recent commits (with truncation)
- `context-workspace.sh` -- workspace tree structure
- `build-system-prompt.sh` -- reads gptme.toml and builds a full system prompt
- `find-agent-root.sh` -- agent root detection

All context scripts accept an optional `AGENT_DIR` argument. Default: git repo root.
