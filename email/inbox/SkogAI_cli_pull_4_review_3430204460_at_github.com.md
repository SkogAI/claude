MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/cli <cli@noreply.github.com>
Date: Thu, 06 Nov 2025 11:43:21 -0800
Subject: Re: [SkogAI/cli] . (PR #4)
Message-ID: <SkogAI/cli/pull/4/review/3430204460@github.com>
In-Reply-To: <SkogAI/cli/pull/4@github.com>
References: <SkogAI/cli/pull/4@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_690cfa59903cb_2919411005112c"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR performs a major cleanup of the repository by removing unused documentation files, temporary evaluation files, and obsolete test code. It also includes important updates to configuration defaults, subprocess error handling, Python version requirements, and import organization in test files.

Key changes:
- Removed 19 documentation/evaluation files totaling over 3,600 lines
- Fixed duplicate imports and organized imports in test files
- Updated subprocess calls to properly propagate exit codes and handle errors
- Changed Python version requirement from 3.12 to 3.13
- Updated default settings to use `$SKOGAI` variable placeholders instead of hardcoded paths

### Reviewed Changes

Copilot reviewed 35 out of 37 changed files in this pull request and generated 6 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| tests/test_misc.py | Organized imports, removed duplicates |
| tests/test_config.py | Removed duplicate imports |
| tests/test_memory.py | Added missing imports for new tests |
| tests/test_config_env_advanced.py | Added pytest import, updated command name, added TODO comments |
| src/skogcli/script.py | Fixed subprocess error handling, changed default script type |
| src/skogcli/memory.py | Simplified subprocess call (removed error handling) |
| src/skogcli/agent.py | Simplified subprocess call for editor |
| src/skogcli/data/default_settings.json | Replaced hardcoded paths with variables |
| pyproject.toml | Updated Python version to 3.13, added tdd-guard-pytest dependency |
| Multiple documentation files | Removed unused/obsolete files |
</details>






---

💡 <a href="/SkogAI/cli/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> -            cmd,
-            capture_output=True,
-            text=True,
-            check=False,
-        )
-        return result
-    except FileNotFoundError:
-        console.print(
-            "[red]Error:[/] basic-memory not found. Please install it with 'uv add basic-memory'",
-            style="bold",
-        )
-        raise typer.Exit(code=1)
-    except subprocess.SubprocessError as e:
-        console.print(f"[red]Error running basic-memory:[/] {str(e)}", style="bold")
-        raise typer.Exit(code=1)
+    return subprocess.run(cmd, capture_output=True, text=True, check=True)

Removing all error handling from `run_basic_memory` means that when basic-memory is not found, users will see a raw Python traceback instead of a helpful error message. The original code provided user-friendly messages like 'basic-memory not found. Please install it with 'uv add basic-memory''. Consider keeping basic error handling to catch FileNotFoundError and provide a clear message.
```suggestion
    try:
        return subprocess.run(cmd, capture_output=True, text=True, check=True)
    except FileNotFoundError:
        typer.echo(
            "[bold red]basic-memory not found.[/bold red] Please install it with [bold]uv add basic-memory[/bold].",
            err=True,
        )
        raise typer.Exit(code=1)
    except subprocess.CalledProcessError as e:
        typer.echo(
            f"[bold red]Error running basic-memory:[/bold red] {e.stderr or e}",
            err=True,
        )
        raise typer.Exit(code=e.returncode)
```

>  
-            if result.returncode != 0:
-                console.print(
-                    f"[bold red]Error:[/] Script exited with code {result.returncode}"
-                )
-        except subprocess.CalledProcessError as e:
-            console.print(f"[bold red]Error:[/] {str(e)}")
-        except Exception as e:
-            console.print(f"[bold red]Error:[/] {str(e)}")
+        if result.returncode == 0:
+            print(result.stdout, end='')

[nitpick] Using `print()` directly bypasses the Rich console that's used throughout the rest of the codebase. For consistency with the application's output formatting, consider using `console.print(result.stdout, end='')` instead.
```suggestion
            console.print(result.stdout, end='')
```

> @@ -4,7 +4,7 @@ version = "0.0.3"
 description = "CLI tool for the SkogAI-project"
 readme = "README.md"
 authors = [{ name = "Emil Skogsund", email = "emil@skogsund.se" }]
-requires-python = ">=3.12"
+requires-python = ">=3.13"

Upgrading the minimum Python version from 3.12 to 3.13 is a breaking change that should be noted in release notes or changelog. Python 3.13 is very recent (released October 2024) and this requirement may prevent many users from using the package. Ensure this change is intentional and documented.
```suggestion
requires-python = ">=3.12"
```

> @@ -34,3 +35,6 @@ dev = [
   "pytest-cov>=6.2.1",
   "ruff>=0.12.4",
 ]
+
+[tool.pytest.ini_options]
+tdd_guard_project_root = "/home/skogix/.local/src/cli"

The `tdd_guard_project_root` setting contains a hardcoded absolute path specific to one user's system. This should use a relative path or environment variable so it works correctly on other developers' machines and in CI environments.
```suggestion
tdd_guard_project_root = "."
```

> @@ -2,7 +2,7 @@
   "skogai": {
     "env": {
       "UV_LINK_MODE": "copy",
-      "SKOGAI": "/home/skogix/skogai",
+      "SKOGAI": "$SKOGAI",

Using `$SKOGAI` as a placeholder for environment variable expansion is a good improvement over hardcoded paths. However, ensure that the code properly handles the case when the SKOGAI environment variable is not set, and document this requirement for users.

> +    subprocess.run([editor, script_path], check=True)
+    console.print(f"[green]Edited script:[/] {script_path}")

Removing the try-except block means users will see a raw CalledProcessError if the editor fails to open or the editor command doesn't exist. The original error handling provided a more user-friendly error message. Consider keeping error handling to catch common failures like missing EDITOR variable or editor command not found.
```suggestion
    try:
        subprocess.run([editor, script_path], check=True)
        console.print(f"[green]Edited script:[/] {script_path}")
    except FileNotFoundError:
        console.print(f"[bold red]Error:[/] Editor command '{editor}' not found. Please set your EDITOR environment variable to a valid editor.")
    except subprocess.CalledProcessError as e:
        console.print(f"[bold red]Error:[/] Failed to open editor '{editor}' for script '{script_path}'.\nDetails: {e}")
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/cli/pull/4#pullrequestreview-3430204460
You are receiving this because you authored the thread.

Message ID: <SkogAI/cli/pull/4/review/3430204460@github.com>