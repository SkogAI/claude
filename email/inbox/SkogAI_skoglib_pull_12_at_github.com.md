MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skoglib <skoglib@noreply.github.com>
Date: Fri, 12 Sep 2025 03:08:42 -0700
Subject: [SkogAI/skoglib] [WIP] Task 2: UV Package Setup and Configuration (PR #12)
Message-ID: <SkogAI/skoglib/pull/12@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68c3f12a6edd_df8610e0196172"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

Original issue description:

&gt; # Task: UV Package Setup and Configuration
&gt; 
&gt; **Epic:** #2 (skogai-python-library)
&gt; 
&gt; ## Objective
&gt; Set up modern Python packaging using UV with proper pyproject.toml configuration, metadata, and distribution readiness.
&gt; 
&gt; ## Scope
&gt; - Create comprehensive pyproject.toml with UV optimization
&gt; - Configure package metadata, dependencies, and build system
&gt; - Set up UV lock files for reproducible development
&gt; - Prepare package for distribution via UV
&gt; 
&gt; ## Technical Requirements
&gt; 
&gt; ### Configuration Files to Create
&gt; 1. **`pyproject.toml`**
&gt;    - Build system configuration for UV
&gt;    - Package metadata (name, version, description, authors)
&gt;    - Dependencies specification (minimal, Python 3.8+ only)
&gt;    - Development dependencies (pytest, mypy, black, isort)
&gt;    - Entry points and console scripts if needed
&gt; 
&gt; 2. **`uv.lock`**
&gt;    - Reproducible dependency locking
&gt;    - Development and production environment separation
&gt; 
&gt; 3. **Package Structure**
&gt;    - Proper directory layout for UV distribution
&gt;    - `src/` layout vs. flat layout decision
&gt;    - Manifest files for package inclusion
&gt; 
&gt; ### UV-Specific Optimizations
&gt; - Fast dependency resolution configuration
&gt; - Minimal dependency tree to reduce installation time
&gt; - Compatible version ranges for broad adoption
&gt; - Proper wheel building configuration
&gt; 
&gt; ### Metadata Requirements
&gt; - Clear package description and keywords
&gt; - License specification (MIT or Apache 2.0)
&gt; - Repository URLs and issue tracker
&gt; - Python version classifiers
&gt; - Development status classifiers
&gt; 
&gt; ### Development Environment Setup
&gt; ```toml
&gt; [project]
&gt; name = &quot;skogai&quot;
&gt; version = &quot;0.1.0&quot;
&gt; description = &quot;Minimal Python library for SkogAI tool execution&quot;
&gt; requires-python = &quot;&gt;=3.8&quot;
&gt; 
&gt; [build-system]
&gt; requires = [&quot;hatchling&quot;]
&gt; build-backend = &quot;hatchling.build&quot;
&gt; 
&gt; [tool.uv]
&gt; dev-dependencies = [
&gt;     &quot;pytest&gt;=7.0.0&quot;,
&gt;     &quot;mypy&gt;=1.0.0&quot;,
&gt;     &quot;black&gt;=23.0.0&quot;,
&gt;     &quot;isort&gt;=5.12.0&quot;,
&gt; ]
&gt; ```
&gt; 
&gt; ## Acceptance Criteria
&gt; - [ ] `uv build` successfully creates wheel and source distributions
&gt; - [ ] `uv install` works from local and remote sources
&gt; - [ ] All package metadata properly configured and valid
&gt; - [ ] Development dependencies installed via `uv sync`
&gt; - [ ] Package structure follows UV best practices
&gt; - [ ] Version management strategy defined
&gt; - [ ] License and copyright information included
&gt; - [ ] README.md basic structure (without extensive documentation)
&gt; 
&gt; ## Dependencies
&gt; - UV package manager installed and functional
&gt; - Core library implementation (Task #3)
&gt; 
&gt; ## Estimated Effort
&gt; 2-3 days including testing and validation
&gt; 
&gt; ## Related to Epic
&gt; This task is **Task 2** of the skogai-python-library epic (#2).


Fixes #4.

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

✨ Let Copilot coding agent [set things up for you](https://github.com/SkogAI/skoglib/issues/new?title=✨+Set+up+Copilot+instructions&amp;body=Configure%20instructions%20for%20this%20repository%20as%20documented%20in%20%5BBest%20practices%20for%20Copilot%20coding%20agent%20in%20your%20repository%5D%28https://gh.io/copilot-coding-agent-tips%29%2E%0A%0A%3COnboard%20this%20repo%3E&amp;assignees=copilot) — coding agent works faster and does higher quality work when set up for your repo.

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/skoglib/pull/12

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/skoglib/pull/12.patch
https://github.com/SkogAI/skoglib/pull/12.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skoglib/pull/12
You are receiving this because you were mentioned.

Message ID: &lt;SkogAI/skoglib/pull/12@github.com&gt;
