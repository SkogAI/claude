MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Fri, 26 Dec 2025 11:29:39 -0800
Subject: Re: [SkogAI/skogansible] feat: Add graphics role for GPU drivers and Ollama management (PR #115)
Message-ID: <SkogAI/skogansible/pull/115/review/3613812261@github.com>
In-Reply-To: <SkogAI/skogansible/pull/115@github.com>
References: <SkogAI/skogansible/pull/115@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_694ee223b241_f610d03242e6"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR implements a new `graphics` role for automated GPU driver installation and Ollama AI model management on Arch Linux systems, addressing issue #92. The role provides comprehensive support for NVIDIA, AMD, and Intel graphics drivers, optional CUDA toolkit installation, and Ollama service management with automatic initramfs regeneration.

**Key Changes:**
- Added complete `roles/graphics/` role with modular task structure for drivers, CUDA, and Ollama
- Created `vars/graphics.yml` configuration file with GPU driver and Ollama settings
- Integrated graphics role into workstation playbook with proper tags and variable loading

### Reviewed changes

Copilot reviewed 12 out of 12 changed files in this pull request and generated 9 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| roles/graphics/tasks/main.yml | Main task orchestration with conditional includes for drivers, CUDA, Ollama, and initramfs regeneration |
| roles/graphics/tasks/drivers.yml | GPU driver installation for NVIDIA/AMD/Intel with handler notifications |
| roles/graphics/tasks/cuda.yml | CUDA toolkit installation with NVIDIA driver verification |
| roles/graphics/tasks/ollama.yml | Ollama installation via pacman/script, service management, and model pulling |
| roles/graphics/defaults/main.yml | Comprehensive default variables with sensible defaults for all configuration options |
| roles/graphics/handlers/main.yml | Handlers for initramfs regeneration and reboot notification |
| roles/graphics/meta/main.yml | Role metadata defining Arch Linux platform support |
| roles/graphics/README.md | Extensive documentation with examples, troubleshooting, and security considerations |
| vars/graphics.yml | User-facing configuration file with GPU driver selection and Ollama model settings |
| playbooks/workstation.yml | Integrated graphics role with proper variable file loading and tags |
| FILESTRUCTURE.md | Updated file structure documentation to include graphics role |
| CLAUDE.md | Added graphics role configuration guide with usage examples and important notes |
</details>






---

💡 <a href="/SkogAI/skogansible/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +- name: Pull Ollama models
+  ansible.builtin.command:
+    cmd: "ollama pull {{ item }}"
+  loop: "{{ graphics_ollama_models }}"
+  when:
+    - graphics_ollama_models | length > 0
+    - graphics_ollama_enable_service
+    - graphics_ollama_service_state == "started"
+  register: ollama_pull_result
+  changed_when: "'pulling manifest' in ollama_pull_result.stdout"

The `ollama pull` command does not have idempotency protection. The task will always report as changed even if the model is already downloaded and up to date. The `changed_when` condition only checks for 'pulling manifest' in stdout, but this string may appear even when the model is already current. Consider checking if the model already exists using `ollama list` before attempting to pull, or improving the changed_when logic to detect actual downloads vs. already-present models.

> @@ -0,0 +1,13 @@
+---
+# Graphics Role - Handlers
+
+- name: Regenerate initramfs
+  become: true
+  ansible.builtin.command:
+    cmd: mkinitcpio -P

Both the `Regenerate initramfs` handler and the task in main.yml execute `mkinitcpio -P` without any changed_when condition. This means both will always report as changed even when the initramfs doesn't need updating. The command should include `changed_when: false` or capture and parse the output to determine if actual changes occurred.
```suggestion
    cmd: mkinitcpio -P
  changed_when: false
```

> +# Intel driver packages (if using intel)
+# graphics_intel_packages:
+#   - xf86-video-intel
+#   - vulkan-intel
+#   - lib32-vulkan-intel
+
+# CUDA toolkit installation
+graphics_install_cuda: false
+# graphics_cuda_packages:
+#   - cuda
+#   - cudnn
+
+# Ollama installation
+graphics_install_ollama: true
+graphics_ollama_method: "pacman"  # Options: pacman, script
+# graphics_ollama_script_url: "https://ollama.ai/install.sh"

The `graphics_ollama_script_url` variable is not defined in vars/graphics.yml but is used in ollama.yml when `graphics_ollama_method == "script"`. If a user sets the installation method to "script" while using vars/graphics.yml, the task will fail because the variable is undefined. Either define this variable in vars/graphics.yml or ensure the task provides a clear error message about the missing variable.
```suggestion
graphics_ollama_script_url: "https://ollama.ai/install.sh"
```

> +    enabled: true
+    state: "{{ graphics_ollama_service_state }}"
+  when: graphics_ollama_enable_service

The systemd task uses `enabled: true` unconditionally when `graphics_ollama_enable_service` is true, but doesn't handle the case where the service should be disabled. If a user wants to disable the service later by setting `graphics_ollama_enable_service: false`, the task won't disable it - it will simply skip the task entirely, leaving the service in its current state. Consider using `enabled: "{{ graphics_ollama_enable_service }}"` instead to properly manage both enabling and disabling.
```suggestion
    enabled: "{{ graphics_ollama_enable_service }}"
    state: "{{ graphics_ollama_service_state }}"
```

> +# graphics_nvidia_packages:
+#   - nvidia
+#   - nvidia-utils
+#   - lib32-nvidia-utils
+
+# AMD driver packages (if using amd)
+# graphics_amd_packages:
+#   - xf86-video-amdgpu
+#   - vulkan-radeon
+#   - lib32-vulkan-radeon
+
+# Intel driver packages (if using intel)
+# graphics_intel_packages:
+#   - xf86-video-intel
+#   - vulkan-intel
+#   - lib32-vulkan-intel

All GPU driver package lists (nvidia, amd, intel) are commented out in vars/graphics.yml but are required by roles/graphics/tasks/drivers.yml when the respective driver is selected. If a user sets `graphics_driver: "nvidia"` (as shown on line 7), the driver installation will fail because `graphics_nvidia_packages` is undefined. These variables should be uncommented to provide working defaults, or the role should fall back to the defaults in roles/graphics/defaults/main.yml.
```suggestion
graphics_nvidia_packages:
  - nvidia
  - nvidia-utils
  - lib32-nvidia-utils

# AMD driver packages (if using amd)
graphics_amd_packages:
  - xf86-video-amdgpu
  - vulkan-radeon
  - lib32-vulkan-radeon

# Intel driver packages (if using intel)
graphics_intel_packages:
  - xf86-video-intel
  - vulkan-intel
  - lib32-vulkan-intel
```

> +
+- name: Enable and start Ollama service
+  become: true
+  ansible.builtin.systemd:
+    name: ollama
+    enabled: true
+    state: "{{ graphics_ollama_service_state }}"
+  when: graphics_ollama_enable_service
+
+- name: Wait for Ollama service to be ready
+  ansible.builtin.wait_for:
+    port: 11434
+    delay: 2
+    timeout: 30
+  when: graphics_ollama_enable_service and graphics_ollama_service_state == "started"
+

The wait_for task only checks if port 11434 is open, but doesn't verify if the Ollama service is actually ready to accept commands. There's a race condition where the port might be open but the service isn't fully initialized. Consider adding a retry mechanism or checking the service's actual readiness using `ollama list` or a health endpoint instead of just port availability.
```suggestion

- name: Verify Ollama service readiness with 'ollama list'
  ansible.builtin.command:
    cmd: ollama list
  register: ollama_readiness_check
  retries: 10
  delay: 3
  until: ollama_readiness_check.rc == 0
  when: graphics_ollama_enable_service and graphics_ollama_service_state == "started"
```

> +
+- name: Regenerate initramfs
+  become: true
+  ansible.builtin.command:
+    cmd: mkinitcpio -P
+  when: graphics_regenerate_initramfs and graphics_driver != "none"
+  notify: Reboot required
+  tags: [graphics, initramfs]

There's potential for duplicate initramfs regeneration. The driver installation tasks in drivers.yml notify the "Regenerate initramfs" handler (lines 10, 18, 26), and then main.yml also runs the same command unconditionally (line 21-22). This means initramfs could be regenerated twice in a single playbook run when drivers are installed. Remove the direct task in main.yml and rely solely on the handler, or remove the handler notifications and keep only the direct task.
```suggestion

```

> +# graphics_cuda_packages:
+#   - cuda
+#   - cudnn

The `graphics_cuda_packages` variable is commented out in vars/graphics.yml but is required by roles/graphics/tasks/cuda.yml when `graphics_install_cuda` is enabled. If a user sets `graphics_install_cuda: true` in vars/graphics.yml, the CUDA installation will fail because the package list is undefined. Either uncomment this variable or ensure users are clearly warned that they must define it.
```suggestion
graphics_cuda_packages:
  - cuda
  - cudnn
```

> +- name: Install Ollama via script
+  become: true
+  ansible.builtin.shell:
+    cmd: curl -fsSL {{ graphics_ollama_script_url }} | sh

The script installation method pipes curl output directly to sh, which is a security risk. While the `creates` parameter prevents re-execution, the initial execution downloads and runs arbitrary code without verification. Consider adding a checksum verification step or at minimum documenting the security implications more prominently in the code comments, not just in the README.
```suggestion
# NOTE: Executing remote installation scripts carries security risks.
# Ensure {{ graphics_ollama_script_url }} points to a trusted source, and
# preferably provide graphics_ollama_script_checksum to enable integrity checking.
- name: Download Ollama install script
  become: true
  ansible.builtin.get_url:
    url: "{{ graphics_ollama_script_url }}"
    dest: /tmp/ollama_install.sh
    mode: "0755"
    checksum: "{{ graphics_ollama_script_checksum | default(omit) }}"
  when: graphics_ollama_method == "script"

- name: Install Ollama via downloaded script
  become: true
  ansible.builtin.shell:
    cmd: sh /tmp/ollama_install.sh
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/115#pullrequestreview-3613812261
You are receiving this because you authored the thread.

Message ID: <SkogAI/skogansible/pull/115/review/3613812261@github.com>