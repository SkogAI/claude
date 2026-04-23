MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: Skogix/mcp-cli <mcp-cli@noreply.github.com>
Date: Mon, 15 Sep 2025 14:09:29 -0700
Subject: Re: [Skogix/mcp-cli] Fix: Add mypy type annotations and resolve linting issues (PR #2)
Message-ID: <Skogix/mcp-cli/pull/2/review/3226344101@github.com>
In-Reply-To: <Skogix/mcp-cli/pull/2@github.com>
References: <Skogix/mcp-cli/pull/2@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68c8808939fbc_b26810e0275887"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR adds comprehensive mypy type annotations and resolves linting issues throughout the codebase. The changes improve type safety by adding Optional type annotations for parameters that can be None, fixing bare exception handling, and cleaning up unused imports and variables.

Key changes:
- Added Optional type annotations to function parameters that default to None
- Fixed bare except clauses to catch specific Exception types
- Removed unused variables and imports to clean up the codebase

### Reviewed Changes

Copilot reviewed 19 out of 22 changed files in this pull request and generated 3 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| src/mcp_cli/tools/manager.py | Added Optional type annotations for optional parameters |
| src/mcp_cli/model_manager.py | Added Optional imports and type annotations, removed unused variable |
| src/mcp_cli/llm/system_prompt_generator.py | Added Optional type annotation for optional parameters |
| src/mcp_cli/config.py | Added Optional import and type annotation |
| src/mcp_cli/commands/tools_call.py | Fixed function call with incorrect parameter |
| src/mcp_cli/commands/tools.py | Fixed function call with incorrect parameter |
| src/mcp_cli/commands/servers.py | Removed large block of unused code |
| src/mcp_cli/cli_options.py | Added Optional type annotation |
| src/mcp_cli/cli/commands/cmd.py | Added missing Console import |
| src/mcp_cli/chat/streaming_handler.py | Added Console import, removed unused variable |
| src/mcp_cli/chat/commands/servers.py | Fixed bare except clauses, removed unused function |
| src/mcp_cli/chat/commands/confirm.py | Removed unused variables, fixed function call |
| src/mcp_cli/chat/commands/__init__.py | Removed unused imports, added noqa comments |
| src/mcp_cli/chat/chat_handler.py | Added Optional type annotations |
| src/mcp_cli/chat/__main__.py | Added Optional import and type annotations |
| src/mcp_cli/async_config.py | Added Optional import and type annotation |
| pyproject.toml | Added mypy and pip dependencies |
| docs/README.md | Added new documentation file |
| diagnostics/mcp_server_diagnostic.py | Fixed code formatting and f-string usage |
</details>






---

<sub>**Tip:** Customize your code reviews with copilot-instructions.md. <a href="/Skogix/mcp-cli/new/main/.github?filename=copilot-instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Create the file</a> or <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">learn how to get started</a>.</sub>

> @@ -88,7 +88,7 @@ async def tools_call_action(tm: ToolManager) -> None:  # noqa: D401
 
     try:
         result: ToolCallResult = await tm.execute_tool(fq_name, args)
-        display_tool_call_result(None, result, console)
+        display_tool_call_result(None, result, None)

The third parameter should likely be `console` instead of `None`. The function call was changed from `display_tool_call_result(None, result, console)` to `display_tool_call_result(None, result, None)` which removes the console parameter that was previously being passed.
```suggestion
        display_tool_call_result(None, result, output.console)
```

> @@ -67,7 +67,7 @@ async def tools_action_async(  # noqa: D401
 
     if show_validation:
         # Show validation-specific information
-        return await _show_validation_info(tm, provider, console)
+        return await _show_validation_info(tm, provider, None)

The third parameter should be `console` instead of `None`. Based on the function signature in the context, `_show_validation_info` expects a console parameter, but `None` is being passed instead.
```suggestion
        return await _show_validation_info(tm, provider, output)
```

>          await tools_action_async(
-            tm,
-            show_details=show_details,
-            show_raw=show_raw,
+            tm

The function call is missing required parameters. The original call included `show_details=show_details` and `show_raw=show_raw` parameters which have been removed, potentially breaking the intended functionality.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/mcp-cli/pull/2#pullrequestreview-3226344101
You are receiving this because you authored the thread.

Message ID: <Skogix/mcp-cli/pull/2/review/3226344101@github.com>