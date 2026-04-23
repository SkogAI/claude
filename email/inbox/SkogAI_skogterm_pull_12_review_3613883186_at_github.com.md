MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogterm <skogterm@noreply.github.com>
Date: Fri, 26 Dec 2025 13:02:12 -0800
Subject: Re: [SkogAI/skogterm] Fix core functionality and make skogterm usable (PR #12)
Message-ID: <SkogAI/skogterm/pull/12/review/3613883186@github.com>
In-Reply-To: <SkogAI/skogterm/pull/12@github.com>
References: <SkogAI/skogterm/pull/12@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_694ef7d48c736_ea10d017704a"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR fixes core functionality issues in skogterm to make it usable for daily terminal workflows. The changes focus on fixing return types, implementing missing command handlers, and adding a wrapper script for easy execution.

Key changes:
- Fixed main function return types to ensure all branches return int values
- Implemented the exec command to actually execute commands instead of just printing them
- Uncommented and updated the help documentation with all available commands

### Reviewed changes

Copilot reviewed 6 out of 6 changed files in this pull request and generated 1 comment.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| src/SkogAI.Lib/SkogAI.Lib.fsproj | Added NoWarn directive to suppress NU1900 vulnerability warnings |
| src/SkogAI.Lib/Runner.fs | Fixed executeTransparent to print output after execution instead of during, enabling proper command execution |
| src/SkogAI.CLI/SkogAI.CLI.fsproj | Added NoWarn directive to suppress NU1900 vulnerability warnings |
| src/SkogAI.CLI/Program.fs | Fixed return types, uncommented help text, implemented exec/demo/help commands, fixed default fallback |
| skog | Added bash wrapper script for convenient dotnet run execution |
| NuGet.Config | Added NuGet configuration for offline package management with proxy settings |
</details>






---

💡 <a href="/SkogAI/skogterm/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> @@ -116,10 +115,8 @@ let main argv =
             printfn "Error: Argc script not found: %s" scriptPath
             1
 
-    | [| "demo"; input |] -> 0
-
-    //| [| "help" |] ->
+    | [| "demo"; input |] -> showDemo ()

The pattern matching for the 'demo' command accepts an 'input' parameter that is never used in the showDemo() function call. The showDemo() function takes no parameters, but this match case expects two arguments. This will only match calls like 'skog demo something', not the documented usage 'skog demo'. Consider changing this to '[| "demo" |] -> showDemo ()' to match the help documentation.
```suggestion
    | [| "demo" |] -> showDemo ()
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogterm/pull/12#pullrequestreview-3613883186
You are receiving this because you authored the thread.

Message ID: <SkogAI/skogterm/pull/12/review/3613883186@github.com>