MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogterm <skogterm@noreply.github.com>
Date: Thu, 06 Nov 2025 08:30:26 -0800
Subject: Re: [SkogAI/skogterm] Replace Fli with direct Process execution for exec/argc commands=0A=0AChanges:=0A- runCommand now uses System.Diagnostics.Process directly=0A- Set RedirectStandardInput/Output/Error all to false=0A- This allows stdin to pass through and stdout/stderr to stream directly=0A- No more buffering output in memory=0A- Exit code is returned from the subprocess=0A=0AThis fixes exec and argc commands to properly handle:=0A- Interactive input (stdin passes through)=0A- Real-time output (stdout streams as it happens)=0A- Proper error output (stderr goes to stderr, not mixed) (PR #8)
Message-ID: <SkogAI/skogterm/pull/8/review/3429224691@github.com>
In-Reply-To: <SkogAI/skogterm/pull/8@github.com>
References: <SkogAI/skogterm/pull/8@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_690ccd22d5c40_3f47d1100641a"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR refactors the `runCommand` function to use direct `System.Diagnostics.Process` execution instead of the Fli library, simplifying the implementation while maintaining the same functionality of executing bash commands.

- Replaced Fli library-based command execution with native .NET Process API
- Added proper string escaping for double quotes in command arguments
- Maintained the same function signature returning exit code as `int`





---

💡 <a href="/SkogAI/skogterm/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +    use proc = Process.Start(startInfo)
+    proc.WaitForExit()
+    proc.ExitCode

Process.Start can return null if the process fails to start. Add a null check and handle the case where process creation fails, or use pattern matching to safely unwrap the result.
```suggestion
    let proc = Process.Start(startInfo)
    match proc with
    | null -> -1 // Indicate failure to start process
    | _ ->
        use p = proc
        p.WaitForExit()
        p.ExitCode
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
+    startInfo.Arguments <- $"-c \"{cmd.Replace("\"", "\\\"")}\""

The string escaping only handles double quotes but may be insufficient for all special shell characters. Consider using a more robust escaping mechanism or leveraging existing libraries to prevent shell injection vulnerabilities, especially if `cmd` can contain user input.
```suggestion
    startInfo.Arguments <- $"-c '{cmd.Replace("'", "'\\''")}'"
```

> +    let startInfo = ProcessStartInfo()
+    startInfo.FileName <- "/bin/bash"
+    startInfo.Arguments <- $"-c \"{cmd.Replace("\"", "\\\"")}\""

The hardcoded path `/bin/bash` is platform-specific and will fail on Windows or systems where bash is installed in a different location. Consider making the shell path configurable or detecting the platform to ensure cross-platform compatibility.
```suggestion
    let shellPath =
        match System.Environment.GetEnvironmentVariable("SKOGAI_SHELL_PATH") with
        | null | "" ->
            match System.Environment.OSVersion.Platform with
            | PlatformID.Win32NT | PlatformID.Win32S | PlatformID.Win32Windows | PlatformID.WinCE ->
                // Try to use WSL bash if available, otherwise fallback to cmd.exe
                let wslBash = @"C:\Windows\System32\bash.exe"
                if System.IO.File.Exists(wslBash) then wslBash else "cmd.exe"
            | _ -> "/bin/bash"
        | path -> path

    let startInfo = ProcessStartInfo()
    startInfo.FileName <- shellPath
    startInfo.Arguments <-
        match System.Environment.OSVersion.Platform with
        | PlatformID.Win32NT | PlatformID.Win32S | PlatformID.Win32Windows | PlatformID.WinCE ->
            if shellPath.EndsWith("cmd.exe") then
                $"/C \"{cmd.Replace("\"", "\\\"")}\""
            else
                $"-c \"{cmd.Replace("\"", "\\\"")}\""
        | _ ->
            $"-c \"{cmd.Replace("\"", "\\\"")}\""
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogterm/pull/8#pullrequestreview-3429224691
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/skogterm/pull/8/review/3429224691@github.com>