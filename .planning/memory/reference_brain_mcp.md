---
name: brain-mcp setup and file provider
description: brain-mcp is installed at /tmp/brain-mcp with fork, uses file provider for summarization via skogai-queue
type: reference
---

brain-mcp (cognitive prosthetic / conversation RAG) is installed from a local fork at `/tmp/brain-mcp/`.

- **Config:** `~/.config/brain-mcp/config.toml`
- **Data:** `~/.config/brain-mcp/data/` (parquet, prompts, summaries JSONL)
- **Vectors:** `~/.config/brain-mcp/vectors/` (LanceDB)
- **Python:** `/tmp/brain-mcp/.venv/bin/python`
- **MCP server name:** `skogai-brain-mcp`

**File provider** (custom addition): Instead of calling Anthropic API, writes `{conv_id}-prompt.txt` to `data/prompts/`, reads `{conv_id}-summary.txt` back. Prompts are processed via `skogai-queue` running `claude -p`.

**Pipeline:** `brain-mcp summarize` (write prompts) -> `queue run` (process overnight) -> `brain-mcp summarize` again (read back results, build parquet + vectors)

**Status as of 2026-03-20:** 105k messages ingested, ~6k embeddings (still running), 5,133 summary prompts queued. Summaries not yet available — unlocks domain analysis, thinking stages, structured open questions.

**Known bugs (pre-existing):** `search_conversations` crashes with `'Europe/Stockholm'` timezone error. Semantic search loses embedding model after server restart.
