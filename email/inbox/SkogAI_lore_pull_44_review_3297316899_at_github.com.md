MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Thu, 02 Oct 2025 20:54:09 -0700
Subject: Re: [SkogAI/lore] a (PR #44)
Message-ID: <SkogAI/lore/pull/44/review/3297316899@github.com>
In-Reply-To: <SkogAI/lore/pull/44@github.com>
References: <SkogAI/lore/pull/44@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68df48e18c786_b810d8173"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR introduces a shell script that automates the creation of 10 GitHub issues for refactoring various shell scripts in the SkogAI repository. The script addresses technical debt by systematically creating issues to eliminate sed/awk usage in favor of more robust tools like jq, and to replace hardcoded paths with SKOGAI_* environment variables.

Key changes:
- Creates a comprehensive issue creation script for shell script refactoring tasks
- Targets 10 specific scripts across different directories (tools, docs, metrics, openrouter, integration, demo)
- Standardizes the refactoring approach using environment variables and modern shell tools


<details>
<summary>Comments suppressed due to low confidence (2)</summary>

**create-script-refactor-issues.sh:1**
* The 'Before' example shows unquoted variables ($SKOGAI_DIR, $RESPONSE) which is a shell scripting anti-pattern. Since this is documentation showing what should be replaced, consider adding a note that these examples also need proper quoting.
```
#!/bin/bash
```
**create-script-refactor-issues.sh:1**
* The 'After' example still shows unquoted variable $SKOGAI_DIR and $RESPONSE. All variable references should be properly quoted to prevent word splitting and pathname expansion issues.
```
#!/bin/bash
```
</details>



> +#!/bin/bash
+# Script to create GitHub issues for shell script refactoring
+# This script creates 10 individual issues for refactoring shell scripts
+# to remove sed/awk usage and use SKOGAI_* environment variables
+
+set -e
+
+REPO="SkogAI/lore"
+
+echo "Creating GitHub issues for shell script refactoring..."
+echo "Repository: $REPO"
+echo ""
+
+# Issue 1: tools/context-manager.sh
+echo "Creating issue 1/10: tools/context-manager.sh"
+gh issue create --repo "$REPO" --title "Refactor tools/context-manager.sh to use jq instead of sed" --body "$(cat <<'EOF'

[nitpick] The script uses heredoc syntax with 'EOF' delimiters inside command substitution, which can be fragile. Consider extracting the issue body content to separate functions or variables to improve readability and maintainability.

> +## Current Issues
+- Uses \`sed -i\` extensively for JSON field updates (lines 13-16, 41-42)
+- Hardcoded paths: \`/home/skogix/skogai/context/\`
+- Brittle string replacement for JSON manipulation
+
+## Requirements
+- Replace all \`sed\` commands with \`jq\` for JSON manipulation
+- Use \`SKOGAI_HOME\` environment variable with sane defaults
+- Use \`SKOGAI_CONTEXT_DIR\` for context directory paths
+- Maintain exact same functionality
+- Ensure proper error handling
+
+## Example Transformation
+**Before:**
+\`\`\`bash
+sed -i "s/\"created\": \"\"/\"created\": \"\$(date -Iseconds)\"/" "/home/skogix/skogai/context/current/context-\${session_id}.json"

[nitpick] The example transformation shows nested quotes and escaped characters that make the command difficult to read. Consider using a cleaner example that demonstrates the concept without complex escaping.
```suggestion
sed -i 's/"created": ""/"created": "'$(date -Iseconds)'"/' /home/skogix/skogai/context/current/context-${session_id}.json
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/44#pullrequestreview-3297316899
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/lore/pull/44/review/3297316899@github.com>