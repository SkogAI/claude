MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Wed, 26 Nov 2025 13:27:58 -0800
Subject: Re: [SkogAI/setup] feat: add gptme role with repo cloning and uv install (PR #44)
Message-ID: <SkogAI/setup/pull/44/review/3512798903@github.com>
In-Reply-To: <SkogAI/setup/pull/44@github.com>
References: <SkogAI/setup/pull/44@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692770dedc760_d711001713eb"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR adds a new `10-gptme` role that sets up the gptme CLI tool and gptme-rag extension, while consolidating the playbook structure by removing `site.yml` and making `skogai.yml` the primary playbook. The implementation follows established patterns from similar roles (05-nvm, 06-skogcli, 07-argc) for git repository cloning and uv tool installation.

**Key changes:**
- New role clones SkogAI/gptme and gptme/gptme-rag repositories, installs gptme with all extras via uv
- Consolidates playbooks by removing site.yml, updating all references to use skogai.yml
- Fixes duplicate [rag] section in gptme config.toml

### Reviewed changes

Copilot reviewed 7 out of 7 changed files in this pull request and generated 2 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| `roles/10-gptme/tasks/main.yml` | New role that clones gptme/gptme-rag repositories, installs with uv, and symlinks config |
| `roles/03-dotfiles/files/.config/gptme/config.toml` | Removes duplicate [rag] section (moved to comments) |
| `skogai.yml` | Adds 10-gptme role to playbook |
| `site.yml` | Removed (consolidated into skogai.yml) |
| `README.md` | Updates command examples from site.yml to skogai.yml |
| `CLAUDE.md` | Updates command examples and architecture documentation for skogai.yml |
| `TO-DOS.md` | Updates task references from site.yml to skogai.yml |
</details>






---

💡 <a href="/SkogAI/setup/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +  become: true
+  become_user: "{{ item.name }}"
+  register: gptme_install
+  changed_when: "'Installed' in gptme_install.stdout or 'updated' in gptme_install.stdout"
+
+- name: Verify gptme installation
+  ansible.builtin.command:
+    cmd: gptme --version
+  loop: "{{ users }}"
+  become: true
+  become_user: "{{ item.name }}"
+  changed_when: false
+
+- name: Symlink gptme config for users
+  ansible.builtin.file:
+    src: "{{ playbook_dir }}/roles/03-dotfiles/files/.config/gptme/config.toml"

The symlink source path uses `playbook_dir` but should use `role_path` for consistency with other roles in this codebase. All other symlink tasks in `roles/03-dotfiles/tasks/main.yml` use `{{ role_path }}/files/...` pattern. This ensures the role remains portable and self-contained.

Change to:
```yaml
src: "{{ role_path }}/../03-dotfiles/files/.config/gptme/config.toml"
```

Or better yet, since this config file lives in the dotfiles role, consider managing it there instead, similar to how fish, kitty, and zsh configs are handled.
```suggestion
    src: "{{ role_path }}/../03-dotfiles/files/.config/gptme/config.toml"
```

> +- name: Clone gptme-rag repository
+  ansible.builtin.git:
+    repo: https://github.com/gptme/gptme-rag.git
+    dest: "/home/{{ item.name }}/.local/src/gptme-rag"
+    version: master
+    accept_hostkey: true
+  loop: "{{ users }}"
+  loop_control:
+    index_var: idx
+  become: true
+  become_user: "{{ item.name }}"
+  when: gptme_rag_origin.results[idx].rc != 0 or gptme_rag_origin.results[idx].stdout != 'https://github.com/gptme/gptme-rag.git'
+
+- name: Install gptme with all extras and gptme-rag
+  ansible.builtin.command:
+    cmd: uv tool install --force --reinstall -e ".[all]" --with gptme-rag

[nitpick] The `--reinstall` flag differs from the pattern used in the similar `06-skogcli` role, which uses `--refresh`. For consistency across roles that install tools with `uv tool install`, consider using `--refresh` instead of `--reinstall` unless there's a specific reason for the different behavior.

Reference: `roles/06-skogcli/tasks/main.yml:87` uses `uv tool install --force --refresh -e .`
```suggestion
    cmd: uv tool install --force --refresh -e ".[all]" --with gptme-rag
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/44#pullrequestreview-3512798903
You are receiving this because you authored the thread.

Message ID: <SkogAI/setup/pull/44/review/3512798903@github.com>