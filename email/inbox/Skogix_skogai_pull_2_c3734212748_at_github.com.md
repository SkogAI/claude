MIME-Version: 1.0
From: "gitguardian[bot]" <notifications@github.com>
To: Skogix/skogai <skogai@noreply.github.com>
Date: Sun, 11 Jan 2026 00:06:35 -0800
Subject: Re: [Skogix/skogai] docs: Add cloud container environment documentation (PR #2)
Message-ID: <Skogix/skogai/pull/2/c3734212748@github.com>
In-Reply-To: <Skogix/skogai/pull/2@github.com>
References: <Skogix/skogai/pull/2@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69635a0b8aaad_10810d015150d0"; charset="UTF-8"

gitguardian[bot] left a comment (Skogix/skogai#2)

#### ⚠️ GitGuardian has uncovered 1 secret following the scan of your pull request.

Please consider investigating the findings and remediating the incidents. Failure to do so may lead to compromising the associated services or software components.



<details>
<summary>🔎 Detected hardcoded secret in your pull request</summary>
<br>

| GitGuardian id | GitGuardian status | Secret                         | Commit           | Filename        |                      |
| -------------- | ------------------ | ------------------------------ | ---------------- | --------------- | -------------------- |
| [20389172](https://dashboard.gitguardian.com/workspace/625234/incidents/20389172?occurrence=234503720) | Triggered | GitHub Personal Access Token | dde00b29f2df74970e80e16d51509b00e2d7bb19 | tmp/claude-container-environment.md | [View secret](https://github.com/Skogix/skogai/commit/dde00b29f2df74970e80e16d51509b00e2d7bb19#diff-c40a34409378a7d4e9504c05470a76d918aa86d5d2f16f539733056d4b07be0cR247) |



</details>

<details>
<summary>🛠 Guidelines to remediate hardcoded secrets</summary>
<br>

1. Understand the implications of revoking this secret by investigating where it is used in your code.
2. Replace and store your secret safely. [Learn here](https://blog.gitguardian.com/secrets-api-management?utm_source=product&amp;utm_medium=GitHub_checks&amp;utm_campaign=check_run_comment) the best practices.
3. Revoke and [rotate this secret](https://docs.gitguardian.com/secrets-detection/secrets-detection-engine/detectors/specifics/github_personal_access_token_v2#revoke-the-secret?utm_source=product&amp;utm_medium=GitHub_checks&amp;utm_campaign=check_run_comment).
4. If possible, [rewrite git history](https://blog.gitguardian.com/rewriting-git-history-cheatsheet?utm_source=product&amp;utm_medium=GitHub_checks&amp;utm_campaign=check_run_comment). Rewriting git history is not a trivial act. You might completely break other contributing developers' workflow and you risk accidentally deleting legitimate data.

To avoid such incidents in the future consider

-   following these [best practices](https://blog.gitguardian.com/secrets-api-management/?utm_source=product&amp;utm_medium=GitHub_checks&amp;utm_campaign=check_run_comment) for managing and storing secrets including API keys and other credentials
-   install [secret detection on pre-commit](https://docs.gitguardian.com/ggshield-docs/integrations/git-hooks/pre-commit?utm_source=product&amp;utm_medium=GitHub_checks&amp;utm_campaign=check_run_comment) to catch secret before it leaves your machine and ease remediation.


</details>

---

<sup>🦉 [GitGuardian](https://dashboard.gitguardian.com/auth/login/?utm_medium=checkruns&amp;utm_source=github&amp;utm_campaign=cr1) detects secrets in your source code to help developers and security teams secure the modern development process. You are seeing this because you or someone else with access to this repository has authorized GitGuardian to scan your pull request.<br/></sup>

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/skogai/pull/2#issuecomment-3734212748
You are receiving this because you modified the open/close state.

Message ID: <Skogix/skogai/pull/2/c3734212748@github.com>