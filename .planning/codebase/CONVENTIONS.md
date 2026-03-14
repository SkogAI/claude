# Coding Conventions

**Analysis Date:** 2026-03-14

## Overview

This workspace is a personal development environment for Claude Code, not an application codebase. It contains:
- Skills (progressive disclosure pattern implementations)
- Agents (Claude Code agent definitions)
- Hooks (Node.js runtime utilities)
- Shell scripts (bash utilities)
- Markdown documentation (routing files, templates, references)

Conventions span multiple languages and formats, unified by XML/semantic tagging principles and progressive disclosure patterns.

## Naming Patterns

**Files:**
- `kebab-case` for all file names: `gsd-executor.md`, `fetch-docs.sh`, `gsd-check-update.js`
- Skill directories: `skill-name/` with `SKILL.md` at root: `.claude/skills/skogai-routing/SKILL.md`
- Agent definitions: `gsd-{purpose}.md`: `.claude/agents/gsd-executor.md`, `.claude/agents/gsd-planner.md`
- Hook files: `gsd-{function}.js`: `.claude/hooks/gsd-check-update.js`
- Workflow files: `{action}.md` within skill directories: `.claude/skills/skogai-routing/workflows/add-reference.md`
- Reference files: `{topic}.md` within skill directories: `.claude/skills/skogai-routing/references/use-xml-tags.md`
- Template files: stored in `templates/` subdirectory: `.claude/skills/skogai-routing/templates/router-skill.md`
- Scripts: shell `.sh` or JavaScript `.js` in `scripts/` subdirectory of skills or in `.claude/hooks/`

**Variables (Bash):**
- ALL_CAPS_WITH_UNDERSCORES for environment and script variables: `PLAN_START_TIME`, `PHASE_DIR`, `VERSION_FILE`
- lowercase_underscore for local bash variables: `cache_dir`, `installed_version`

**XML Tags:**
- `kebab-case` for tag names: `<quick_start>`, `<success_criteria>`, `<advanced_features>`
- Attributes use underscores: `type="checkpoint:human-verify"`, `gate="blocking"`, `name="load_project_state"`

**Function/Commands:**
- Bash functions: `kebab-case`: `detectConfigDir()` → exported as kebab pattern in skills
- JavaScript functions: `camelCase`: `detectConfigDir()`, `spawnChild()`, `writeFile()`
- Commands: prefixed with `/gsd:` or `/skogai:` in kebab-case: `/gsd:execute-phase`, `/gsd:map-codebase`, `/skogai:routing`

## Code Style

**Formatting:**
- No enforced formatter (workspace, not application)
- Bash: standard GNU bash conventions
- JavaScript (Node.js): CommonJS modules (`require`/`module.exports`)
- JSON: 2-space indentation in schema files
- Markdown: standard Markdown with embedded code blocks

**Linting:**
- No linting tools configured (workspace environment)
- Manual review for semantic correctness
- XML structure validation: Tags must be properly closed

## Semantic Structure: XML Over Markdown Headings

**Critical rule:** Use XML tags for semantic structure, not markdown headings.

**Markdown headings** (`#`, `##`, `###`) are visual formatting only. **XML tags** (`<objective>`, `<workflow>`, etc.) provide semantic meaning and clear boundaries.

**Required tags** (every skill/agent must have):
```xml
<objective>
What this does and why it matters
</objective>

<quick_start>
Minimal working example or essential usage
</quick_start>

<success_criteria>
How to know the task worked
</success_criteria>
```

**Conditional tags** (add based on complexity):
- `<context>` - Background needed before starting
- `<workflow>` or `<process>` - Step-by-step procedures
- `<validation>` - Verification steps
- `<examples>` - Input/output pairs demonstrating patterns
- `<anti_patterns>` - Common mistakes to avoid
- `<security_checklist>` - Security considerations
- `<testing>` - Testing guidance
- `<common_patterns>` - Code recipes and reusable patterns
- `<advanced_features>` - Deep-dive topics (progressive disclosure)
- `<reference_guides>` or `<detailed_references>` - Links to external docs

**Benefits:**
- Unambiguous section boundaries
- Semantic meaning: Claude knows purpose of each section
- Token efficient: XML tags are ~15 tokens, markdown headings ~20 tokens
- Consistency: Same tag names across all skills
- Programmatically parseable: Can extract sections by tag name

**Example of correct structure:**
```xml
---
name: gsd-executor
description: Executes GSD plans with atomic commits
---

<objective>
Executes PLAN.md files autonomously, creating per-task commits and managing state.
</objective>

<quick_start>
Read PLAN.md → Execute tasks → Create commits → Update STATE.md
</quick_start>

<success_criteria>
- All tasks completed as specified
- Each task has its own commit
- SUMMARY.md file created
- STATE.md updated with progress
</success_criteria>

<workflow>
1. Load project state from .planning/STATE.md
2. Parse PLAN.md frontmatter and tasks
3. Execute tasks in order
4. Commit each completed task
5. Write SUMMARY.md
6. Update STATE.md
</workflow>
```

## Agent & Skill Frontmatter

All agent definitions and skills start with YAML frontmatter:

```yaml
---
name: {kebab-case-identifier}
description: {One-line description of purpose}
tools: {Tool1, Tool2, Tool3}        # For agents
skills:                             # Optional: skills this uses
  - skill-name
color: {color}                      # For UI: cyan, green, yellow, etc
---
```

Agent examples:
- `name: gsd-executor` - Executes plans
- `name: gsd-planner` - Creates phase plans
- `name: gsd-codebase-mapper` - Analyzes codebase structure

Skill examples:
- `name: skogai-routing` - Progressive disclosure routing patterns
- `name: skogai-bats-testing` - Bash testing patterns

## JavaScript/Node.js Conventions

**Module system:** CommonJS
```javascript
const fs = require('fs');
const path = require('path');
const { spawn } = require('child_process');

module.exports = {
  detectConfigDir,
  readVersionFile
};
```

**Error handling:** Try-catch with silent failures for optional operations:
```javascript
try {
  const data = JSON.parse(input);
  // process data
} catch (e) {
  // Silent fail for best-effort operations
  process.exit(0);
}
```

**File operations:** Always check existence and create parent directories:
```javascript
if (!fs.existsSync(cacheDir)) {
  fs.mkdirSync(cacheDir, { recursive: true });
}
fs.writeFileSync(cacheFile, JSON.stringify(result));
```

**Async operations:** Spawn detached background processes with `stdio: 'ignore'`:
```javascript
const child = spawn(process.execPath, ['-e', scriptContent], {
  stdio: 'ignore',
  windowsHide: true,
  detached: true  // Windows compatibility
});
child.unref();
```

**String handling:** Use template literals for readability:
```javascript
const bridgePath = path.join(os.tmpdir(), `claude-ctx-${session}.json`);
const result = {
  installed: fs.readFileSync(projectVersionFile, 'utf8').trim(),
  latest: execSync('npm view get-shit-done-cc version', {...}).trim()
};
```

**Comments:** Inline comments explain non-obvious logic:
```javascript
// Detect runtime config directory (supports Claude, OpenCode, Gemini)
// Respects CLAUDE_CONFIG_DIR for custom config directory setups
function detectConfigDir(baseDir) {
  // Check env override first (supports multi-account setups)
  const envDir = process.env.CLAUDE_CONFIG_DIR;
  ...
}

// Required on Windows for proper process detachment
detached: true
```

## Bash Conventions

**Shebang:** Always specify shell: `#!/usr/bin/env bash`

**Error handling:** Set strict mode at top:
```bash
#!/usr/bin/env bash
set -euo pipefail
```

**Comments:** Explain why, not what:
```bash
# Fetch all pages from Claude Code docs and save locally
for page in agent-teams amazon-bedrock ...; do
  echo "$page"
  curl -sL "$BASE/${page}.md" -o "$DIR/$page.md"
done
```

**Variables:** Use quotes and braces:
```bash
DIR="${1:-.}"  # Default to current directory
BASE="https://code.claude.com/docs/en"
```

## Markdown Conventions

**Link style:** Use relative paths for internal files, absolute URLs for external:
```markdown
[Internal reference](./referenced-file.md)
[External doc](https://example.com/docs)
[Agent](./agents/gsd-executor.md)
```

**Code blocks:** Use language-specific fencing:
````markdown
```bash
# Shell commands
```

```javascript
// Node.js code
```

```json
// JSON data
```
````

## Comments & Documentation

**When to comment:**
- Explain WHY, not WHAT: Code shows what, comments explain why
- Non-obvious logic: Regex patterns, complex algorithms, workarounds
- Platform-specific behavior: Windows vs Linux differences, compatibility notes
- Silently-failing operations: "Silent fail -- bridge is best-effort"

**Comment format:**
```javascript
// Single-line comments for quick explanations
// Multiple lines allowed for longer context
```

**JSDoc/TSDoc:** Not used in this workspace (not a TypeScript project)

## Import Organization

**JavaScript (CommonJS):**
```javascript
// Standard library
const fs = require('fs');
const path = require('path');
const os = require('os');

// Built-in Node APIs
const { spawn } = require('child_process');
const { execSync } = require('child_process');

// Destructured assignments after standard library imports
```

**No explicit import sections:** Single logical grouping of standard library first, then specific imports needed.

## Error Handling

**Pattern 1: Silent failures for optional operations**
Used when operation is best-effort and failure shouldn't block:
```javascript
try {
  const bridgeData = JSON.stringify({...});
  fs.writeFileSync(bridgePath, bridgeData);
} catch (e) {
  // Silent fail -- bridge is best-effort, don't break statusline
}
```

**Pattern 2: Exit cleanly on timeout**
Used in long-running processes to prevent hanging:
```javascript
const stdinTimeout = setTimeout(() => process.exit(0), 3000);
process.stdin.on('end', () => {
  clearTimeout(stdinTimeout);
  // process input
});
```

**Pattern 3: Informative logging without exposing internals**
Used in hooks to provide context to Claude agents:
```javascript
const message = isGsdActive
  ? `CONTEXT WARNING: Usage at ${usedPct}%. Remaining: ${remaining}%. ` +
    'Context is getting limited. Avoid starting new complex work.'
  : `CONTEXT WARNING: Usage at ${usedPct}%. Remaining: ${remaining}%. ` +
    'Be aware that context is getting limited.';
```

## Logging

**Framework:** Console methods (`console.log`, `console.error`) or no logging

**Patterns:**
- `console.log()` for standard operations: `echo "$page"` in bash, status updates
- `console.error()` for errors: Errors must be visible
- Silent operations: Many processes run with `stdio: 'ignore'` for background work
- Hook output: JSON structures for inter-process communication

**Guidelines:**
- Log operations for visibility during execution
- Silent-fail for optional/best-effort operations
- Structured JSON for machine-readable output between processes

## Function Design

**Size:** Short functions (typically < 50 lines)
- `detectConfigDir()` - 12 lines
- `spawnBackgroundProcess()` - 15 lines
- Longer functions broken into named steps within agents

**Parameters:** Pass what's needed, not entire objects:
```javascript
// Good
detectConfigDir(baseDir)
fs.writeFileSync(filePath, data)

// Not used in this codebase
```

**Return values:**
- Functions return meaningful data (paths, version strings, JSON objects)
- Void operations execute side effects (file writes, process spawns)
- Early returns for guard clauses:
```javascript
if (!sessionId) {
  process.exit(0);
}
```

## Module Design

**Exports:** CommonJS module.exports at end of file:
```javascript
module.exports = {
  detectConfigDir,
  readVersionFile,
  checkForUpdates
};
```

**Barrel files:** Not used in this codebase (single-purpose modules)

**Module organization:**
- One primary function per hook file
- Utility functions for reusable operations
- Configuration loading at module level

## Configuration & Metadata

**JSON schemas:** Validated against JSON Schema Draft 7
- Location: `{skill-name}/schemas/input.schema.json`, `output.schema.json`
- Pattern: `additionalProperties: true` for flexibility
- Key properties documented with descriptions

**Version files:** Plain text, single line
- Location: `.claude/get-shit-done/VERSION`
- Content: Semantic version string (e.g., "1.22.4")

**Settings files:** JSON format with documented structure
- Location: `.claude/settings.json` (local), `settings.schema.example.json` (documented)
- Purpose: Configuration for Claude Code integration and GSD framework

## Special Patterns

**@-references (at-references):** Used in agent/skill documentation to reference files by path:
```
@.planning/STATE.md
@./CLAUDE.md
@.claude/agents/gsd-executor.md
```
These expand at prompt-time to include actual file contents.

**Progressive disclosure:** Used in skills to limit cognitive load:
```
SKILL.md (< 500 lines) → Routing to:
  - workflows/ (step-by-step procedures)
  - references/ (domain knowledge)
  - templates/ (output structures)
  - scripts/ (executable code)
```

---

*Convention analysis: 2026-03-14*
