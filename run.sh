#!/usr/bin/env bash

cd /home/skogix/skogai || exit

# --- env vars (defaults made explicit, override before `claude` invocation) ---
# Auth: set ANTHROPIC_API_KEY or use /login interactively
# export ANTHROPIC_API_KEY=""
# export ANTHROPIC_AUTH_TOKEN=""            # custom Authorization header value
# export ANTHROPIC_CUSTOM_HEADERS=""        # Name: Value, newline-separated

# Model overrides (alias or full name)
# export ANTHROPIC_MODEL=""                 # override default model
# export ANTHROPIC_DEFAULT_SONNET_MODEL=""
# export ANTHROPIC_DEFAULT_OPUS_MODEL=""
# export ANTHROPIC_DEFAULT_HAIKU_MODEL=""
# export CLAUDE_CODE_SUBAGENT_MODEL=""      # model for subagents

# Bash tool
export BASH_DEFAULT_TIMEOUT_MS="120000" # 2 min default
export BASH_MAX_TIMEOUT_MS="600000"     # 10 min max
# export BASH_MAX_OUTPUT_LENGTH=""          # max chars before middle-truncation
# export CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR=""  # reset cwd after each cmd

# Token budgets
export CLAUDE_CODE_MAX_OUTPUT_TOKENS="32000" # max output tokens (max: 64000)
# export MAX_THINKING_TOKENS=""              # thinking budget (default: 31999, 0=disable)
export MAX_MCP_OUTPUT_TOKENS="25000" # max tokens in MCP tool responses
# export CLAUDE_CODE_FILE_READ_MAX_OUTPUT_TOKENS=""  # override read token limit

# Effort
export CLAUDE_CODE_EFFORT_LEVEL="high" # low | medium | high

# Context & compaction
# export CLAUDE_AUTOCOMPACT_PCT_OVERRIDE="" # 1-100, triggers compaction (default ~95%)
# export CLAUDE_CODE_DISABLE_1M_CONTEXT=""  # set 1 to disable 1M context window
# export CLAUDE_CODE_DISABLE_ADAPTIVE_THINKING=""  # set 1 to disable adaptive thinking

# Features on/off
export CLAUDE_CODE_DISABLE_AUTO_MEMORY="0"
export CLAUDE_CODE_DISABLE_BACKGROUND_TASKS="0"
export CLAUDE_CODE_DISABLE_FAST_MODE="0"
export CLAUDE_CODE_DISABLE_TERMINAL_TITLE="0"
export CLAUDE_CODE_ENABLE_PROMPT_SUGGESTION="true"
export CLAUDE_CODE_ENABLE_TASKS="true"
# export CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=""  # set 1 to enable agent teams

# Telemetry & reporting
export DISABLE_AUTOUPDATER="0"
export DISABLE_COST_WARNINGS="0"
export DISABLE_ERROR_REPORTING="0"
export DISABLE_TELEMETRY="0"
export DISABLE_NON_ESSENTIAL_MODEL_CALLS="0"
export DISABLE_PROMPT_CACHING="0"
# export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=""  # umbrella for above 4
# export CLAUDE_CODE_ENABLE_TELEMETRY=""    # set 1 to enable OTel collection
# export CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY=""

# MCP
# export MCP_TIMEOUT=""                     # startup timeout ms
# export MCP_TOOL_TIMEOUT=""                # tool execution timeout ms
# export ENABLE_TOOL_SEARCH="auto"          # auto | auto:N | true | false
# export ENABLE_CLAUDEAI_MCP_SERVERS=""     # set false to disable claude.ai MCP

# Proxy
# export HTTP_PROXY=""
# export HTTPS_PROXY=""
# export NO_PROXY=""

# Paths
export CLAUDE_CONFIG_DIR="/home/skogix/.claude"
# export CLAUDE_CODE_TMPDIR=""              # override /tmp for internal temp files
# export CLAUDE_CODE_SHELL=""               # override shell detection

# UI
# export IS_DEMO=""                         # set true to hide email/org, skip onboarding
# export CLAUDE_CODE_HIDE_ACCOUNT_INFO=""   # set 1 to hide email/org
# export USE_BUILTIN_RIPGREP=""             # set 0 to use system rg

# Plugins
# export FORCE_AUTOUPDATE_PLUGINS=""        # set true to force plugin updates
# export CLAUDE_CODE_PLUGIN_GIT_TIMEOUT_MS="120000"

# --- claude invocation ---
# --resume="claude-code-settings-and-envs" \
# --system-prompt="" \
claude \
  --worktree="claude-code-settings-and-envs" \
  --setting-sources="project" \
  --settings="/home/skogix/.claude/settings.json" \
  --plugin-dir="/home/skogix/.local/src/marketplace" \
  --permission-mode="plan" \
  --mcp-config="/home/skogix/skogai/config/mcp.json" \
  --effort="high" \
  --disallowed-tools="NotebookEdit Computer WebSearch WebFetch" \
  --append-system-prompt='[$claude]hi claude![$/claude]' \
  --add-dir="/home/skogix/skogai" \
  --model="claude-opus-4-6" \
  --strict-mcp-config \
  --no-chrome \
  --tmux
