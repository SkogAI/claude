MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: "SkogAI/.ansible" <.ansible@noreply.github.com>
Date: Sun, 28 Sep 2025 11:01:28 -0700
Subject: [SkogAI/.ansible] save this is the github folder as template : Your task is to "onboard" this repository to Copilot coding agent by adding a .github/copilot-instructions.md file in the repository that contains information describing how a coding agent seeing it for the ... (PR #29)
Message-ID: <SkogAI/.ansible/pull/29@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68d977f81ee1e_1b7c910c8196a"; charset="UTF-8"

Thanks for asking me to work on this. I will get started on it and keep this PR&#39;s description up to date as I form a plan and make progress.


&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

save this is the github folder as template : Your task is to &quot;onboard&quot; this repository to Copilot coding agent by adding a .github/copilot-instructions.md file in the repository that contains information describing how a coding agent seeing it for the first time can work most efficiently.

You will do this task only one time per repository and doing a good job can SIGNIFICANTLY improve the quality of the agent&#39;s work, so take your time, think carefully, and search thoroughly before writing the instructions.

&lt;Goals&gt;
- Reduce the likelihood of a coding agent pull request getting rejected by the user due to
generating code that fails the continuous integration build, fails a validation pipeline, or
having misbehavior.
- Minimize bash command and build failures.
- Allow the agent to complete its task more quickly by minimizing the need for exploration using grep, find, str_replace_editor, and code search tools.
&lt;/Goals&gt;

&lt;Limitations&gt;
- Instructions must be no longer than 2 pages.
- Instructions must not be task specific.
&lt;/Limitations&gt;

&lt;WhatToAdd&gt;

Add the following high level details about the codebase to reduce the amount of searching the agent has to do to understand the codebase each time:
&lt;HighLevelDetails&gt;

- A summary of what the repository does.
- High level repository information, such as the size of the repo, the type of the project, the languages, frameworks, or target runtimes in use.
&lt;/HighLevelDetails&gt;

Add information about how to build and validate changes so the agent does not need to search and find it each time.
&lt;BuildInstructions&gt;

- For each of bootstrap, build, test, run, lint, and any other scripted step, document the sequence of steps to take to run it successfully as well as the versions of any runtime or build tools used.
- Each command should be validated by running it to ensure that it works correctly as well as any preconditions and postconditions.
- Try cleaning the repo and environment and running commands in different orders and document errors and and misbehavior observed as well as any steps used to mitigate the problem.
- Run the tests and document the order of steps required to run the tests.
- Make a change to the codebase. Document any unexpected build issues as well as the workarounds.
- Document environment setup steps that seem optional but that you have validated are actually required.
- Document the time required for commands that failed due to timing out.
- When you find a sequence of commands that work for a particular purpose, document them in detail.
- Use language to indicate when something should always be done. For example: &quot;always run npm install before building&quot;.
- Record any validation steps from documentation.
&lt;/BuildInstructions&gt;

List key facts about the layout and architecture of the codebase to help the agent find where to make changes with minimal searching.
&lt;ProjectLayout&gt;

- A description of the major architectural elements of the project, including the relative paths to the main project files, the location
of configuration files for linting, compilation, testing, and preferences.
- A description of the checks run prior to check in, including any GitHub workflows, continuous integration builds, or other validation pipelines.
- Document the steps so that the agent can replicate these itself.
- Any explicit validation steps that the agent can consider to have further confidence in its changes.
- Dependencies that aren&#39;t obvious from the layout or file structure.
- Finally, fill in any remaining space with detailed lists of the following, in order of priority: the list of files in the repo root, the
contents of the README, the contents of any key source files, the list of files in the next level down of directories, giving priority to the more structurally important and snippets of code from key source files, such as the one containing the main method.
&lt;/ProjectLayout&gt;
&lt;/WhatToAdd&gt;

&lt;StepsToFollow&gt;
- Perform a comprehensive inventory of the codebase. Search for and view:
- README.md, CONTRIBUTING.md, and all other documentation files.
- Search the codebase for build steps and indications of workarounds like &#39;HACK&#39;, &#39;TODO&#39;, etc.
- All scripts, particularly those pertaining to build and repo or environment setup.
- All build and actions pipelines.
- All project files.
- All configuration and linting files.
- For each file:
- think: are the contents or the existence of the file information that the coding agent will need to implement, build, test, validate, or demo a code change?
- If yes:
   - Document the command or information in detail.
   - Explicitly indicate which commands work and which do not and the order in which commands should be run.
   - Document any errors encountered as well as the steps taken to workaround them.
- Document any other steps or information that the agent can use to reduce time spent exploring or trying and failing to run bash commands.
- Finally, explicitly instruct the agent to trust the instructions and only perform a...

&lt;/details&gt;


&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.
You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/.ansible/pull/29

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/.ansible/pull/29.patch
https://github.com/SkogAI/.ansible/pull/29.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/.ansible/pull/29
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/.ansible/pull/29@github.com&gt;
