# prompt.sh — shell prompt for claude home
# Sourced by both .bashrc and .zshrc via shell-specific wrappers.

# Shows: [claude] cwd (git-branch) $
# Keeps it minimal — agents parse output, fancy prompts add noise.

__claude_git_branch() {
  local branch
  branch=$(git branch --show-current 2>/dev/null)
  if [ -n "$branch" ]; then
    printf ' (%s)' "$branch"
  fi
}
