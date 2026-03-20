# env.sh — shared environment for claude home (sourced by .bashrc and .zshrc)
# This file sets PATH, environment variables, and aliases common to all shells.

# ── PATH ─────────────────────────────────────────────────────────────────────
# Go binaries (bd, dolt, etc.)
export PATH="$HOME/go/bin:$PATH"

# Local user binaries (gt, etc.)
export PATH="$HOME/.local/bin:$PATH"

# Claude home scripts
export PATH="$HOME/claude/bin:$PATH"

# ── Environment ──────────────────────────────────────────────────────────────
# Gas Town workspace root
export GT_HOME="$HOME/gt"

# Claude home directory
export CLAUDE_HOME="$HOME/claude"

# Go environment
export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"

# Editor (non-interactive)
export EDITOR="cat"

# ── Aliases ──────────────────────────────────────────────────────────────────
alias hc='$CLAUDE_HOME/bin/healthcheck'
