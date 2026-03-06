#!/bin/bash
# @describe Claude Code workspace manager

# @cmd Worktree management commands
workspace() {
  :
}

# @cmd Open or create a worktree session
# @arg name[`_choice_worktrees`]  Worktree name (auto-generated if omitted)
workspace::open() {
  echo "name: $argc_name"
}

# @cmd List all git worktrees
# @alias ls
workspace::list() {
  _choice_worktrees
}

# @cmd Remove a worktree by name
# @alias rm
# @arg name![`_choice_worktrees`] Worktree name
workspace::remove() {
  echo "name: $argc_name"
}

# @cmd Prune stale worktree references
workspace::prune() {
  echo "prune"
}

# @cmd Show interface for all commands
debug() {
  :
}

# @cmd Show interface for all commands
# @flag --json  Output raw JSON (argc-export)
debug::interface() {
  local script
  script=$(argc --argc-script-path)

  if [[ "$argc_json" == "1" ]]; then
    argc --argc-export "$script"
    return
  fi

  (eval "$(argc --argc-eval "$script" --help)") 2>&1
  echo "---"

  argc --argc-export "$script" | jq -r '
    .subcommands[] |
    (.name as $p | $p, (.subcommands[]? | $p + " " + .name))
  ' | while IFS= read -r cmd; do
    # shellcheck disable=SC2086
    (eval "$(argc --argc-eval "$script" $cmd --help)") 2>&1
    echo "---"
  done
}

_in_worktree() {
  ! test -d .git
}

_choice_worktrees() {
  git worktree list 2>/dev/null |
    awk 'NR>1 {print $1}' |
    xargs -I{} basename {}
}

eval "$(argc --argc-eval "$0" "$@")"
