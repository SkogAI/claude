MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: "SkogAI/.ansible" <.ansible@noreply.github.com>
Date: Sun, 28 Sep 2025 11:12:59 -0700
Subject: Re: [SkogAI/.ansible] Add comprehensive Copilot instructions for Ansible repository automation (PR #29)
Message-ID: <SkogAI/.ansible/pull/29/review/3277266685@github.com>
In-Reply-To: <SkogAI/.ansible/pull/29@github.com>
References: <SkogAI/.ansible/pull/29@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68d97aab15f76_179af10c81282b"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR adds comprehensive Copilot instructions to enable AI coding agents to work efficiently with this Ansible repository without extensive exploration. The instructions document the dual-playbook architecture, validated build commands, and common failure scenarios with workarounds.

Key changes:
- Added `.github/copilot-instructions.md` with complete repository onboarding documentation
- Documented all validated build and validation commands with proper sequencing
- Included architecture overview, common issues, and emergency fallback procedures





> +
+### Development Workflow
+1. Make changes to roles or playbooks
+2. Run `./validate_setup.sh` 
+3. Check YAML syntax with Python if validate_setup.sh fails
+4. Test role loading with `--list-tasks`
+5. Use `--tags` for selective testing
+
+## Emergency Validation Steps
+
+If standard validation fails, use these fallback commands:
+
+```bash
+# Basic file structure check
+ls -la playbooks/ roles/ group_vars/
+find roles/ -name "main.yml" -type f | wc -l  # Should show 19 roles

The comment states '19 roles' but the repository architecture section lists only a subset of roles. Consider updating the expected count to match the actual number of roles or clarify if this includes placeholder roles.
```suggestion
find roles/ -name "main.yml" -type f | wc -l  # Should show the number of roles present (update this number if roles are added/removed)
```

> +- `host_vars/` - Host-specific configurations
+- Placeholder roles (fonts, vim, zsh, etc.) - contain "To be implemented"
+
+### Modification Requires Care:
+- `ansible.cfg` - Core Ansible configuration
+- `playbooks/*.yml` - Main execution workflows
+- `validate_setup.sh` - Validation logic
+
+### Never Modify:
+- `.github/workflows/` - CI/CD pipeline
+- `.hosts` - Inventory configuration
+
+## Testing New Changes
+
+**Essential Test Sequence:**
+1. `./validate_setup.sh` (must pass all 37 tests)

The instruction states the validation script 'must pass all 37 tests' but earlier in line 101 it suggests using validate_setup.sh as a workaround when collections are missing, which could cause test failures. This creates conflicting guidance about expected test outcomes.
```suggestion
1. `./validate_setup.sh` (must pass all 37 tests in a fully provisioned environment; in sandboxed or restricted environments, some tests may fail—see "Known Limitations" and "Emergency Validation Steps" below)
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/.ansible/pull/29#pullrequestreview-3277266685
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/.ansible/pull/29/review/3277266685@github.com>