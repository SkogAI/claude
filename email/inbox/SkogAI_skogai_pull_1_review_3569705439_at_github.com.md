MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogai <skogai@noreply.github.com>
Date: Thu, 11 Dec 2025 15:27:17 -0800
Subject: Re: [SkogAI/skogai] Add Claude Code GitHub Workflow (PR #1)
Message-ID: <SkogAI/skogai/pull/1/review/3569705439@github.com>
In-Reply-To: <SkogAI/skogai/pull/1@github.com>
References: <SkogAI/skogai/pull/1@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_693b53551fcb4_e11118225827"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR adds GitHub Actions workflows to enable Claude Code integration for AI-assisted development. The integration provides two modes: on-demand assistance via @claude mentions in issues/PRs (claude.yml), and automatic code review on new/updated pull requests (claude-code-review.yml). The workflows leverage the repository's existing CLAUDE.md file for project-specific guidance.

### Key Changes
- Added on-demand Claude assistance workflow triggered by @claude mentions in issues and PR comments
- Added automatic Claude code review workflow for all new or updated pull requests  
- Configured permissions and tool access for Claude to read repository context and post feedback

### Reviewed changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 10 comments.

| File | Description |
| ---- | ----------- |
| `.github/workflows/claude.yml` | Enables on-demand Claude assistance via @claude mentions in issues and pull request comments |
| `.github/workflows/claude-code-review.yml` | Provides automatic Claude-powered code reviews on pull request creation and updates |





---

💡 <a href="/SkogAI/skogai/new/develop/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +    #   - "src/**/*.tsx"
+    #   - "src/**/*.js"
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

The workflow only has read permissions, but the prompt instructs Claude to use 'gh pr comment' to leave review comments on the PR. Add pull-requests: write permission to enable Claude to post review comments as intended.
```suggestion
      pull-requests: write
```

> +    if: |
+      (github.event_name == 'issue_comment' && contains(github.event.comment.body, '@claude')) ||
+      (github.event_name == 'pull_request_review_comment' && contains(github.event.comment.body, '@claude')) ||
+      (github.event_name == 'pull_request_review' && contains(github.event.review.body, '@claude')) ||
+      (github.event_name == 'issues' && (contains(github.event.issue.body, '@claude') || contains(github.event.issue.title, '@claude')))

The workflow can be triggered by any user who opens an issue or makes a comment, not just users with write access as stated in the PR description. Consider adding a check to verify the user has write access before allowing Claude to execute, or add a job-level condition that checks permissions using github.actor and the repository permission level.

> +    runs-on: ubuntu-latest
+    permissions:
+      contents: read
+      pull-requests: read
+      issues: read
+      id-token: write
+      actions: read # Required for Claude to read CI results on PRs
+    steps:
+      - name: Checkout repository
+        uses: actions/checkout@v4
+        with:
+          fetch-depth: 1
+
+      - name: Run Claude Code
+        id: claude
+        uses: anthropics/claude-code-action@v1

Using @v1 for the action version tag allows automatic updates to new major versions, which could introduce breaking changes. Consider pinning to a specific commit SHA or using a more specific version tag like @v1.0.0 to ensure reproducible builds and prevent unexpected behavior from updates.
```suggestion
        uses: anthropics/claude-code-action@v1.0.0
```

> +    runs-on: ubuntu-latest
+    permissions:
+      contents: read
+      pull-requests: read
+      issues: read
+      id-token: write
+
+    steps:
+      - name: Checkout repository
+        uses: actions/checkout@v4
+        with:
+          fetch-depth: 1
+
+      - name: Run Claude Code Review
+        id: claude-review
+        uses: anthropics/claude-code-action@v1

Using @v1 for the action version tag allows automatic updates to new major versions, which could introduce breaking changes. Consider pinning to a specific commit SHA or using a more specific version tag like @v1.0.0 to ensure reproducible builds and prevent unexpected behavior from updates.
```suggestion
        uses: anthropics/claude-code-action@v1.0.0
```

> +    #   github.event.pull_request.user.login == 'external-contributor' ||
+    #   github.event.pull_request.user.login == 'new-developer' ||
+    #   github.event.pull_request.author_association == 'FIRST_TIME_CONTRIBUTOR'
+
+    runs-on: ubuntu-latest
+    permissions:
+      contents: read
+      pull-requests: read
+      issues: read
+      id-token: write
+
+    steps:
+      - name: Checkout repository
+        uses: actions/checkout@v4
+        with:
+          fetch-depth: 1

Setting fetch-depth to 1 performs a shallow clone which only fetches the latest commit. For PR reviews and diff analysis, Claude needs access to the base branch and PR commits to properly review changes. Consider using fetch-depth: 0 for full history or removing this parameter to use the default behavior which fetches enough commits for proper diff analysis.
```suggestion
          fetch-depth: 0
```

> +      contents: read
+      pull-requests: read
+      issues: read

The workflow has read-only permissions for contents, pull-requests, and issues, but Claude Code needs write permissions to create comments, branches, and commits as mentioned in the PR description. Add write permissions for pull-requests and issues to allow Claude to post responses, and contents: write to enable branch and commit creation.
```suggestion
      contents: write
      pull-requests: write
      issues: write
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
+          # or https://code.claude.com/docs/en/cli-reference for available options
+          claude_args: '--allowed-tools "Bash(gh issue view:*),Bash(gh search:*),Bash(gh issue list:*),Bash(gh pr comment:*),Bash(gh pr diff:*),Bash(gh pr view:*),Bash(gh pr list:*)"'

The allowed tools list includes patterns with colons and asterisks (e.g., 'gh issue view:*') which appears inconsistent with the example in claude.yml line 49 that uses parentheses (e.g., 'Bash(gh pr:*)'). Verify the correct syntax for tool permissions and ensure consistency with the Claude Code action documentation.

> @@ -0,0 +1,50 @@
+name: Claude Code

Consider adding a comment at the top of the file describing the workflow's purpose and when it runs, similar to the detailed description in the PR. This would help future maintainers understand the workflow without needing to reference external documentation.

> @@ -0,0 +1,57 @@
+name: Claude Code Review

Consider adding a comment at the top of the file describing the workflow's purpose and how it differs from claude.yml. This would help future maintainers understand when automatic code reviews run versus when Claude responds to mentions.

> +      (github.event_name == 'issue_comment' && contains(github.event.comment.body, '@claude')) ||
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
+    steps:
+      - name: Checkout repository
+        uses: actions/checkout@v4
+        with:
+          fetch-depth: 1

Setting fetch-depth to 1 performs a shallow clone which only fetches the latest commit. For PR reviews and diff analysis, Claude may need access to multiple commits or the full history to understand changes. Consider using fetch-depth: 0 for full history or removing this parameter to use the default behavior which fetches enough history for proper diff analysis.
```suggestion
          fetch-depth: 0
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogai/pull/1#pullrequestreview-3569705439
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/skogai/pull/1/review/3569705439@github.com>