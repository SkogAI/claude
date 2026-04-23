MIME-Version: 1.0
From: "github-actions[bot]" <notifications@github.com>
To: SkogAI/skogansible <skogansible@noreply.github.com>
Date: Thu, 02 Oct 2025 03:49:13 -0700
Subject: Re: [SkogAI/skogansible] testing  (Issue #4)
Message-ID: <SkogAI/skogansible/issues/4/3360480389@github.com>
In-Reply-To: <SkogAI/skogansible/issues/4@github.com>
References: <SkogAI/skogansible/issues/4@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68de58a9763ca_f010d86198"; charset="UTF-8"

github-actions[bot] left a comment (SkogAI/skogansible#4)

**Claude finished @Skogix's task** —— [View job](https://github.com/SkogAI/skogansible/actions/runs/18190789940)

---
### How to Test Ansible Code

There are several approaches to testing Ansible code, ranging from basic syntax checks to full integration testing. Here's a comprehensive guide tailored to your repository:

---

### 1. **Syntax Checking** (Fastest)

```bash
# Check playbook syntax
ansible-playbook playbooks/all.yml --syntax-check

# Check specific role
ansible-playbook playbooks/all.yml --syntax-check --tags role_name
```

---

### 2. **Check Mode (Dry Run)**

Run playbooks without making actual changes:

```bash
# Your existing run.sh could be modified to support check mode
ansible-playbook playbooks/all.yml --check --diff
```

The `--diff` flag shows what would change (you already have `always = yes` in ansible.cfg:1, so diff is enabled by default).

---

### 3. **ansible-lint** (Recommended)

Lints your playbooks and roles for best practices:

```bash
# Install
pip install ansible-lint

# Lint entire repository
ansible-lint

# Lint specific playbook
ansible-lint playbooks/all.yml

# Lint specific role
ansible-lint roles/01_host_info/
```

Common checks:
- YAML syntax
- Deprecated modules
- Security issues
- Best practice violations
- Naming conventions

---

### 4. **Molecule** (Role Testing Framework)

For testing individual roles in isolation. Particularly useful for your roles like `02_package_managers` and `01_host_info`:

```bash
# Install
pip install molecule molecule-plugins[docker]

# Initialize molecule for a role
cd roles/01_host_info
molecule init scenario

# Run tests
molecule test
```

Molecule workflow:
1. Creates test instances (Docker, Vagrant, etc.)
2. Runs your role
3. Runs verification tests (using testinfra or ansible)
4. Destroys test instances

Example molecule test for `roles/01_host_info/tasks/main.yml:8` (the assert task):
```yaml
# molecule/default/verify.yml
- name: Verify
  hosts: all
  tasks:
    - name: Check facts file was created
      ansible.builtin.stat:
        path: /path/to/ansible_facts.yml
      register: facts_file
      
    - name: Assert facts file exists
      ansible.builtin.assert:
        that: facts_file.stat.exists
```

---

### 5. **Testing Specific to Your Repository**

Based on your setup, here are practical testing approaches:

#### **Test the entire playbook safely:**
```bash
# Check mode first
bash run.sh --check

# Then run with tags to test incrementally
ansible-playbook playbooks/all.yml --tags host_info
ansible-playbook playbooks/all.yml --tags package_managers
```

#### **Test vault configuration:**
```bash
# Verify vault password file exists
test -f ~/.ssh/ansible-vault-password && echo "Vault password OK"

# Test decrypting the become password
ansible-vault view ~/.ssh/ansible-become-password
```

#### **Test sudo configuration:**
Your `roles/01_host_info/tasks/main.yml:17-25` already does this! It checks:
- If `ANSIBLE_BECOME_PASSWORD_FILE` exists
- If the file is readable
- Sets `sudo_configured` fact accordingly

---

### 6. **CI/CD Testing**

Since you're on GitHub, you could add a workflow:

```yaml
# .github/workflows/ansible-test.yml
name: Ansible Tests
on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Install dependencies
        run: |
          pip install ansible ansible-lint
          ansible-galaxy collection install -r requirements.yml
      
      - name: Syntax check
        run: ansible-playbook playbooks/all.yml --syntax-check
      
      - name: Lint
        run: ansible-lint
```

---

### 7. **Manual Testing Checklist**

For your specific roles:

- **01_host_info**: Check that `ansible_facts.yml` is created, distribution assert works
- **02_package_managers**: Verify `aur_builder` user exists, packages install correctly
- **03_dotfiles**: Ensure dotfiles are symlinked properly
- **04_shell_config**: Verify shell configuration is applied
- **05_systemd_services**: Check services are enabled and running
- **06_ai_tools**: Verify AI tools are installed and configured
- **07_development**: Confirm development tools are set up

---

### Recommended Testing Strategy for This Repository:

1. **Before committing**: `ansible-lint` + `--syntax-check`
2. **Before running**: `--check --diff` to preview changes
3. **For role development**: Use Molecule
4. **For production**: Run with tags incrementally, check logs in `logs/`

---

### Quick Start:

```bash
# Install testing tools
pip install ansible-lint yamllint

# Create a simple test script
cat > test.sh << 'EOF'
#!/bin/bash
set -e
echo "Running syntax check..."
ansible-playbook playbooks/all.yml --syntax-check

echo "Running ansible-lint..."
ansible-lint

echo "Running check mode..."
ansible-playbook playbooks/all.yml --check --diff
EOF

chmod +x test.sh
./test.sh
```

This gives you a solid foundation for testing your Ansible configuration!

---

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/skogansible/issues/4#issuecomment-3360480389
You are receiving this because you were mentioned.

Message ID: <SkogAI/skogansible/issues/4/3360480389@github.com>