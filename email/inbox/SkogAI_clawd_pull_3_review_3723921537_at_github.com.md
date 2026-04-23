MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/clawd <clawd@noreply.github.com>
Date: Thu, 29 Jan 2026 08:56:01 -0800
Subject: Re: [SkogAI/clawd] Create claude-manual.yml (PR #3)
Message-ID: <SkogAI/clawd/pull/3/review/3723921537@github.com>
In-Reply-To: <SkogAI/clawd/pull/3@github.com>
References: <SkogAI/clawd/pull/3@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_697b91215428d_12311183177f9"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR adds a new GitHub Actions workflow that enables manual triggering of Claude Code with custom prompts. The workflow is designed to provide a convenient way to invoke Claude Code automation on demand, with optional issue/PR context.

**Changes:**
- Added a manually-triggered GitHub Actions workflow that accepts a user prompt and optional issue/PR number
- Configured the workflow with necessary permissions for repository operations (contents, pull-requests, issues, etc.)
- Integrated with the `anthropics/claude-code-action@v1` action using OAuth token authentication





---

💡 <a href="/SkogAI/clawd/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +            REPO: ${{ github.repository }}
+            ${{ inputs.issue_number && format('ISSUE/PR: #{0}', inputs.issue_number) || '' }}

When issue_number is not provided, this conditional expression will evaluate to an empty string, leaving a blank line in the prompt. While not necessarily breaking, it would be cleaner to use a format that doesn't leave extra whitespace. Consider using GitHub Actions' conditional job steps or reformatting the prompt to avoid the extra blank line when the issue_number is omitted.
```suggestion
            REPO: ${{ github.repository }}${{ inputs.issue_number && format(' ISSUE/PR: #{0}', inputs.issue_number) || '' }}
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/clawd/pull/3#pullrequestreview-3723921537
You are receiving this because you authored the thread.

Message ID: <SkogAI/clawd/pull/3/review/3723921537@github.com>