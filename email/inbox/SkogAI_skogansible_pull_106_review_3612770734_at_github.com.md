MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Thu, 25 Dec 2025 21:09:30 -0800
Subject: Re: [SkogAI/skogansible] Hardening?  (PR #106)
Message-ID: <SkogAI/skogansible/pull/106/review/3612770734@github.com>
In-Reply-To: <SkogAI/skogansible/pull/106@github.com>
References: <SkogAI/skogansible/pull/106@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_694e188adc7c7_be10d0269987d"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR adds comprehensive SSH hardening capabilities to the SSH role, implementing security best practices for both client and server configurations. The feature is disabled by default for safety and includes extensive documentation and examples.

**Key Changes:**
- New SSH hardening configuration variables and templates for client/server security
- Integration with Fail2Ban for brute-force protection and systemd socket rate limiting
- Three progressive example playbooks demonstrating client-only, full, and policy-based hardening

### Reviewed changes

Copilot reviewed 13 out of 13 changed files in this pull request and generated 13 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| vars/ssh.yml | Adds top-level hardening configuration variables with examples and documentation |
| roles/ssh/defaults/main.yml | Comprehensive default values for all hardening options (200+ lines of configuration) |
| roles/ssh/templates/sshd_config_hardened.j2 | Server configuration template with modern cryptographic algorithms and security settings |
| roles/ssh/templates/ssh_config_hardened.j2 | Client configuration template with secure defaults and connection multiplexing |
| roles/ssh/templates/sshd.socket.j2 | Systemd socket unit override for connection rate limiting |
| roles/ssh/templates/fail2ban_sshd.j2 | Fail2Ban jail configuration for SSH brute-force protection |
| roles/ssh/tasks/main.yml | Adds include for hardening tasks when enabled |
| roles/ssh/tasks/hardening.yml | Implements client/server hardening, key management, policies, and auditing |
| roles/ssh/handlers/main.yml | Adds handlers for sshd, systemd, and fail2ban service management |
| roles/ssh/examples/07-hardening-client.yml | Example for safe client-side only hardening |
| roles/ssh/examples/08-hardening-full.yml | Example for comprehensive client+server hardening with critical warnings |
| roles/ssh/examples/09-hardening-with-policies.yml | Example for maximum security with fail2ban integration |
| roles/ssh/README.md | Extensive documentation covering features, workflow, security considerations, and troubleshooting |
</details>






---

💡 <a href="/SkogAI/skogansible/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +
+    # Known hosts file location
+    UserKnownHostsFile ~/.ssh/known_hosts
+
+    # Connection Keepalive
+    # Keep connections alive (helps with firewalls/NAT)
+    ServerAliveInterval {{ ssh_hardening_server_alive_interval | default('60') }}
+    ServerAliveCountMax {{ ssh_hardening_server_alive_count | default('3') }}
+
+    # Connection timeout
+    ConnectTimeout {{ ssh_hardening_connect_timeout | default('30') }}
+
+    # Connection Multiplexing (for performance)
+    # Share connections to same host
+    ControlMaster {{ ssh_hardening_control_master | default('auto') }}
+    ControlPath {{ ssh_hardening_control_path | default('~/.ssh/sockets/%r@%h-%p') }}

The task creates a socket directory at ~/.ssh/sockets for ControlPath but this directory is never created in the client hardening block. This will cause SSH connection multiplexing to fail until the directory is manually created. Consider adding a task to ensure this directory exists with appropriate permissions (0700).
```suggestion
    ControlPath {{ ssh_hardening_control_path | default('~/.ssh/%r@%h-%p') }}
```

> +  listen: restart sshd
+

The handler has both a 'name' and a 'listen' directive with the same value 'restart sshd'. The 'listen' directive is used when you want a handler to respond to a different notification name than its actual name, but here they're identical. This is redundant - you should either use just 'name' or use 'name' with a different value and 'listen: restart sshd'.
```suggestion

```

> +  listen: restart sshd
+
+- name: reload sshd
+  ansible.builtin.systemd:
+    name: sshd
+    state: reloaded
+  become: true
+  listen: reload sshd

Same issue as the previous handler - the 'name' and 'listen' directives have identical values 'reload sshd', which is redundant.
```suggestion

- name: reload sshd
  ansible.builtin.systemd:
    name: sshd
    state: reloaded
  become: true
```

> +    state: restarted
+  become: true
+  listen: restart sshd
+
+- name: reload sshd
+  ansible.builtin.systemd:
+    name: sshd
+    state: reloaded
+  become: true
+  listen: reload sshd
+
+- name: reload systemd
+  ansible.builtin.systemd:
+    daemon_reload: true
+  become: true
+  listen: reload systemd

Same redundancy issue - 'name' and 'listen' both set to 'reload systemd'.
```suggestion

```

> +- name: restart fail2ban
+  ansible.builtin.systemd:
+    name: fail2ban
+    state: restarted
+  become: true
+  listen: restart fail2ban

Same redundancy issue - 'name' and 'listen' both set to 'restart fail2ban'.

> +- name: reload ssh config
+  ansible.builtin.debug:
+    msg: "SSH config reloaded (no action needed, changes take effect immediately)"
+  listen: reload ssh config

Same redundancy issue - 'name' and 'listen' both set to 'reload ssh config'.

> +#
+# ⚠️  WARNING: Server-side hardening requires sudo and restarts SSH daemon
+# ⚠️  Test on non-production systems first!
+# ⚠️  Keep existing SSH session open while testing
+# ⚠️  Test new connections in a separate terminal before closing current session
+
+- name: SSH Full Hardening (Client + Server)
+  hosts: localhost
+  connection: local
+
+  # Server hardening requires privilege escalation
+  # Note: This will prompt for sudo password unless configured otherwise
+  vars:
+    ansible_become_password: "{{ lookup('env', 'ANSIBLE_BECOME_PASSWORD') }}"
+
+  vars:

There is a duplicate 'vars:' key in this playbook. The first 'vars:' block at lines 16-17 defines ansible_become_password, and the second 'vars:' block starts at line 19. In YAML, having duplicate keys at the same level will cause the first one to be overwritten. These should be combined into a single 'vars:' block.
```suggestion

```

> +# Note: logpath is ignored when backend is 'systemd' (Arch Linux, modern Debian/Ubuntu)
+# systemd backend reads from journald directly

The comment on line 298 states "logpath is ignored when backend is 'systemd'" but this is misleading. While systemd backend does use journald directly for most modern systems, the logpath parameter may still be relevant for compatibility with non-systemd systems or specific fail2ban configurations. Consider clarifying this comment to indicate this is the behavior for systemd-based systems specifically.
```suggestion
# Note: on most systemd-based systems (e.g. Arch Linux, modern Debian/Ubuntu),
# the 'systemd' backend reads from journald directly so logpath is typically unused,
# but it may still be relevant on non-systemd systems or in specific fail2ban setups.
```

> +
+# Security and logging (server)
+ssh_hardening_syslog_facility: "AUTH"
+ssh_hardening_server_log_level: "VERBOSE"
+ssh_hardening_strict_modes: "yes"
+ssh_hardening_use_privilege_separation: "sandbox"
+ssh_hardening_server_compression: "no"
+ssh_hardening_print_motd: "no"
+ssh_hardening_print_last_log: "yes"
+ssh_hardening_permit_user_env: "no"
+# ssh_hardening_accept_env:
+#   - LANG
+#   - LC_*
+
+# SFTP (server)
+ssh_hardening_enable_sftp: true

The SFTP server path '/usr/lib/ssh/sftp-server' may not be correct for all systems. On many distributions, the path is '/usr/lib/openssh/sftp-server' (Debian/Ubuntu) or '/usr/libexec/openssh/sftp-server' (RHEL/CentOS). Consider using a more portable default or adding documentation about this variable needing to be set per distribution.
```suggestion
ssh_hardening_enable_sftp: true
# NOTE: This path is distribution-specific and may need to be overridden.
# Common locations include:
#   - /usr/lib/openssh/sftp-server        # Debian/Ubuntu
#   - /usr/libexec/openssh/sftp-server    # RHEL/CentOS
#   - /usr/lib/ssh/sftp-server            # Some other distributions
# Override this in your inventory/group_vars/host_vars if your system uses a different path.
```

> @@ -0,0 +1,270 @@
+# SSH Server Config - Hardened Configuration
+# Managed by Ansible - Generated: {{ ansible_facts['date_time']['iso8601'] }}
+#
+# This configuration follows SSHD security best practices:

The comment refers to 'SSHD' (all caps) which is inconsistent with the rest of the codebase that uses 'sshd' or 'SSH'. While 'SSHD' is sometimes used as an acronym, consider using 'SSH server' or 'sshd' for consistency.
```suggestion
# This configuration follows SSH server security best practices:
```

> +
+- name: "SSH Hardening | Client-side hardening"
+  when: ssh_hardening_client_enabled | default(false)
+  tags:
+    - ssh
+    - ssh-hardening
+    - ssh-hardening-client
+  block:
+    - name: "SSH Hardening | Deploy hardened SSH client config"
+      ansible.builtin.template:
+        src: "{{ ssh_hardening_client_template | default('ssh_config_hardened.j2') }}"
+        dest: "{{ ssh_config_file }}"
+        mode: "{{ ssh_config_mode }}"
+        owner: "{{ ansible_facts['user_id'] }}"
+        group: "{{ ansible_facts['user_id'] }}"
+        backup: true

The validation command 'ssh -G -F %s localhost' will always pass as long as the syntax is correct, but it won't catch semantic errors like missing socket directories. While this is the standard validation approach for SSH config files, consider adding a comment noting that this only validates syntax, not runtime functionality.
```suggestion
        backup: true
        # Note: this validate command checks only SSH config syntax, not runtime paths (e.g. socket directories).
```

> +  listen: reload fail2ban
+

Same redundancy issue - 'name' and 'listen' both set to 'reload fail2ban'.
```suggestion

```

> +# SFTP subsystem
+{% if ssh_hardening_enable_sftp | default(true) %}
+Subsystem sftp {{ ssh_hardening_sftp_server | default('/usr/lib/ssh/sftp-server') }}

Similar to the defaults file, the SFTP server path '/usr/lib/ssh/sftp-server' may not be correct for all distributions. This should either use a distribution-specific variable or have better documentation about setting this correctly per system.
```suggestion
# SFTP subsystem (defaults to internal-sftp; override ssh_hardening_sftp_server per distro if needed)
{% if ssh_hardening_enable_sftp | default(true) %}
Subsystem sftp {{ ssh_hardening_sftp_server | default('internal-sftp') }}
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/106#pullrequestreview-3612770734
You are receiving this because you authored the thread.

Message ID: <SkogAI/skogansible/pull/106/review/3612770734@github.com>