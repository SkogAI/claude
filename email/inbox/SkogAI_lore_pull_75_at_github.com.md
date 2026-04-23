MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Fri, 03 Oct 2025 04:27:16 -0700
Subject: [SkogAI/lore] [WIP] Create centralized configuration system for path resolution (PR #75)
Message-ID: <SkogAI/lore/pull/75@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68dfb3142fe1d_10110d858835"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

**Original issue description**:

&gt; ### Overview
&gt; 
&gt; Before migrating files to use a configuration system, we need to create the centralized configuration infrastructure that will replace hardcoded paths throughout the codebase.
&gt; 
&gt; ### Context
&gt; 
&gt; Issue #5 identified 509 files with hardcoded `/home/skogix/skogai` paths. This issue creates the foundation for systematic migration.
&gt; 
&gt; ### Tasks
&gt; 
&gt; #### Python Configuration System
&gt; 
&gt; - [ ] Create `config/paths.py` with path resolution utilities
&gt;   - [ ] Support environment variables (`SKOGAI_BASE_DIR`, `SKOGAI_AGENTS_DIR`, etc.)
&gt;   - [ ] Git-aware defaults (auto-detect repository root)
&gt;   - [ ] Backward compatibility (fallback to `/home/skogix/skogai`)
&gt;   - [ ] Type-safe API with `pathlib.Path`
&gt; - [ ] Implement standard path getters:
&gt;   - [ ] `get_config_file(filename)` - Config files
&gt;   - [ ] `get_demo_output_dir(session_id, agent_type)` - Demo outputs
&gt;   - [ ] `get_context_dir()` - Context files
&gt;   - [ ] `get_agents_dir()` - Agent implementations
&gt;   - [ ] `get_knowledge_dir()` - Knowledge base
&gt; - [ ] Add `ensure_dir(path)` utility for directory creation
&gt; 
&gt; #### Shell Configuration System
&gt; 
&gt; - [ ] Create `config/paths.sh` shell library
&gt;   - [ ] Implement path resolution with env var support
&gt;   - [ ] Provide functions matching Python API
&gt;   - [ ] Git repository detection
&gt;   - [ ] Source-able library (not executable)
&gt; 
&gt; #### Documentation
&gt; 
&gt; - [ ] Create `config/README.md` with:
&gt;   - [ ] Complete API documentation
&gt;   - [ ] Usage examples (Python and Shell)
&gt;   - [ ] Environment variable reference
&gt;   - [ ] Migration patterns
&gt; 
&gt; #### Validation Tools
&gt; 
&gt; - [ ] Create `tools/check_hardcoded_paths.py` for Python files
&gt; - [ ] Create `tools/check_hardcoded_paths.sh` for shell scripts
&gt; - [ ] Configure `.pre-commit-config.yaml` to prevent new hardcoded paths
&gt; 
&gt; ### Acceptance Criteria
&gt; 
&gt; - [ ] Configuration system supports both Python and Shell
&gt; - [ ] Environment variables take precedence over defaults
&gt; - [ ] Git-aware path resolution works correctly
&gt; - [ ] Backward compatibility maintained
&gt; - [ ] Pre-commit hooks prevent new hardcoded paths
&gt; - [ ] Comprehensive documentation with examples
&gt; 
&gt; ### Related Issues
&gt; 
&gt; Part of the path resolution standardization effort (Issue #5)

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;


----

*This section details on the original issue you should resolve*

&lt;issue_title&gt;Create centralized configuration system for path resolution&lt;/issue_title&gt;
&lt;issue_description&gt;### Overview

Before migrating files to use a configuration system, we need to create the centralized configuration infrastructure that will replace hardcoded paths throughout the codebase.

### Context

Issue SkogAI/lore#5 identified 509 files with hardcoded `/home/skogix/skogai` paths. This issue creates the foundation for systematic migration.

### Tasks

#### Python Configuration System

- [ ] Create `config/paths.py` with path resolution utilities
  - [ ] Support environment variables (`SKOGAI_BASE_DIR`, `SKOGAI_AGENTS_DIR`, etc.)
  - [ ] Git-aware defaults (auto-detect repository root)
  - [ ] Backward compatibility (fallback to `/home/skogix/skogai`)
  - [ ] Type-safe API with `pathlib.Path`
- [ ] Implement standard path getters:
  - [ ] `get_config_file(filename)` - Config files
  - [ ] `get_demo_output_dir(session_id, agent_type)` - Demo outputs
  - [ ] `get_context_dir()` - Context files
  - [ ] `get_agents_dir()` - Agent implementations
  - [ ] `get_knowledge_dir()` - Knowledge base
- [ ] Add `ensure_dir(path)` utility for directory creation

#### Shell Configuration System

- [ ] Create `config/paths.sh` shell library
  - [ ] Implement path resolution with env var support
  - [ ] Provide functions matching Python API
  - [ ] Git repository detection
  - [ ] Source-able library (not executable)

#### Documentation

- [ ] Create `config/README.md` with:
  - [ ] Complete API documentation
  - [ ] Usage examples (Python and Shell)
  - [ ] Environment variable reference
  - [ ] Migration patterns

#### Validation Tools

- [ ] Create `tools/check_hardcoded_paths.py` for Python files
- [ ] Create `tools/check_hardcoded_paths.sh` for shell scripts
- [ ] Configure `.pre-commit-config.yaml` to prevent new hardcoded paths

### Acceptance Criteria

- [ ] Configuration system supports both Python and Shell
- [ ] Environment variables take precedence over defaults
- [ ] Git-aware path resolution works correctly
- [ ] Backward compatibility maintained
- [ ] Pre-commit hooks prevent new hardcoded paths
- [ ] Comprehensive documentation with examples

### Related Issues

Part of the path resolution standardization effort (Issue SkogAI/lore#5)&lt;/issue_description&gt;

## Comments on the Issue (you are @copilot in this section)

&lt;comments&gt;
&lt;comment_new&gt;&lt;author&gt;@Skogix&lt;/author&gt;&lt;body&gt;
No, just use skogcli config in your envrc. @claude make sure skogcli is set with the sane skogai envs &lt;/body&gt;&lt;/comment_new&gt;
&lt;comment_new&gt;&lt;author&gt;@Skogix&lt;/author&gt;&lt;body&gt;
&gt; **Claude finished @Skogix&#39;s task** —— [View job](https://github.com/SkogAI/lore/actions/runs/18214726127)
&gt; 
&gt; ---
&gt; ### Configuration Analysis Complete ✅
&gt; 
&gt; The configuration system is **already correctly set up** using `skogcli config` with the existing `config/paths.sh` file.
&gt; 
&gt; #### Current `.envrc` Setup
&gt; ```bash
&gt; eval &quot;$(skogcli config export-env --namespace skogai,claude,openai)&quot;
&gt; source .venv/bin/activate
&gt; ```
&gt; 
&gt; This uses three namespaces:
&gt; - **skogai** - Core SkogAI environment variables (paths, directories)
&gt; - **claude** - Claude API configuration
&gt; - **openai** - OpenAI API configuration
&gt; 
&gt; #### Existing Path Configuration
&gt; 
&gt; The `config/paths.sh` file already provides all the SKOGAI environment variables mentioned in issue SkogAI/lore#57:
&gt; 
&gt; **Exported Variables:**
&gt; - `SKOGAI_BASE_DIR` - Base directory (git-aware, with fallback to `/home/skogix/skogai`)
&gt; - `SKOGAI_AGENTS_DIR` - `/agents`
&gt; - `SKOGAI_CONFIG_DIR` - `/config`
&gt; - `SKOGAI_DEMO_DIR` - `/demo`
&gt; - `SKOGAI_DOCS_DIR` - `/docs`
&gt; - `SKOGAI_LOGS_DIR` - `/logs`
&gt; - `SKOGAI_LOREFILES_DIR` - `/lorefiles`
&gt; - `SKOGAI_TOOLS_DIR` - `/tools`
&gt; 

@claude this is what will be used :
$skogai is base, $SKOGAI_lore will always be set. the rest is not needed for now and should be relative to skogai_lore. please explain the usage of each envs better so we know what to keep 

&gt; **Features:**
&gt; - ✅ Environment variable overrides via `SKOGAI_BASE_DIR`
&gt; - ✅ Git-aware path resolution (auto-detects repository root)
&gt; - ✅ Backward compatibility (fallback to `/home/skogix/skogai`)
&gt; - ✅ Helper functions: `skogai_get_path()`, `skogai_ensure_dir()`, `skogai_get_log_file()`
&gt; - ✅ Type-safe Python API in `config/paths.py`
&gt; - ✅ Comprehensive documentation in `config/README.md`
&gt; 
&gt; ### Conclusion
&gt; 
&gt; The centralized configuration system requested in **Issue SkogAI/lore#57** already exists and is properly integrated:
&gt; 1. `config/paths.sh` and `config/paths.py` provide the path resolution utilities
&gt; 2. `.envrc` uses `skogcli config export-env` to load environment variables
&gt; 3. The system supports environment overrides, git-aware defaults, and backward compatibility
&gt; 
&gt; **No additional work is needed.** The `skogcli config` integration with the `skogai` namespace is the correct approach for this repository.
&gt; 
&gt; ---
&gt; **Job Run*...

&lt;/details&gt;
Fixes SkogAI/lore#57

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

✨ Let Copilot coding agent [set things up for you](https://github.com/SkogAI/lore/issues/new?title=✨+Set+up+Copilot+instructions&amp;body=Configure%20instructions%20for%20this%20repository%20as%20documented%20in%20%5BBest%20practices%20for%20Copilot%20coding%20agent%20in%20your%20repository%5D%28https://gh.io/copilot-coding-agent-tips%29%2E%0A%0A%3COnboard%20this%20repo%3E&amp;assignees=copilot) — coding agent works faster and does higher quality work when set up for your repo.

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/lore/pull/75

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/lore/pull/75.patch
https://github.com/SkogAI/lore/pull/75.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/75
You are receiving this because you were mentioned.

Message ID: &lt;SkogAI/lore/pull/75@github.com&gt;
