MIME-Version: 1.0
From: "github-actions[bot]" <notifications@github.com>
To: SkogAI/supabase <supabase@noreply.github.com>
Date: Sat, 01 Nov 2025 07:12:19 -0700
Subject: Re: [SkogAI/supabase] WIP (PR #205)
Message-ID: <SkogAI/supabase/pull/205/c3476406242@github.com>
In-Reply-To: <SkogAI/supabase/pull/205@github.com>
References: <SkogAI/supabase/pull/205@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_690615436503_51a0611005878c"; charset="UTF-8"

github-actions[bot] left a comment (SkogAI/supabase#205)

## Code Review: PR #205 - WIP

### Critical Issues

#### 🚨 Major Problem: Incorrect Repository Structure

This PR appears to be adding the **entire Supabase monorepo** (1.79M+ lines) as a subdirectory within the existing project. This is fundamentally incorrect and will cause significant problems:

**Issues identified:**
1. **Nested repository structure**: Adding files like `supabase/.github/`, `supabase/CLAUDE.md`, `supabase/.turbo/` suggests the entire Supabase OSS repo is being copied into the existing `supabase/` directory
2. **Massive size**: 1,791,068 additions is far too large for what should be a scripts cleanup (issue #185)
3. **Binary files**: Including `.tar.zst` and `.cookie` files in `supabase/.turbo/cache/` that should never be committed
4. **Build artifacts**: Turbo cache files and daemon logs are temporary build artifacts
5. **Wrong scope**: Issue #185 requested "cleanup of the scripts folder" but this PR modifies entirely different paths

### Specific Problems

#### Security Concerns
- **Environment files**: `supabase/apps/cms/.env` should NEVER be committed to version control (contains secrets)
- **Turbo cache**: Cache files may contain sensitive build information

#### Code Quality Issues
- **Binary files in git**: `.tar.zst` files (compressed archives) should not be in version control
- **Build artifacts**: `.turbo/` directory should be in `.gitignore`
- **Cookie files**: Temporary session files in `supabase/.turbo/cookies/` have no place in git

#### Repository Structure
The correct structure should be:
```
your-project/
├── supabase/          # Your Supabase project config
│   ├── functions/     # Edge functions
│   ├── migrations/    # Database migrations
│   └── config.toml    # Supabase config
├── scripts/           # Your utility scripts
└── ...
```

NOT:
```
your-project/
└── supabase/          # Your Supabase project config
    └── supabase/      # ❌ Entire Supabase monorepo nested inside
        ├── .github/
        ├── apps/
        └── ...
```

### Recommendations

1. **Close this PR** - The changes are fundamentally incorrect
2. **Start fresh** - Create a new branch for issue #185
3. **Focus on the actual task**: Review and document scripts in the `scripts/` directory at the root level
4. **Do not copy** the entire Supabase repository into your project
5. **Review .gitignore**: Ensure build artifacts, cache files, and environment files are excluded

### What Should Have Been Done

For issue #185 ("cleanup of the scripts folder"), the PR should:
- Review existing scripts in `/scripts/` directory
- Create or update `/scripts/README.md` documenting each script's purpose
- Possibly refactor/consolidate scripts
- Total changes should be <1000 lines, not 1.79M lines

### Questions

- How did this branch get created? Was there a git operation that went wrong?
- Did you accidentally add a git submodule or clone of the Supabase repo?
- Do you need help recovering to a clean state?

---
*Review performed by Claude Code following repository conventions in CLAUDE.md*

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/supabase/pull/205#issuecomment-3476406242
You are receiving this because you authored the thread.

Message ID: <SkogAI/supabase/pull/205/c3476406242@github.com>