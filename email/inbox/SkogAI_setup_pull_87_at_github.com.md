MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sun, 30 Nov 2025 01:23:47 -0800
Subject: [SkogAI/setup] [WIP] Add comprehensive Copilot instructions and remove obsolete files (PR #87)
Message-ID: <SkogAI/setup/pull/87@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692c0d23a7e44_b71100196811"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;


----

*This section details on the original issue you should resolve*

&lt;issue_title&gt;## PR Review: Set up Copilot instructions (#84)&lt;/issue_title&gt;
&lt;issue_description&gt;## PR Review: Set up Copilot instructions (#84)

### Summary
This PR adds comprehensive Copilot coding agent instructions and removes obsolete meta-instruction files. The new .github/copilot-instructions.md file provides essential onboarding documentation for AI coding agents.

---

### ✅ Strengths

1. **Excellent Structure** - The copilot-instructions.md file is well-organized with clear sections:
   - Repository overview and tech stack
   - Build &amp; validation commands
   - Project structure with detailed role listing
   - Coding conventions matching CLAUDE.md
   - Key files reference table
   - Testing workflow

2. **Accurate Conventions** - Coding conventions correctly reflect repository standards:
   - FQCN requirement for Ansible modules ✅
   - Variable naming pattern {role_name}_{variable_name} ✅
   - Dotfiles patterns (templates, static files, .local overrides) ✅
   - Arch-first package management ✅

3. **Practical Commands** - Build commands are concrete and actionable:
   - Bootstrap and run scripts clearly documented
   - Vault password requirements explicitly noted
   - Check/diff mode provided as CI-friendly alternative
   - Syntax validation and single-role testing included

4. **Good Coverage** - Hits all key areas from the repository:
   - Role numbering scheme (00-10)
   - vars/ directory structure
   - scripts/ workflow tools
   - Testing procedures

---

### ⚠️ Issues Found

#### 🐛 **CRITICAL BUG in run.sh (not introduced by this PR)**
While reviewing the copilot-instructions.md references to run.sh, I discovered a syntax error in run.sh:9-11:

**Problems:**
1. Line 8 is missing the continuation backslash - causes line 9 to execute as separate command
2. --become-password-file is duplicated 3 times (lines 8, 9, 11)
3. --connection test appears orphaned on line 10
4. Dollar-sign-at appears twice (lines 10, 11)

**This bug should be fixed in a separate PR** - the run.sh script won&#39;t work correctly as-is.

---

#### 📝 **Minor Accuracy Issue**

**Line 28 vault password paths:**
While the documentation accurately reflects what&#39;s in run.sh, the actual run.sh script is broken (see above). Once run.sh is fixed, verify these paths are still correct.

---

#### 📋 **Documentation Completeness**

The copilot-instructions.md is missing a few items from CLAUDE.md that might be useful for AI agents:

1. **Active Hooks** - No mention of .claude/hooks/post-commit-verify.sh that auto-runs ./run.sh after commits
2. **Issue Workflow** - Git worktree workflow is mentioned but not detailed (scripts/wt-* tools)
3. **User Shell** - No mention that user shell is zsh (could affect script examples)
4. **Window Manager** - No mention of default WM (i3 vs sway, controlled by wm_type variable)

**Recommendation:** These are nice-to-haves, not critical. Consider adding in a follow-up if Copilot agents need more context.

---

### 🎯 **Best Practices Compliance**

✅ **Follows GitHub Copilot best practices guide**
✅ **Under 2-page limit** (115 lines is ~1.5 pages)
✅ **Not task-specific** (general repository guidance)
✅ **Build commands validated** (though run.sh has bugs)
✅ **Project structure documented**
✅ **Coding conventions explicit**

---

### 🔒 **Security Considerations**

✅ No security issues introduced by this PR
✅ Vault password paths documented (encrypted secrets not exposed)
⚠️ Note: CLAUDE.md mentions vars/ssh_vault.yml contains plaintext keys (existing security issue, not introduced here)

---

### 🧪 **Testing Recommendation**

Before merging:
1. ✅ Validate the copilot-instructions.md renders correctly on GitHub
2. ✅ Syntax check: ansible-playbook skogai.yml --syntax-check -i inventory
3. ⚠️ **Fix run.sh before relying on this documentation** - current script is broken

---

### 📊 **Overall Assessment**

**Score: 8.5/10**

This is a high-quality PR that provides valuable documentation for AI coding agents. The copilot-instructions.md file is well-structured, accurate, and follows best practices. The only blocker is the discovery of the run.sh bug (pre-existing, not introduced by this PR).

**Recommendation: APPROVE with caveats**
- ✅ Merge this PR as-is (copilot-instructions.md is good)
- ⚠️ Create follow-up issue to fix run.sh syntax errors
- 💡 Consider adding hook/workflow details in future iteration

---

### 🔧 **Action Items**

1. **Immediate:** Create issue to fix run.sh script (critical bug)
2. **Nice-to-have:** Add active hooks section to copilot-instructions.md
3. **Nice-to-have:** Expand git workflow section with wt-* script details

---

Great work consolidating repository onboarding documentation! This will significantly improve AI agent efficiency. 🚀

_Originally posted by @claude[bot] in https://github.com/Sko...

&lt;/details&gt;

- Fixes SkogAI/setup#86

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💬 We&#39;d love your input! Share your thoughts on Copilot coding agent in our [2 minute survey](https://gh.io/copilot-coding-agent-survey).

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/setup/pull/87

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/setup/pull/87.patch
https://github.com/SkogAI/setup/pull/87.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/87
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/setup/pull/87@github.com&gt;
