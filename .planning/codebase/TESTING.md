# Testing Patterns

**Analysis Date:** 2026-03-14

## Overview

This workspace is a personal development environment for Claude Code (not an application). Testing patterns differ from traditional software projects:

- **No automated test suite** - This is a workspace, not an application with a test runner
- **Manual verification** - Testing happens through execution and observation
- **Pattern validation** - Verification against stub detection and substantive implementation patterns
- **Integration testing** - Skills and agents are validated by running in Claude Code environment
- **Hook testing** - Node.js hooks validated by spawning as subprocesses and checking output

The GSD framework includes verification patterns for validating that implementations are substantive (not stubs), not a traditional testing framework.

## Test Framework

**Runner:** Not applicable - no automated test runner

**Testing approach:** Manual + Pattern-based validation

**Verification tools:**
- Bash script patterns: `grep`, file inspection, exit code checks
- Stub detection: Looking for placeholder patterns, empty returns, TODOs
- Hook validation: Spawning process and checking JSON output
- Agent validation: Running in Claude Code and observing behavior

## Verification Patterns

The GSD framework defines "substantive implementation" verification. This determines if code is real or placeholder.

**Stub Detection Patterns:**

Universal patterns indicating placeholder code (grep patterns):
```bash
# Comment-based stubs
grep -E "(TODO|FIXME|XXX|HACK|PLACEHOLDER)" "$file"
grep -E "implement|add later|coming soon|will be" "$file" -i
grep -E "// \.\.\.|/\* \.\.\. \*/|# \.\.\." "$file"

# Placeholder text in output
grep -E "placeholder|lorem ipsum|coming soon|under construction" "$file" -i
grep -E "sample|example|test data|dummy" "$file" -i

# Empty or trivial implementations
grep -E "return null|return undefined|return \{\}|return \[\]" "$file"
grep -E "pass$|\.\.\.|\bnothing\b" "$file"
grep -E "console\.(log|warn|error).*only" "$file"

# Hardcoded values where dynamic expected
grep -E "id.*=.*['\"].*['\"]" "$file"  # Hardcoded IDs
grep -E "count.*=.*\d+|length.*=.*\d+" "$file"  # Hardcoded counts
```

**Substantiveness criteria (4 levels):**

1. **Exists** - File is present at expected path
   ```bash
   test -f "$file_path"
   ```

2. **Substantive** - Content is real implementation, not placeholder
   ```bash
   # Check for stub indicators
   grep -E "(TODO|FIXME|return null|return \{\})" "$file" && echo "STUB" || echo "SUBSTANTIVE"
   ```

3. **Wired** - Connected to rest of system
   ```bash
   # For Node hooks: Check that module exports needed functions
   grep -E "module.exports.*=" "$file"
   # For skills: Check that SKILL.md routes to this functionality
   ```

4. **Functional** - Actually works when invoked
   ```bash
   # Requires human observation or integration testing in Claude Code
   ```

Reference: `.claude/get-shit-done/references/verification-patterns.md`

## Hook Testing (Node.js)

Hooks are validated by spawning as subprocesses and checking output/behavior.

**Hook files:**
- `.claude/hooks/gsd-check-update.js` - Spawns background process checking npm for updates
- `.claude/hooks/gsd-statusline.js` - Reads stdin, writes statusline to stdout
- `.claude/hooks/gsd-context-monitor.js` - Reads stdin, injects context warnings

**Testing approach:**

**Test 1: Process spawning (gsd-check-update.js)**
```bash
# Hook spawns background update check
# Verify:
# 1. Script runs without error
node /home/skogix/claude/.claude/hooks/gsd-check-update.js
# 2. Cache file is created
test -f ~/.claude/cache/gsd-update-check.json && echo "PASS" || echo "FAIL"
# 3. Cache contains valid JSON with update_available, installed, latest fields
cat ~/.claude/cache/gsd-update-check.json | jq '.' && echo "PASS" || echo "FAIL"
```

**Test 2: Stdin processing (gsd-statusline.js)**
```bash
# Hook reads JSON from stdin, writes formatted statusline
# Verify:
# 1. Accepts stdin JSON
echo '{"model":{"display_name":"Claude"},"workspace":{"current_dir":"/tmp"},"session_id":"test"}' | \
  node /home/skogix/claude/.claude/hooks/gsd-statusline.js
# 2. Output contains model name and directory
# 3. No crashes on edge cases (empty input, missing fields)
echo '{}' | node /home/skogix/claude/.claude/hooks/gsd-statusline.js
# 4. 3-second timeout prevents hanging
timeout 5 sh -c 'echo "{}" | node /home/skogix/claude/.claude/hooks/gsd-statusline.js'
```

**Test 3: Context monitoring (gsd-context-monitor.js)**
```bash
# Hook reads metrics from bridge file, injects warnings
# Verify:
# 1. Produces valid JSON output (hookSpecificOutput with additionalContext)
echo '{"session_id":"test"}' | node /home/skogix/claude/.claude/hooks/gsd-context-monitor.js | jq '.' && echo "PASS" || echo "FAIL"
# 2. No context metrics → silent exit (exit code 0)
echo '{"session_id":"missing"}' | node /home/skogix/claude/.claude/hooks/gsd-context-monitor.js
# 3. High context usage triggers warning
# 4. Debounce prevents warning spam
```

**Common patterns for all hooks:**

Error handling:
```javascript
try {
  const data = JSON.parse(input);
  // process
} catch (e) {
  // Silent fail - never block tool execution
  process.exit(0);
}
```

Timeout guards (3-second stdin timeout prevents hanging):
```javascript
const stdinTimeout = setTimeout(() => process.exit(0), 3000);
process.stdin.on('end', () => {
  clearTimeout(stdinTimeout);
  // process safely
});
```

Silent failures for optional operations:
```javascript
try {
  fs.writeFileSync(filePath, data);
} catch (e) {
  // Silent fail - don't break parent process
}
```

## Bash Script Testing

Bash scripts (`.sh` files) are validated through execution and output inspection.

**Example: fetch-docs.sh** (`/home/skogix/claude/docs/fetch-docs.sh`)

Structure:
```bash
#!/usr/bin/env bash
set -euo pipefail  # Strict mode: exit on error, undefined vars, pipe failures

DIR="./claude-code"
mkdir -p "$DIR"
BASE="https://code.claude.com/docs/en"

# Loop and execute curl commands
for page in agent-teams amazon-bedrock ...; do
  echo "$page"
  curl -sL "$BASE/${page}.md" -o "$DIR/$page.md"
done
```

**Testing approach:**
```bash
# Test 1: Script executes without error
cd /home/skogix/claude/docs
./fetch-docs.sh

# Test 2: Directory created
test -d ./claude-code && echo "PASS" || echo "FAIL"

# Test 3: Files fetched (at least one)
test -f ./claude-code/agent-teams.md && echo "PASS" || echo "FAIL"

# Test 4: Files have content (not empty)
test -s ./claude-code/agent-teams.md && echo "PASS" || echo "FAIL"

# Test 5: Idempotent (can run again without errors)
./fetch-docs.sh
test $? -eq 0 && echo "PASS" || echo "FAIL"
```

## Skill & Agent Testing

Skills and agents are validated through:
1. **Structure validation** - Correct frontmatter, required XML tags
2. **Content validation** - Substantive content (not stubs)
3. **Routing validation** - References point to actual files
4. **Integration testing** - Running in Claude Code environment

**Structure validation checklist:**

```bash
SKILL_FILE=".claude/skills/skill-name/SKILL.md"

# 1. File exists
test -f "$SKILL_FILE" || exit 1

# 2. Has YAML frontmatter
grep -A 5 "^---" "$SKILL_FILE" | grep -E "^name:|^description:" || exit 1

# 3. Has required XML tags
grep -E "<objective>.*</objective>" "$SKILL_FILE" || exit 1
grep -E "<quick_start>.*</quick_start>" "$SKILL_FILE" || exit 1
grep -E "<success_criteria>.*</success_criteria>" "$SKILL_FILE" || exit 1

# 4. No markdown headings in skill body (use XML instead)
# Lines after --- should not contain # or ##
tail -n +4 "$SKILL_FILE" | grep -E "^#+\s" && echo "FAIL: Uses markdown headings" || echo "PASS"

# 5. All cross-references exist
# For references in workflows/, check that they exist
grep -o "\[.*\](.*\.md)" "$SKILL_FILE" | grep -oE "\(.*\)" | tr -d '()' | while read ref; do
  test -f "$ref" || echo "MISSING: $ref"
done
```

**Content validation (substantiveness):**

```bash
FILE="$1"

# Check for stub patterns
stubs=$(grep -c -E "TODO|FIXME|XXX|placeholder|not implemented" "$FILE" 2>/dev/null || echo 0)
test $stubs -eq 0 || echo "WARNING: $stubs stub markers found"

# Check for empty content
test -s "$FILE" || echo "ERROR: File is empty"

# Check for actual instructions/code, not just placeholders
content_lines=$(wc -l < "$FILE")
test $content_lines -gt 20 || echo "WARNING: File very short ($content_lines lines)"
```

## Agent Verification

Agents are markdown files with YAML frontmatter. Validation:

```bash
AGENT_FILE=".claude/agents/gsd-{name}.md"

# 1. Valid frontmatter
grep -A 10 "^---" "$AGENT_FILE" | grep -E "^name:|^description:|^tools:" || exit 1

# 2. Tools are comma-separated and valid
tools=$(grep "^tools:" "$AGENT_FILE" | cut -d: -f2 | tr ',' '\n' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
# Valid tools: Read, Write, Edit, Bash, Grep, Glob, WebFetch, mcp__*

# 3. Has main role section
grep -A 5 "<role>" "$AGENT_FILE" | grep -v "^--" | head -1 || exit 1

# 4. Links to referenced files exist
grep -oE "@\./[^\s]+" "$AGENT_FILE" | sed 's/@//' | while read ref; do
  test -e "$ref" || echo "MISSING: $ref"
done
```

## Manual Testing Workflow

Testing this workspace involves:

**1. Syntax validation (can be automated):**
- JSON files: `jq '.' file.json`
- YAML frontmatter: `grep "^---" -A 10 file.md | yamllint -`
- Shell scripts: `bash -n script.sh`

**2. Structure validation (automated):**
- Required XML tags present
- No stub patterns (TODO, FIXME, return null, etc)
- Frontmatter present and valid

**3. Reference validation (automated):**
- @-references point to real files
- Cross-file links exist
- No broken references

**4. Functional validation (manual):**
- Run hook in Claude Code environment
- Check output format
- Observe behavior during actual use

**5. Integration testing (manual):**
- Run skills through Claude Code UI
- Execute agents through GSD commands
- Verify routing and workflows work

## Test Coverage Gaps

This workspace has **no coverage reporting** - it's not an application with unit tests.

**What is tested:**
- Hook functionality (by running in Claude Code)
- Skill routing (by following workflows in Claude)
- Agent execution (by running commands)
- Pattern substantiveness (grep for stubs)

**What is NOT tested:**
- Unit tests for individual functions (not applicable)
- Code coverage metrics (workspace, not app)
- Automated regressions (not in CI/CD)

**Validation approach instead:**
- Manual execution and observation
- Pattern matching for stub detection
- Reference validation for broken links
- Integration testing through Claude Code interface

## Running Verification

To verify a skill or agent is substantive:

```bash
#!/bin/bash
# Verify script for skill substantiveness

SKILL_DIR="${1:-.}"

if [ ! -f "$SKILL_DIR/SKILL.md" ]; then
  echo "FAIL: SKILL.md not found at $SKILL_DIR"
  exit 1
fi

# Check for stubs
stubs=$(grep -E "TODO|FIXME|XXX|return null|return \{\}" "$SKILL_DIR/SKILL.md" | wc -l)
if [ "$stubs" -gt 0 ]; then
  echo "WARNING: Found $stubs stub markers"
fi

# Check required tags
for tag in "objective" "quick_start" "success_criteria"; do
  if ! grep -q "<$tag>" "$SKILL_DIR/SKILL.md"; then
    echo "FAIL: Missing required tag <$tag>"
    exit 1
  fi
done

# Check file size (should be substantial)
lines=$(wc -l < "$SKILL_DIR/SKILL.md")
if [ "$lines" -lt 50 ]; then
  echo "WARNING: SKILL.md is small ($lines lines) - may be incomplete"
fi

echo "PASS: $SKILL_DIR appears substantive"
exit 0
```

## Common Testing Patterns

**Pattern 1: Detecting stubs with grep**
```bash
# Find all stub indicators in a file
grep -n -E "TODO|FIXME|XXX|HACK|PLACEHOLDER|return null|return \{\}|return \[\]" "$file"
```

**Pattern 2: Verifying JSON output**
```bash
# Validate JSON format
echo "$output" | jq '.' > /dev/null && echo "Valid JSON" || echo "Invalid JSON"
```

**Pattern 3: Timeout guard for long-running processes**
```javascript
const timeout = setTimeout(() => process.exit(0), 3000);
process.stdin.on('end', () => {
  clearTimeout(timeout);
  // safe to process
});
```

**Pattern 4: Verifying file wiring**
```bash
# Check that skill is referenced in agent
if grep -q "skills:" "$AGENT_FILE"; then
  grep -A 5 "^skills:" "$AGENT_FILE" | grep "$SKILL_NAME"
fi
```

---

*Testing analysis: 2026-03-14*
