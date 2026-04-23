MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt2 <agent-gpt2@noreply.github.com>
Date: Sun, 02 Mar 2025 21:10:26 -0800
Subject: [Skogix/agent-gpt2] Bump cryptography from 41.0.5 to 44.0.2 in /platform (PR #24)
Message-ID: <Skogix/agent-gpt2/pull/24@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_67c539c2c821_adde04767f"; charset="UTF-8"

Bumps [cryptography](https://github.com/pyca/cryptography) from 41.0.5 to 44.0.2.
&lt;details&gt;
&lt;summary&gt;Changelog&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/pyca/cryptography/blob/main/CHANGELOG.rst&quot;&gt;cryptography&#39;s changelog&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;p&gt;44.0.2 - 2025-03-01&lt;/p&gt;
&lt;pre&gt;&lt;code&gt;
* We now build wheels for PyPy 3.11.
&lt;p&gt;.. _v44-0-1:&lt;/p&gt;
&lt;p&gt;44.0.1 - 2025-02-11
&lt;/code&gt;&lt;/pre&gt;&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 3.4.1.&lt;/li&gt;
&lt;li&gt;We now build &lt;code&gt;armv7l&lt;/code&gt; &lt;code&gt;manylinux&lt;/code&gt; wheels and publish them to PyPI.&lt;/li&gt;
&lt;li&gt;We now build &lt;code&gt;manylinux_2_34&lt;/code&gt; wheels and publish them to PyPI.&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;.. _v44-0-0:&lt;/p&gt;
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
&lt;p&gt;43.0.3 - 2024-10-18
&lt;/code&gt;&lt;/pre&gt;&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;Fixed release metadata for &lt;code&gt;cryptography-vectors&lt;/code&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;.. _v43-0-2:&lt;/p&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/56cfce682c8bd2ee5101b654a429b05d0f610f0e&quot;&gt;&lt;code&gt;56cfce6&lt;/code&gt;&lt;/a&gt; 44.0.2 release (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12537&quot;&gt;#12537&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/7b4cc268cb5d95180ab5cfa32d55f6045bb2dcf0&quot;&gt;&lt;code&gt;7b4cc26&lt;/code&gt;&lt;/a&gt; Backport PyPy3.11 support (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12536&quot;&gt;#12536&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/adaaaed77db676bbaa9d171175db81dce056e2a7&quot;&gt;&lt;code&gt;adaaaed&lt;/code&gt;&lt;/a&gt; Bump for 44.0.1 release (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12441&quot;&gt;#12441&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/ccc61dabe38b86956bf218565cd4e82b918345a1&quot;&gt;&lt;code&gt;ccc61da&lt;/code&gt;&lt;/a&gt; [backport] test and build on armv7l (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12420&quot;&gt;#12420&lt;/a&gt;) (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12431&quot;&gt;#12431&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/f299a48153650f2dd87716343f2daa7cd39a1f59&quot;&gt;&lt;code&gt;f299a48&lt;/code&gt;&lt;/a&gt; remove deprecated call (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12052&quot;&gt;#12052&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/439eb0594a9ffb7c9adedb2490998d83914d141e&quot;&gt;&lt;code&gt;439eb05&lt;/code&gt;&lt;/a&gt; Bump version for 44.0.0 (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12051&quot;&gt;#12051&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/2c5ad4d8dcec1b8f833198bc2f3b4634c4fd9d78&quot;&gt;&lt;code&gt;2c5ad4d&lt;/code&gt;&lt;/a&gt; chore(deps): bump maturin from 1.7.4 to 1.7.5 in /.github/requirements (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12050&quot;&gt;#12050&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/d23968adddd79aa8508d7c1f985da09383b3808f&quot;&gt;&lt;code&gt;d23968a&lt;/code&gt;&lt;/a&gt; chore(deps): bump libc from 0.2.165 to 0.2.166 (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12049&quot;&gt;#12049&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/133c0e02edf2f172318eb27d8f50525ed64c9ec3&quot;&gt;&lt;code&gt;133c0e0&lt;/code&gt;&lt;/a&gt; Bump x509-limbo and/or wycheproof in CI (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12047&quot;&gt;#12047&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/f2259d7aa0d134c839ebe298baa8b63de9ead804&quot;&gt;&lt;code&gt;f2259d7&lt;/code&gt;&lt;/a&gt; Bump BoringSSL and/or OpenSSL in CI (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12046&quot;&gt;#12046&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/pyca/cryptography/compare/41.0.5...44.0.2&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=cryptography&amp;package-manager=pip&amp;previous-version=41.0.5&amp;new-version=44.0.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt2/pull/24

-- Commit Summary --

  * Bump cryptography from 41.0.5 to 44.0.2 in /platform

-- File Changes --

    M platform/poetry.lock (92)
    M platform/pyproject.toml (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt2/pull/24.patch
https://github.com/Skogix/agent-gpt2/pull/24.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt2/pull/24
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt2/pull/24@github.com&gt;
