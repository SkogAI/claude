MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Fri, 12 Dec 2025 14:49:31 -0800
Subject: Re: [SkogAI/skogix] Fix Claude workflow permission check failure for bot actors (PR #122)
Message-ID: <SkogAI/skogix/pull/122/review/3573842350@github.com>
In-Reply-To: <SkogAI/skogix/pull/122@github.com>
References: <SkogAI/skogix/pull/122@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_693c9bfbe8237_e9111816861e"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR fixes a critical issue where Claude Code workflows failed when triggered by bot actors (e.g., GitHub Copilot) due to permission check API failures. The solution implements a dual-layer bot filtering approach: primary protection via `if` conditions that skip workflow execution for known bots, and secondary validation via the `allowed_bots` parameter.

### Key Changes
- Added bot filtering `if` conditions to both workflows to prevent execution for copilot, dependabot, renovate, and github-actions bots
- Configured `allowed_bots` parameter in both workflows as secondary validation
- Created comprehensive documentation explaining the workflows, bot filtering mechanism, troubleshooting steps, and security considerations

### Reviewed changes

Copilot reviewed 3 out of 3 changed files in this pull request and generated 3 comments.

| File | Description |
| ---- | ----------- |
| `.github/workflows/claude.yml` | Added bot filtering conditions to skip workflow for known bots; added `allowed_bots` parameter |
| `.github/workflows/claude-code-review.yml` | Added bot filtering conditions to skip workflow for known bot PRs; added `allowed_bots` parameter |
| `docs/workflows/claude-workflows.md` | New comprehensive documentation covering workflow purposes, triggers, bot filtering, troubleshooting, and security considerations |





---

💡 <a href="/SkogAI/skogix/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +
+### "Copilot is not a user" Error
+
+**Symptom**: Workflow fails during prepare step with error:
+```
+Failed to check permissions for Copilot: HttpError: Copilot is not a user
+```
+
+**Cause**: The Claude Code Action tries to check repository permissions for the actor (PR author or comment author). When the actor is a bot like "copilot" that doesn't follow GitHub's standard bot naming convention (username[bot]), the GitHub API returns an error.
+
+Note: Not all bots follow the `[bot]` suffix convention. GitHub Apps typically use this format (e.g., `dependabot[bot]`), but some integrations like GitHub Copilot use plain usernames (e.g., `copilot`). This inconsistency requires explicit handling of both formats.
+
+**Solution**: The workflows are configured to skip execution when the actor is a known bot using `if` conditions. If you encounter this error with a different bot:
+
+1. Add the bot username to the `if` condition in the workflow file
+2. Add the bot to the `allowed_bots` parameter (without the `[bot]` suffix if it has one)

The instruction to add bots "without the `[bot]` suffix if it has one" is unclear and potentially confusing. The actual implementation shows that `allowed_bots` uses the base name without the suffix (e.g., "dependabot" not "dependabot[bot]"), but the phrasing makes it sound conditional. Consider rephrasing to: "Add the bot to the `allowed_bots` parameter using only its base name without any `[bot]` suffix".
```suggestion
2. Add the bot to the `allowed_bots` parameter using only its base name without any `[bot]` suffix
```

> +      github.event.pull_request.user.login != 'copilot' &&
+      github.event.pull_request.user.login != 'dependabot[bot]' &&
+      github.event.pull_request.user.login != 'renovate[bot]' &&
+      github.event.pull_request.user.login != 'github-actions[bot]'

The bot filtering condition checks "copilot" without a "[bot]" suffix on line 17, but checks other bots with the "[bot]" suffix (lines 18-20). This inconsistency exists because "copilot" doesn't follow GitHub's standard bot naming convention. Consider adding an inline comment explaining why "copilot" is treated differently to improve maintainability and prevent future confusion.

> +      github.actor != 'copilot' &&
+      github.actor != 'dependabot[bot]' &&
+      github.actor != 'renovate[bot]' &&
+      github.actor != 'github-actions[bot]'

The bot filtering condition checks "copilot" without a "[bot]" suffix on line 22, but checks other bots with the "[bot]" suffix (lines 23-25). This inconsistency exists because "copilot" doesn't follow GitHub's standard bot naming convention. Consider adding an inline comment explaining why "copilot" is treated differently to improve maintainability and prevent future confusion.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/122#pullrequestreview-3573842350
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/skogix/pull/122/review/3573842350@github.com>