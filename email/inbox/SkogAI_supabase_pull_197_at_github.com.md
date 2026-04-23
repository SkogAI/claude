MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/supabase <supabase@noreply.github.com>
Date: Wed, 29 Oct 2025 02:23:07 -0700
Subject: [SkogAI/supabase] [WIP] Enable auth service and implement SAML SSO (PR #197)
Message-ID: <SkogAI/supabase/pull/197@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6901dcfb29bcb_213c711007412"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;Enable Auth Service and Implement SAML SSO&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;## Goal
&gt; 
&gt; Get SAML Single Sign-On working with ZITADEL as quickly as possible.
&gt; 
&gt; **Current Status:** Phase 0 (PostgreSQL only) → Need Phase 3 (Auth enabled) for SAML  
&gt; **Blocker:** Auth/GoTrue service not yet enabled
&gt; 
&gt; ---
&gt; 
&gt; ## Quick Setup Path
&gt; 
&gt; ### Phase 1: Enable Auth Service (Prerequisite)
&gt; 
&gt; **STATUS.md shows we&#39;re in Phase 0.** Need to enable:
&gt; 1. Studio (Phase 1)
&gt; 2. API/PostgREST (Phase 2)  
&gt; 3. **Auth/GoTrue (Phase 3) ← Required for SAML**
&gt; 
&gt; **Action:** Update project to enable Auth service in Docker Compose
&gt; 
&gt; ```bash
&gt; # Check current status
&gt; cat STATUS.md
&gt; 
&gt; # Enable auth in config
&gt; # Location: supabase/config.toml
&gt; ```
&gt; 
&gt; ### Phase 2: Generate SAML Certificate
&gt; 
&gt; ```bash
&gt; # Run the ready-made script
&gt; cd /home/skogix/dev/supabase
&gt; ./scripts/generate-saml-key.sh
&gt; 
&gt; # This creates:
&gt; # - /secure/saml/certs/saml_sp_private.key
&gt; # - /secure/saml/certs/saml_sp_cert.pem
&gt; # - Base64-encoded key for .env
&gt; ```
&gt; 
&gt; ### Phase 3: Configure Environment
&gt; 
&gt; Add to `.env`:
&gt; 
&gt; ```bash
&gt; GOTRUE_SAML_ENABLED=true
&gt; GOTRUE_SAML_PRIVATE_KEY=&lt;output-from-script&gt;
&gt; GOTRUE_SITE_URL=http://localhost:8000  # or your domain
&gt; ```
&gt; 
&gt; **Fix Security Issue:** Move hardcoded key from `docker/docker-compose.override.yml` to `.env`
&gt; 
&gt; ### Phase 4: Configure ZITADEL IdP
&gt; 
&gt; 1. Create SAML application in ZITADEL
&gt; 2. Set Entity ID: `http://localhost:8000/auth/v1/sso/saml/metadata`
&gt; 3. Set ACS URL: `http://localhost:8000/auth/v1/sso/saml/acs`
&gt; 4. Map attributes: `Email`, `FullName`, `FirstName`, `SurName`
&gt; 5. Get metadata URL
&gt; 
&gt; ### Phase 5: Register Provider
&gt; 
&gt; ```bash
&gt; # Use the automated setup script
&gt; ./scripts/saml-setup.sh \
&gt;   -d yourdomain.com \
&gt;   -m https://your-zitadel-instance/saml/v2/metadata
&gt; ```
&gt; 
&gt; ### Phase 6: Test It
&gt; 
&gt; ```bash
&gt; # Run test suite
&gt; ./scripts/test_saml.sh --user-email test@yourdomain.com
&gt; 
&gt; # Or test manually
&gt; curl http://localhost:8000/auth/v1/sso/saml/metadata
&gt; ```
&gt; 
&gt; ---
&gt; 
&gt; ## Acceptance Criteria
&gt; 
&gt; - [ ] Auth service enabled and running
&gt; - [ ] SAML certificates generated and configured
&gt; - [ ] ZITADEL IdP configured with correct endpoints
&gt; - [ ] SAML provider registered in Supabase
&gt; - [ ] Test authentication flow completes successfully
&gt; - [ ] User created in database after SAML login
&gt; 
&gt; ---
&gt; 
&gt; ## Files &amp; Scripts (Already Exist!)
&gt; 
&gt; **Scripts ready to use:**
&gt; - `scripts/generate-saml-key.sh` - Generate certificates
&gt; - `scripts/saml-setup.sh` - Automated SAML setup
&gt; - `scripts/test_saml.sh` - Test suite
&gt; 
&gt; **Documentation:**
&gt; - `skogai/guides/saml/SAML Implementation Summary.md`
&gt; - `skogai/guides/saml/ZITADEL SAML Integration Guide.md`
&gt; 
&gt; **Config:**
&gt; - `.env.example:149-192` - SAML environment variables template
&gt; - `CONFIG.md:221-223` - SAML configuration reference
&gt; 
&gt; ---
&gt; 
&gt; ## Known Issues to Fix
&gt; 
&gt; 1. **Hardcoded private key in docker-compose.override.yml** - Move to .env
&gt; 2. **Missing main config.toml** - Create or locate primary Supabase config
&gt; 3. **Auth service not enabled** - Primary blocker
&gt; 
&gt; ---
&gt; 
&gt; ## Quick Troubleshooting
&gt; 
&gt; **404 on SAML endpoints?**
&gt; → Auth service not enabled or Kong routes not configured
&gt; 
&gt; **Invalid signature error?**
&gt; → Certificate mismatch between ZITADEL and Supabase
&gt; 
&gt; **User not created?**
&gt; → Check attribute mapping in provider registration
&gt; 
&gt; **500 error on ACS endpoint?**
&gt; → Private key not loaded correctly in GOTRUE_SAML_PRIVATE_KEY
&gt; 
&gt; ---
&gt; 
&gt; ## References
&gt; 
&gt; - SAML Guide: `/home/skogix/dev/supabase/skogai/guides/saml/ZITADEL SAML Integration Guide.md`
&gt; - Supabase SAML Docs: https://supabase.com/docs/guides/auth/enterprise-sso/auth-sso-saml
&gt; - ZITADEL SAML: https://zitadel.com/docs/guides/integrate/login/saml
&gt; 
&gt; ---
&gt; 
&gt; **Estimated Time:** 2-3 hours (including Auth enablement)&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/supabase#195

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

💬 We&#39;d love your input! Share your thoughts on Copilot coding agent in our [2 minute survey](https://gh.io/copilot-coding-agent-survey).

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/supabase/pull/197

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/supabase/pull/197.patch
https://github.com/SkogAI/supabase/pull/197.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/supabase/pull/197
You are receiving this because you were assigned.

Message ID: &lt;SkogAI/supabase/pull/197@github.com&gt;
