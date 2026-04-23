MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Sun, 04 Jan 2026 21:28:14 -0800
Subject: [SkogAI/lore] [WIP] Add generation queue for offline and batch lore processing (PR #45)
Message-ID: <SkogAI/lore/pull/45@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_695b4bee441cc_f210d015000c2"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT ORIGINAL PROMPT --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;feat: Add generation queue for offline/batch lore processing&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Problem
&gt; Currently, lore generation requires an active LLM connection. Users want to:
&gt; 1. Queue generation tasks during work sessions
&gt; 2. Process queues during downtime (cheaper, batch)
&gt; 3. Review generated content before committing
&gt; 
&gt; ## Proposed Solution
&gt; Create a simple file-based queue system:
&gt; 
&gt; ```
&gt; queue/
&gt; ├── pending/           # Tasks waiting to be processed
&gt; │   └── task_1704567890.json
&gt; ├── processing/        # Currently being processed
&gt; ├── completed/         # Finished tasks with output
&gt; │   └── task_1704567890.json
&gt; └── failed/            # Tasks that errored
&gt; ```
&gt; 
&gt; ### Task Format
&gt; ```json
&gt; {
&gt;   &quot;id&quot;: &quot;task_1704567890&quot;,
&gt;   &quot;type&quot;: &quot;entry&quot;,
&gt;   &quot;prompt_ref&quot;: &quot;prompts/lore-entry-generation.yaml&quot;,
&gt;   &quot;data&quot;: {
&gt;     &quot;title&quot;: &quot;The Dark Tower&quot;,
&gt;     &quot;category&quot;: &quot;place&quot;
&gt;   },
&gt;   &quot;created_at&quot;: &quot;2026-01-04T12:00:00Z&quot;,
&gt;   &quot;priority&quot;: &quot;normal&quot;,
&gt;   &quot;persona_id&quot;: &quot;persona_1744992765&quot;
&gt; }
&gt; ```
&gt; 
&gt; ## Acceptance Criteria
&gt; - [ ] Create queue directory structure
&gt; - [ ] Add `queue-task.sh` script to add tasks to queue
&gt; - [ ] Add `process-queue.sh` script to process pending tasks
&gt; - [ ] Integrate with existing `llama-lore-creator.sh` for actual generation
&gt; - [ ] Document queue workflow in `docs/QUEUE_SYSTEM.md`
&gt; 
&gt; ## CLI Interface
&gt; ```bash
&gt; # Add to queue
&gt; ./tools/queue-task.sh entry &quot;The Dark Tower&quot; &quot;place&quot; --persona amy
&gt; 
&gt; # Process queue (with optional provider)
&gt; LLM_PROVIDER=ollama ./tools/process-queue.sh
&gt; 
&gt; # Check queue status
&gt; ./tools/queue-task.sh status
&gt; ```
&gt; 
&gt; ## Dependencies
&gt; - SkogAI/lore#29 (Extract prompts to files) - prompts need to be loadable
&gt; 
&gt; ## Estimated Effort
&gt; ~4-6 hours&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;



&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;

- Fixes SkogAI/lore#30

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.
You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/lore/pull/45

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/lore/pull/45.patch
https://github.com/SkogAI/lore/pull/45.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/45
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/lore/pull/45@github.com&gt;
