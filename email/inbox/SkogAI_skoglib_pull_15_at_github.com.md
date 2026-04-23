MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skoglib <skoglib@noreply.github.com>
Date: Fri, 12 Sep 2025 04:22:45 -0700
Subject: [SkogAI/skoglib] [WIP] Task 3: Configuration Management and Utils (PR #15)
Message-ID: <SkogAI/skoglib/pull/15@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68c402853c2b8_ce10e0839cc"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

Original issue description:

&gt; # Task: Configuration Management and Utils
&gt; 
&gt; **Epic:** #2 (skogai-python-library)
&gt; 
&gt; ## Objective
&gt; Create a robust configuration management system and common utilities that support the core executable runner while maintaining the minimal dependency philosophy.
&gt; 
&gt; ## Scope
&gt; - Implement `skogai/config.py` for configuration management
&gt; - Create `skogai/utils.py` with common utilities
&gt; - Add environment variable support and configuration discovery
&gt; - Implement utility functions for path resolution and validation
&gt; 
&gt; ## Technical Requirements
&gt; 
&gt; ### Core Files to Implement
&gt; 1. **`skogai/config.py`**
&gt;    - Configuration class with sensible defaults
&gt;    - Environment variable override support
&gt;    - Configuration validation and type checking
&gt;    - Executable path discovery and caching
&gt; 
&gt; 2. **`skogai/utils.py`**
&gt;    - Path resolution utilities (absolute path handling)
&gt;    - Executable discovery and validation
&gt;    - Common string/data manipulation helpers
&gt;    - Performance timing utilities
&gt; 
&gt; ### Configuration Features
&gt; - Default timeout values for executable runs
&gt; - Default logging levels and formats
&gt; - Executable search path configuration
&gt; - Environment variable prefix support (`SKOGAI_*`)
&gt; 
&gt; ### Utility Functions
&gt; ```python
&gt; # Path and executable utilities
&gt; def find_executable(name: str, search_paths: List[str] = None) -&gt; Optional[str]
&gt; def resolve_path(path: Union[str, Path], base_dir: Optional[str] = None) -&gt; Path
&gt; def validate_executable(path: str) -&gt; bool
&gt; 
&gt; # Performance and debugging utilities  
&gt; def time_execution(func: Callable) -&gt; Tuple[Any, float]
&gt; def format_duration(seconds: float) -&gt; str
&gt; 
&gt; # Configuration utilities
&gt; def load_config_from_env() -&gt; Dict[str, Any]
&gt; def merge_configs(*configs: Dict[str, Any]) -&gt; Dict[str, Any]
&gt; ```
&gt; 
&gt; ### Configuration Schema
&gt; ```python
&gt; @dataclass
&gt; class SkogAIConfig:
&gt;     default_timeout: int = 30
&gt;     log_level: str = &quot;INFO&quot; 
&gt;     executable_search_paths: List[str] = field(default_factory=list)
&gt;     env_prefix: str = &quot;SKOGAI&quot;
&gt;     max_output_size: int = 10 * 1024 * 1024  # 10MB
&gt; ```
&gt; 
&gt; ## Implementation Details
&gt; - Use dataclasses for configuration objects
&gt; - Environment variable parsing with type conversion
&gt; - Lazy loading of configuration values
&gt; - Thread-safe configuration access
&gt; - Proper error handling for invalid configuration
&gt; 
&gt; ## Acceptance Criteria
&gt; - [ ] Configuration loads from environment variables properly
&gt; - [ ] Default configuration values work without any setup
&gt; - [ ] Executable discovery works across common installation paths
&gt; - [ ] Path resolution handles relative and absolute paths correctly
&gt; - [ ] All utility functions have proper error handling
&gt; - [ ] Configuration validation catches common mistakes
&gt; - [ ] Thread-safe access to configuration objects
&gt; - [ ] Performance utilities provide accurate timing
&gt; 
&gt; ## Dependencies
&gt; - Core library implementation (Task #3)
&gt; - Python standard library only (dataclasses, os, pathlib, threading)
&gt; 
&gt; ## Estimated Effort
&gt; 2-3 days including comprehensive testing
&gt; 
&gt; ## Related to Epic
&gt; This task is **Task 3** of the skogai-python-library epic (#2).


Fixes #5.

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

✨ Let Copilot coding agent [set things up for you](https://github.com/SkogAI/skoglib/issues/new?title=✨+Set+up+Copilot+instructions&amp;body=Configure%20instructions%20for%20this%20repository%20as%20documented%20in%20%5BBest%20practices%20for%20Copilot%20coding%20agent%20in%20your%20repository%5D%28https://gh.io/copilot-coding-agent-tips%29%2E%0A%0A%3COnboard%20this%20repo%3E&amp;assignees=copilot) — coding agent works faster and does higher quality work when set up for your repo.

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/skoglib/pull/15

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/skoglib/pull/15.patch
https://github.com/SkogAI/skoglib/pull/15.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skoglib/pull/15
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/skoglib/pull/15@github.com&gt;
