MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: actions/starter-workflows <starter-workflows@noreply.github.com>
Date: Wed, 01 Oct 2025 11:00:18 -0700
Subject: Re: [actions/starter-workflows] Remove SLSA generators which are not being actively maintained (PR #3077)
Message-ID: <actions/starter-workflows/pull/3077/review/3290368299@github.com>
In-Reply-To: <actions/starter-workflows/pull/3077@github.com>
References: <actions/starter-workflows/pull/3077@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68dd6c32d08b7_485b10d8217019"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR removes SLSA (Supply chain Levels for Software Artifacts) generators that are not actively maintained and updates the Docker publish workflow to use GitHub's new artifact attestations feature.

- Removes Go and Generic SLSA3 publish workflows and their associated properties files
- Updates Docker publish workflow to use GitHub artifact attestations instead of Cosign signing
- Updates action versions to more recent releases in the Docker workflow

### Reviewed Changes

Copilot reviewed 5 out of 7 changed files in this pull request and generated 1 comment.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| ci/properties/go-ossf-slsa3-publish.properties.json | Removes properties file for Go SLSA3 generator |
| ci/properties/generator-generic-ossf-slsa3-publish.properties.json | Removes properties file for Generic SLSA3 generator |
| ci/go-ossf-slsa3-publish.yml | Removes Go SLSA3 workflow entirely |
| ci/generator-generic-ossf-slsa3-publish.yml | Removes Generic SLSA3 workflow entirely |
| ci/docker-publish.yml | Updates to use GitHub artifact attestations and newer action versions |
</details>






---

<sub>**Tip:** Customize your code reviews with copilot-instructions.md. <a href="/actions/starter-workflows/new/main/.github?filename=copilot-instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Create the file</a> or <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">learn how to get started</a>.</sub>

> -      # Sign the resulting Docker image digest except on PRs.
-      # This will only write to the public Rekor transparency log when the Docker
-      # repository is public to avoid leaking data.  If you would like to publish
-      # transparency data even for private images, pass --force to cosign below.
-      # https://github.com/sigstore/cosign
-      - name: Sign the published Docker image
-        if: ${{ github.event_name != 'pull_request' }}
-        env:
-          # https://docs.github.com/en/actions/security-guides/security-hardening-for-github-actions#using-an-intermediate-environment-variable
-          TAGS: ${{ steps.meta.outputs.tags }}
-          DIGEST: ${{ steps.build-and-push.outputs.digest }}
-        # This step uses the identity token to provision an ephemeral certificate
-        # against the sigstore community Fulcio instance.
-        run: echo "${TAGS}" | xargs -I {} cosign sign --yes {}@${DIGEST}
+      - name: Generate artifact attestation
+        uses: actions/attest-build-provenance@v2

The action reference uses a tag (@v2) instead of a full commit hash. According to the workflow guidelines in the PR description, third-party actions should be referenced using the full 40 character hash of the action's commit for security purposes.
```suggestion
        uses: actions/attest-build-provenance@e3e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2 # v2.0.0
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/actions/starter-workflows/pull/3077#pullrequestreview-3290368299
You are receiving this because you are subscribed to this thread.

Message ID: <actions/starter-workflows/pull/3077/review/3290368299@github.com>