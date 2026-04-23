MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Mon, 05 Jan 2026 00:24:32 -0800
Subject: Re: [SkogAI/lore] Migrate generate-agent-lore.py from LoreAPI to shell tools (PR #46)
Message-ID: <SkogAI/lore/pull/46/review/3625884532@github.com>
In-Reply-To: <SkogAI/lore/pull/46@github.com>
References: <SkogAI/lore/pull/46@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_695b7540f0b10_d010d01921868"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR successfully migrates `generate-agent-lore.py` from the deprecated `LoreAPI` Python class to direct subprocess calls to existing shell tools (`manage-lore.sh`, `create-persona.sh`), addressing issue #27. The migration removes the Python API dependency while maintaining the same CLI interface for users.

**Key changes:**
- Replaced LoreAPI import and all method calls with subprocess-based shell tool wrappers
- Added helper functions to parse shell script output and handle file operations
- Fixed undefined variable bugs in export functionality (`export_dir`/`export_path` → `args.export`)





> +    # Load the created book to return it
+    try:
+        with open(book_path, 'r') as f:
+            book = json.load(f)
+        return book
+    except Exception as e:
+        logger.error(f"Failed to load created book: {e}")
+        return {"id": book_id, "error": str(e)}
+
+def add_entry_to_book_shell(entry_id: str, book_id: str) -> bool:
+    """Add an entry to a book using manage-lore.sh."""
+    result = run_shell_tool([MANAGE_LORE_SCRIPT, "add-to-book", entry_id, book_id])
+    return result["success"]
+
+def create_persona_shell(name: str, core_description: str, personality_traits: List[str], voice_tone: str) -> Dict[str, Any]:
+    """Create a persona using create-persona.sh."""

The traits_str is created by joining traits with commas without any validation or escaping. If any trait contains a comma, this will break the parsing in the shell script. Consider validating that traits don't contain commas, or use a different delimiter, or pass traits in a more robust way (e.g., as separate arguments).
```suggestion
    """Create a persona using create-persona.sh."""
    # Validate personality traits to ensure they don't contain commas, since the
    # underlying shell script expects a comma-separated list and parses on commas.
    if personality_traits is None:
        personality_traits = []
    invalid_traits = [t for t in personality_traits if "," in t]
    if invalid_traits:
        error_msg = (
            "Personality traits must not contain commas, as they are used as a delimiter "
            f"in the shell script. Invalid traits: {invalid_traits}"
        )
        logger.error(error_msg)
        return {"id": None, "error": error_msg}
```

>  # Configure logging
 logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
 logger = logging.getLogger("agent_lore_generator")
 
+# Shell tool paths
+REPO_ROOT = os.path.dirname(os.path.abspath(__file__))
+MANAGE_LORE_SCRIPT = os.path.join(REPO_ROOT, "tools", "manage-lore.sh")
+CREATE_PERSONA_SCRIPT = os.path.join(REPO_ROOT, "tools", "create-persona.sh")
+LORE_ENTRIES_DIR = os.path.join(REPO_ROOT, "knowledge", "expanded", "lore", "entries")
+LORE_BOOKS_DIR = os.path.join(REPO_ROOT, "knowledge", "expanded", "lore", "books")
+PERSONAS_DIR = os.path.join(REPO_ROOT, "knowledge", "expanded", "personas")
+

The MANAGE_LORE_SCRIPT and CREATE_PERSONA_SCRIPT paths are constructed but never validated to ensure the scripts actually exist and are executable. If these scripts are missing or not executable, the error won't be caught until runtime when subprocess.run is called. Consider adding validation checks at module initialization to fail fast with a clear error message.
```suggestion


def _validate_script_path(path: str, script_name: str) -> None:
    """
    Ensure that a required shell script exists and is executable.

    Raises:
        RuntimeError: if the script is missing or not executable.
    """
    if not os.path.isfile(path):
        logger.error("Required script '%s' not found at path: %s", script_name, path)
        raise RuntimeError(f"Required script '{script_name}' not found at path: {path}")
    if not os.access(path, os.X_OK):
        logger.error("Required script '%s' at path '%s' is not executable", script_name, path)
        raise RuntimeError(f"Required script '{script_name}' at path '{path}' is not executable")


# Validate critical shell scripts at import time to fail fast if misconfigured.
_validate_script_path(MANAGE_LORE_SCRIPT, "manage-lore.sh")
_validate_script_path(CREATE_PERSONA_SCRIPT, "create-persona.sh")
```

> +# Helper functions for shell tool integration
+def run_shell_tool(command: List[str]) -> Dict[str, Any]:
+    """Run a shell tool command and return parsed result."""
+    try:
+        result = subprocess.run(
+            command,
+            capture_output=True,
+            text=True,
+            check=True,
+            cwd=REPO_ROOT
+        )
+        return {"success": True, "output": result.stdout.strip(), "stderr": result.stderr.strip()}
+    except subprocess.CalledProcessError as e:
+        logger.error(f"Shell tool error: {e}")
+        logger.error(f"Stderr: {e.stderr}")
+        return {"success": False, "error": str(e), "stderr": e.stderr}

The function only logs errors but doesn't provide any details about what went wrong in a structured way that could be useful for debugging. Consider including the command that was run and the full stderr output in the returned error dictionary, not just in the logs. This would help with troubleshooting subprocess failures.
```suggestion
        return {
            "success": False,
            "error": str(e),
            "stderr": (e.stderr or "").strip() if e.stderr is not None else "",
            "stdout": (e.stdout or "").strip() if getattr(e, "stdout", None) is not None else "",
            "command": command,
            "returncode": e.returncode,
        }
```

> +
+def create_lore_entry_shell(title: str, content: str, category: str, tags: List[str] = None, summary: str = "") -> Dict[str, Any]:
+    """Create a lore entry using manage-lore.sh and then update its content."""

The title and category parameters are passed directly to the shell script without validation or sanitization. This could allow shell command injection if these parameters contain special characters like semicolons, backticks, or dollar signs. Consider validating/sanitizing these inputs or using a safer method to pass them to the subprocess (the current implementation already uses list form which is safer than string form, but the shell script itself may be vulnerable to malicious input).
```suggestion

def _validate_shell_arg(name: str, value: str) -> None:
    """
    Validate a string intended to be passed as an argument to a shell script.

    This uses a conservative allowlist to reduce the risk that the downstream
    shell script mishandles arguments containing special shell metacharacters.
    """
    if value is None:
        raise ValueError(f"{name} must not be None")

    # Allow letters, numbers, spaces, underscores, dashes, periods, and commas.
    # Reject characters that are commonly dangerous in shell contexts.
    if not re.fullmatch(r"[A-Za-z0-9 _\-\.,]+", value):
        raise ValueError(f"{name} contains unsupported characters")


def create_lore_entry_shell(title: str, content: str, category: str, tags: List[str] = None, summary: str = "") -> Dict[str, Any]:
    """Create a lore entry using manage-lore.sh and then update its content."""
    try:
        _validate_shell_arg("title", title)
        _validate_shell_arg("category", category)
    except ValueError as e:
        logger.error(f"Invalid argument for manage-lore.sh: {e}")
        return {"id": None, "error": str(e)}
```

> +        with open(entry_path, 'r') as f:
+            entry = json.load(f)

There's a race condition between creating the entry via shell script and reading the JSON file. If the shell script hasn't finished writing the file when this code tries to read it, the file might not exist yet or be incomplete. Consider adding a small retry loop with a timeout, or have the shell script return the full file path and verify the file exists before reading.
```suggestion
        # Retry reading the JSON file to avoid race conditions with the shell script
        max_attempts = 10
        delay_seconds = 0.5
        last_error: Optional[Exception] = None

        for attempt in range(max_attempts):
            try:
                with open(entry_path, 'r') as f:
                    entry = json.load(f)
                last_error = None
                break
            except (FileNotFoundError, json.JSONDecodeError) as read_err:
                last_error = read_err
                if attempt == max_attempts - 1:
                    raise
                logger.info(
                    f"Waiting for lore entry file {entry_path} to become available "
                    f"(attempt {attempt + 1}/{max_attempts})..."
                )
                time.sleep(delay_seconds)

        # If for some reason we exited the loop without clearing last_error, raise it
        if last_error is not None:
            raise last_error
```

> +def create_lore_entry_shell(title: str, content: str, category: str, tags: List[str] = None, summary: str = "") -> Dict[str, Any]:
+    """Create a lore entry using manage-lore.sh and then update its content."""
+    # Create the entry
+    result = run_shell_tool([MANAGE_LORE_SCRIPT, "create-entry", title, category])
+    
+    if not result["success"]:
+        return {"id": None, "error": result.get("error")}
+    
+    # Extract entry ID from output (format: "Created lore entry: entry_...")
+    match = re.search(r'entry_\d+_[a-f0-9]+', result["output"])
+    if not match:
+        return {"id": None, "error": "Could not parse entry ID from output"}
+    
+    entry_id = match.group(0)
+    entry_path = os.path.join(LORE_ENTRIES_DIR, f"{entry_id}.json")
+    
+    # Update the entry with content, tags, and summary
+    try:
+        with open(entry_path, 'r') as f:
+            entry = json.load(f)
+        
+        entry["content"] = content
+        entry["summary"] = summary
+        entry["tags"] = tags or []
+        
+        with open(entry_path, 'w') as f:
+            json.dump(entry, f, indent=2)
+        
+        logger.info(f"Updated entry {entry_id} with content and metadata")
+        return entry
+    except Exception as e:
+        logger.error(f"Failed to update entry content: {e}")
+        return {"id": entry_id, "error": str(e)}

The error return structure is inconsistent with the success return. On success, the full entry dictionary is returned (line 75), but on error, a minimal dictionary with just "id" and "error" keys is returned (lines 52, 57, 78). This inconsistency could cause issues for callers expecting an "id" key in the returned dictionary. Consider always returning a consistent structure with at least "success", "id", and optionally "error" keys.

> +def create_lore_book_shell(title: str, description: str) -> Dict[str, Any]:
+    """Create a lore book using manage-lore.sh."""
+    result = run_shell_tool([MANAGE_LORE_SCRIPT, "create-book", title, description])
+    
+    if not result["success"]:
+        return {"id": None, "error": result.get("error")}
+    
+    # Extract book ID from output (format: "Created lore book: book_...")
+    match = re.search(r'book_\d+_[a-f0-9]+', result["output"])
+    if not match:
+        return {"id": None, "error": "Could not parse book ID from output"}
+    
+    book_id = match.group(0)
+    book_path = os.path.join(LORE_BOOKS_DIR, f"{book_id}.json")
+    
+    # Load the created book to return it
+    try:
+        with open(book_path, 'r') as f:
+            book = json.load(f)
+        return book
+    except Exception as e:
+        logger.error(f"Failed to load created book: {e}")
+        return {"id": book_id, "error": str(e)}

Similar to create_lore_entry_shell, this function has the same issues: potential shell injection with unsanitized title/description parameters passed to subprocess, and inconsistent return structure between success (full book dict) and error (minimal dict with id/error keys).

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/46#pullrequestreview-3625884532
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/lore/pull/46/review/3625884532@github.com>