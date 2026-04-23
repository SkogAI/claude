MIME-Version: 1.0
From: "claude[bot]" <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Wed, 18 Feb 2026 13:52:45 -0800
Subject: Re: [SkogAI/lore] Audit and trim CLAUDE.md (-32%) (PR #58)
Message-ID: <SkogAI/lore/pull/58/c3923407744@github.com>
In-Reply-To: <SkogAI/lore/pull/58@github.com>
References: <SkogAI/lore/pull/58@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_699634ad80eb3_cc11282722a"; charset="UTF-8"

claude[bot] left a comment (SkogAI/lore#58)

## PR Review: Audit and trim CLAUDE.md (-32%)

**Overall:** This is a solid cleanup. The core goal — making CLAUDE.md accurate and leaner — is well-executed. Here are specific notes:

---

### Approved Changes

- **Deleting `.skogai/plan/CLAUDE.md` and `.skogai/plan/phases/CLAUDE.md`**: Auto-generated claude-mem activity logs have no place as CLAUDE.md files. Correct removal.
- **Removing stale data counts**: Hardcoded numbers (1202 entries, 107 books, 92 personas) in docs rot fast. Removing them entirely rather than updating is the right call.
- **Fixing `@` path prefixes**: Non-standard and likely confusing for tooling. Good fix.
- **Removing `scripts/jq/`**: If the directory does not exist, it should not be in the directory structure.
- **LLM provider correction**: Changing "All 3 providers (Claude, OpenAI, Ollama)" to the accurate "Claude Code (~80%)" is a meaningful accuracy fix.
- **Removing `.serena/memories/` reference**: If this path is not in the repo, the reference was dead weight.
- **Code Style placement**: Moving it earlier in the doc makes sense — it is useful to know before reading the rest.

---

### Concerns

**1. Docstring guideline silently dropped**

The original Code Style section had this line, which was removed without mention in the PR summary:

```
- **Documentation**: Docstrings with triple quotes for all classes/functions
```

If the project still expects docstrings, this should stay. If moving away from requiring them, worth noting in the PR description so the rationale is captured.

**2. Orchestrator Purpose appendix was not just a duplicate**

The PR summary says this section "duplicated Integration Pipeline", but the appendix contained knowledge-mapping detail not found elsewhere:

```
Knowledge mapping: content (00,10,20,101), lore (00,10,300,303), research (00,10,02)
```

This specifies which numbered knowledge files the orchestrator loads per task type — useful context for Claude Code when working in this repo. If this info lives in `orchestrator/` or another doc, the removal is fine. If not, consider preserving it or moving it somewhere discoverable.

**3. Test plan is unchecked**

None of the three test plan items are marked complete. The most important one before merging:

- [ ] Validate argc CLI still matches documented output

The argc Quick Start block is a key reference and should be verified against actual argc output before merge.

---

### Minor Notes

- Context Management went from 20 lines with example commands to a 2-line summary. Compact is fine if `tools/context-manager.sh --help` covers it, but the old examples were useful for understanding the interface at a glance.
- "Original Tools" → "Tools" rename is a clean improvement.

---

**Verdict:** Approve with suggestions. The accuracy fixes are valuable and the size reduction is justified. The two open questions (docstring guideline intent, orchestrator knowledge-mapping info) and unchecked test plan are worth a quick look before merge.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/58#issuecomment-3923407744
You are receiving this because you authored the thread.

Message ID: <SkogAI/lore/pull/58/c3923407744@github.com>