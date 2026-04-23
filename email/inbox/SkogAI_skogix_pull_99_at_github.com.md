MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Sat, 29 Nov 2025 12:26:16 -0800
Subject: [SkogAI/skogix] [WIP] Add persistent task execution with automatic retry (PR #99)
Message-ID: <SkogAI/skogix/pull/99@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692b56e8b5187_10011001393334"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;skogai-queue-service: Persistent task execution with automatic retry&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Summary
&gt; 
&gt; Lightweight queue service for fire-and-forget task execution with automatic retries, exponential backoff, and persistent state.
&gt; 
&gt; ## Current Status: ✅ Production Ready
&gt; 
&gt; Fully implemented and tested. Solves the problem of manually retrying flaky network operations.
&gt; 
&gt; ## Features
&gt; 
&gt; - **Fire-and-forget**: Queue operations and walk away
&gt; - **Automatic retry**: Exponential backoff (10s → 30s → 90s → 270s → 810s)
&gt; - **Persistent state**: Survives terminal close, reboots
&gt; - **Parallel execution**: Configurable concurrent jobs
&gt; - **Progress tracking**: pending, running, completed, failed
&gt; - **JSON storage**: `~/.cache/skogai/queue.json`
&gt; 
&gt; ## Usage
&gt; 
&gt; ```bash
&gt; # Add operations
&gt; queue add &quot;git push origin feature-1&quot;
&gt; queue add &quot;git push origin feature-2&quot;
&gt; 
&gt; # Process queue
&gt; queue run
&gt; 
&gt; # Check status
&gt; queue status
&gt; ```
&gt; 
&gt; ## Problem Solved
&gt; 
&gt; Before: 18 worktrees/branches, network issues caused ~15 retry attempts, constant manual intervention
&gt; 
&gt; After: Queue all 18 operations, run once, come back to completion
&gt; 
&gt; ## Future Enhancements (Optional)
&gt; 
&gt; - Operation dependencies
&gt; - Priority levels
&gt; - Scheduled execution
&gt; - Web UI/API
&gt; - Notification system
&gt; 
&gt; ## Files
&gt; 
&gt; - `scripts/queue` - Main script
&gt; - `docs/queue-service.md` - Documentation
&gt; - `docs/examples/queue-service-git-push.md` - Examples
&gt; - `todo/skogai-queue-service/proposal.md` - Original proposal&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/skogix#73

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.
You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/skogix/pull/99

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/skogix/pull/99.patch
https://github.com/SkogAI/skogix/pull/99.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/99
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/skogix/pull/99@github.com&gt;
