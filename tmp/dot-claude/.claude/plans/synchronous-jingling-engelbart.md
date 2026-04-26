# Debug Session Report

## Context

No specific issue was described. This is a scan of the current session's debug log for errors and warnings.

---

## Findings

### 1. `skogai-tools` MCP server — BROKEN (actionable)
**Error:** `Cannot find package 'uuid' imported from /home/skogix/.local/src/tools/mcp/server/index.js`

The server crashes immediately on startup because `uuid` isn't installed. Fix:
```
cd /home/skogix/.local/src/tools/mcp/server && npm install
```

### 2. `doc-writer.md` YAML frontmatter — WARN (agent broken)
**File:** `~/.claude/agents/doc-writer.md`

YAML parser fails on the multi-line description containing XML-like `<example>` tags. The agent loads but may not behave correctly. Fix: wrap the description value in quotes or use a block scalar.

### 3. Missing env vars — plugins silently degrade
- `GITHUB_PERSONAL_ACCESS_TOKEN` → `plugin:github` MCP fails (also getting "Authorization header is badly formatted" — token may be set but malformed)
- `GREPTILE_API_KEY` → `plugin:greptile` MCP fails

Fix: set the env vars in shell profile, or disable the plugins if not needed.

### 4. `pyright-langserver` not in PATH
**Error:** `LSP server plugin:pyright-lsp:pyright failed to start: Executable not found in $PATH`

pyright-lsp plugin is enabled but `pyright` isn't installed. Fix:
```
pip install pyright   # or: npm install -g pyright
```
Or disable the pyright-lsp plugin if not needed.

### 5. `plugin:supabase` + `plugin:slack` — Unauthorized
Both return 401/Unauthorized. Not authenticated. Expected if not logged in; use Claude.ai web to authenticate these, or disable if unused.

### 6. Org fast-mode status — 403
```
Failed to fetch org fast mode status, defaulting to disabled: AxiosError 403
```
Not user-actionable — likely an account/org permissions issue on Anthropic's side. Fast mode defaults to disabled.

---

## False Positives (not real errors)

- `plugin:context7` and `plugin:serena` log to stderr at startup — Claude Code marks these as [ERROR] but they're just info logs. Both servers connected successfully.

---

## Priority Order

| Priority | Issue | Fix |
|----------|-------|-----|
| High | `skogai-tools` broken | `npm install` in server dir |
| Medium | `doc-writer.md` YAML parse | Fix frontmatter formatting |
| Medium | pyright not installed | `pip/npm install pyright` or disable plugin |
| Low | GitHub/Greptile missing tokens | Set env vars or disable |
| Low | Supabase/Slack unauth | Login via web or disable |
| Info | Org fast-mode 403 | Not actionable |
