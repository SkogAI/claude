# shell/ -- Shell environment configuration

Shell config files for the claude user. Source from ~/.bashrc or ~/.zshrc,
or symlink them.

## contents

- `env.sh` -- shared PATH, env vars, aliases (sourced by both bashrc and zshrc)
- `prompt.sh` -- git-aware prompt helper (shared)
- `bashrc` -- bash-specific config (prompt, history)
- `zshrc` -- zsh-specific config (prompt, history)

## usage

```bash
# Option 1: source from existing rc file
echo 'source ~/claude/shell/zshrc' >> ~/.zshrc

# Option 2: symlink
ln -sf ~/claude/shell/zshrc ~/.zshrc
```

## what's in PATH

| Directory | Tools |
|-----------|-------|
| `~/go/bin` | `bd` (beads), `dolt` |
| `~/.local/bin` | `gt` (gas town) |
| `~/claude/bin` | `healthcheck`, project scripts |
