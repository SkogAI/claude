MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skoglib <skoglib@noreply.github.com>
Date: Sun, 26 Oct 2025 09:38:53 -0700
Subject: Re: [SkogAI/skoglib] Fix TimeoutError missing exit_code from ExecutionError parent (PR #49)
Message-ID: <SkogAI/skoglib/pull/49/review/3381214388@github.com>
In-Reply-To: <SkogAI/skoglib/pull/49@github.com>
References: <SkogAI/skoglib/pull/49@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68fe4e9d86574_4ac2b110042b6"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

Fixes a critical inheritance bug where `TimeoutError` wasn't properly initializing its `ExecutionError` parent class, causing `AttributeError` when code tried to access inherited attributes like `exit_code`. The fix ensures `TimeoutError` properly calls `super().__init__()` with appropriate parameters, maintaining full type contract compliance.

**Key Changes:**
- `TimeoutError` now properly initializes `ExecutionError` parent with `exit_code=-1` and maps timeout-specific parameters
- Comprehensive test suite validates exception hierarchy and attribute accessibility
- Maintains backward compatibility while fixing the type contract violation

### Reviewed Changes

Copilot reviewed 2 out of 2 changed files in this pull request and generated 2 comments.

| File | Description |
| ---- | ----------- |
| `src/skoglib/exceptions.py` | Refactored `TimeoutError.__init__` to properly call parent constructor with mapped parameters |
| `tests/test_timeout_error_contract.py` | Added 11 tests validating exception hierarchy, attribute accessibility, and timeout-specific behavior |





> +        
+        # Override message with timeout-specific format
         cmd_str = executable
         if command_args:
             cmd_str += " " + " ".join(command_args)
-
-        message = f"Command '{cmd_str}' timed out after {timeout} seconds"
-
-        # Call SkogAIError directly to avoid ExecutionError's exit_code requirement
-        SkogAIError.__init__(self, message, details, log_error=log_error)
-        self.executable = executable
+        self.message = f"Command '{cmd_str}' timed out after {timeout} seconds"

The `self.message` assignment directly overwrites the message set by the parent `ExecutionError.__init__()`. This creates tight coupling and makes the message construction fragile. Consider passing a custom message to the parent constructor instead, or document why direct override is necessary here.

>          self.partial_stdout = partial_stdout
         self.partial_stderr = partial_stderr
+        
+        # Add timeout-specific suggestions to details (prepend to parent's suggestions)
+        timeout_suggestions = [
+            f"Increase timeout (currently {timeout}s)",
+            "Check for hanging processes or infinite loops",
+            "Verify input data doesn't cause processing delays",
+            "Consider breaking large tasks into smaller chunks",
+        ]
+        self.details["timeout"] = timeout
+        self.details["suggestions"] = timeout_suggestions + self.details["suggestions"]

Modifying `self.details['suggestions']` after parent initialization creates an implicit dependency on parent's details structure. If the parent changes how it initializes suggestions, this could break. Consider if the parent class could accept additional suggestions as a parameter, or document this implementation detail.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skoglib/pull/49#pullrequestreview-3381214388
You are receiving this because you were assigned.

Message ID: <SkogAI/skoglib/pull/49/review/3381214388@github.com>