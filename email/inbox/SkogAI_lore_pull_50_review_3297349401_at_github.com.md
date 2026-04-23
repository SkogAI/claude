MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Thu, 02 Oct 2025 21:16:56 -0700
Subject: Re: [SkogAI/lore] a (PR #50)
Message-ID: <SkogAI/lore/pull/50/review/3297349401@github.com>
In-Reply-To: <SkogAI/lore/pull/50@github.com>
References: <SkogAI/lore/pull/50@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68df4e389eeb1_fd10d867932"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR implements a comprehensive configuration system to replace hardcoded paths throughout the SkogAI codebase. The change introduces centralized path management with environment variable support, git-aware defaults, and backward compatibility with legacy paths.

Key changes include:
- Implementation of a complete configuration system in the `config/` directory
- Migration of several critical files to use the new path resolution system
- Addition of validation tools and pre-commit hooks to prevent future hardcoded paths

### Reviewed Changes

Copilot reviewed 12 out of 12 changed files in this pull request and generated 5 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| tools/context-manager.sh | Migrated from hardcoded paths to configuration system using paths.sh |
| tools/check_hardcoded_paths.sh | New validation tool to detect hardcoded paths in shell scripts |
| tools/check_hardcoded_paths.py | New validation tool to detect hardcoded paths in Python files |
| demo/small_model_workflow.py | Updated to use configuration system instead of hardcoded paths |
| config/settings.py | New configuration management system with JSON loading and environment fallbacks |
| config/paths.sh | Shell script library for centralized path resolution |
| config/paths.py | Python path resolution utilities with environment variable support |
| config/__init__.py | Module initialization for the configuration system |
| config/README.md | Comprehensive documentation for the configuration system |
| agents/api/agent_api.py | Migrated all hardcoded paths to use the configuration system |
| MIGRATION_GUIDE.md | Complete migration guide for remaining files with hardcoded paths |
| .pre-commit-config.yaml | Pre-commit hooks to prevent new hardcoded paths |
</details>






> +
+# Directories to exclude
+EXCLUDE_DIRS="node_modules|MASTER_KNOWLEDGE|MASTER_KNOWLEDGE_COMPLETE|.git|lorefiles|config"
+
+check_file() {
+    local file="$1"
+    local violations=0
+
+    # Skip excluded directories
+    if echo "$file" | grep -E "$EXCLUDE_DIRS" > /dev/null; then
+        return 0
+    fi
+
+    # Check each pattern
+    for pattern in "${PATTERNS[@]}"; do
+        if grep -n -E "$pattern" "$file" 2>/dev/null | grep -v "^#" > /tmp/violations_$$; then

Using predictable temporary file names with $$ can create security vulnerabilities in multi-user environments. Use `mktemp` to create secure temporary files instead.

> +
+This script scans Python files for hardcoded absolute paths that should
+be replaced with the configuration system.
+"""
+
+import re
+import sys
+from pathlib import Path
+from typing import List, Tuple
+
+
+# Patterns to detect hardcoded paths
+HARDCODED_PATTERNS = [
+    r"/home/[a-zA-Z0-9_]+/skogai",
+    r"/home/[a-zA-Z0-9_]+/lore",
+    r"['\"]\/mnt\/[^'\"]+['\"]",  # Any /mnt/ paths

The regex pattern uses excessive escaping. The pattern could be simplified to `r\"['\\\"]\/mnt\/[^'\\\"]+['\\\"]\"` or use raw strings more effectively.
```suggestion
    r"['\"]/mnt/[^'\\\"]+['\"]",  # Any /mnt/ paths
```

> +        """Initialize configuration manager."""
+        self._config: Optional[Dict[str, Any]] = None
+        self._config_file: Optional[Path] = None
+
+    def load(self, config_path: Optional[Path] = None) -> Dict[str, Any]:
+        """Load configuration from file or environment.
+
+        Args:
+            config_path: Optional path to configuration file
+
+        Returns:
+            Configuration dictionary
+        """
+        if config_path is None:
+            # Try environment variable first
+            if config_env := os.environ.get("SKOGAI_CONFIG_FILE"):

The walrus operator `:=` requires Python 3.8+. Consider checking if this aligns with the project's minimum Python version requirements or add a compatibility check.
```suggestion
            config_env = os.environ.get("SKOGAI_CONFIG_FILE")
            if config_env:
```

> +        3. Default value
+
+        Args:
+            key: Configuration key (supports dot notation for nested keys)
+            default: Default value if key not found
+            env_var: Optional environment variable name to check first
+
+        Returns:
+            Configuration value
+        """
+        # Ensure config is loaded
+        if self._config is None:
+            self.load()
+
+        # Check environment variable first if provided
+        if env_var and (env_value := os.environ.get(env_var)):

Another walrus operator usage that requires Python 3.8+. Ensure consistency with project's Python version requirements.
```suggestion
        env_value = os.environ.get(env_var) if env_var else None
        if env_value:
```

> +        self._context_dir = None
+        self._knowledge_dir = None
+        self._config_dir = None
+        self._demo_dir = None
+        self._tools_dir = None
+        self._metrics_dir = None
+        self._venv_dir = None
+
+    def _resolve_base_dir(self) -> Path:
+        """Resolve the base directory from environment or defaults."""
+        # Priority order:
+        # 1. SKOGAI_BASE_DIR environment variable
+        # 2. Current git repository root
+        # 3. Legacy /home/skogix/skogai (for backward compatibility)
+
+        if base_dir := os.environ.get("SKOGAI_BASE_DIR"):

Walrus operator usage requires Python 3.8+. This should be consistent with the project's Python version requirements mentioned in the coding guidelines (Python 3.13+).

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/50#pullrequestreview-3297349401
You are receiving this because you authored the thread.

Message ID: <SkogAI/lore/pull/50/review/3297349401@github.com>