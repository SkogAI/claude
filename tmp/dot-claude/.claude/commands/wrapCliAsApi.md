---
name: wrapCliAsApi
description: Wrap CLI tools as REST API endpoints served via a stable systemd user service.
argument-hint: CLI tool name(s) and desired API endpoint structure
---

Take the specified CLI tool(s) and expose them as REST API endpoints via FastAPI, running as a stable systemd user service.

## Steps

1. **Create the FastAPI app** at the target project directory
   - One endpoint per CLI subcommand (list, get, read, etc.)
   - Parse CLI output (headers, indentation, `key = value` lines) into structured JSON
   - Use `subprocess.run` with full binary paths (not bare command names)
   - Include a `/api/health` endpoint

2. **Create a systemd start script** at `~/.config/systemd/<service-name>-start.sh`
   - Export `PATH="$HOME/.local/bin:$PATH"` for CLI tool access
   - Export any required env vars the CLI needs (e.g., config dirs)
   - Use `uvx --from "fastapi[standard]" fastapi dev` for development or `fastapi run` for production

3. **Create a systemd user service** at `~/.config/systemd/user/<service-name>.service`
   - `ExecStart` points to the start script
   - `Restart=always` with `RestartSec=5`
   - `WorkingDirectory` set to the project directory
   - Enable with `systemctl --user enable --now`

4. **Test each endpoint** with `curl` and verify JSON output
   - Check for empty results (usually a CLI output parsing issue)
   - Check service logs with `journalctl --user -u <service>`
   - Watch for env isolation issues (missing PATH, config dirs, HOME)

## Key gotchas

- `uvx` runs in an isolated environment — bare command names won't resolve
- CLI tools may need specific env vars (config dirs, HOME) that systemd doesn't set
- CLI output often has header lines and indentation that need filtering when parsing
- Use `fastapi dev` for auto-reload during development, `fastapi run` for production
- After port conflicts, kill stale processes with `lsof -ti:<port> | xargs kill -9`
