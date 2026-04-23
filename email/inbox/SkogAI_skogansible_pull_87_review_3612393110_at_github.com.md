MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Thu, 25 Dec 2025 06:01:51 -0800
Subject: Re: [SkogAI/skogansible] Add SSH hardening with modern crypto, Fail2Ban, and rate limiting (PR #87)
Message-ID: <SkogAI/skogansible/pull/87/review/3612393110@github.com>
In-Reply-To: <SkogAI/skogansible/pull/87@github.com>
References: <SkogAI/skogansible/pull/87@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_694d43cf7adac_df10d015040cb"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This pull request adds comprehensive SSH hardening capabilities to the existing SSH role, implementing security best practices for both client and server configurations. The hardening features are disabled by default to ensure backward compatibility and safety.

**Key Changes:**
- Modern cryptographic algorithms enforcement (curve25519, ChaCha20-Poly1305, AES-GCM)
- Optional client-side and server-side SSH hardening with granular control flags
- Fail2Ban integration for brute-force protection and systemd socket-based rate limiting

### Reviewed changes

Copilot reviewed 13 out of 13 changed files in this pull request and generated 15 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| `vars/ssh.yml` | Adds high-level hardening control flags with examples and safety warnings |
| `roles/ssh/defaults/main.yml` | Defines 150+ hardening variables with secure defaults for crypto algorithms, authentication, and security policies |
| `roles/ssh/tasks/main.yml` | Integrates hardening tasks via conditional include |
| `roles/ssh/tasks/hardening.yml` | Implements client/server hardening, weak key removal, Fail2Ban setup, and configuration audit |
| `roles/ssh/handlers/main.yml` | Adds systemd handlers for sshd, fail2ban, and systemd daemon-reload |
| `roles/ssh/templates/ssh_config_hardened.j2` | Client config template enforcing modern crypto and secure defaults |
| `roles/ssh/templates/sshd_config_hardened.j2` | Server config template with restrictive authentication and disabled tunneling |
| `roles/ssh/templates/sshd.socket.j2` | Systemd socket override for connection rate limiting |
| `roles/ssh/templates/fail2ban_sshd.j2` | Fail2Ban jail configuration for SSH protection |
| `roles/ssh/examples/07-hardening-client.yml` | Example playbook for client-only hardening (no sudo required) |
| `roles/ssh/examples/08-hardening-full.yml` | Example playbook for full client+server hardening |
| `roles/ssh/examples/09-hardening-with-policies.yml` | Example playbook for maximum security with Fail2Ban and policies |
| `roles/ssh/README.md` | Adds 330+ lines of hardening documentation with usage examples, security considerations, and troubleshooting |
</details>






---

💡 <a href="/SkogAI/skogansible/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +    - name: "SSH Hardening | Ensure ED25519 host key exists"
+      ansible.builtin.command:
+        cmd: ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ""
+        creates: /etc/ssh/ssh_host_ed25519_key
+      when: ssh_hardening_ensure_ed25519 | default(true)
+
+    - name: "SSH Hardening | Ensure RSA host key exists with appropriate size"
+      ansible.builtin.command:
+        cmd: "ssh-keygen -t rsa -b {{ ssh_hardening_rsa_key_size | default(4096) }} -f /etc/ssh/ssh_host_rsa_key -N ''"
+        creates: /etc/ssh/ssh_host_rsa_key
+      when: ssh_hardening_ensure_rsa | default(true)

Using `ansible.builtin.command` with `ssh-keygen` without checking if keys are already present or handling errors could lead to issues. While `creates` parameter prevents recreation, consider using `no_log: true` to avoid logging key generation commands in audit logs, and adding error handling for when ssh-keygen is not available.
```suggestion
    - name: "SSH Hardening | Check ssh-keygen availability"
      ansible.builtin.command: ssh-keygen -?
      register: ssh_keygen_check
      changed_when: false
      failed_when: ssh_keygen_check.rc != 0
      no_log: true

    - name: "SSH Hardening | Ensure ED25519 host key exists"
      ansible.builtin.command:
        cmd: ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ""
        creates: /etc/ssh/ssh_host_ed25519_key
      no_log: true
      when: 
        - ssh_hardening_ensure_ed25519 | default(true)
        - ssh_keygen_check.rc == 0

    - name: "SSH Hardening | Ensure RSA host key exists with appropriate size"
      ansible.builtin.command:
        cmd: "ssh-keygen -t rsa -b {{ ssh_hardening_rsa_key_size | default(4096) }} -f /etc/ssh/ssh_host_rsa_key -N ''"
        creates: /etc/ssh/ssh_host_rsa_key
      no_log: true
      when: 
        - ssh_hardening_ensure_rsa | default(true)
        - ssh_keygen_check.rc == 0
```

> +# Use privilege separation
+UsePrivilegeSeparation {{ ssh_hardening_use_privilege_separation | default('sandbox') }}

The `UsePrivilegeSeparation` directive is deprecated as of OpenSSH 7.5 and removed in OpenSSH 7.6+ (released March 2017). Modern versions of OpenSSH always use privilege separation and will generate warnings or errors when this directive is present. This directive should be removed or made conditional based on the OpenSSH version to avoid configuration warnings.
```suggestion
# Privilege separation is always enabled in modern OpenSSH; the
# legacy UsePrivilegeSeparation directive has been removed.
```

> +    - ssh_hardening_connection_limits | default(false)
+    - ssh_hardening_server_enabled | default(false)
+  become: true
+  block:
+    - name: "SSH Hardening | Ensure systemd socket override directory exists"
+      ansible.builtin.file:
+        path: /etc/systemd/system/sshd.socket.d
+        state: directory
+        mode: "0755"
+        owner: root
+        group: root
+      when: ansible_facts['service_mgr'] == 'systemd'
+
+    - name: "SSH Hardening | Configure systemd socket limits"
+      ansible.builtin.template:
+        src: "{{ ssh_hardening_socket_template | default('sshd.socket.j2') }}"

The variable `ssh_hardening_socket_template` is used in the tasks but not defined in the defaults file. While it has a default value in the template task itself, for consistency with other template variables like `ssh_hardening_client_template` and `ssh_hardening_server_template`, this should be defined in defaults/main.yml.
```suggestion
        src: "sshd.socket.j2"
```

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

The `ControlPath` is set to `~/.ssh/sockets/%r@%h-%p` but the `~/.ssh/sockets/` directory is not automatically created by the hardening tasks. If this directory doesn't exist, SSH connection multiplexing will fail. Consider adding a task to create this directory in the client hardening block, or document that users need to create it manually.
```suggestion
    ControlPath {{ ssh_hardening_control_path | default('~/.ssh/%r@%h-%p') }}
```

> +PermitUserEnvironment {{ ssh_hardening_permit_user_env | default('no') }}
+
+# Accept environment variables (be restrictive)
+{% if ssh_hardening_accept_env is defined %}
+AcceptEnv {{ ssh_hardening_accept_env | join(' ') }}
+{% else %}
+AcceptEnv LANG LC_*
+{% endif %}
+
+# ==============================================================================
+# Subsystems
+# ==============================================================================
+
+# SFTP subsystem
+{% if ssh_hardening_enable_sftp | default(true) %}
+Subsystem sftp {{ ssh_hardening_sftp_server | default('/usr/lib/ssh/sftp-server') }}

The default SFTP server path `/usr/lib/ssh/sftp-server` may not be correct for all distributions. Common paths include `/usr/lib/openssh/sftp-server` (Debian/Ubuntu), `/usr/libexec/openssh/sftp-server` (Red Hat/CentOS), and `/usr/lib/ssh/sftp-server` (Arch). Consider detecting the correct path dynamically or documenting that this variable should be set per distribution.
```suggestion
# Default to the portable built-in SFTP server. To use an external binary instead,
# override `ssh_hardening_sftp_server` per distribution, for example:
#   - Debian/Ubuntu: /usr/lib/openssh/sftp-server
#   - RHEL/CentOS:   /usr/libexec/openssh/sftp-server
#   - Arch:          /usr/lib/ssh/sftp-server
Subsystem sftp {{ ssh_hardening_sftp_server | default('internal-sftp') }}
```

> @@ -0,0 +1,12 @@
+# Fail2Ban SSH Jail Configuration
+# Managed by Ansible - Generated: {{ ansible_facts['date_time']['iso8601'] }}
+
+[sshd]
+enabled = {{ ssh_hardening_fail2ban_enabled | default('true') }}
+port = {{ ssh_hardening_port | default('22') }}
+filter = sshd
+logpath = {{ ssh_hardening_fail2ban_logpath | default('/var/log/auth.log') }}

The default log path `/var/log/auth.log` is Debian/Ubuntu-specific. Red Hat-based systems use `/var/log/secure`, and systems with systemd typically use the journal. With `backend = systemd`, the `logpath` setting may be ignored, but for consistency and compatibility with non-systemd backends, consider documenting this or making it distribution-aware.
```suggestion
{# Note: On systemd systems the journal may be used instead of this logpath, #}
{# but we keep a distro-aware default for non-systemd backends and clarity. #}
{% if ssh_hardening_fail2ban_logpath is defined %}
logpath = {{ ssh_hardening_fail2ban_logpath }}
{% else %}
{% if ansible_facts['os_family'] == 'RedHat' %}
logpath = /var/log/secure
{% else %}
logpath = /var/log/auth.log
{% endif %}
{% endif %}
```

> +        group: root
+
+    - name: "SSH Hardening | Deploy hardened sshd_config"
+      ansible.builtin.template:
+        src: "{{ ssh_hardening_server_template | default('sshd_config_hardened.j2') }}"
+        dest: /etc/ssh/sshd_config
+        mode: "0600"
+        owner: root
+        group: root
+        backup: true
+        validate: '/usr/sbin/sshd -t -f %s'
+      notify: restart sshd
+
+    - name: "SSH Hardening | Ensure SSH server is enabled"
+      ansible.builtin.systemd:
+        name: sshd

Using the systemd module with hardcoded service name 'sshd' will fail on distributions where the SSH service is named 'ssh' (like Ubuntu). This is the same issue as in the handlers file. Consider using a variable for the service name.
```suggestion
        name: "{{ ssh_service_name | default('sshd') }}"
```

> +# SSH Socket Unit Override
+# Managed by Ansible - Generated: {{ ansible_facts['date_time']['iso8601'] }}
+#
+# This file configures systemd socket activation for SSH
+# with connection rate limiting
+
+[Socket]
+# Listen on IPv4 and IPv6
+ListenStream={{ ssh_hardening_port | default('22') }}

The systemd socket configuration may conflict with systems that use socket activation versus traditional service activation for SSH. Not all systems use socket activation for SSH, and applying this configuration could cause issues. The documentation should clarify that this is only applied when `ssh_hardening_connection_limits` is enabled, and warn that it may not be compatible with all system configurations. Additionally, consider checking if socket activation is already in use before applying this override.

> +      ansible.builtin.lineinfile:
+        path: /etc/pam.d/sshd
+        regexp: "{{ item.regexp }}"
+        line: "{{ item.line }}"
+        state: present
+        backup: true
+      loop: "{{ ssh_hardening_pam_config | default([]) }}"
+      when: ssh_hardening_configure_pam | default(false)

The `ssh_hardening_pam_config` variable is used but never defined in the defaults. While it defaults to an empty list `[]` if undefined, the PAM configuration feature is incomplete without documented examples of what should be in this list. Consider adding example PAM configurations in the defaults file or documentation, or removing this feature if it's not fully implemented.
```suggestion
      # ssh_hardening_pam_config is expected to be a list of mappings with at least
      # the following keys:
      #   - regexp: Regular expression to match an existing PAM line in /etc/pam.d/sshd
      #   - line:   The full PAM configuration line that should be present
      #
      # Example:
      # ssh_hardening_pam_config:
      #   - regexp: '^auth\s+required\s+pam_faillock\.so'
      #     line: 'auth required pam_faillock.so preauth silent audit deny=3 unlock_time=600'
      #   - regexp: '^account\s+required\s+pam_faillock\.so'
      #     line: 'account required pam_faillock.so'
      ansible.builtin.lineinfile:
        path: /etc/pam.d/sshd
        regexp: "{{ item.regexp }}"
        line: "{{ item.line }}"
        state: present
        backup: true
      loop: "{{ ssh_hardening_pam_config }}"
      when:
        - ssh_hardening_configure_pam | default(false)
        - ssh_hardening_pam_config is defined
        - ssh_hardening_pam_config | length > 0
```

> +# Global Security Settings (applies to all hosts)
+# ==============================================================================
+
+Host *
+    # Cryptographic Algorithms - Modern and Secure Only
+    # Only use modern, secure key exchange algorithms
+    KexAlgorithms {{ ssh_hardening_kex_algorithms | default('curve25519-sha256,curve25519-sha256@libssh.org,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group-exchange-sha256') }}
+    
+    # Only use strong ciphers (AES-GCM preferred, ChaCha20 as alternative)
+    Ciphers {{ ssh_hardening_ciphers | default('chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr') }}
+    
+    # Only use strong MAC algorithms
+    MACs {{ ssh_hardening_macs | default('hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256') }}
+    
+    # Public key algorithms (prefer ed25519, then RSA-SHA2)
+    PubkeyAcceptedKeyTypes {{ ssh_hardening_pubkey_types | default('ssh-ed25519,ssh-ed25519-cert-v01@openssh.com,sk-ssh-ed25519@openssh.com,sk-ssh-ed25519-cert-v01@openssh.com,rsa-sha2-512,rsa-sha2-256,rsa-sha2-512-cert-v01@openssh.com,rsa-sha2-256-cert-v01@openssh.com') }}

The `PubkeyAcceptedKeyTypes` directive is deprecated as of OpenSSH 7.0 (released August 2015) and replaced with `PubkeyAcceptedAlgorithms`. While OpenSSH maintains backward compatibility, using the deprecated directive may generate warnings in newer versions. Consider using `PubkeyAcceptedAlgorithms` instead, or conditionally using the appropriate directive based on OpenSSH version.

> +  when: ssh_hardening_policies_enabled | default(false)
+  become: true
+  block:
+    - name: "SSH Hardening | Configure PAM for SSH"
+      ansible.builtin.lineinfile:
+        path: /etc/pam.d/sshd
+        regexp: "{{ item.regexp }}"
+        line: "{{ item.line }}"
+        state: present
+        backup: true
+      loop: "{{ ssh_hardening_pam_config | default([]) }}"
+      when: ssh_hardening_configure_pam | default(false)
+
+    - name: "SSH Hardening | Configure fail2ban for SSH"
+      ansible.builtin.template:
+        src: "{{ ssh_hardening_fail2ban_template | default('fail2ban_sshd.j2') }}"

The variable `ssh_hardening_fail2ban_template` is used in the tasks but not defined in the defaults file. For consistency with other template variables (`ssh_hardening_client_template` and `ssh_hardening_server_template`), this should be defined in defaults/main.yml.
```suggestion
        src: "fail2ban_sshd.j2"
```

> +
+  vars:

Duplicate `vars:` keys in the playbook. YAML doesn't allow duplicate keys at the same level. The second `vars:` block starting at line 19 should be removed or merged with the first one at line 16.
```suggestion

```

> +        line: "{{ item.line }}"
+        state: present
+        backup: true
+      loop: "{{ ssh_hardening_pam_config | default([]) }}"
+      when: ssh_hardening_configure_pam | default(false)
+
+    - name: "SSH Hardening | Configure fail2ban for SSH"
+      ansible.builtin.template:
+        src: "{{ ssh_hardening_fail2ban_template | default('fail2ban_sshd.j2') }}"
+        dest: /etc/fail2ban/jail.d/sshd.local
+        mode: "0644"
+        owner: root
+        group: root
+      when: 
+        - ssh_hardening_configure_fail2ban | default(false)
+        - ansible_facts['os_family'] == "Archlinux" or ansible_facts['os_family'] == "Debian"

The OS family check uses string comparison which may not match all distributions correctly. `ansible_facts['os_family']` for Arch Linux is typically "Arch" not "Archlinux". This condition will never be true for Arch Linux systems, preventing Fail2Ban configuration from being applied.
```suggestion
        - (ansible_facts['os_family'] | lower) in ['arch', 'archlinux', 'debian']
```

> +        src: /etc/ssh/sshd_config
+        dest: "/etc/ssh/sshd_config.backup.{{ ansible_facts['date_time']['epoch'] }}"
+        remote_src: true
+        mode: "0600"
+        owner: root
+        group: root
+
+    - name: "SSH Hardening | Deploy hardened sshd_config"
+      ansible.builtin.template:
+        src: "{{ ssh_hardening_server_template | default('sshd_config_hardened.j2') }}"
+        dest: /etc/ssh/sshd_config
+        mode: "0600"
+        owner: root
+        group: root
+        backup: true
+        validate: '/usr/sbin/sshd -t -f %s'

The hardcoded path `/usr/sbin/sshd` for the validate command may not work on all distributions. On some systems (like Arch Linux), sshd is located at `/usr/bin/sshd`. Consider using a variable for the sshd path or detecting it dynamically, or use just `sshd` without a path and rely on PATH resolution.
```suggestion
        validate: 'sshd -t -f %s'
```

> +    name: sshd
+    state: restarted
+  become: true
+  listen: restart sshd
+
+- name: reload sshd
+  ansible.builtin.systemd:
+    name: sshd

Handlers assume that the service is named 'sshd', but on some distributions (like Ubuntu), the SSH service may be named 'ssh' instead of 'sshd'. This will cause the handlers to fail on those systems. Consider using a variable for the service name or detecting it dynamically based on the distribution.
```suggestion
    name: "{{ ssh_service_name | default('sshd') }}"
    state: restarted
  become: true
  listen: restart sshd

- name: reload sshd
  ansible.builtin.systemd:
    name: "{{ ssh_service_name | default('sshd') }}"
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/pull/87#pullrequestreview-3612393110
You are receiving this because you were assigned.

Message ID: <SkogAI/skogansible/pull/87/review/3612393110@github.com>