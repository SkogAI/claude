MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skoglib <skoglib@noreply.github.com>
Date: Fri, 12 Sep 2025 04:16:25 -0700
Subject: Re: [SkogAI/skoglib] Add comprehensive GitHub Copilot instructions for skoglib development (PR #14)
Message-ID: <SkogAI/skoglib/pull/14/review/3216159114@github.com>
In-Reply-To: <SkogAI/skoglib/pull/14@github.com>
References: <SkogAI/skoglib/pull/14@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68c401097a7ac_cb10e069728"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR adds comprehensive GitHub Copilot instructions to enhance development experience with coding agents in the skoglib repository. The instructions provide validated commands, timing expectations, and troubleshooting guidance.

Key changes include:
- Creation of detailed `.github/copilot-instructions.md` with complete setup and development workflows
- Cleanup of unused imports across test files and source modules to improve code quality
- Addition of validated test scenarios and API documentation examples

### Reviewed Changes

Copilot reviewed 6 out of 7 changed files in this pull request and generated 5 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| `.github/copilot-instructions.md` | Comprehensive development guide with validated commands, timing data, and troubleshooting |
| `tests/test_logging_config.py` | Removed unused `patch` and `pytest` imports |
| `tests/test_import_performance.py` | Removed unused import statements in performance test methods |
| `tests/test_exception_logging.py` | Removed unused `patch` import |
| `src/skoglib/logging_config.py` | Removed unused `Dict` type import and unused exception variable |
| `src/skoglib/executable.py` | Removed unused `logging` import and `Any` type import |
</details>






> @@ -219,7 +219,7 @@ def get_performance_logger(name: str) -> PerformanceLogger:
 if not os.getenv("PYTEST_CURRENT_TEST") and not logging.getLogger(LOGGER_PREFIX).handlers:
     try:
         configure_from_env()
-    except Exception as e:
+    except Exception:

The bare except clause catches all exceptions without any handling or logging. Consider at least logging the exception or catching more specific exception types to aid in debugging configuration issues.

>          start_time = time.perf_counter()
         
-        import skoglib.logging_config
         
         import_time_ms = (time.perf_counter() - start_time) * 1000

The import statement was removed but the test is still measuring import time without actually importing anything. This will always measure near-zero time and the test will pass incorrectly. The import statements should be restored or the test logic should be updated.

>          start_time = time.perf_counter()
         
-        import skoglib.exceptions
         
         import_time_ms = (time.perf_counter() - start_time) * 1000

The import statement was removed but the test is still measuring import time without actually importing anything. This will always measure near-zero time and the test will pass incorrectly. The import statements should be restored or the test logic should be updated.

>          start_time = time.perf_counter()
         
-        import skoglib.executable
         
         import_time_ms = (time.perf_counter() - start_time) * 1000

The import statement was removed but the test is still measuring import time without actually importing anything. This will always measure near-zero time and the test will pass incorrectly. The import statements should be restored or the test logic should be updated.

>          start_time = time.perf_counter()
         
-        import skoglib
         
         import_time_ms = (time.perf_counter() - start_time) * 1000

The import statement was removed but the test is still measuring import time without actually importing anything. This will always measure near-zero time and the test will pass incorrectly. The import statements should be restored or the test logic should be updated.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skoglib/pull/14#pullrequestreview-3216159114
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/skoglib/pull/14/review/3216159114@github.com>