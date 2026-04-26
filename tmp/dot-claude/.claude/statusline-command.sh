#!/usr/bin/env bash
# Claude Code statusLine script
# Based on the smt zsh theme

input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
model=$(echo "$input" | jq -r '.model.display_name // ""')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

host=$(hostname -s)
dir=$(echo "$cwd" | sed "s|^$HOME|~|")

# Git branch and dirty status (skip lock to be safe)
git_branch=""
git_dirty=""
if git_out=$(git --no-optional-locks -C "$cwd" rev-parse --abbrev-ref HEAD 2>/dev/null); then
    git_branch="$git_out"
    if ! git --no-optional-locks -C "$cwd" diff --quiet 2>/dev/null || ! git --no-optional-locks -C "$cwd" diff --cached --quiet 2>/dev/null; then
        git_dirty="*"
    fi
fi

# ANSI color codes
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
RESET='\033[0m'

# Build status line
status=""

# host + dir (mimicking: %{$fg[blue]%}%m 福 %{$fg[cyan]%}%~)
status+="$(printf "${BLUE}%s${RESET}" "$host") 福 $(printf "${CYAN}%s${RESET}" "$dir")"

# git info
if [ -n "$git_branch" ]; then
    if [ -n "$git_dirty" ]; then
        status+=" $(printf "|${RED}%s${RESET}${RED}⚡${RESET}" "$git_branch")"
    else
        status+=" $(printf "|${GREEN}%s${RESET}${GREEN}✓${RESET}" "$git_branch")"
    fi
fi

# model
if [ -n "$model" ]; then
    status+=" $(printf "${YELLOW}[%s]${RESET}" "$model")"
fi

# context usage
if [ -n "$used_pct" ]; then
    used_int=${used_pct%.*}
    if [ "$used_int" -ge 80 ] 2>/dev/null; then
        status+=" $(printf "${RED}ctx:%s%%${RESET}" "$used_int")"
    elif [ "$used_int" -ge 50 ] 2>/dev/null; then
        status+=" $(printf "${YELLOW}ctx:%s%%${RESET}" "$used_int")"
    else
        status+=" $(printf "${GREEN}ctx:%s%%${RESET}" "$used_int")"
    fi
fi

printf "%b\n" "$status"
