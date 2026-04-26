# Design Spec: Container Management

## Context

Two invocation paths must both work for every service script:

1. **Human CLI**: `skog argc run searxng --action up`
   → `Argcfile.sh run()` → `bash scripts/searxng.sh --action up`

2. **AI agent tool**: `./utils/run-script.sh searxng '{"action":"up"}'`
   → jq converts JSON to flags → `./scripts/searxng.sh --action up`

Both paths converge on the same call: `./scripts/searxng.sh --flag value`.
This is the "gain for free" — argc annotations become the schema for both humans and AI agents.

The current scripts are wrong: they use `@cmd main` + `@arg action` (positional).
`run-script.sh` always emits `--key value` flags from JSON — positional args are unreachable.
Scripts must use `@describe` + `@option` instead.

---

## Critical files

- `/home/skogix/.local/src/container/Argcfile.sh` — dispatcher, needs `main` stripped from run()
- `/home/skogix/.local/src/container/scripts/*.sh` — all 22 need interface fix
- `/home/skogix/.local/src/container/utils/run-script.sh` — reference, do not modify
- `/home/skogix/.local/src/skogterm/scripts/port.sh` — canonical example of correct pattern

---

## Required changes

### 1. Fix script interface (all 22 scripts)

**Wrong (current):**
```bash
# @cmd SearXNG container management
# @arg action![up|down|logs|shell]
# @flag -f --follow
main() { echo TODO }
```

**Correct:**
```bash
#!/usr/bin/env bash
# @describe SearXNG container management
# @option --action![up|down|logs|shell] Action to perform
# @flag -f --follow                     Follow log output (logs only)
# @env LLM_OUTPUT=/dev/stdout           Output path

main() { echo TODO }

eval "$(argc --argc-eval "$0" "$@")"
```

Key differences:
- `@describe` not `@cmd` — no subcommand needed
- `@option --action` not `@arg action` — reachable from JSON via run-script.sh
- `@env LLM_OUTPUT` — standard output path for AI tool calling

### 2. Fix Argcfile.sh run() — drop `main` prefix

**Wrong (current):**
```bash
bash ./scripts/${argc_file}.sh main "${args[@]}"
```

**Correct:**
```bash
bash ./scripts/${argc_file}.sh "${args[@]}"
```

Scripts no longer have a `main` subcommand — they're called directly.

### 3. Fix _choice_scripts — update detection

Currently checks for `grep -q '^main()'`. With `@describe`, main() still exists,
so this check still works. No change needed.

---

## Invocation after fix

```
skog argc run searxng --action up
  → argc_args=( --action up )
  → bash scripts/searxng.sh --action up
  → argc_action=up → main() runs

./utils/run-script.sh searxng '{"action":"up"}'
  → jq: --action up
  → ./scripts/searxng.sh --action up
  → argc_action=up → main() runs
```

Both identical. ✓

---

## What is NOT in scope for this plan

The actual `main()` implementations (podman run, start, stop, etc.) and the
`services/manifest.toml` + `lib/container.sh` architecture are separate work.
This plan only fixes the interface layer so both invocation paths work correctly.

---

## Verification

```bash
cd /home/skogix/.local/src/container

# CLI path
skog argc run searxng --action up      # should run main(), not error

# AI tool path
./utils/run-script.sh searxng '{"action":"up"}'   # should run main()
./utils/run-script.sh searxng '{"action":"logs","follow":true}'  # flag test

# Completion still works
skog argc run <TAB>    # lists all services
skog argc run searxng <TAB>   # lists --action, --follow
```
