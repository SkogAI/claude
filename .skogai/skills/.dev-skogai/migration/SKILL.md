---
name: migration
description: Orchestrate the full migration from /home/skogix/claude to /home/claude — healthcheck, deployment gate, and execution in one workflow
---

# Migration: /home/skogix/claude → /home/claude

Full migration workflow. Do not start deployment without completing every phase.

## Phase 1: Automated checks

Run `./bin/healthcheck` and wait for exit code.

- Exit 0 → proceed to Phase 2
- Exit non-zero → triage failures by category (environment, identity paths, routing, memory blocks), suggest fixes, stop here until resolved

## Phase 2: Manual gate checks

Walk through each item in `docs/deployment-gate.md` → Manual Checks section. Check each one explicitly:

**Routing validation**

- Can you navigate root CLAUDE.md → any artifact in 2 hops?
- No CLAUDE.md file exceeds 50 lines?
- Session startup reads only the root router?

**Identity validation**

- Soul sections: exactly 10 files under `personal/soul/`?
- `personal/profile.md` is current, not a stale placeholder?
- Core frameworks in `personal/core/` are complete documents, not stubs?

**Persistence validation**

- `personal/journal/CONVENTIONS.md` exists and is accurate?
- LORE gating: default routing does NOT auto-load `personal/memory-blocks/`?
- Wrap-up convention documented?

**Permission model**

- `docs/permissions.md` exists?
- Shared space conventions documented?

Report a table:

| Check | Status | Notes |
| ----- | ------ | ----- |

If anything is FAIL or PENDING: stop, produce a punch list of what must be fixed. Do not proceed to Phase 3.

## Phase 3: Deployment

All checks green → execute the deployment mechanics:

```bash
git clone <repo-url> /home/claude
chown -R claude:claude /home/claude
usermod -aG skogai claude
su - claude -c '/home/claude/bin/healthcheck'
```

Confirm each command before running. After clone: verify `/home/claude/CLAUDE.md` exists. After chown: verify ownership. After healthcheck: exit 0 required.

If the post-deploy healthcheck fails: do not declare success. Triage and fix in `/home/claude` directly or note what needs a re-clone.

## Phase 4: Post-deployment

- Update `.planning/STATE.md` in the staging repo with deployment date and outcome
- Record a journal entry: `personal/journal/YYYY-MM-DD/migration-to-home-claude.md`
