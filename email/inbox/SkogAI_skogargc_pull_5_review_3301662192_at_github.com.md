MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogargc <skogargc@noreply.github.com>
Date: Sat, 04 Oct 2025 00:33:17 -0700
Subject: Re: [SkogAI/skogargc] Add Claude Code GitHub Actions workflow (PR #5)
Message-ID: <SkogAI/skogargc/pull/5/review/3301662192@github.com>
In-Reply-To: <SkogAI/skogargc/pull/5@github.com>
References: <SkogAI/skogargc/pull/5@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68e0cdbd419d7_23e2310d84216f"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR adds a GitHub Actions workflow to enable Claude Code integration, allowing team members to invoke Claude's assistance by mentioning `@claude` in issues and pull requests.

Key changes:
- Creates a new workflow file that triggers on various GitHub events when `@claude` is mentioned
- Configures comprehensive permissions for Claude to interact with the repository
- Sets up OAuth token authentication and enables GitHub CLI commands





---

<sub>**Tip:** Customize your code reviews with copilot-instructions.md. <a href="/SkogAI/skogargc/new/master/.github?filename=copilot-instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Create the file</a> or <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">learn how to get started</a>.</sub>

> +          fetch-depth: 1
+
+      - name: Run Claude Code
+        id: claude
+        uses: anthropics/claude-code-action@v1
+        with:
+          CLAUDE_CODE_OAUTH_TOKEN: ${{ secrets.CLAUDE_CODE_OAUTH_TOKEN }}
+
+          # This is an optional setting that allows Claude to read CI results on PRs
+          additional_permissions: |
+            actions: write
+            contents: write
+            pull-requests: write
+            issues: write # Allow Claude to create and update issues
+            id-token: write
+            actions: write # Required for Claude to read CI results on PRs

The `actions: write` permission is duplicated on lines 42 and 47. Remove the duplicate entry to clean up the configuration.
```suggestion

```

> +    types: [submitted]
+
+jobs:
+  claude:
+    if: |
+      (github.event_name == 'issue_comment' && contains(github.event.comment.body, '@claude')) ||
+      (github.event_name == 'pull_request_review_comment' && contains(github.event.comment.body, '@claude')) ||
+      (github.event_name == 'pull_request_review' && contains(github.event.review.body, '@claude')) ||
+      (github.event_name == 'issues' && (contains(github.event.issue.body, '@claude') || contains(github.event.issue.title, '@claude')))
+    runs-on: ubuntu-latest
+    permissions:
+      contents: write
+      pull-requests: write
+      issues: write # Allow Claude to create and update issues
+      id-token: write
+      actions: read # Required for Claude to read CI results on PRs

There's inconsistency between job-level permissions (line 26: `actions: read`) and additional_permissions (lines 42, 47: `actions: write`). Consider aligning these permissions or clarifying why different permission levels are needed at different scopes.
```suggestion
      actions: write # Required for Claude to read CI results on PRs
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogargc/pull/5#pullrequestreview-3301662192
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/skogargc/pull/5/review/3301662192@github.com>