MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Fri, 03 Oct 2025 03:56:46 -0700
Subject: Re: [SkogAI/skogansible] Configure ansible-lint with repository-specific rules and fix linting violations (PR #24)
Message-ID: <SkogAI/skogansible/pull/24/review/3298450590@github.com>
In-Reply-To: <SkogAI/skogansible/pull/24@github.com>
References: <SkogAI/skogansible/pull/24@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68dfabee3dc29_b910d823206a"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

Configures ansible-lint and yamllint for this repository and fixes lint violations in two roles.
- Add repository-specific .ansible-lint with skip/warn/enable lists, offline mode, and mock modules
- Align .yamllint with ansible-lint expectations (braces, octal-values, comments-indentation)
- Fix empty-string comparison and octal mode violations in role tasks

### Reviewed Changes

Copilot reviewed 4 out of 4 changed files in this pull request and generated 4 comments.

| File | Description |
| ---- | ----------- |
| .ansible-lint | Adds comprehensive linter configuration, skip/warn/enable lists, offline mode, and justifications |
| .yamllint | Configures rules to match ansible-lint expectations (comments-indentation, braces, octal-values, truthy) |
| roles/01_host_info/tasks/main.yml | Replaces empty-string comparison with a length-based check in when clause |
| roles/02_package_managers/tasks/main.yml | Quotes file mode to avoid implicit octal parsing |





---

<sub>**Tip:** Customize your code reviews with copilot-instructions.md. <a href="/SkogAI/skogansible/new/master/.github?filename=copilot-instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Create the file</a> or <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">learn how to get started</a>.</sub>

> @@ -11,7 +11,7 @@
     path: /etc/sudoers.d/11-install-aur_builder
     line: "aur_builder ALL=(ALL) NOPASSWD: /usr/bin/pacman"
     create: yes
-    mode: 0644
+    mode: "0644"

Sudoers include files should be owned by root:root and use mode 0440 to follow sudo's recommended permissions. Please set owner/group and reduce permissions to avoid unnecessary readability and align with best practices.
```suggestion
    mode: "0440"
```

> @@ -18,7 +18,7 @@
   ansible.builtin.stat:
     path: "{{ lookup('env', 'ANSIBLE_BECOME_PASSWORD_FILE') }}"
   register: become_pass_file
-  when: lookup('env', 'ANSIBLE_BECOME_PASSWORD_FILE') != ''
+  when: lookup('env', 'ANSIBLE_BECOME_PASSWORD_FILE') | length > 0

[nitpick] Add a default('') before length to avoid a potential type error if the environment variable is unset and the lookup returns None. Suggested: when: (lookup('env', 'ANSIBLE_BECOME_PASSWORD_FILE') | default('')) | length > 0
```suggestion
  when: (lookup('env', 'ANSIBLE_BECOME_PASSWORD_FILE') | default('')) | length > 0
```

>  profile: null
+
+# Verbosity level (0-2)
+# 1 provides a good balance of information without overwhelming output
+verbosity: 1
+
+# Intentional Rule Skip Justifications:
+# =====================================
+#
+# risky-file-permissions (warning only):
+#   - roles/01_host_info/tasks/main.yml:2 - ansible_facts.yml file

[nitpick] Avoid hard-coding a line number in the justification, as it will drift. Consider referencing the task name or the target file path (ansible_facts.yml) without a specific line number.
```suggestion
#   - roles/01_host_info/tasks/main.yml - ansible_facts.yml file
```

> @@ -13,6 +13,18 @@ rules:
   comments:
     min-spaces-from-content: 1
 
+  # ansible-lint requires comments-indentation to be disabled
+  comments-indentation: false
+
+  # ansible-lint requires braces.max-spaces-inside to be 1
+  braces:
+    max-spaces-inside: 1
+
+  # ansible-lint requires octal-values rules
+  octal-values:
+    forbid-implicit-octal: true
+    forbid-explicit-octal: true
+
   truthy:
     allowed-values: ['true', 'false', 'yes', 'no']

[nitpick] Configuration intent appears inconsistent: ansible-lint warns on yaml[truthy], but yamllint allows 'yes'/'no', which suppresses that warning. If you want warnings for 'yes'/'no', remove them from allowed-values; otherwise, drop yaml[truthy] from warn_list in .ansible-lint.
```suggestion
    allowed-values: ['true', 'false']
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/24#pullrequestreview-3298450590
You are receiving this because you were assigned.

Message ID: <SkogAI/skogansible/pull/24/review/3298450590@github.com>