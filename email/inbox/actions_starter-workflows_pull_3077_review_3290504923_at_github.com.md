MIME-Version: 1.0
From: Zach Steindler <notifications@github.com>
To: actions/starter-workflows <starter-workflows@noreply.github.com>
Date: Wed, 01 Oct 2025 11:36:11 -0700
Subject: Re: [actions/starter-workflows] Remove SLSA generators which are not being actively maintained (PR #3077)
Message-ID: <actions/starter-workflows/pull/3077/review/3290504923@github.com>
In-Reply-To: <actions/starter-workflows/pull/3077@github.com>
References: <actions/starter-workflows/pull/3077@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68dd749b4b48a_10510d8156038"; charset="UTF-8"

@steiza commented on this pull request.



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

This is consistent with how we reference other GitHub-managed action workflows, like `actions/checkout@v4`.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/actions/starter-workflows/pull/3077#discussion_r2395494494
You are receiving this because you are subscribed to this thread.

Message ID: <actions/starter-workflows/pull/3077/review/3290504923@github.com>