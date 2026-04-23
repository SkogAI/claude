MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogix <skogix@noreply.github.com>
Date: Sat, 29 Nov 2025 13:22:36 -0800
Subject: Re: [SkogAI/skogix] Complete 00-locale role with standard Ansible structure (PR #98)
Message-ID: <SkogAI/skogix/pull/98/review/3520828890@github.com>
In-Reply-To: <SkogAI/skogix/pull/98@github.com>
References: <SkogAI/skogix/pull/98@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692b641c74f4b_b9110014527f4"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR completes the `00-locale` role by adding standard Ansible role structure files (defaults, handlers, meta, README) and refactors the existing tasks to use handler-based locale generation instead of inline conditional execution. The role was already present in the repository at `system-setup/roles/00-locale/` with basic tasks and was included in `skogai.yml`.

Key changes:
- Adds role structure files (defaults/main.yml, handlers/main.yml, meta/main.yml, README.md)
- Refactors tasks/main.yml to use handler notification pattern for idempotent locale-gen execution
- Updates example playbook and documentation references

### Reviewed changes

Copilot reviewed 7 out of 7 changed files in this pull request and generated 2 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| system-setup/roles/00-locale/tasks/main.yml | Refactored to use handler notification instead of inline conditional; removed default values (now in defaults/main.yml) |
| system-setup/roles/00-locale/meta/main.yml | Added role metadata with Ansible version requirement and platform info |
| system-setup/roles/00-locale/handlers/main.yml | Added "Generate locales" handler with proper changed_when flag |
| system-setup/roles/00-locale/defaults/main.yml | Added default variables for locales to generate and system locale |
| system-setup/roles/00-locale/README.md | Added comprehensive role documentation with usage examples and variable tables |
| system-setup/examples/example-locale.yml | Fixed role path reference (partially - still has incorrect prefix) |
| system-setup/README.md | Updated documentation paths to reference correct role and example locations |
</details>






---

💡 <a href="/SkogAI/skogix/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

>    become: true
 
   roles:
-    - role: ../ansible/roles/locale
+    - role: ../roles/00-locale

Incorrect role path. Should use `roles/00-locale` (without `../`) to match the repository convention. Other example playbooks like `example-aur-user.yml` and `example-uv-tools.yml` use the `roles/XX-name` format, not `../roles/XX-name`.
```suggestion
    - role: roles/00-locale
```

> @@ -0,0 +1,20 @@
+---
+# meta file for 00-locale role
+
+galaxy_info:
+  author: skogix
+  description: Ansible role for locale configuration
+  license: MIT
+  min_ansible_version: "2.12"

Inconsistent `min_ansible_version`. Other roles in this repository (e.g., `01-base`, `04-aur-user`) use `"2.9"`, but this role specifies `"2.12"`. Unless there's a specific feature requirement from Ansible 2.12+, consider using `"2.9"` for consistency.
```suggestion
  min_ansible_version: "2.9"
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogix/pull/98#pullrequestreview-3520828890
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/skogix/pull/98/review/3520828890@github.com>