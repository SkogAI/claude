MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt2 <agent-gpt2@noreply.github.com>
Date: Sun, 16 Feb 2025 21:06:41 -0800
Subject: [Skogix/agent-gpt2] Bump cryptography from 41.0.5 to 44.0.1 in /platform (PR #18)
Message-ID: <Skogix/agent-gpt2/pull/18@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_67b2c3e17c6_97d98818078"; charset="UTF-8"

Bumps [cryptography](https://github.com/pyca/cryptography) from 41.0.5 to 44.0.1.
&lt;details&gt;
&lt;summary&gt;Changelog&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/pyca/cryptography/blob/main/CHANGELOG.rst&quot;&gt;cryptography&#39;s changelog&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;p&gt;44.0.1 - 2025-02-11&lt;/p&gt;
&lt;pre&gt;&lt;code&gt;
* Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 3.4.1.
* We now build ``armv7l`` ``manylinux`` wheels and publish them to PyPI.
* We now build ``manylinux_2_34`` wheels and publish them to PyPI.
&lt;p&gt;.. _v44-0-0:&lt;/p&gt;
&lt;p&gt;44.0.0 - 2024-11-27
&lt;/code&gt;&lt;/pre&gt;&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;&lt;strong&gt;BACKWARDS INCOMPATIBLE:&lt;/strong&gt; Dropped support for LibreSSL &amp;lt; 3.9.&lt;/li&gt;
&lt;li&gt;Deprecated Python 3.7 support. Python 3.7 is no longer supported by the
Python core team. Support for Python 3.7 will be removed in a future
&lt;code&gt;cryptography&lt;/code&gt; release.&lt;/li&gt;
&lt;li&gt;Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 3.4.0.&lt;/li&gt;
&lt;li&gt;macOS wheels are now built against the macOS 10.13 SDK. Users on older
versions of macOS should upgrade, or they will need to build
&lt;code&gt;cryptography&lt;/code&gt; themselves.&lt;/li&gt;
&lt;li&gt;Enforce the :rfc:&lt;code&gt;5280&lt;/code&gt; requirement that extended key usage extensions must
not be empty.&lt;/li&gt;
&lt;li&gt;Added support for timestamp extraction to the
:class:&lt;code&gt;~cryptography.fernet.MultiFernet&lt;/code&gt; class.&lt;/li&gt;
&lt;li&gt;Relax the Authority Key Identifier requirements on root CA certificates
during X.509 verification to allow fields permitted by :rfc:&lt;code&gt;5280&lt;/code&gt; but
forbidden by the CA/Browser BRs.&lt;/li&gt;
&lt;li&gt;Added support for :class:&lt;code&gt;~cryptography.hazmat.primitives.kdf.argon2.Argon2id&lt;/code&gt;
when using OpenSSL 3.2.0+.&lt;/li&gt;
&lt;li&gt;Added support for the :class:&lt;code&gt;~cryptography.x509.Admissions&lt;/code&gt; certificate extension.&lt;/li&gt;
&lt;li&gt;Added basic support for PKCS7 decryption (including S/MIME 3.2) via
:func:&lt;code&gt;~cryptography.hazmat.primitives.serialization.pkcs7.pkcs7_decrypt_der&lt;/code&gt;,
:func:&lt;code&gt;~cryptography.hazmat.primitives.serialization.pkcs7.pkcs7_decrypt_pem&lt;/code&gt;, and
:func:&lt;code&gt;~cryptography.hazmat.primitives.serialization.pkcs7.pkcs7_decrypt_smime&lt;/code&gt;.&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;.. _v43-0-3:&lt;/p&gt;
&lt;p&gt;43.0.3 - 2024-10-18&lt;/p&gt;
&lt;pre&gt;&lt;code&gt;
* Fixed release metadata for ``cryptography-vectors``
&lt;p&gt;.. _v43-0-2:&lt;/p&gt;
&lt;p&gt;43.0.2 - 2024-10-18
&lt;/code&gt;&lt;/pre&gt;&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;Fixed compilation when using LibreSSL 4.0.0.&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;.. _v43-0-1:&lt;/p&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/adaaaed77db676bbaa9d171175db81dce056e2a7&quot;&gt;&lt;code&gt;adaaaed&lt;/code&gt;&lt;/a&gt; Bump for 44.0.1 release (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12441&quot;&gt;#12441&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/ccc61dabe38b86956bf218565cd4e82b918345a1&quot;&gt;&lt;code&gt;ccc61da&lt;/code&gt;&lt;/a&gt; [backport] test and build on armv7l (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12420&quot;&gt;#12420&lt;/a&gt;) (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12431&quot;&gt;#12431&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/f299a48153650f2dd87716343f2daa7cd39a1f59&quot;&gt;&lt;code&gt;f299a48&lt;/code&gt;&lt;/a&gt; remove deprecated call (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12052&quot;&gt;#12052&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/439eb0594a9ffb7c9adedb2490998d83914d141e&quot;&gt;&lt;code&gt;439eb05&lt;/code&gt;&lt;/a&gt; Bump version for 44.0.0 (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12051&quot;&gt;#12051&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/2c5ad4d8dcec1b8f833198bc2f3b4634c4fd9d78&quot;&gt;&lt;code&gt;2c5ad4d&lt;/code&gt;&lt;/a&gt; chore(deps): bump maturin from 1.7.4 to 1.7.5 in /.github/requirements (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12050&quot;&gt;#12050&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/d23968adddd79aa8508d7c1f985da09383b3808f&quot;&gt;&lt;code&gt;d23968a&lt;/code&gt;&lt;/a&gt; chore(deps): bump libc from 0.2.165 to 0.2.166 (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12049&quot;&gt;#12049&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/133c0e02edf2f172318eb27d8f50525ed64c9ec3&quot;&gt;&lt;code&gt;133c0e0&lt;/code&gt;&lt;/a&gt; Bump x509-limbo and/or wycheproof in CI (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12047&quot;&gt;#12047&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/f2259d7aa0d134c839ebe298baa8b63de9ead804&quot;&gt;&lt;code&gt;f2259d7&lt;/code&gt;&lt;/a&gt; Bump BoringSSL and/or OpenSSL in CI (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12046&quot;&gt;#12046&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/e201c870b89fd2606d67230a97e50c3badb07907&quot;&gt;&lt;code&gt;e201c87&lt;/code&gt;&lt;/a&gt; fixed metadata in changelog (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12044&quot;&gt;#12044&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pyca/cryptography/commit/c6104cc3669585941dc1d2b9c6507621c53d242f&quot;&gt;&lt;code&gt;c6104cc&lt;/code&gt;&lt;/a&gt; Prohibit Python 3.9.0, 3.9.1 -- they have a bug that causes errors (&lt;a href=&quot;https://redirect.github.com/pyca/cryptography/issues/12045&quot;&gt;#12045&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/pyca/cryptography/compare/41.0.5...44.0.1&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=cryptography&amp;package-manager=pip&amp;previous-version=41.0.5&amp;new-version=44.0.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt2/pull/18

-- Commit Summary --

  * Bump cryptography from 41.0.5 to 44.0.1 in /platform

-- File Changes --

    M platform/poetry.lock (88)
    M platform/pyproject.toml (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt2/pull/18.patch
https://github.com/Skogix/agent-gpt2/pull/18.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt2/pull/18
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt2/pull/18@github.com&gt;
