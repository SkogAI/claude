MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogai <skogai@noreply.github.com>
Date: Thu, 11 Dec 2025 17:39:02 -0800
Subject: Re: [SkogAI/skogai] Remove restrictive tool allowlist from Claude Code Review workflow (PR #3)
Message-ID: <SkogAI/skogai/pull/3/review/3569928635@github.com>
In-Reply-To: <SkogAI/skogai/pull/3@github.com>
References: <SkogAI/skogai/pull/3@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_693b7236d4d25_e51118197097"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR fixes a Claude Code Review workflow failure caused by overly restrictive tool permissions. The workflow was failing immediately (1 turn, 0 cost, `is_error: true`) because Claude was limited to only 7 specific `gh` commands and couldn't access basic repository operations like reading files or navigating directories.

**Key Changes:**
- Removed the restrictive `--allowed-tools` argument that limited Claude to only specific `gh` commands
- Updated documentation link from GitHub to the official Claude CLI reference
- Added inline comments explaining why the restriction was removed





---

💡 <a href="/SkogAI/skogai/new/develop/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -56,6 +56,10 @@ jobs:
             Use `gh pr comment` with your Bash tool to leave your review as a comment on the PR.
           
           # See https://github.com/anthropics/claude-code-action/blob/main/docs/usage.md
-          # or https://docs.anthropic.com/en/docs/claude-code/sdk#command-line for available options
-          claude_args: '--allowed-tools "Bash(gh issue view:*),Bash(gh search:*),Bash(gh issue list:*),Bash(gh pr comment:*),Bash(gh pr diff:*),Bash(gh pr view:*),Bash(gh pr list:*)"'
+          # or https://code.claude.com/docs/en/cli-reference for available options
+          # Removed overly restrictive tool allowlist to enable Claude to:
+          # - Read and navigate repository files
+          # - Analyze code and provide meaningful reviews
+          # - Use gh commands to interact with the PR
+          # claude_args: ''

The `claude_args` is commented out, which means it will not be applied. This should either be uncommented with an empty value or removed entirely. Commenting out the parameter line means it won't be passed to the action at all. Based on the other workflow file (claude.yml:48), consider using `claude_args: "--allowed-tools *"` to explicitly grant all tools, or `claude_args: ""` with the line uncommented to use defaults.
```suggestion
          claude_args: "--allowed-tools *"
```

> @@ -56,6 +56,10 @@ jobs:
             Use `gh pr comment` with your Bash tool to leave your review as a comment on the PR.
           
           # See https://github.com/anthropics/claude-code-action/blob/main/docs/usage.md
-          # or https://docs.anthropic.com/en/docs/claude-code/sdk#command-line for available options
-          claude_args: '--allowed-tools "Bash(gh issue view:*),Bash(gh search:*),Bash(gh issue list:*),Bash(gh pr comment:*),Bash(gh pr diff:*),Bash(gh pr view:*),Bash(gh pr list:*)"'
+          # or https://code.claude.com/docs/en/cli-reference for available options

The documentation link has been updated to point to code.claude.com, but the anthropics GitHub link is still referenced. Consider removing the GitHub link since it appears to be outdated, or verify both links are valid and useful.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogai/pull/3#pullrequestreview-3569928635
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/skogai/pull/3/review/3569928635@github.com>