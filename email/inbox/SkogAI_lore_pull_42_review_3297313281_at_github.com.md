MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Thu, 02 Oct 2025 20:52:10 -0700
Subject: Re: [SkogAI/lore] Add script to create shell script refactoring issues (PR #42)
Message-ID: <SkogAI/lore/pull/42/review/3297313281@github.com>
In-Reply-To: <SkogAI/lore/pull/42@github.com>
References: <SkogAI/lore/pull/42@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68df486a12626_eb10d8724a5"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR adds a shell script that automatically creates 10 GitHub issues for refactoring various shell scripts in the repository to eliminate sed/awk usage and adopt standardized SKOGAI_* environment variables instead of hardcoded paths.

Key changes:
- Creates a comprehensive automation script for generating refactoring issues
- Targets 10 specific shell scripts across tools, docs, metrics, openrouter, integration, and demo directories
- Standardizes environment variable usage patterns across the codebase





> @@ -0,0 +1,334 @@
+#!/bin/bash

Missing executable permissions setup. The script should include a shebang and be marked as executable, or include instructions for making it executable.

> @@ -0,0 +1,334 @@
+#!/bin/bash
+# Script to create GitHub issues for shell script refactoring
+# This script creates 10 individual issues for refactoring shell scripts
+# to remove sed/awk usage and use SKOGAI_* environment variables
+
+set -e
+
+REPO="SkogAI/lore"

Repository name is hardcoded. Consider making it configurable via environment variable or command line argument to improve reusability.
```suggestion
# Allow repository name to be set via command line argument or environment variable, fallback to default
REPO="${1:-${REPO:-SkogAI/lore}}"
```

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

No error handling for gh command failures. If any gh issue create command fails, the script will continue creating subsequent issues, potentially leading to inconsistent state.

> +## Environment Variables to Use
+- \`SKOGAI_HOME\` - Base directory (default: \`\$HOME/skogai\` or \`\$(pwd)\`)
+- Other relevant SKOGAI_* variables as needed
+
+## Testing
+- Verify demo workflow works correctly
+- Test with and without environment variables set
+
+Related to #41
+EOF
+)"
+
+echo ""
+echo "✅ Successfully created 10 issues for shell script refactoring!"
+echo ""
+echo "View all issues at: https://github.com/$REPO/issues"

[nitpick] URL construction uses string concatenation. Consider using printf for more robust URL formatting or validate that REPO variable contains expected format.
```suggestion
printf "View all issues at: https://github.com/%s/issues\n" "$REPO"
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/42#pullrequestreview-3297313281
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/lore/pull/42/review/3297313281@github.com>