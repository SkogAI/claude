MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogterm <skogterm@noreply.github.com>
Date: Sun, 04 Jan 2026 20:23:24 -0800
Subject: Re: [SkogAI/skogterm] feat: execute commands by default, add test suite (PR #14)
Message-ID: <SkogAI/skogterm/pull/14/review/3625452152@github.com>
In-Reply-To: <SkogAI/skogterm/pull/14@github.com>
References: <SkogAI/skogterm/pull/14@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_695b3cbca620d_f410d010832be"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR introduces a breaking change to the CLI behavior, making command execution the default action instead of requiring an `exec` prefix. It adds comprehensive test coverage with 57 tests across 4 test modules and implements piped stdin support for command execution.

Key changes:
- CLI now executes commands directly by default (e.g., `skog ls -la` runs `ls -la`)
- Piped stdin support enables `echo 'cmd' | skog` usage pattern
- Comprehensive test suite covering entity algebra, domain types, command execution, and CLI behavior
- Reserved commands: `help`, `list`, `demo`, and help flags (`--help`, `-h`)
- Removed commands: `exec`, `run`, `argc` (arguments now execute directly)

### Reviewed changes

Copilot reviewed 9 out of 9 changed files in this pull request and generated 9 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| src/SkogAI.Tests/SkogAI.Tests.fsproj | New test project with NUnit, FsUnit dependencies; targets net10.0 |
| src/SkogAI.Tests/EntityTests.fs | Tests for entity algebra functions (unique0, unique1, createEID, updateEntity) |
| src/SkogAI.Tests/DomainTests.fs | Tests for domain type constructors and builder functions |
| src/SkogAI.Tests/RunnerTests.fs | Tests for command building, execution, script discovery, and transparent execution |
| src/SkogAI.Tests/CliTests.fs | Tests for CLI argument parsing, reserved commands, and integration scenarios |
| src/SkogAI.CLI/Program.fs | Breaking change: implements exec-by-default CLI with stdin support; removes exec/run/argc commands |
| SkogAI.sln | Adds test project to solution with build configurations |
| Makefile | Reorganizes targets, adds test target before run, updates clean to include test artifacts |
| AGENTS.md | Documents new CLI usage patterns, commands, and test infrastructure (contains outdated information) |
</details>






---

💡 <a href="/SkogAI/skogterm/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +
+F# terminal tool for running scripts/commands via Fli library with argc integration. Practical terminal workflows, not a notation parser.
+
+## STRUCTURE
+
+```
+skogterm/
+├── src/
+│   ├── SkogAI.Lib/        # Core library (5 F# modules)
+│   │   ├── Domain.fs      # Types: Script, Command, InputType, ScriptResult
+│   │   ├── Entity.fs      # EID algebra (createEID, updateEntity)
+│   │   ├── Runner.fs      # Fli wrappers (executeTransparent, runCommand)
+│   │   ├── ParseCommon.fs # Parser combinators (legacy)
+│   │   └── ParseValues.fs # Value parsers (legacy)
+│   └── SkogAI.CLI/        # CLI entry point
+│       └── Program.fs     # Commands: run, argc, list, exec, demo

The documentation states "Commands: run, argc, list, exec, demo" but according to the PR description and Program.fs changes, the exec, run, and argc commands have been removed. The commands should be updated to reflect the new CLI behavior where commands execute directly by default, with reserved commands: help, list, demo.
```suggestion
│       └── Program.fs     # CLI: direct exec (default); reserved commands: help, list, demo
```

> +### Fli Usage
+```fsharp
+cli {
+    Shell Shells.BASH
+    Command cmd
+} |> Command.execute
+```
+
+### Argc Integration
+Scripts use argc directives:
+```bash
+# @cmd Create entity
+# @option -n --name! <NAME> Required
+# @flag -v --verbose
+```
+Run via: `skog argc script.sh subcommand --options`

The documentation incorrectly states "Run via: `skog argc script.sh subcommand --options`" but according to the PR changes, the argc command has been removed. Argc scripts should now be invoked directly by passing the script path as the first argument, such as "skog scripts/argc-entity.sh subcommand --options".
```suggestion
Run via: `skog scripts/argc-entity.sh subcommand --options`
```

> +    let testScript = mkScript "test" "/path/test.sh" (Some BASH)
+
+    [<Test>]
+    member _.``buildCommand with Direct returns command string``() =
+        let input = Direct (Command "echo hello")
+        buildCommand testScript input |> should equal "echo hello"
+
+    [<Test>]
+    member _.``buildCommand with WithArgs joins command and args``() =
+        let input = WithArgs (Command "echo", [Argument "hello"; Argument "world"])
+        buildCommand testScript input |> should equal "echo hello world"
+
+    [<Test>]
+    member _.``buildCommand with WithArgs empty args``() =
+        let input = WithArgs (Command "ls", [])
+        buildCommand testScript input |> should equal "ls "

The test expects "ls " (with trailing space) for empty args, but this creates an inconsistent behavior. The buildCommand function in Runner.fs will produce "ls " (with space) when args are empty, which is different from how WithArgs is typically used. Consider whether this trailing space is intentional or if the function should handle empty args specially to avoid trailing spaces.
```suggestion
        buildCommand testScript input |> should equal "ls"
```

> +    let parseArgs (argv: string array) =
+        match argv with
+        | [||] -> "help"  // No args -> help
+        | [| "help" |] | [| "--help" |] | [| "-h" |] -> "help"
+        | [| "list" |] -> "list"
+        | [| "demo" |] -> "demo"
+        | args -> 
+            // Everything else is a command to execute
+            "exec:" + (args |> String.concat " ")
+
+    [<Test>]
+    member _.``empty args shows help``() =
+        parseArgs [||] |> should equal "help"

The test helper function parseArgs doesn't account for stdin redirection, which is a key feature mentioned in the PR description. The actual CLI behavior in Program.fs checks Console.IsInputRedirected for empty args, but this test helper will always return "help" for empty args. Consider adding test cases or documentation noting that stdin handling is tested separately.

> +        isReserved "ls" |> should be False
+
+    [<Test>]
+    member _.``echo is not reserved``() =
+        isReserved "echo" |> should be False
+
+[<TestFixture>]
+[<Platform("Linux,Unix,MacOsX")>]
+type CliIntegrationTests() =
+
+    // Integration tests that actually run the CLI
+    // These use runCommand to execute the skog wrapper
+    
+    [<Test>]
+    member _.``exec command runs echo``() =
+        // Current behavior: skog exec 'echo test'

The comment states "Current behavior: skog exec 'echo test'" but according to the PR description, the exec command has been removed. This comment should be updated to reflect the new direct execution behavior, such as "Test direct command execution: echo test".
```suggestion
        // Test direct command execution: echo test
```

> +    [<Test>]
+    member _.``findScripts finds sh files in scripts directory``() =
+        let scriptsDir = System.IO.Path.Combine(System.IO.Directory.GetCurrentDirectory(), "scripts")
+        if System.IO.Directory.Exists(scriptsDir) then
+            let scripts = findScripts scriptsDir
+            scripts |> should not' (be Empty)
+            scripts |> List.forall (fun s -> 
+                let (ScriptPath p) = s.Path
+                p.EndsWith(".sh")) |> should be True

The test conditionally runs only if the scripts directory exists, which makes it non-deterministic. In CI/CD environments or when tests run from different working directories, this test may be skipped silently. Consider either creating a test fixture with a known directory structure, or using NUnit's [Ignore] attribute with a reason when the directory doesn't exist, or asserting that the directory should exist.

>  
-    | [| "help" |] -> showHelp ()
+    // Piped input: execute stdin content as command
+    | [||] when Console.IsInputRedirected ->
+        match readStdin () with
+        | Some cmd -> executeCmd cmd

Commands from stdin are executed directly without any validation or sanitization. While this is a CLI tool where users control the input, consider documenting the security implications. For example, if a user accidentally pipes untrusted content (e.g., from a curl command), it will be executed directly. This might be intentional design, but should be documented in the help text or README.
```suggestion
        | Some cmd ->
            printfn "Warning: executing commands read from standard input. Do not pipe untrusted data into this tool."
            executeCmd cmd
```

> +# Direct dotnet
+dotnet run --project src/SkogAI.CLI -- ls -la
+```
+
+## DEPENDENCIES
+
+- **.NET 10.0** (preview)
+- **Fli 1.111.11** - F# shell execution library
+- **argc** - Bash argument parsing (external, in PATH)
+
+## NOTES
+
+- `skog` wrapper ensures argc is in PATH via `$HOME/.cargo/bin`
+- `ParseCommon.fs` and `ParseValues.fs` are legacy parser code (not the project focus)
+- Project is in Phase 1 (Core Workflows) per `CLAUDE.md`
+- No tests currently configured

The documentation states "No tests currently configured" but this PR adds a comprehensive test suite with 57 tests across 4 test files (EntityTests, DomainTests, RunnerTests, CliTests). This note should be updated or removed.
```suggestion
- Test suite: 57 tests across EntityTests, DomainTests, RunnerTests, and CliTests
```

> +let readStdin () : string option =
+    if Console.IsInputRedirected then
+        let input = Console.In.ReadToEnd().Trim()
+        if String.IsNullOrWhiteSpace(input) then None
+        else Some input
+    else
+        None

The readStdin function reads all input into memory using ReadToEnd(), which could be problematic for large piped inputs. For a CLI tool that might receive large outputs from other commands via pipe (e.g., "cat large_file.txt | skog"), consider adding a size limit or streaming the input, or documenting the memory implications of this design choice.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogterm/pull/14#pullrequestreview-3625452152
You are receiving this because you authored the thread.

Message ID: <SkogAI/skogterm/pull/14/review/3625452152@github.com>