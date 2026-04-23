MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Fri, 12 Dec 2025 11:28:43 -0800
Subject: Re: [SkogAI/skogix] Update subagent-driven-development skill to SkogAI conventions (PR #110)
Message-ID: <SkogAI/skogix/pull/110/review/3573310609@github.com>
In-Reply-To: <SkogAI/skogix/pull/110@github.com>
References: <SkogAI/skogix/pull/110@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_693c6cebaf255_11311185651d"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR updates the subagent-driven-development skill to align with SkogAI documentation standards, improving discoverability, clarity, and consistency with other skills in the repository.

Key changes:
- Shortened description and improved trigger pattern specificity
- Added "Announce at start" convention and proper Overview section structure
- Replaced generic placeholders with concrete examples throughout
- Added comprehensive Common Mistakes section with Problem/Fix format
- Enhanced Red Flags section with positive "Always" guidance





---

💡 <a href="/SkogAI/skogix/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +Task tool (code-reviewer):
+  WHAT_WAS_IMPLEMENTED: Hook installation script with install-hook command, 5 tests covering happy path and error cases
+  PLAN_OR_REQUIREMENTS: Task 1 from docs/plans/2025-12-10-hook-system.md
+  BASE_SHA: a7981ec
+  HEAD_SHA: 3df7661
+  DESCRIPTION: Add install-hook script with validation and error handling

The example shows template parameters (WHAT_WAS_IMPLEMENTED, PLAN_OR_REQUIREMENTS, BASE_SHA, HEAD_SHA, DESCRIPTION) without explaining their origin or structure. The removed references to requesting-code-review/code-reviewer.md template (previously at this line and at the end) provided context for these parameters. Consider adding a brief note like "See requesting-code-review skill for parameter details" to help users understand where these parameters come from.

> @@ -1,15 +1,17 @@
 ---
 name: subagent-driven-development
-description: Use when executing implementation plans with independent tasks in the current session - dispatches fresh subagent for each task with code review between tasks, enabling fast iteration with quality gates
+description: Use when executing implementation plans with independent tasks in current session - dispatches fresh subagent per task with automated code review, enabling fast iteration with quality gates

The PR description claims the frontmatter description was shortened to 162 characters, but the actual description is 204 characters long. While this is still well under the 500-character guideline and within the 1024-character frontmatter limit, the PR description contains an inaccurate character count.

> @@ -62,14 +64,12 @@ Task tool (general-purpose):
 
 **Dispatch code-reviewer subagent:**
 ```
-Task tool (superpowers:code-reviewer):
-  Use template at requesting-code-review/code-reviewer.md
-
-  WHAT_WAS_IMPLEMENTED: [from subagent's report]
-  PLAN_OR_REQUIREMENTS: Task N from [plan-file]
-  BASE_SHA: [commit before task]
-  HEAD_SHA: [current commit]
-  DESCRIPTION: [task summary]
+Task tool (code-reviewer):

The removal of the 'superpowers:' prefix from 'code-reviewer' creates inconsistency with the requesting-code-review skill, which still uses 'superpowers:code-reviewer' throughout (lines 3, 8, 34, 59 of actions/requesting-code-review/SKILL.md). This inconsistency could confuse users about the correct way to reference the code-reviewer subagent. Either both skills should use the prefix or neither should.
```suggestion
Task tool (superpowers:code-reviewer):
```

> @@ -103,7 +117,7 @@ After all tasks complete, dispatch final code-reviewer:
 
 After final review passes:
 - Announce: "I'm using the finishing-a-development-branch skill to complete this work."
-- **REQUIRED SUB-SKILL:** Use superpowers:finishing-a-development-branch
+- **REQUIRED SUB-SKILL:** Use finishing-a-development-branch

The removal of the 'superpowers:' prefix from 'finishing-a-development-branch' creates inconsistency with the executing-plans skill, which still uses 'superpowers:finishing-a-development-branch' (line 49 of actions/executing-plans/SKILL.md). This inconsistency could confuse users about the correct way to reference the finishing-a-development-branch skill. Either both skills should use the prefix or neither should.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/110#pullrequestreview-3573310609
You are receiving this because you were assigned.

Message ID: <SkogAI/skogix/pull/110/review/3573310609@github.com>