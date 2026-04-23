MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Fri, 12 Dec 2025 11:28:13 -0800
Subject: Re: [SkogAI/skogix] Review and update requesting-code-review skill to SkogAI conventions (PR #109)
Message-ID: <SkogAI/skogix/pull/109/review/3573309094@github.com>
In-Reply-To: <SkogAI/skogix/pull/109@github.com>
References: <SkogAI/skogix/pull/109@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_693c6ccde17ed_fe111816d2"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR reviews and updates the `requesting-code-review` skill documentation to improve consistency with SkogAI conventions. The changes enhance git SHA examples, standardize task tool formatting, add comprehensive troubleshooting guidance, and update template path references. The review documentation in `todo/skills-lookover/` follows a structured approach with findings, recommendations, and action items.

**Key Changes:**
- Enhanced git SHA selection examples with three scenarios (single commit, task-based, feature branch)
- Standardized task tool invocation format to match `subagent-driven-development` pattern
- Added new troubleshooting section covering common failure scenarios

### Reviewed changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 5 comments.

| File | Description |
| ---- | ----------- |
| todo/skills-lookover/requesting-code-review.md | Comprehensive review documentation detailing all findings, recommendations, and changes made to the skill |
| actions/requesting-code-review/SKILL.md | Updated skill with enhanced examples, standardized formatting, and new troubleshooting section |





---

💡 <a href="/SkogAI/skogix/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

>  ```bash
-BASE_SHA=$(git rev-parse HEAD~1)  # or origin/main
+# For single commit review:
+BASE_SHA=$(git rev-parse HEAD~1)
+HEAD_SHA=$(git rev-parse HEAD)
+
+# For task-based review (find commit where task started):
+BASE_SHA=$(git log --oneline | grep "Task N" | head -1 | awk '{print $1}')

The git command to find task start commits may not work reliably. The current command searches all of git history and takes the first (most recent) match, but this may not be the commit where the current task started if "Task N" appears in multiple commits. Consider using `git log --oneline --reverse | grep "Task N" | head -1` to get the oldest matching commit, or better yet, provide guidance to manually identify the starting commit SHA for the current task.
```suggestion
# This finds the oldest commit containing "Task N" in the message. Manually verify the SHA if in doubt.
BASE_SHA=$(git log --oneline --reverse | grep "Task N" | head -1 | awk '{print $1}')
```

>  HEAD_SHA=$(git rev-parse HEAD)
 ```
 
 **2. Dispatch code-reviewer subagent:**
 
-Use Task tool with superpowers:code-reviewer type, fill template at `code-reviewer.md`
+```
+Task tool (superpowers:code-reviewer):
+  Use template at actions/requesting-code-review/code-reviewer.md

The template path should be consistent with how it's referenced in other skills. The subagent-driven-development skill uses "requesting-code-review/code-reviewer.md" (line 66), while this skill now uses "actions/requesting-code-review/code-reviewer.md". For consistency across the codebase, these paths should match. Consider whether the path should be relative (as in subagent-driven-development) or absolute with the "actions/" prefix.
```suggestion
  Use template at requesting-code-review/code-reviewer.md
```

> @@ -56,7 +69,9 @@ You: Let me request code review before proceeding.
 BASE_SHA=$(git log --oneline | grep "Task 1" | head -1 | awk '{print $1}')
 HEAD_SHA=$(git rev-parse HEAD)
 
-[Dispatch superpowers:code-reviewer subagent]
+[Task tool (superpowers:code-reviewer)]
+  Use template at actions/requesting-code-review/code-reviewer.md

The template path should be consistent with how it's referenced in other skills. The subagent-driven-development skill uses "requesting-code-review/code-reviewer.md" (line 66), while this example now uses "actions/requesting-code-review/code-reviewer.md". For consistency across the codebase, these paths should match the same pattern used on line 46.
```suggestion
  Use template at requesting-code-review/code-reviewer.md
```

> @@ -102,4 +145,4 @@ You: [Fix progress indicators]
 - Show code/tests that prove it works
 - Request clarification
 
-See template at: requesting-code-review/code-reviewer.md
+See template at: actions/requesting-code-review/code-reviewer.md

The template path should be consistent with how it's referenced in other skills. The subagent-driven-development skill uses "requesting-code-review/code-reviewer.md" (line 66), while this reference now uses "actions/requesting-code-review/code-reviewer.md". For consistency across the codebase, these paths should match the same pattern used throughout the file.
```suggestion
See template at: requesting-code-review/code-reviewer.md
```

> @@ -56,7 +69,9 @@ You: Let me request code review before proceeding.
 BASE_SHA=$(git log --oneline | grep "Task 1" | head -1 | awk '{print $1}')

The git command to find task start commits may not work reliably. The current command searches all of git history and takes the first (most recent) match, but this may not be the commit where Task 1 started if "Task 1" appears in multiple commits. Consider using `git log --oneline --reverse | grep "Task 1" | head -1` to get the oldest matching commit, or provide a more specific search pattern that matches the exact commit message format used in the codebase.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/109#pullrequestreview-3573309094
You are receiving this because you were assigned.

Message ID: <SkogAI/skogix/pull/109/review/3573309094@github.com>