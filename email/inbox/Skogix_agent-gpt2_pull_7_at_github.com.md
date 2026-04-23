MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt2 <agent-gpt2@noreply.github.com>
Date: Wed, 29 Jan 2025 04:03:59 -0800
Subject: [Skogix/agent-gpt2] Bump cryptography from 41.0.5 to 44.0.0 in /platform (PR #7)
Message-ID: <Skogix/agent-gpt2/pull/7@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_679a192f9a0bc_7cd8815263f"; charset="UTF-8"

Bumps [cryptography](https://github.com/pyca/cryptography) from 41.0.5 to 44.0.0.
&lt;details&gt;
&lt;summary&gt;Changelog&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/pyca/cryptography/blob/main/CHANGELOG.rst&quot;&gt;cryptography&#39;s changelog&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;p&gt;44.0.0 - 2024-11-27&lt;/p&gt;
&lt;pre&gt;&lt;code&gt;
* **BACKWARDS INCOMPATIBLE:** Dropped support for LibreSSL &amp;lt; 3.9.
* Deprecated Python 3.7 support. Python 3.7 is no longer supported by the
  Python core team. Support for Python 3.7 will be removed in a future
  ``cryptography`` release.
* Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 3.4.0.
* macOS wheels are now built against the macOS 10.13 SDK. Users on older
  versions of macOS should upgrade, or they will need to build
  ``cryptography`` themselves.
* Enforce the :rfc:`5280` requirement that extended key usage extensions must
  not be empty.
* Added support for timestamp extraction to the
  :class:`~cryptography.fernet.MultiFernet` class.
* Relax the Authority Key Identifier requirements on root CA certificates
  during X.509 verification to allow fields permitted by :rfc:`5280` but
  forbidden by the CA/Browser BRs.
* Added support for :class:`~cryptography.hazmat.primitives.kdf.argon2.Argon2id`
  when using OpenSSL 3.2.0+.
* Added support for the :class:`~cryptography.x509.Admissions` certificate extension.
* Added basic support for PKCS7 decryption (including S/MIME 3.2) via
  :func:`~cryptography.hazmat.primitives.serialization.pkcs7.pkcs7_decrypt_der`,
  :func:`~cryptography.hazmat.primitives.serialization.pkcs7.pkcs7_decrypt_pem`, and
  :func:`~cryptography.hazmat.primitives.serialization.pkcs7.pkcs7_decrypt_smime`.
&lt;p&gt;.. _v43-0-3:&lt;/p&gt;
&lt;p&gt;43.0.3 - 2024-10-18&lt;br /&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;Fixed release metadata for &lt;code&gt;cryptography-vectors&lt;/code&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;.. _v43-0-2:&lt;/p&gt;
&lt;p&gt;43.0.2 - 2024-10-18&lt;/p&gt;
&lt;pre&gt;&lt;code&gt;
* Fixed compilation when using LibreSSL 4.0.0.
&lt;p&gt;.. _v43-0-1:&lt;/p&gt;
&lt;p&gt;43.0.1 - 2024-09-03&lt;br /&gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 3.3.2.&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;.. _v43-0-0:&lt;/p&gt;
&lt;p&gt;43.0.0 - 2024-07-20&lt;/p&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/f299a48153650f2dd87716343f2daa7cd39a1f59&quot;&gt;&lt;code&gt;f299a48&lt;/code&gt;&lt;/a&gt; remove deprecated call (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12052&quot;&gt;#12052&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/439eb0594a9ffb7c9adedb2490998d83914d141e&quot;&gt;&lt;code&gt;439eb05&lt;/code&gt;&lt;/a&gt; Bump version for 44.0.0 (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12051&quot;&gt;#12051&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/2c5ad4d8dcec1b8f833198bc2f3b4634c4fd9d78&quot;&gt;&lt;code&gt;2c5ad4d&lt;/code&gt;&lt;/a&gt; chore(deps): bump maturin from 1.7.4 to 1.7.5 in /.github/requirements (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12050&quot;&gt;#12050&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/d23968adddd79aa8508d7c1f985da09383b3808f&quot;&gt;&lt;code&gt;d23968a&lt;/code&gt;&lt;/a&gt; chore(deps): bump libc from 0.2.165 to 0.2.166 (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12049&quot;&gt;#12049&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/133c0e02edf2f172318eb27d8f50525ed64c9ec3&quot;&gt;&lt;code&gt;133c0e0&lt;/code&gt;&lt;/a&gt; Bump x509-limbo and/or wycheproof in CI (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12047&quot;&gt;#12047&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/f2259d7aa0d134c839ebe298baa8b63de9ead804&quot;&gt;&lt;code&gt;f2259d7&lt;/code&gt;&lt;/a&gt; Bump BoringSSL and/or OpenSSL in CI (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12046&quot;&gt;#12046&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/e201c870b89fd2606d67230a97e50c3badb07907&quot;&gt;&lt;code&gt;e201c87&lt;/code&gt;&lt;/a&gt; fixed metadata in changelog (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12044&quot;&gt;#12044&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/c6104cc3669585941dc1d2b9c6507621c53d242f&quot;&gt;&lt;code&gt;c6104cc&lt;/code&gt;&lt;/a&gt; Prohibit Python 3.9.0, 3.9.1 -- they have a bug that causes errors (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12045&quot;&gt;#12045&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/d6cac753c2fcf8e0ca52ee7038a7d729ad5d763a&quot;&gt;&lt;code&gt;d6cac75&lt;/code&gt;&lt;/a&gt; Add support for decrypting S/MIME messages (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/11555&quot;&gt;#11555&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/b8e5bfd4d7b35ba8d18b8052266e2cdae4963970&quot;&gt;&lt;code&gt;b8e5bfd&lt;/code&gt;&lt;/a&gt; chore(deps): bump libc from 0.2.164 to 0.2.165 (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12042&quot;&gt;#12042&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/pyca/cryptography/compare/41.0.5...44.0.0&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=cryptography&amp;package-manager=pip&amp;previous-version=41.0.5&amp;new-version=44.0.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

Dependabot will resolve any conflicts with this PR as long as you don&#39;t alter it yourself. You can also trigger a rebase manually by commenting `@dependabot rebase`.

[//]: # (dependabot-automerge-start)
[//]: # (dependabot-automerge-end)

---

&lt;details&gt;
&lt;summary&gt;Dependabot commands and options&lt;/summary&gt;
&lt;br /&gt;

You can trigger Dependabot actions by commenting on this PR:
- `@dependabot rebase` will rebase this PR
- `@dependabot recreate` will recreate this PR, overwriting any edits that have been made to it
- `@dependabot merge` will merge this PR after your CI passes on it
- `@dependabot squash and merge` will squash and merge this PR after your CI passes on it
- `@dependabot cancel merge` will cancel a previously requested merge and block automerging
- `@dependabot reopen` will reopen this PR if it is closed
- `@dependabot close` will close this PR and stop Dependabot recreating it. You can achieve the same result by closing it manually
- `@dependabot show &lt;dependency name&gt; ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)


&lt;/details&gt;
You can view, comment on, or merge this pull request online at:

  https://github.com/Skogix/agent-gpt2/pull/7

-- Commit Summary --

  * Bump cryptography from 41.0.5 to 44.0.0 in /platform

-- File Changes --

    M platform/poetry.lock (84)
    M platform/pyproject.toml (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt2/pull/7.patch
https://github.com/Skogix/agent-gpt2/pull/7.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt2/pull/7
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt2/pull/7@github.com&gt;
