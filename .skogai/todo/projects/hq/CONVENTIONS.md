# Conventions

## Tools and how to use them

- Use the `append` tool to write to .list files

## Files and folders

- `SKOGAI.md` is the agent-agnostic project summary — portable, any AI can consume it via `cat SKOGAI.md >> prompt`
- `CLAUDE.md` should be present and declares the root of a project or the base from which we work
- Every `CLAUDE.md` should have a `## Files to read` section listing @-imports of files relevant to that project
- `INBOX.list` is always a way to send and receive messages in a project
- `README.md` should be seen as a "GitHub README geared towards human readers" while *every other file is only intended to be read by developers and AI Agents*
- `DECISIONS.md` logs setup changes, installs, and architectural choices with reasoning
- Do not duplicate content — use @-imports to reference files instead
