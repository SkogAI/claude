MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: "SkogAI/.dotfiles" <.dotfiles@noreply.github.com>
Date: Sat, 27 Sep 2025 19:34:56 -0700
Subject: Re: [SkogAI/.dotfiles] Fix Claude Code GitHub Action failures by making workflows conditional (PR #6)
Message-ID: <SkogAI/.dotfiles/pull/6/review/3275252216@github.com>
In-Reply-To: <SkogAI/.dotfiles/pull/6@github.com>
References: <SkogAI/.dotfiles/pull/6@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68d89ed05415e_7bcbe10c8789aa"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR fixes GitHub Action failures by making Claude Code workflows conditional on the availability of required secrets. The workflows will now skip gracefully when the OAuth token is not configured instead of failing.

- Added conditional checks to prevent workflow execution when `CLAUDE_CODE_OAUTH_TOKEN` is missing
- Updated documentation to explain the optional GitHub Actions setup
- Maintained backward compatibility while eliminating failures

### Reviewed Changes

Copilot reviewed 3 out of 3 changed files in this pull request and generated 1 comment.

| File | Description |
| ---- | ----------- |
| `.github/workflows/claude.yml` | Added secret availability check to existing conditional logic |
| `.github/workflows/claude-code-review.yml` | Added conditional check and updated commented filter example |
| `README.md` | Added documentation for GitHub Actions setup and configuration |





---

<sub>**Tip:** Customize your code reviews with copilot-instructions.md. <a href="/SkogAI/.dotfiles/new/master/.github?filename=copilot-instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Create the file</a> or <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">learn how to get started</a>.</sub>

> @@ -12,11 +12,15 @@ on:
 
 jobs:
   claude-review:
+    # Only run if the Claude Code OAuth token is available
+    if: secrets.CLAUDE_CODE_OAUTH_TOKEN != ''
     # Optional: Filter by PR author

The commented code shows an inconsistent pattern. The active conditional uses `if: secrets.CLAUDE_CODE_OAUTH_TOKEN != ''` while the commented example shows the secret check combined with author filtering. Consider updating the commented example to show how to properly combine both conditions without duplicating the secret check.
```suggestion
    # Optional: To filter by PR author, replace the above 'if' with the following combined condition:
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/.dotfiles/pull/6#pullrequestreview-3275252216
You are receiving this because you were assigned.

Message ID: <SkogAI/.dotfiles/pull/6/review/3275252216@github.com>