MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sat, 29 Nov 2025 03:07:37 -0800
Subject: [SkogAI/setup] [WIP] Integrate dotfiles-templates into system-setup (PR #65)
Message-ID: <SkogAI/setup/pull/65@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692ad3f929a33_3c76b1100240759"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;


----

*This section details on the original issue you should resolve*

&lt;issue_title&gt;Epic: Integrate dotfiles-templates into system-setup&lt;/issue_title&gt;
&lt;issue_description&gt;## Summary

Integrate learnings and templates from `dotfiles-templates/` directory into `system-setup` ansible roles to provide comprehensive, well-documented dotfile management with user override mechanisms.

## Context

The `dotfiles-templates/` directory contains high-quality, well-documented dotfile templates with:
- Sensible defaults for common Unix/Linux tools
- Consistent `.local` override pattern for user customization
- Cross-platform compatibility
- Comprehensive comments explaining each section

System-setup currently focuses on zsh and has gaps in universal dotfile coverage (readline, editorconfig, dircolors, bash, profile).

## Goals

1. **Universal tool coverage** - Deploy configs that benefit all users regardless of shell choice
2. **User customization** - Enable `.local` override pattern for ansible-safe customization
3. **Simplicity** - Provide simple template alternatives to complex modular roles where appropriate
4. **Documentation** - Well-commented configs explaining what each setting does

## Sub-Issues

### High Priority (Immediate Wins)

- SkogAI/setup#52 - Add .inputrc template for readline configuration
  - Benefits: All readline tools (bash, python REPL, mysql, etc.)
  - Effort: Low - Simple symlink deployment
  - Impact: High - Universal improvement

- SkogAI/setup#53 - Add .editorconfig template for cross-editor consistency
  - Benefits: All editorconfig-aware editors (vim, neovim, vscode, zed, etc.)
  - Effort: Low - Simple symlink deployment
  - Impact: High - Cross-editor consistency

- SkogAI/setup#55 - Add .local override pattern to all dotfile templates
  - Benefits: Users can customize without breaking ansible management
  - Effort: Medium - Update multiple templates + documentation
  - Impact: Critical - Enables safe user customization

### Medium Priority (Important Enhancements)

- SkogAI/setup#54 - Add .dircolors template for custom ls colors
  - Benefits: Better visual distinction in file listings
  - Effort: Low-Medium - Symlink + update zsh aliases
  - Impact: Medium - Nice UX improvement

- SkogAI/setup#56 - Create .profile template for login shell environment
  - Benefits: Bash users and login shell scenarios
  - Effort: Medium - Template creation + testing
  - Impact: Medium - zsh users already covered

### Low Priority (Optional Improvements)

- SkogAI/setup#57 - Create .bashrc template as alternative to modular bash role
  - Benefits: Simple option for bash users
  - Effort: Low-Medium - Depends on approach chosen
  - Impact: Low - System-setup is zsh-focused
  - Note: Requires decision on approach (both/replace/enhance)

## Implementation Phases

### Phase 1: Quick Wins (Issues SkogAI/setup#52, SkogAI/setup#53)
1. Deploy .inputrc
2. Deploy .editorconfig
3. Test and verify
4. **Estimated effort:** 1-2 hours

### Phase 2: Override Pattern (Issue SkogAI/setup#55)
1. Update .zshrc.j2 with .local override
2. Update .gitconfig.j2 with include pattern
3. Document in role README
4. Create example .local files
5. Test override mechanism
6. **Estimated effort:** 2-3 hours

### Phase 3: Additional Templates (Issues SkogAI/setup#54, SkogAI/setup#56)
1. Deploy .dircolors
2. Create .profile template
3. Test login shell scenarios
4. **Estimated effort:** 2-3 hours

### Phase 4: Bash Simplification (Issue SkogAI/setup#57)
1. Decide on approach (both/replace/enhance)
2. Implement chosen approach
3. Document migration if replacing
4. **Estimated effort:** 3-4 hours (if replacing bash role)

## Success Criteria

- [ ] All high-priority issues (#52, SkogAI/setup#53, SkogAI/setup#55) implemented
- [ ] Comprehensive testing on clean system
- [ ] Documentation updated in role READMEs
- [ ] User customization via .local files works
- [ ] No regressions in existing dotfile deployments
- [ ] CLAUDE.md updated with integration notes

## References

- Source: `/home/skogix/skogix/dotfiles-templates/`
- Target: `/home/skogix/skogix/system-setup/roles/03-dotfiles/`
- Documentation: `dotfiles-templates/README.md`

## Related Issues

- SkogAI/setup#21 - General integration: dotfile-ansible atomic components (broader scope)
- SkogAI/setup#30-41 - Specific dotfile deployments (i3, rofi, dunst, gh, gptme, etc.)

## Timeline

- **Phase 1:** Immediate (this week)
- **Phase 2:** Short-term (next week)
- **Phase 3:** Medium-term (next 2 weeks)
- **Phase 4:** Long-term (requires decision + planning)

---

**Total estimated effort:** 8-12 hours across all phases
**Recommended start:** Phase 1 (quick wins with immediate value)&lt;/issue_description&gt;

## Comments on the Issue (you are @copilot in this section)

&lt;comments&gt;
&lt;/comments&gt;


&lt;/details&gt;

- Fixes SkogAI/setup#58

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.
You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/setup/pull/65

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/setup/pull/65.patch
https://github.com/SkogAI/setup/pull/65.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/65
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/setup/pull/65@github.com&gt;
