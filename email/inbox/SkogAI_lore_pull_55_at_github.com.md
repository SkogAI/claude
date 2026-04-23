MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Sun, 04 Jan 2026 21:28:23 -0800
Subject: [SkogAI/lore] [WIP] Improve prompt to reduce LLM meta-commentary (PR #55)
Message-ID: <SkogAI/lore/pull/55@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_695b4bf72dfc4_be10d01085379"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT ORIGINAL PROMPT --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;bug: Improve prompt to reduce LLM meta-commentary (Issue #5)&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Problem
&gt; LLM sometimes generates meta-commentary instead of lore content:
&gt; - &quot;I will now create...&quot;
&gt; - &quot;Let me help you with...&quot;
&gt; - &quot;I need your approval before...&quot;
&gt; - &quot;Here is the entry you requested...&quot;
&gt; 
&gt; ## Current Mitigation
&gt; `tools/llama-lore-creator.sh` has:
&gt; 1. `validate_lore_output()` - Detects meta-commentary patterns
&gt; 2. `strip_meta_commentary()` - Removes first line if it matches patterns
&gt; 3. Prompt includes &quot;NO phrases like...&quot; instruction
&gt; 
&gt; ## Why It Still Happens
&gt; 1. Prompt instructions may not be strong enough for all models
&gt; 2. Different providers (ollama/claude/openai) respond differently
&gt; 3. Validation only strips first line, meta can appear later
&gt; 
&gt; ## Acceptance Criteria
&gt; - [ ] Audit current prompt in `llama-lore-creator.sh` (lines 116-148)
&gt; - [ ] Test with multiple providers to identify worst offenders
&gt; - [ ] Improve prompt structure (system vs user role, examples, etc.)
&gt; - [ ] Expand `strip_meta_commentary()` to handle more patterns
&gt; - [ ] Add retry logic if content fails validation
&gt; 
&gt; ## Prompt Improvement Ideas
&gt; 1. Use system prompt for role, user prompt for task
&gt; 2. Add more negative examples
&gt; 3. Use &quot;Continue this story:&quot; pattern instead of &quot;Write a story about:&quot;
&gt; 4. Provider-specific prompt variations
&gt; 
&gt; ## Testing Matrix
&gt; | Provider | Model | Meta-commentary frequency |
&gt; |----------|-------|---------------------------|
&gt; | ollama | llama3 | TBD |
&gt; | claude | claude-3 | TBD |
&gt; | openai | gpt-4 | TBD |
&gt; 
&gt; ## Related
&gt; - Original Issue SkogAI/lore#5
&gt; - Issue SkogAI/lore#31 (empty content) - may be related
&gt; 
&gt; ## Estimated Effort
&gt; ~2-3 hours for testing + prompt iteration&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;



&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;

- Fixes SkogAI/lore#32

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💬 We&#39;d love your input! Share your thoughts on Copilot coding agent in our [2 minute survey](https://gh.io/copilot-coding-agent-survey).

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/lore/pull/55

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/lore/pull/55.patch
https://github.com/SkogAI/lore/pull/55.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/55
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/lore/pull/55@github.com&gt;
