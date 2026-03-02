# Claude Code Built-in Tools

## How Tools Actually Work

Tools are **not wrappers around shell commands**. They are an **adapter pattern** over
a file tree abstraction that may live anywhere — local machine, sandboxed container,
server-side cache, or a remote environment accessed from a phone.

**Key insight:** Only Bash actually executes on the user's real machine (via a full
shell environment snapshot — aliases, functions, PATH, everything). Every other tool
operates on the file tree abstraction and is location-independent.

### The permission model follows from this:

- **No permission needed:** Operations on the cached/server-side file tree (Read, Glob, Grep).
  Files were already permission-gated when they entered the cache.
- **Permission needed:** Changes that must sync back to the user's machine. Write/Edit
  produce a diff that gets applied on the real machine only when the user OKs it.
  Bash executes real commands on the real machine — always needs approval.

### Why dedicated tools instead of "just use Bash":

1. **Adapter pattern** — the interface is stable, the implementation can change.
   Glob wraps fd/find, Grep wraps ripgrep — but could be a database query on an
   indexed file tree. The model doesn't need to know.
2. **Output control** — tools act as token valves. Grep has output modes
   (content/files_with_matches/count), Read has offset/limit. Bash returns raw
   stdout that could blow the context window.
3. **Diff-friendly operations** — Edit sends `old→new` patches (surgical, minimal
   delta). Write sends whole files. Append (proposed) would be a single atomic
   addition. Each produces conflict-free diffs by design.
4. **Governance chokepoints** — each tool is a point where Claude Code can intercept,
   validate, truncate, format, and permission-gate — structurally, not via prompt
   instructions the model might ignore.

---

## Always-On Tools (the irreducible core)

These six should always be enabled — they cover the fundamental operations on the
file tree + the escape hatch to reality:

- **Read** — read file contents (text, images, PDFs, notebooks). No permission — reads
  from cache/server-side copy. The foundation everything else depends on.
- **Write** — create or overwrite files. Produces a diff applied to the real machine on
  user OK. Can operate freely in sandbox/container without touching the real filesystem.
- **Edit** — exact string replacements in existing files. Surgical old→new patches that
  are minimal, diffable, and merge-conflict-free. Preferred over Write for modifications.
- **Glob** — file pattern matching (wraps fd/find depending on environment). No permission
  — queries the file tree index. Implementation-independent.
- **Grep** — content search (wraps ripgrep, which Claude Code ships as a dependency). No
  permission — same reason as Glob. Could be rg locally or a database query server-side.
- **Bash** — the only tool that actually executes on the real machine. Gets a full shell
  environment snapshot (~8000 lines: zsh functions, aliases, PATH, everything) to mimic
  the user's real environment. The escape hatch when dedicated tools can't do the job.

### Missing from the core: Append

Currently, appending to a file requires: Read entire file → Edit with last lines as
old_string → hope it's unique. Burns tokens for no reason. An Append tool would be a
single atomic operation — no read required, no uniqueness problem, trivially conflict-free
diff. Fits the same pattern as Write/Edit: a file tree operation producing a minimal delta.

---

## Session-Loadable Tools

Everything below should be loaded **on demand** based on session type, not dumped at boot.
Each tool definition + its usage prompts costs tokens on every message.

### Execution Support
- **KillShell** — kill background bash shells
- **TaskOutput** — retrieve output from background tasks
- **Sleep** — wait/sleep with early wake on user input

### Agents & Tasks
- **Task** (aka Agent) — launch sub-agents for complex multi-step tasks
- **TaskCreate** — create a new task
- **TaskGet** — retrieve task details
- **TaskList** — list all tasks with status
- **TaskUpdate** — update task status/dependencies/details
- **TodoWrite** — break down and manage work with task lists (2,161 tks — the heaviest tool!)

### Planning
- **EnterPlanMode** — explore and design implementation approaches
- **ExitPlanMode** — present plan for user approval, start coding

### Web
- **WebFetch** — fetch content from a URL
- **WebSearch** — web search with domain filtering

### User Interaction
- **AskUserQuestion** — ask multiple-choice questions for requirements/clarification
- **Skill** — execute a skill in the main conversation

### Swarm / Multi-Agent
- **SendMessageTool** — send messages to teammates, handle protocol requests/responses (1,241 tks)
- **TeammateTool** — manage teams and coordinate teammates (1,642 tks)
- **TeamDelete** — delete a teammate

### Code Intelligence
- **LSP** — language server protocol: type errors, jump to definition, find references, symbols
- **NotebookEdit** — edit Jupyter notebook cells

### Tool Discovery
- **MCPSearch** — search for and load MCP tools on demand
- **ToolSearch** — search and load deferred built-in tools

### Environment
- **Computer** — Chrome browser automation
- **EnterWorktree** — git worktree management
