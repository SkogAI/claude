MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Sat, 29 Nov 2025 10:08:10 -0800
Subject: [SkogAI/setup] [WIP] Integrate atomic components from dotfile-ansible into system-setup (PR #72)
Message-ID: <SkogAI/setup/pull/72@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692b368a6e926_bf110010517cf"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;


----

*This section details on the original issue you should resolve*

&lt;issue_title&gt;General integration: dotfile-ansible atomic components into system-setup&lt;/issue_title&gt;
&lt;issue_description&gt;## Summary

Integrate useful components from the bash-focused `dotfile-ansible` repository (in `TODO/`) into the current zsh-focused `system-setup`.

## What Are Atomic Components?

The TODO folder contains documentation for a **different Ansible dotfiles project** that was broken down into modular, independent pieces for selective integration:

### The 4 Atomic Roles

| Role | Purpose | Complexity | Value for system-setup |
|------|---------|------------|------------------------|
| **bash** | oh-my-bash + 17 utility scripts | HIGH | Medium (convert to zsh) |
| **nvim** | Neovim nightly from AUR | LOW | Skip (have svim) |
| **ssh_vault** | Vault-encrypted SSH key management | MEDIUM | Evaluate (see SkogAI/setup#19) |
| **system** | Basic package management (jq) | LOW | Skip (too basic) |

### The 17 Bash Utility Scripts

The most valuable component - located in `TODO/roles/bash/files/bash/`:

**Git Workflow:**
- `git_functions.sh` - Advanced git operations
- `git_aliases.sh` - Git shortcuts
- `git_completions.sh` - Tab completion

**Development Tools:**
- `neovim_functions.sh` / `neovim_aliases.sh` - Nvim helpers
- `pkg_functions.sh` - Universal package management
- `gpt_functions.sh` - AI/GPT integration

**File/System Management:**
- `bat_functions.sh` - Enhanced file viewing
- `lsd_aliases.sh` - Modern ls alternatives
- `paths_functions.sh` / `paths_vars.sh` - PATH management
- `vars.sh` - Environment variables
- `speedtest_functions.sh` - Network testing

**Completions:**
- `dotfiles_completions.sh`
- `git_completions.sh`

**Miscellaneous:**
- `misc_aliases.sh` - General aliases

## Key Differences: dotfile-ansible vs system-setup

| Aspect | dotfile-ansible (TODO) | system-setup (current) |
|--------|------------------------|------------------------|
| **Shell** | bash + oh-my-bash | zsh |
| **Scope** | Simple dotfiles | Full workstation setup |
| **Roles** | 4 roles | 10 roles (00-09) |
| **Features** | Scripts only | GPU detection, systemd services, skogcli |
| **Secrets** | ansible-vault encrypted | Private git repo (skogix/secrets) |

## Integration Strategy

### What to USE

1. **Git functions** → Convert to zsh, add to `roles/03-dotfiles/files/zsh/`
2. **Package management functions** → Adapt for pacman-first approach
3. **PATH functions** → Merge with existing env.zsh
4. **SSH vault approach** → Evaluate as alternative to 00-secrets

### What to SKIP

1. **oh-my-bash** - Using zsh, not bash
2. **nvim role** - Already have svim in 03-dotfiles
3. **system role** - Too basic, already have comprehensive package management
4. **axin theme** - bash-specific

### Variable Files

- `vars/main.yml` - Contains personal info (git user), adapt pattern only
- `vars/groups.yml` - Role selection pattern, useful for reference
- `vars/ssh_keys.yml` - VAULTED, don&#39;t copy - create your own

## Implementation Plan

### Phase 1: Script Migration (Issues SkogAI/setup#16, SkogAI/setup#17, SkogAI/setup#18)
- [ ] Review each bash script for useful functions
- [ ] Convert bash → zsh syntax
- [ ] Add to zsh module loading in `roles/03-dotfiles/`
- [ ] Test on Arch Linux

### Phase 2: Secrets Evaluation (#19)
- [ ] Compare vault-based vs private-repo approaches
- [ ] Decide on hybrid or single approach
- [ ] Update 00-secrets role if needed

### Phase 3: Cleanup (#20)
- [ ] Verify all useful code extracted
- [ ] Document decisions in commit messages
- [ ] Delete TODO folder

## Dependency Summary

### What&#39;s NOT Needed from TODO
- `community.general` - Already have
- `kewlfft.aur` - Already have (04-aur-user)
- `kubernetes.core` - Not used

### What&#39;s Useful to Reference
- Role selection pattern (`vars/groups.yml`)
- Vault password file management (ssh_vault)
- OS-specific task organization

## Files to Review

Key files in TODO folder:
```
TODO/
├── ATOMIC_COMPONENTS_README.md  # Quick start guide
├── INTEGRATION_GUIDE.md         # Detailed planning (376 lines)
├── COMPONENT_BREAKDOWN.md       # Technical deep dive (607 lines)
├── DEPENDENCY_MAP.md            # Visual dependencies (619 lines)
└── CLAUDE.md                    # Old project context (outdated)
```

## Related Issues

- SkogAI/setup#16 - Migrate git functions from bash to zsh
- SkogAI/setup#17 - Migrate package management functions to zsh
- SkogAI/setup#18 - Migrate PATH management functions to zsh
- SkogAI/setup#19 - Evaluate SSH vault role for secrets management
- SkogAI/setup#20 - Clean up TODO folder after migrations

## Success Criteria

- [ ] Valuable bash functions converted to zsh and working
- [ ] No redundant code introduced
- [ ] TODO folder deleted
- [ ] system-setup CLAUDE.md updated with any new modules
- [ ] All related issues closed

## Priority

Medium - provides productivity enhancements but current setup works

## Time Estimate

- Review: 30 minutes
...

&lt;/details&gt;

- Fixes SkogAI/setup#21

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💡 You can make Copilot smarter by setting up custom instructions, customizing its development environment and configuring Model Context Protocol (MCP) servers. Learn more [Copilot coding agent tips](https://gh.io/copilot-coding-agent-tips) in the docs.
You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/setup/pull/72

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/setup/pull/72.patch
https://github.com/SkogAI/setup/pull/72.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/72
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/setup/pull/72@github.com&gt;
