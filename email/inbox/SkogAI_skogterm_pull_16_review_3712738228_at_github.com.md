MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogterm <skogterm@noreply.github.com>
Date: Tue, 27 Jan 2026 10:13:27 -0800
Subject: Re: [SkogAI/skogterm] docs: clean up outdated documentation for v0.1.0 (PR #16)
Message-ID: <SkogAI/skogterm/pull/16/review/3712738228@github.com>
In-Reply-To: <SkogAI/skogterm/pull/16@github.com>
References: <SkogAI/skogterm/pull/16@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69790047afc13_ff11184798b0"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR aims to clean up outdated v0.0.1 documentation to align with the v0.1.0 workflow orchestration vision. It removes 11 files containing outdated documentation (including notation parser docs that belong in skogparse, not skogterm) and updates 3 key files (README.md, STATUS.md, AGENTS.md) to reflect the current project state and future direction.

**Changes:**
- **Removed** 11 outdated documentation files (4,143 lines) including notation parser docs, completed audit documents, and v0.0.1-specific test plans
- **Updated** README.md to emphasize v0.1.0 workflow orchestration vision with clear project structure and roadmap
- **Updated** STATUS.md to be concise with proper redirection to `.skogai/plan/STATE.md`
- **Updated** AGENTS.md knowledge base to reference v0.1.0 planning phase

### Reviewed changes

Copilot reviewed 15 out of 15 changed files in this pull request and generated 2 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| docs/notation/* (7 files) | Removed - notation parser docs belong in skogparse project, not skogterm |
| docs/EXECUTION_MODEL.md | Removed - theoretical model that didn't match implementation |
| TEST_PLAN_v0.0.1.md | Removed - v0.0.1 is released, test plan document no longer needed |
| ELI5.md | Removed - explained outdated v0.0.1 vision |
| DOCS_AUDIT.md | Removed - completed audit document |
| README.md | Updated - now reflects v0.1.0 workflow orchestration focus |
| STATUS.md | Updated - concise status with redirect to detailed planning |
| AGENTS.md | Updated - knowledge base for v0.1.0 planning state |
| **src/SkogAI.Lib/Domain.fs** | **CRITICAL: Contains breaking changes - all types changed to lowercase** |
</details>






---

💡 <a href="/SkogAI/skogterm/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +// argc-specific types
+type argcflag = argcflag of string
+type argcoption = argcoption of string * string // (key, value)
 
-type ArgcArgs =
-    { Positional: Argument list
-      Flags: ArgcFlag list
-      Options: ArgcOption list }
+type argcargs =
+    { positional: argument list
+      flags: argcflag list
+      options: argcoption list }
 
-// Input types
-type InputType =
-    | Direct of Command
-    | WithArgs of Command * Argument list
-    | Argc of ScriptPath * ArgcArgs
+// input types
+type inputtype =
+    | direct of command
+    | withargs of command * argument list
+    | argc of scriptpath * argcargs
 
-// Script definition
-type Script =
-    { Name: ScriptName
-      Path: ScriptPath
-      Shell: Shell option }
+// script definition
+type script =
+    { name: scriptname
+      path: scriptpath
+      shell: shell option }
 
-// Execution result
-type ExitCode = ExitCode of int
-type Output = Output of string
-type Error = Error of string
+// execution result
+type exitcode = exitcode of int
+type output = output of string
+type error = error of string
 
-type ScriptResult =
-    { ExitCode: ExitCode
-      Output: Output
-      Error: Error option }
+type scriptresult =
+    { exitcode: exitcode
+      output: output
+      error: error option }
 
-// Pure Functions - Type Construction
+// pure functions - type construction
 
-let mkScriptName name = ScriptName name
-let mkScriptPath path = ScriptPath path
-let mkCommand cmd = Command cmd
-let mkArgument arg = Argument arg
+let mkscriptname name = scriptname name
+let mkscriptpath path = scriptpath path
+let mkcommand cmd = command cmd
+let mkargument arg = argument arg
 
-let mkScript name path shell =
-    { Name = mkScriptName name
-      Path = mkScriptPath path
-      Shell = shell }
+let mkscript name path shell =
+    { name = mkscriptname name
+      path = mkscriptpath path
+      shell = shell }
 
-// Pure Functions - Argc Helpers
+// pure functions - argc helpers
 
-let mkArgcFlag flag = ArgcFlag flag
-let mkArgcOption key value = ArgcOption(key, value)
+let mkargcflag flag = argcflag flag
+let mkargcoption key value = argcoption(key, value)
 
-let buildArgcArgs positional flags options =
-    { Positional = positional |> List.map mkArgument
-      Flags = flags |> List.map mkArgcFlag
-      Options = options |> List.map (fun (k, v) -> mkArgcOption k v) }
+let buildargcargs positional flags options =
+    { positional = positional |> list.map mkargument
+      flags = flags |> list.map mkargcflag
+      options = options |> list.map (fun (k, v) -> mkargcoption k v) }
 
-// Pure Functions - Command Building
+// pure functions - command building
 
-let argToString (Argument a) = a
-let flagToString (ArgcFlag f) = f
-let optionToString (ArgcOption(k, v)) = $"{k} {v}"
+let argtostring (argument a) = a
+let flagtostring (argcflag f) = f
+let optiontostring (argcoption(k, v)) = $"{k} {v}"

This change converts all type names and union cases from PascalCase to lowercase, which violates F# naming conventions and breaks all existing code. F# types and union cases must start with an uppercase letter.

Breaking changes:
- `ScriptName` → `scriptname` (used in Program.fs line 114, Tests)
- `Command` → `command` (used extensively throughout codebase)
- `BASH`, `ZSH`, `SH` → `bash`, `zsh`, `sh` (used in 30+ locations)
- `List.map` → `list.map` (invalid - should be `List.map`)

The PR description mentions cleaning up documentation but this file contains breaking code changes that will prevent the project from compiling. All test files and application code reference the PascalCase versions.

> +    { positional = positional |> list.map mkargument
+      flags = flags |> list.map mkargcflag
+      options = options |> list.map (fun (k, v) -> mkargcoption k v) }

Invalid F# syntax: `list.map` should be `List.map` (capital L). The `List` module in F# is always capitalized. This will cause a compilation error.
```suggestion
    { positional = positional |> List.map mkargument
      flags = flags |> List.map mkargcflag
      options = options |> List.map (fun (k, v) -> mkargcoption k v) }
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogterm/pull/16#pullrequestreview-3712738228
You are receiving this because you authored the thread.

Message ID: <SkogAI/skogterm/pull/16/review/3712738228@github.com>