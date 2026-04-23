MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/claude <claude@noreply.github.com>
Date: Sat, 27 Sep 2025 13:38:32 -0700
Subject: [SkogAI/claude] [WIP] feat: Add sc-context workflow templates for focused development (PR #28)
Message-ID: <SkogAI/claude/pull/28@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68d84b48162e1_52bb410c885143"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

**Original issue description**:

&gt; ## Summary
&gt; 
&gt; Added 9 new workflow templates for sc-context to enable focused context generation during development. These templates allow developers to generate context tailored to specific development tasks, reducing context size and improving LLM response times.
&gt; 
&gt; ## New Templates
&gt; 
&gt; 1. **tmp-prm-minimal** - Ultra-minimal mode with just CLAUDE.md and .envrc (2 files)
&gt;    - Perfect for quick questions or initial project setup
&gt;    
&gt; 2. **tmp-prm-agent** - Agent development context with all agent/command definitions (67 files)
&gt;    - Includes all agent files, command definitions, and related infrastructure
&gt;    
&gt; 3. **tmp-prm-scripts** - Shell scripts only for bash development (17 files)
&gt;    - Focused on shell script development and maintenance
&gt;    
&gt; 4. **tmp-prm-gitflow** - Git-flow workflow including docs and GitHub workflows
&gt;    - For working on git workflows, CI/CD, and repository management
&gt;    
&gt; 5. **tmp-prm-argc** - Argc command development with examples and docs
&gt;    - Specialized for argc command line tool development
&gt;    
&gt; 6. **tmp-prm-philosophy** - SkogAI philosophy and documentation
&gt;    - For working on project documentation and philosophy alignment
&gt;    
&gt; 7. **tmp-prm-testing** - Test files and CI/CD configurations
&gt;    - Focused on testing infrastructure and test development
&gt;    
&gt; 8. **tmp-prm-everything** - All project files with minimal exclusions
&gt;    - When you need complete project context (fallback option)
&gt;    
&gt; 9. **tmp-prm-docs-update** - Documentation update context (already existed)
&gt;    - Specialized for documentation updates and maintenance
&gt; 
&gt; ## Usage
&gt; 
&gt; ```bash
&gt; # Set a specific template and generate context
&gt; sc-set-rule tmp-prm-minimal &amp;&amp; sc-context
&gt; 
&gt; # Switch to agent development context
&gt; sc-set-rule tmp-prm-agent &amp;&amp; sc-context
&gt; 
&gt; # Return to default context
&gt; sc-set-rule default &amp;&amp; sc-context
&gt; ```
&gt; 
&gt; ## Benefits
&gt; 
&gt; - **Reduced Context Size**: Each template includes only relevant files for specific tasks
&gt; - **Faster LLM Responses**: Smaller context means faster processing and responses
&gt; - **Focused Development**: Context is tailored to the specific type of work being done
&gt; - **Improved Accuracy**: LLMs can focus on relevant code without distractions
&gt; - **Flexible Workflow**: Easy switching between different development contexts
&gt; 
&gt; ## Implementation Details
&gt; 
&gt; Templates are stored in `.sc-context/rules/` directory and can be easily extended or modified. Each template uses specific include/exclude patterns to capture the most relevant files for its intended use case.
&gt; 
&gt; This enhancement significantly improves the developer experience when working with Claude Code by providing context that&#39;s both comprehensive and focused.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;feat: Add sc-context workflow templates for focused development&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Summary
&gt; 
&gt; Added 9 new workflow templates for sc-context to enable focused context generation during development. These templates allow developers to generate context tailored to specific development tasks, reducing context size and improving LLM response times.
&gt; 
&gt; ## New Templates
&gt; 
&gt; 1. **tmp-prm-minimal** - Ultra-minimal mode with just CLAUDE.md and .envrc (2 files)
&gt;    - Perfect for quick questions or initial project setup
&gt;    
&gt; 2. **tmp-prm-agent** - Agent development context with all agent/command definitions (67 files)
&gt;    - Includes all agent files, command definitions, and related infrastructure
&gt;    
&gt; 3. **tmp-prm-scripts** - Shell scripts only for bash development (17 files)
&gt;    - Focused on shell script development and maintenance
&gt;    
&gt; 4. **tmp-prm-gitflow** - Git-flow workflow including docs and GitHub workflows
&gt;    - For working on git workflows, CI/CD, and repository management
&gt;    
&gt; 5. **tmp-prm-argc** - Argc command development with examples and docs
&gt;    - Specialized for argc command line tool development
&gt;    
&gt; 6. **tmp-prm-philosophy** - SkogAI philosophy and documentation
&gt;    - For working on project documentation and philosophy alignment
&gt;    
&gt; 7. **tmp-prm-testing** - Test files and CI/CD configurations
&gt;    - Focused on testing infrastructure and test development
&gt;    
&gt; 8. **tmp-prm-everything** - All project files with minimal exclusions
&gt;    - When you need complete project context (fallback option)
&gt;    
&gt; 9. **tmp-prm-docs-update** - Documentation update context (already existed)
&gt;    - Specialized for documentation updates and maintenance
&gt; 
&gt; ## Usage
&gt; 
&gt; ```bash
&gt; # Set a specific template and generate context
&gt; sc-set-rule tmp-prm-minimal &amp;&amp; sc-context
&gt; 
&gt; # Switch to agent development context
&gt; sc-set-rule tmp-prm-agent &amp;&amp; sc-context
&gt; 
&gt; # Return to default context
&gt; sc-set-rule default &amp;&amp; sc-context
&gt; ```
&gt; 
&gt; ## Benefits
&gt; 
&gt; - **Reduced Context Size**: Each template includes only relevant files for specific tasks
&gt; - **Faster LLM Responses**: Smaller context means faster processing and responses
&gt; - **Focused Development**: Context is tailored to the specific type of work being done
&gt; - **Improved Accuracy**: LLMs can focus on relevant code without distractions
&gt; - **Flexible Workflow**: Easy switching between different development contexts
&gt; 
&gt; ## Implementation Details
&gt; 
&gt; Templates are stored in `.sc-context/rules/` directory and can be easily extended or modified. Each template uses specific include/exclude patterns to capture the most relevant files for its intended use case.
&gt; 
&gt; This enhancement significantly improves the developer experience when working with Claude Code by providing context that&#39;s both comprehensive and focused.&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;
Fixes SkogAI/claude#27

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.
You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/claude/pull/28

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/claude/pull/28.patch
https://github.com/SkogAI/claude/pull/28.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/claude/pull/28
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/claude/pull/28@github.com&gt;
