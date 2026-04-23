MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: "SkogAI/.skogai" <.skogai@noreply.github.com>
Date: Sun, 28 Sep 2025 14:09:11 -0700
Subject: Re: [SkogAI/.skogai] Add Claude Code GitHub Workflow (PR #1)
Message-ID: <SkogAI/.skogai/pull/1/review/3277386339@github.com>
In-Reply-To: <SkogAI/.skogai/pull/1@github.com>
References: <SkogAI/.skogai/pull/1@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68d9a3f77abde_216a010c8220437"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR adds GitHub Actions workflows to integrate Claude Code, an AI coding agent, into the repository. The integration enables automated code reviews and on-demand assistance through @claude mentions in PR and issue comments.

- Adds two GitHub Actions workflows for Claude Code integration
- Enables automated code reviews on pull requests
- Allows triggering Claude assistance via @claude mentions in comments

### Reviewed Changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 2 comments.

| File | Description |
| ---- | ----------- |
| .github/workflows/claude.yml | Main workflow that triggers Claude when mentioned in PR/issue comments |
| .github/workflows/claude-code-review.yml | Automated code review workflow that runs on PR creation/updates |





---

<sub>**Tip:** Customize your code reviews with copilot-instructions.md. <a href="/SkogAI/.skogai/new/master/.github?filename=copilot-instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Create the file</a> or <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">learn how to get started</a>.</sub>

> +      contents: read
+      pull-requests: read
+      issues: read
+      id-token: write
+      actions: read # Required for Claude to read CI results on PRs

The workflow defines `actions: read` permission twice - once in the permissions block (line 26) and again in additional_permissions (line 41). This duplication is unnecessary and could cause confusion. Remove one of the declarations.

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

The automated code review workflow is missing the `pull-requests: write` permission, which is likely required for Claude to post review comments on PRs. Add this permission to ensure the workflow can function properly.
```suggestion
      pull-requests: write
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/.skogai/pull/1#pullrequestreview-3277386339
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/.skogai/pull/1/review/3277386339@github.com>