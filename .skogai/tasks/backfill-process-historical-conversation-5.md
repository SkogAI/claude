---
state: new
created: "2026-03-06"
tracking: ["https://github.com/SkogAI/claude-memory/issues/5"]
tags: ["enhancement", "pipeline", "github"]
---

# Backfill: process historical conversation archive

**Source**: [Github #5](https://github.com/SkogAI/claude-memory/issues/5)

## Description

## Parent: #1
## Depends on: #3

## Summary

Run the extraction pipeline against 1.5 years of historical conversations. This is the bulk processing job that turns dead JSONL files into searchable, structured knowledge.

## Scale

- ~900k lines of conversation history
- Unknown number of conversations (need to scan)
- Only viable with local LLM (ollama) — API costs would be prohibitive

## CLI

```bash
claude-memory backfill --types all           # everything
claude-memory backfill --types decisi

## Notes

*Imported from external tracker. See source link for full context.*
