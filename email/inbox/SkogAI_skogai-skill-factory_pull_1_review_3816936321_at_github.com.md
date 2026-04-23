MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogai-skill-factory <skogai-skill-factory@noreply.github.com>
Date: Tue, 17 Feb 2026 16:06:27 -0800
Subject: Re: [SkogAI/skogai-skill-factory] feat: add todo command family to generated-commands (PR #1)
Message-ID: <SkogAI/skogai-skill-factory/pull/1/review/3816936321@github.com>
In-Reply-To: <SkogAI/skogai-skill-factory/pull/1@github.com>
References: <SkogAI/skogai-skill-factory/pull/1@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6995028394433_ee112882290"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR adds a distributable command family for task lifecycle management using the skogai-todo CLI. It copies four slash commands (plan, setup, execute, done) into generated-commands/todo/ with a README explaining their usage and workflow.

**Changes:**
- Adds four command files (plan.md, setup.md, execute.md, done.md) implementing a complete task lifecycle workflow
- Includes a README.md documenting installation, usage, workflow, and command descriptions
- Introduces commands that integrate with skogai-todo CLI for task management with git worktrees

### Reviewed changes

Copilot reviewed 5 out of 5 changed files in this pull request and generated 4 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| generated-commands/todo/README.md | Documents the todo command family with installation instructions, command overview, workflow description, and state transitions |
| generated-commands/todo/plan.md | Implements big picture planning across all tasks with dependency analysis and prioritization |
| generated-commands/todo/setup.md | Prepares a task for execution by activating, locking, creating worktree, and enriching task file |
| generated-commands/todo/execute.md | Executes the actual work in a task's worktree following the handover instructions |
| generated-commands/todo/done.md | Closes out a completed task by reviewing, creating PR, unlocking, syncing, and cleaning up |
</details>






---

💡 <a href="/SkogAI/skogai-skill-factory/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -0,0 +1,61 @@
+---
+allowed-tools: Bash(skogai-todo:*)
+argument-hint: <task-id>
+description: Prepare a task for execution - activate, lock, create worktree, enrich task file.
+---
+
+## Context
+
+- Current locks: !`skogai-todo locks`
+- Existing worktrees: !`skogai-todo worktree list`
+- Task state transitions: !`skogai-todo transitions`
+
+## Workflow reference
+
+@~/claude/.skogai/workflows/tasks/preparation.md

This file reference points to a path that won't exist for users installing this command family. The path `~/claude/.skogai/workflows/tasks/preparation.md` appears to be specific to your local setup and won't be available when users copy these commands to their projects. Either remove this reference, include the referenced file in the distribution, or document that this is an optional reference that users can ignore.
```suggestion
Optional: Link to your own workflow documentation for task preparation here (for example, a checklist in your project's docs).
```

> @@ -0,0 +1,56 @@
+---
+allowed-tools: Bash(skogai-todo:*), Bash(git add:*), Bash(git commit:*), Bash(git status:*), Bash(git diff:*)
+argument-hint: <task-id>
+description: Execute a task in its worktree - do the work described in the handover.
+---
+
+## Workflow reference
+
+@~/claude/.skogai/workflows/tasks/execution.md

This file reference points to a path that won't exist for users installing this command family. The path `~/claude/.skogai/workflows/tasks/execution.md` appears to be specific to your local setup and won't be available when users copy these commands to their projects. Either remove this reference, include the referenced file in the distribution, or document that this is an optional reference that users can ignore.
```suggestion
Optional: Link to your project's task execution workflow documentation here, if available.
```

> +Using the context above, confirm:
+
+- Task is in `active` state
+- Task is locked
+- Worktree exists
+
+If any prerequisite is missing, tell the user to run `/todo:setup $ARGUMENTS` first.
+
+### 2. Enter the worktree
+
+cd into the worktree path shown above.

The command references "context above" on line 17 and line 27, but there is no Context section defined in this file. The execute.md file should include a Context section similar to setup.md and plan.md that provides runtime information about the task state, lock status, and worktree location. This information is needed for the validation steps.

> @@ -0,0 +1,53 @@
+---
+allowed-tools: Bash(skogai-todo:*), Bash(git log:*), Bash(git diff:*), Bash(gh:*)
+argument-hint: <task-id>
+description: Close out a task - review, PR, unlock, sync, and remove worktree.
+---
+
+## Your task
+
+Close out task `$ARGUMENTS`. This is the "done" phase — review the work, create a PR, and clean everything up.
+
+### 1. Validate
+
+Using the context above, confirm the task exists and has a worktree with commits.

The command references "context above" on line 13, but there is no Context section defined in this file. The done.md file should include a Context section similar to setup.md and plan.md that provides runtime information about the task state, worktree status, and commits. This information is needed for the validation step.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogai-skill-factory/pull/1#pullrequestreview-3816936321
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/skogai-skill-factory/pull/1/review/3816936321@github.com>