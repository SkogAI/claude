MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Sun, 04 Jan 2026 21:28:15 -0800
Subject: [SkogAI/lore] [WIP] Extract inline LLM prompts to offloadable format (PR #52)
Message-ID: <SkogAI/lore/pull/52@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_695b4befa4c0b_c810d0126494c"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT ORIGINAL PROMPT --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;feat: Extract inline LLM prompts to offloadable prompt+data format&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Problem
&gt; LLM prompts are embedded inline in shell scripts and Python files. This makes it hard to:
&gt; 1. Queue generation tasks for later (offline/batch processing)
&gt; 2. Audit and improve prompts systematically
&gt; 3. Reuse prompts across different tools
&gt; 
&gt; ## Current Prompt Locations
&gt; **Shell scripts (high priority - used in pipeline):**
&gt; - `tools/llama-lore-creator.sh` - 3 prompts (entry, persona, titles)
&gt; - `tools/llama-lore-integrator.sh` - 4 prompts (extract, persona, connections, etc.)
&gt; 
&gt; **Python files (lower priority - being deprecated):**
&gt; - `generate-agent-lore.py` - 3 prompts
&gt; - `orchestrator/orchestrator.py` - dynamic prompt builder
&gt; - `agents/api/agent_api.py` - agent prompts
&gt; 
&gt; **Template files (already extracted):**
&gt; - `agents/templates/small_models/*.txt` - research, writing, outline
&gt; - `agents/templates/personas/*.md` - persona templates
&gt; 
&gt; ## Proposed Format
&gt; Create `prompts/` directory with JSON/YAML files:
&gt; 
&gt; ```yaml
&gt; # prompts/lore-entry-generation.yaml
&gt; name: lore-entry-generation
&gt; description: Generate narrative lore entry content
&gt; version: &quot;1.0&quot;
&gt; template: |
&gt;   You are a master lore writer crafting narrative mythology.
&gt;   
&gt;   ## CRITICAL INSTRUCTION
&gt;   Write the lore entry content DIRECTLY...
&gt;   
&gt;   ## Task
&gt;   Create a {{category}} entry titled &quot;{{title}}&quot;
&gt;   ...
&gt; variables:
&gt;   - name: title
&gt;     type: string
&gt;     required: true
&gt;   - name: category
&gt;     type: string
&gt;     required: true
&gt;     enum: [character, place, event, object, concept]
&gt; examples:
&gt;   - title: &quot;The Dark Tower&quot;
&gt;     category: &quot;place&quot;
&gt;     expected_output: &quot;In the shadows of the digital realm...&quot;
&gt; ```
&gt; 
&gt; ## Acceptance Criteria
&gt; - [ ] Create `prompts/` directory structure
&gt; - [ ] Extract prompts from `llama-lore-creator.sh` to YAML/JSON files
&gt; - [ ] Extract prompts from `llama-lore-integrator.sh` to YAML/JSON files
&gt; - [ ] Update shell scripts to load prompts from files (with fallback to inline)
&gt; - [ ] Document prompt format in `prompts/README.md`
&gt; 
&gt; ## Benefits
&gt; - **Offline generation**: Save prompt+data to queue, process later
&gt; - **Prompt versioning**: Track prompt improvements over time
&gt; - **Easier auditing**: All prompts in one place for review
&gt; - **Batch processing**: Generate multiple entries from queued data
&gt; 
&gt; ## NOT in scope
&gt; - Python tool prompts (being deprecated)
&gt; - Runtime prompt injection (separate concern)
&gt; 
&gt; ## Estimated Effort
&gt; ~3-4 hours&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;



&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;

- Fixes SkogAI/lore#29

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💬 We&#39;d love your input! Share your thoughts on Copilot coding agent in our [2 minute survey](https://gh.io/copilot-coding-agent-survey).

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/lore/pull/52

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/lore/pull/52.patch
https://github.com/SkogAI/lore/pull/52.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/52
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/lore/pull/52@github.com&gt;
