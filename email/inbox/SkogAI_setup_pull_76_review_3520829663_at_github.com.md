MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sat, 29 Nov 2025 13:26:23 -0800
Subject: Re: [SkogAI/setup] "Claude Code Review workflow" (PR #76)
Message-ID: <SkogAI/setup/pull/76/review/3520829663@github.com>
In-Reply-To: <SkogAI/setup/pull/76@github.com>
References: <SkogAI/setup/pull/76@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692b64ff56ace_d41100127933a"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR introduces two GitHub Actions workflows to integrate Claude Code (AI assistant) into the repository's development workflow. The workflows enable AI-assisted code review and interactive Claude assistance via comment mentions.

- Adds interactive Claude assistant workflow triggered by @claude mentions in issues, PRs, and comments
- Adds automated Claude code review workflow that runs on PR open/sync events
- Configures permissions, prompts, and allowed tools for secure Claude integration

### Reviewed changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 5 comments.

| File | Description |
| ---- | ----------- |
| `.github/workflows/claude.yml` | Interactive Claude assistant workflow triggered by @claude mentions in comments, reviews, and issues with configurable permissions and tools |
| `.github/workflows/claude-code-review.yml` | Automated Claude code review workflow for PRs with custom prompt referencing CLAUDE.md guidance and restricted gh CLI tool access |





---

💡 <a href="/SkogAI/setup/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -0,0 +1,50 @@
+name: Claude Code

[nitpick] The workflow name "Claude Code" appears incomplete. Based on the PR title and the workflow's purpose, this should likely be "Claude Code Review" or "Claude Code Assistant" to clearly indicate its function.
```suggestion
name: Claude Code Review
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
+      contents: read
+      pull-requests: read
+      issues: read
+      id-token: write
+      actions: read # Required for Claude to read CI results on PRs

The `actions: read` permission is redundantly specified both here in the permissions block (line 26) and in the `additional_permissions` configuration (line 41). This duplication is unnecessary. Consider removing it from one location - either keep it in the top-level permissions block (recommended for clarity) or in the additional_permissions, but not both.

> +          # This is an optional setting that allows Claude to read CI results on PRs
+          additional_permissions: |
+            actions: read
+

The `actions: read` permission specified here is redundant as it's already declared in the job's permissions block at line 26. Consider removing this `additional_permissions` block entirely unless you need to grant permissions beyond what's already specified.
```suggestion

```

> +    #   - "src/**/*.js"
+    #   - "src/**/*.jsx"
+
+jobs:
+  claude-review:
+    # Optional: Filter by PR author
+    # if: |
+    #   github.event.pull_request.user.login == 'external-contributor' ||
+    #   github.event.pull_request.user.login == 'new-developer' ||
+    #   github.event.pull_request.author_association == 'FIRST_TIME_CONTRIBUTOR'
+
+    runs-on: ubuntu-latest
+    permissions:
+      contents: read
+      pull-requests: read
+      issues: read

Missing `actions: read` permission that's present in the other Claude workflow (claude.yml:26). Since both workflows use the same action (@anthropics/claude-code-action@v1), and the comment in claude.yml indicates this permission is "Required for Claude to read CI results on PRs", this permission should be added here for consistency and functionality. Add `actions: read` to the permissions block.
```suggestion
      issues: read
      actions: read    # Required for Claude to read CI results on PRs
```

> +            PR NUMBER: ${{ github.event.pull_request.number }}
+
+            Please review this pull request and provide feedback on:
+            - Code quality and best practices
+            - Potential bugs or issues
+            - Performance considerations
+            - Security concerns
+            - Test coverage
+
+            Use the repository's CLAUDE.md for guidance on style and conventions. Be constructive and helpful in your feedback.
+
+            Use `gh pr comment` with your Bash tool to leave your review as a comment on the PR.
+
+          # See https://github.com/anthropics/claude-code-action/blob/main/docs/usage.md
+          # or https://docs.claude.com/en/docs/claude-code/cli-reference for available options
+          claude_args: '--allowed-tools "Bash(gh issue view:*),Bash(gh search:*),Bash(gh issue list:*),Bash(gh pr comment:*),Bash(gh pr diff:*),Bash(gh pr view:*),Bash(gh pr list:*)"'

[nitpick] The `claude_args` configuration lists multiple individual Bash tool patterns for gh commands. Consider whether the wildcard pattern could be simplified. For example, `Bash(gh pr:*)` would cover all PR commands (view, list, comment, diff) more concisely. However, the current explicit approach is more restrictive and may be intentional for security.
```suggestion
          claude_args: '--allowed-tools "Bash(gh issue view:*),Bash(gh search:*),Bash(gh issue list:*),Bash(gh pr:*)"'
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/76#pullrequestreview-3520829663
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/setup/pull/76/review/3520829663@github.com>