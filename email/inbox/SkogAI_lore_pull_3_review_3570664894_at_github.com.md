MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Thu, 11 Dec 2025 23:33:33 -0800
Subject: Re: [SkogAI/lore] Migrate claude-code-review workflow from Anthropic API to Claude Code OAuth (PR #3)
Message-ID: <SkogAI/lore/pull/3/review/3570664894@github.com>
In-Reply-To: <SkogAI/lore/pull/3@github.com>
References: <SkogAI/lore/pull/3@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_693bc54dbca06_ae1118330443"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR migrates the `claude-code-review.yml` workflow from direct Anthropic API authentication to Claude Code OAuth, aligning it with the authentication pattern used by other Claude workflows in the repository.

**Key change:**
- Replaced `anthropic_api_key` parameter with `claude_code_oauth_token` in the Claude Code action configuration





> @@ -81,7 +81,7 @@ jobs:
         id: claude-review
         uses: anthropics/claude-code-action@v1
         with:
-          anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
+          claude_code_oauth_token: ${{ secrets.CLAUDE_CODE_OAUTH_TOKEN }}

Inconsistent parameter casing across Claude workflows. This workflow uses `claude_code_oauth_token` (lowercase), which matches `claude-lore-keeper.yml`, but `claude.yml` uses `CLAUDE_CODE_OAUTH_TOKEN` (uppercase). This inconsistency should be resolved across all three workflows to ensure maintainability and avoid confusion. Verify which casing is correct for the `anthropics/claude-code-action@v1` action and standardize all workflows to use the same parameter name.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/3#pullrequestreview-3570664894
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/lore/pull/3/review/3570664894@github.com>