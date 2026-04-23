MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Fri, 14 Nov 2025 09:55:02 -0800
Subject: Re: [SkogAI/skogix] Add Claude Code GitHub Workflow (PR #22)
Message-ID: <SkogAI/skogix/pull/22/review/3466094608@github.com>
In-Reply-To: <SkogAI/skogix/pull/22@github.com>
References: <SkogAI/skogix/pull/22@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69176cf618aae_c311087683d"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR adds two GitHub Actions workflows to enable Claude Code integration: an interactive workflow triggered by `@claude` mentions in comments, and an automated code review workflow that runs on pull requests.

**Key Changes:**
- Interactive Claude workflow triggered by `@claude` mentions in PR/issue comments
- Automated Claude code review workflow that runs on PR opens/updates
- Configuration for Claude's allowed tools and custom prompts

### Reviewed Changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 3 comments.

| File | Description |
| ---- | ----------- |
| `.github/workflows/claude.yml` | Defines the interactive workflow that responds to `@claude` mentions in comments, with triggers for issue comments, PR review comments, and issue/PR creation |
| `.github/workflows/claude-code-review.yml` | Defines an automated code review workflow that runs on PR opens/synchronize events, configured with a custom review prompt and allowed GitHub CLI tools |





---

💡 <a href="/SkogAI/skogix/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +      contents: read
+      pull-requests: read
+      issues: read

The workflow has insufficient permissions for Claude to function as described. According to the PR description, Claude should be able to create "comments, branches, and commits". The current configuration is missing:
- `contents: write` (currently set to `read`) - needed for creating branches and commits
- `pull-requests: write` - needed for posting comments on pull requests
- `issues: write` - needed for posting comments on issues

Update the permissions block to include write access for these resources.
```suggestion
      contents: write
      pull-requests: write
      issues: write
```

> +          # This is an optional setting that allows Claude to read CI results on PRs
+          additional_permissions: |
+            actions: read
+

[nitpick] The `additional_permissions` section specifies `actions: read`, but this permission is already defined in the main `permissions` block at line 26. This is redundant and could cause confusion.

Consider removing the `additional_permissions` section or updating the comment to clarify why it's specified here.
```suggestion

```

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

The workflow is missing `pull-requests: write` permission, which is required for Claude to post review comments on pull requests as instructed in the prompt (line 52: "Use `gh pr comment`..."). Without this permission, the `gh pr comment` command will fail.

Add `pull-requests: write` to the permissions block.
```suggestion
      pull-requests: write
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/22#pullrequestreview-3466094608
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/skogix/pull/22/review/3466094608@github.com>