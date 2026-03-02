# ~/bin/

Scripts in this directory are on PATH and available to both the user and AI agents.

## Files to read

- @SKOGAI.md - agent-agnostic tool documentation

## Creating scripts

Scripts here are on PATH. After creating one, run `chmod +x` on it.

### Conventions (derived from existing scripts)

- **Shebang**: always `#!/usr/bin/env bash`. Resolves bash through PATH, same as everything else. Combined with `exec` (which preserves the environment including PATH), this means our wrappers stay in the loop for the entire call chain downstream.
- **Comment header**: script name + one-line description. Add `# usage:` lines if it takes args.
- **Passthrough wrappers use `exec`**: replaces the process entirely. Environment, args, and exit codes pass through transparently. After `exec`, the wrapper is gone — everything is the called command's responsibility. Use `exec` + `"$@"` whenever possible.
- **No unnecessary complexity**: these are small, focused tools — not libraries.

### Exit and output rules

- **No input / wrong input**: print usage to stdout and exit 0. The script understood the situation — nothing is broken.
- **Let errors propagate**: don't catch or swallow errors from commands the script calls. If `git` fails inside a wrapper, let that exit code pass through naturally (`exec` does this for free).
- **exit non-zero**: reserved for situations the script could not foresee or fix at runtime. Something is actually on fire and everything downstream should know about it.

### Minimal wrapper template

```bash
#!/usr/bin/env bash
# name — what it does
exec some-command --with-flags "$@"
```

### After creating a script

1. `chmod +x ~/bin/<script>`
2. Add an entry to `SKOGAI.md` so all agents (not just Claude) know about it.
