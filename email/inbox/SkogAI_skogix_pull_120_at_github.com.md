MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Fri, 12 Dec 2025 07:57:00 -0800
Subject: [SkogAI/skogix] [WIP] Update reference documentation for skill-hook development (PR #120)
Message-ID: <SkogAI/skogix/pull/120@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_693c3b4cd3c44_d91118359373"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT ORIGINAL PROMPT --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;skill-hook-developer: Comprehensive framework for Claude Code skills and hooks&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Summary
&gt; 
&gt; Comprehensive reference documentation and development framework for creating and managing skills in Claude Code&#39;s auto-activation system.
&gt; 
&gt; **Project Location:** `todo/skill-hook-developer/`
&gt; 
&gt; ## Current Status
&gt; 
&gt; **Phase:** Complete reference documentation (production ready as conceptual framework)
&gt; 
&gt; As of recent repository updates, local skills have been migrated to the `taches-cc-resources` plugin. This documentation now serves as:
&gt; - **Reference material** for understanding skill/hook development concepts
&gt; - **Development guide** for creating skills in projects that implement the skill system
&gt; - **Architecture documentation** for the skill auto-activation system design
&gt; 
&gt; ## Purpose
&gt; 
&gt; This project provides detailed guidance for:
&gt; - Creating and managing skills with YAML frontmatter
&gt; - Understanding trigger patterns (keywords, intent patterns, file paths, content patterns)
&gt; - Implementing enforcement levels (block, suggest, warn)
&gt; - Working with hook mechanisms (UserPromptSubmit, PreToolUse)
&gt; - Following Anthropic&#39;s official skill development best practices
&gt; - Debugging and troubleshooting skill activation issues
&gt; 
&gt; ## Documentation Structure
&gt; 
&gt; - **[SKILL.md](todo/skill-hook-developer/SKILL.md)** (426 lines) - Main development guide with quick start, enforcement levels, testing checklist
&gt; - **[SKILL_RULES_REFERENCE.md](todo/skill-hook-developer/SKILL_RULES_REFERENCE.md)** (315 lines) - Complete schema reference with TypeScript interfaces and examples
&gt; - **[TRIGGER_TYPES.md](todo/skill-hook-developer/TRIGGER_TYPES.md)** (305 lines) - Comprehensive trigger configuration guide
&gt; - **[HOOK_MECHANISMS.md](todo/skill-hook-developer/HOOK_MECHANISMS.md)** (306 lines) - Technical internals of hook flows
&gt; - **[PATTERNS_LIBRARY.md](todo/skill-hook-developer/PATTERNS_LIBRARY.md)** (152 lines) - Ready-to-use pattern examples
&gt; - **[TROUBLESHOOTING.md](todo/skill-hook-developer/TROUBLESHOOTING.md)** (514 lines) - Comprehensive debugging guide
&gt; - **[ADVANCED.md](todo/skill-hook-developer/ADVANCED.md)** (197 lines) - Future enhancements and ideas
&gt; 
&gt; ## Key Concepts
&gt; 
&gt; ### Skill Types
&gt; - **Guardrail Skills** - Critical enforcement (`type: &quot;guardrail&quot;`, `enforcement: &quot;block&quot;`)
&gt; - **Domain Skills** - Advisory guidance (`type: &quot;domain&quot;`, `enforcement: &quot;suggest&quot;`)
&gt; 
&gt; ### Trigger Mechanisms
&gt; - **Keywords** - Explicit substring matching in prompts
&gt; - **Intent Patterns** - Regex detection of user actions
&gt; - **File Paths** - Glob pattern matching on edited files
&gt; - **Content Patterns** - Regex matching in file content
&gt; 
&gt; ### Enforcement Levels
&gt; - **BLOCK** - Exit code 2, prevents tool execution
&gt; - **SUGGEST** - Inject context reminder
&gt; - **WARN** - Low priority advisory
&gt; 
&gt; ## Anthropic Best Practices
&gt; 
&gt; Following official Claude Code guidelines:
&gt; - ✅ 500-line rule - SKILL.md kept under 500 lines
&gt; - ✅ Progressive disclosure - Reference files for detailed information
&gt; - ✅ Table of contents - Added to files &gt; 100 lines
&gt; - ✅ Rich descriptions - Include all trigger keywords
&gt; - ✅ Gerund naming - Prefer verb + -ing (e.g., &quot;processing-pdfs&quot;)
&gt; 
&gt; ## Next Steps / Future Work
&gt; 
&gt; - Update examples to reference plugin-based implementation
&gt; - Add notes on taches-cc-resources plugin integration
&gt; - Document plugin-specific commands and workflows
&gt; - Consider creating example implementations in new projects
&gt; 
&gt; ## Files
&gt; 
&gt; - `README.md` - Overview and guide
&gt; - `SKILL.md` - Main development guide (START HERE)
&gt; - `SKILL_RULES_REFERENCE.md` - Complete schema
&gt; - `TRIGGER_TYPES.md` - Trigger configuration
&gt; - `HOOK_MECHANISMS.md` - Technical internals
&gt; - `PATTERNS_LIBRARY.md` - Ready-to-use patterns
&gt; - `TROUBLESHOOTING.md` - Debugging guide
&gt; - `ADVANCED.md` - Future enhancements
&gt; 
&gt; ---
&gt; 
&gt; **Last Updated:** 2025-11-23  
&gt; **Status:** Complete reference documentation  
&gt; **Framework Version:** 1.0&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;



&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;

- Fixes SkogAI/skogix#67

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.
You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/skogix/pull/120

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/skogix/pull/120.patch
https://github.com/SkogAI/skogix/pull/120.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/120
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/skogix/pull/120@github.com&gt;
