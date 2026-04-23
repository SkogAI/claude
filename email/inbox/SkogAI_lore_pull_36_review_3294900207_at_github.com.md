MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Thu, 02 Oct 2025 07:21:17 -0700
Subject: Re: [SkogAI/lore] Add claude GitHub actions 1759414709868 (PR #36)
Message-ID: <SkogAI/lore/pull/36/review/3294900207@github.com>
In-Reply-To: <SkogAI/lore/pull/36@github.com>
References: <SkogAI/lore/pull/36@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68de8a5d5c7ad_e410d821556"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR adds two new GitHub Actions workflows to integrate Claude AI capabilities into the repository's CI/CD pipeline. The workflows enable Claude to respond to mentions in issues and pull requests, as well as automatically review pull requests for code quality.

- Added Claude mention-based interaction workflow that triggers when @claude is mentioned
- Added automated Claude code review workflow for pull requests
- Configured proper permissions and tool restrictions for secure Claude operations

### Reviewed Changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 1 comment.

| File | Description |
| ---- | ----------- |
| `.github/workflows/claude.yml` | Main Claude interaction workflow triggered by @claude mentions in issues, comments, and reviews |
| `.github/workflows/claude-code-review.yml` | Automated Claude code review workflow that runs on pull request creation and updates |





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
+          # or https://docs.claude.com/en/docs/claude-code/sdk#command-line for available options
+          claude_args: '--allowed-tools "Bash(gh issue view:*),Bash(gh search:*),Bash(gh issue list:*),Bash(gh pr comment:*),Bash(gh pr diff:*),Bash(gh pr view:*),Bash(gh pr list:*)"'

The tool permissions are quite broad, allowing Claude to execute various GitHub CLI commands. Consider restricting to only the minimum required tools (e.g., just `gh pr comment:*` for leaving reviews) to follow the principle of least privilege.
```suggestion
          claude_args: '--allowed-tools "Bash(gh pr comment:*)"'
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/36#pullrequestreview-3294900207
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/lore/pull/36/review/3294900207@github.com>