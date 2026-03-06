# Argcfile.sh — Claude Code workspace manager

<what_is_this>

An argc-powered task runner at the repo root that simplifies working with Claude Code
git worktrees. Replaces raw `claude --worktree` invocations with a clean CLI.

</what_is_this>

<current_state>

`workspace` namespace is implemented and wired up. `debug` namespace exists for
introspection. Stubs are real implementations — no echo placeholders remain.

```
argc workspace open [-n name]   # open or create a worktree session in tmux
argc workspace list             # git worktree list
argc workspace remove <name>    # remove by name, validated against existing worktrees
argc workspace prune            # git worktree prune
argc debug interface [--json]   # show full interface (human) or argc-export JSON
```

</current_state>

<learnings>

## argc parameter types matter

`@arg`, `@option`, and `@flag` are not interchangeable:

- `@arg` — positional. When optional and not provided, `$argc_name` is `""`.
  Passing `""` to downstream CLIs is NOT the same as omitting the argument.
- `@option` — named (`--name value`). When not provided, the variable is unset.
  `"$argc_name"` expands to nothing — clean passthrough to downstream CLIs.
- `@flag` — boolean. `$argc_flag` is `0` or `1`.

**Rule:** use `@option` when a value is optional and needs clean passthrough.
Use `@arg` only when the argument is always meaningful when provided.

`workspace::open` uses `@option -n --name` so that `claude --worktree "$argc_name"`
passes nothing when name is omitted, auto-generating a worktree name via claude.

## Choice functions: validation vs completion

- `[`_fn`]` — choice from fn, validates input against returned list
- `[?`_fn`]` — choice from fn, no validation (completions only)

`workspace::open --name` uses `[?`_choice_worktrees`]` — suggests existing worktrees
but also accepts new names (which claude creates as new worktrees).
`workspace::remove` uses `[`_choice_worktrees`]` — strict validation, only existing.

## Parsing worktrees

Use `git worktree list --porcelain` for programmatic parsing, not the human-readable
default format. Porcelain gives one field per line, stable across git versions.

## argc internals

- `argc --argc-script-path` — returns absolute path to current Argcfile.sh
- `argc --argc-export <file>` — full CLI structure as JSON, useful for tooling
- `argc --argc-eval "$0" "$@"` — the required eval line, must use `$0` not `""`
- `debug::interface` uses export + jq to discover commands dynamically, no hardcoding

## Private helpers

Prefix with `_` — argc ignores them as commands. Keeps function bodies clean.

- `_worktree_path <name>` — resolves worktree name to full path via porcelain
- `_in_worktree` — returns true if cwd is a worktree (`! test -d .git`)
- `_choice_worktrees` — lists existing worktree names for completion/validation

## docs location

`skills/skogai-argc/docs/specification.md` — full argc tag reference.
Check here before guessing at syntax.

</learnings>

<next>

- test `workspace open` against a real worktree (does `claude --worktree ""` error?)
- shell completions via `argc --argc-completions`
- consider `workspace open` detecting if already in a worktree via `_in_worktree`

</next>
