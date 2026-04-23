MIME-Version: 1.0
From: "claude[bot]" <notifications@github.com>
To: SkogAI/lore <lore@noreply.github.com>
Date: Thu, 08 Jan 2026 15:12:01 -0800
Subject: Re: [SkogAI/lore] feat: Extract inline LLM prompts to external YAML files (PR #52)
Message-ID: <SkogAI/lore/pull/52/c3726320172@github.com>
In-Reply-To: <SkogAI/lore/pull/52@github.com>
References: <SkogAI/lore/pull/52@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_696039c152bad_e010d01102a5"; charset="UTF-8"

claude[bot] left a comment (SkogAI/lore#52)

## PR Review: Extract Inline LLM Prompts to External YAML Files

This PR successfully addresses Issue #29 by extracting 7 inline LLM prompts from shell scripts into external YAML files with proper fallback handling.

## Strengths

**1. Excellent Backward Compatibility**
- Works without yq installed (inline fallbacks)
- Works without prompts/ directory
- No breaking changes to CLI or output formats
- Clean load_prompt_template() function handles all edge cases

**2. Well-Structured YAML Format**
- Clear schema with versioning, validation, and examples
- Enables version tracking, variable documentation, and testing

**3. Comprehensive Documentation**
- 208-line prompts/README.md with usage patterns
- Anti-patterns section, version management guidelines
- Testing recommendations and contributing guidelines

**4. Simple but Effective**
- Efficient bash parameter expansion for interpolation
- Single-pass replacement performs well

**5. Addresses Core Goals**
- Prompts externalized for offline queuing
- Systematic auditing now possible
- Reusable across tools
- Enables batch processing

## Areas for Consideration

**1. Variable Interpolation Edge Cases**
Potential issues with newlines, special characters, and unmatched variables. Recommend adding validation to detect uninterpolated variables after substitution.

**2. Missing Tests**
No tests for prompt loading, fallback behavior, or variable interpolation. Recommend tests/test_prompt_loading.sh following pattern in existing tests/test_lore_flow_content.sh

**3. YAML Dependency**
Introduces yq dependency alongside existing jq. Acceptable since YAML is more readable for multi-line prompts. Should document optional dependency.

**4. Version Management**
Scripts don't verify prompt version compatibility. No documented archive structure for old versions. Recommend documenting versioning strategy.

**5. Security Note**
Low risk but document that variables from untrusted sources should be sanitized before interpolation.

## Minor Issues

1. Add comment in interpolate_prompt() explaining pair-based parameters
2. Add SKOGAI_DIR validation with warning message
3. Consider logging when falling back to inline prompts for debugging

## Code Quality

Architecture: ⭐⭐⭐⭐⭐ Clean separation of concerns
Backward Compatibility: ⭐⭐⭐⭐⭐ Perfect
Documentation: ⭐⭐⭐⭐⭐ Comprehensive
Test Coverage: ⭐⭐⭐ Missing new functionality tests
Security: ⭐⭐⭐⭐ Low risk surface
Performance: ⭐⭐⭐⭐ Efficient
Maintainability: ⭐⭐⭐⭐⭐ Clear and simple

## Recommendation: APPROVE ✅

This PR successfully achieves its goals with excellent backward compatibility and documentation. Minor issues are non-blocking and can be addressed in follow-up PRs.

**Next Steps:**
1. Merge this PR
2. Add tests in follow-up PR
3. Update CLAUDE.md to reference prompts/ directory
4. Monitor for edge cases

Great work by Copilot on this feature!

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/lore/pull/52#issuecomment-3726320172
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/lore/pull/52/c3726320172@github.com>