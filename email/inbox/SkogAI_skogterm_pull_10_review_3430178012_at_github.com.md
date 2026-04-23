MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogterm <skogterm@noreply.github.com>
Date: Thu, 06 Nov 2025 11:37:13 -0800
Subject: Re: [SkogAI/skogterm] Replace Fli with direct Process execution for exec/argc commands=0A=0AChanges:=0A- runCommand now uses System.Diagnostics.Process directly=0A- Set RedirectStandardInput/Output/Error all to false=0A- This allows stdin to pass through and stdout/stderr to stream directly=0A- No more buffering output in memory=0A- Exit code is returned from the subprocess=0A=0AThis fixes exec and argc commands to properly handle:=0A- Interactive input (stdin passes through)=0A- Real-time output (stdout streams as it happens)=0A- Proper error output (stderr goes to stderr, not mixed) (PR #10)
Message-ID: <SkogAI/skogterm/pull/10/review/3430178012@github.com>
In-Reply-To: <SkogAI/skogterm/pull/10@github.com>
References: <SkogAI/skogterm/pull/10@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_690cf8e9f1628_107df110026550"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR refactors the `runCommand` function to use direct `Process.Start` instead of the Fli library's command execution abstraction. The implementation moves from a declarative command builder approach to a more imperative, lower-level process management strategy.

- Replaced Fli library's `cli` computation expression with direct `System.Diagnostics.Process` API
- Added explicit `ProcessStartInfo` configuration for bash command execution
- Implemented manual quote escaping for command arguments





---

💡 <a href="/SkogAI/skogterm/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -157,9 +158,14 @@ let findScripts (directory: string) : Script list =
         []
 
 let runCommand (cmd: string) : int =
-    cli {
-        Shell Shells.BASH
-        Command cmd
-    }
-    |> Command.execute
-    |> Output.toExitCode
+    let startInfo = ProcessStartInfo()
+    startInfo.FileName <- "/bin/bash"
+    startInfo.Arguments <- $"-c \"{cmd.Replace("\"", "\\\"")}\""
+    startInfo.UseShellExecute <- false
+    startInfo.RedirectStandardInput <- false
+    startInfo.RedirectStandardOutput <- false
+    startInfo.RedirectStandardError <- false
+
+    use proc = Process.Start(startInfo)

The `Process.Start` method can return `null` if the process fails to start. This will cause a `NullReferenceException` when calling `proc.WaitForExit()`. Consider adding a null check:

```fsharp
use proc = Process.Start(startInfo)
if isNull proc then
    failwith "Failed to start process"
proc.WaitForExit()
proc.ExitCode
```
```suggestion
    use proc = Process.Start(startInfo)
    if isNull proc then
        failwith "Failed to start process"
```

> +    let startInfo = ProcessStartInfo()
+    startInfo.FileName <- "/bin/bash"
+    startInfo.Arguments <- $"-c \"{cmd.Replace("\"", "\\\"")}\""
+    startInfo.UseShellExecute <- false
+    startInfo.RedirectStandardInput <- false
+    startInfo.RedirectStandardOutput <- false
+    startInfo.RedirectStandardError <- false
+
+    use proc = Process.Start(startInfo)
+    proc.WaitForExit()
+    proc.ExitCode

The simple string replacement `cmd.Replace("\"", "\\\"")` for escaping quotes is fragile and may not handle all shell metacharacters correctly. For example, it doesn't handle cases where the command already contains escaped quotes, or other special characters like backticks, dollar signs, or backslashes that have special meaning in bash.

Consider using a more robust escaping mechanism or leveraging the existing `executeCommand` function that uses the Fli library's built-in shell handling, which likely handles these edge cases properly.
```suggestion
    let result = executeCommand cmd (Some BASH)
    let (ExitCode exitCode) = result.ExitCode
    exitCode
```

> @@ -157,9 +158,14 @@ let findScripts (directory: string) : Script list =
         []
 
 let runCommand (cmd: string) : int =
-    cli {
-        Shell Shells.BASH
-        Command cmd
-    }
-    |> Command.execute
-    |> Output.toExitCode
+    let startInfo = ProcessStartInfo()
+    startInfo.FileName <- "/bin/bash"

The hardcoded path `/bin/bash` may not be portable across different Unix-like systems. On some systems, bash might be located at `/usr/bin/bash` or elsewhere. Consider using `"bash"` without the full path and relying on the system's PATH environment variable, or detecting the bash location dynamically.
```suggestion
    startInfo.FileName <- "bash"
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogterm/pull/10#pullrequestreview-3430178012
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/skogterm/pull/10/review/3430178012@github.com>