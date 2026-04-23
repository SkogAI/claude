MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/tools <tools@noreply.github.com>
Date: Thu, 27 Nov 2025 19:36:25 -0800
Subject: Re: [SkogAI/tools] 1 (PR #2)
Message-ID: <SkogAI/tools/pull/2/review/3517373770@github.com>
In-Reply-To: <SkogAI/tools/pull/2@github.com>
References: <SkogAI/tools/pull/2@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692918b955f2b_b811003844d5"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR adds support for agent-specific MCP (Model Context Protocol) tool integration. It enables agents to selectively include MCP server functions in their `functions.json` files by specifying desired MCP server prefixes in a new `mcp_tools` field within each agent's `index.yaml` file.

Key changes:
- Agents can now specify which MCP server functions they want via the `mcp_tools` field in their `index.yaml`
- The `merge-functions` and `recovery-functions` in `scripts/mcp.sh` now populate/clean agent-specific `functions.json` files
- Added `yq` as a new dependency for YAML processing

### Reviewed changes

Copilot reviewed 4 out of 4 changed files in this pull request and generated 6 comments.

| File | Description |
| ---- | ----------- |
| scripts/mcp.sh | Added logic to find MCP-enabled agents and populate/clean their functions.json files with selected MCP tools |
| agents/demo/index.yaml | Added `mcp` and `mcp_tools` fields to demonstrate MCP integration configuration |
| agents/demo/README.md | Added comprehensive documentation explaining how MCP server integration works with agents |
| README.md | Added `yq` to the list of required dependencies |





---

💡 <a href="/SkogAI/tools/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -1,6 +1,11 @@
 name: Demo
 description: An AI agent that demonstrates agent capabilities
 version: 0.1.0
+mcp: true

The `mcp` field is defined but never used in the codebase. The script only checks for `.mcp_tools | length != 0` in line 4 of scripts/mcp.sh. Consider removing this unused field or documenting its intended purpose if it's for future use.
```suggestion

```

> @@ -115,6 +116,22 @@ merge-functions() {
     else
         printf "%s" "$result"
     fi
+
+    for agent in "${mcp_enabled_agents[@]}"; do
+        if [[ -f "${agent}/functions.json" ]]; then
+            tool_json="$(jq '.' "${agent}/functions.json")"
+            rm -f "${agent}/functions.json"
+        else
+            tool_json='[]'
+        fi
+
+        mcp_function_prefixes="$(yq -o json '.mcp_tools' "${agent}/index.yaml")"
+
+        jq -s 'add | unique' \
+            <(jq '.' <<< "$tool_json") \
+            <(jq --argjson prefixes "$mcp_function_prefixes" 'map(select(.mcp as $mcp | $prefixes | index($mcp)))' "$FUNCTIONS_JSON_PATH") \
+            >> "${agent}/functions.json"

Using the append operator `>>` after deleting the file (line 123) is potentially confusing. Consider using the overwrite operator `>` instead for clarity, as the file should be created fresh each time.
```suggestion
            > "${agent}/functions.json"
```

> @@ -130,6 +147,20 @@ recovery-functions() {
     else
         printf "%s" "$result"
     fi
+
+    for agent in "${mcp_enabled_agents[@]}"; do
+        if [[ -f "${agent}/functions.json" ]]; then
+            tool_json="$(jq '.' "${agent}/functions.json")"
+            rm -f "${agent}/functions.json"
+        else
+            tool_json='[]'
+        fi
+
+        mcp_function_prefixes="$(yq -o json '.mcp_tools' "${agent}/index.yaml")"
+
+        jq --argjson prefixes "$mcp_function_prefixes" 'map(select(.name as $s | $prefixes | any(. as $p | $s | startswith($p))| not))' <<< "$tool_json" \
+        >> "${agent}/functions.json"

Using the append operator `>>` after deleting the file (line 154) is potentially confusing. Consider using the overwrite operator `>` instead for clarity, as the file should be created fresh each time.
```suggestion
        > "${agent}/functions.json"
```

> +It has been modified from the version defined in the base repo to also include details on
+how to integrate MCP servers with agents.
+
+## How MCP Servers Work with Agents
+A new `mcp_tools` field was added to the [index.yaml](./index.yaml) file in order to define and configure MCP support for
+agents.
+
+This field allows you to specify the prefixes of the MCP server functions that are generated according to
+the MCP servers defined in the [mcp.json](../../mcp.json) file under the `mcpServers` key.
+
+When `argc mcp start` is executed, it populates the main [`functions.json`](../../functions.json) file with
+functions that are all prefixed with the name of the corresponding MCP server in the [mcp.json](../../mcp.json).
+
+What this fork does is it allows you to specify which MCP servers you specifically want access to in your agent.
+
+Then, when the `argc mcp start` command is executed, will populate each agent it finds with a non-empty `mcp_tools` field

Corrected grammar by adding 'it' before 'will populate'.
```suggestion
Then, when the `argc mcp start` command is executed, it will populate each agent it finds with a non-empty `mcp_tools` field
```

> @@ -115,6 +116,22 @@ merge-functions() {
     else
         printf "%s" "$result"
     fi
+
+    for agent in "${mcp_enabled_agents[@]}"; do
+        if [[ -f "${agent}/functions.json" ]]; then
+            tool_json="$(jq '.' "${agent}/functions.json")"
+            rm -f "${agent}/functions.json"
+        else
+            tool_json='[]'
+        fi
+
+        mcp_function_prefixes="$(yq -o json '.mcp_tools' "${agent}/index.yaml")"

If `yq` fails to parse the YAML or the `.mcp_tools` field is malformed, the variable will contain an error message or be empty, which could cause `jq` to fail silently on line 132. Consider adding error handling to validate that `mcp_function_prefixes` contains valid JSON before proceeding.

> @@ -130,6 +147,20 @@ recovery-functions() {
     else
         printf "%s" "$result"
     fi
+
+    for agent in "${mcp_enabled_agents[@]}"; do
+        if [[ -f "${agent}/functions.json" ]]; then
+            tool_json="$(jq '.' "${agent}/functions.json")"
+            rm -f "${agent}/functions.json"
+        else
+            tool_json='[]'
+        fi
+
+        mcp_function_prefixes="$(yq -o json '.mcp_tools' "${agent}/index.yaml")"

If `yq` fails to parse the YAML or the `.mcp_tools` field is malformed, the variable will contain an error message or be empty, which could cause `jq` to fail silently on line 161. Consider adding error handling to validate that `mcp_function_prefixes` contains valid JSON before proceeding.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/tools/pull/2#pullrequestreview-3517373770
You are receiving this because you authored the thread.

Message ID: <SkogAI/tools/pull/2/review/3517373770@github.com>