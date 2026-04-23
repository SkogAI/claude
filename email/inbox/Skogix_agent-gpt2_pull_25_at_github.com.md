MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt2 <agent-gpt2@noreply.github.com>
Date: Sun, 02 Mar 2025 21:24:27 -0800
Subject: [Skogix/agent-gpt2] Bump grpcio from 1.59.2 to 1.68.1 in /platform (PR #25)
Message-ID: <Skogix/agent-gpt2/pull/25@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_67c53d0b25e20_64de05153d1"; charset="UTF-8"

Bumps [grpcio](https://github.com/grpc/grpc) from 1.59.2 to 1.68.1.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/grpc/grpc/releases&quot;&gt;grpcio&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;Release v1.68.1&lt;/h2&gt;
&lt;p&gt;This is release 1.68.1 (&lt;a href=&quot;https://github.com/grpc/grpc/blob/master/doc/g_stands_for.md&quot;&gt;groovy&lt;/a&gt;) of gRPC Core.&lt;/p&gt;
&lt;p&gt;For gRPC documentation, see &lt;a href=&quot;https://grpc.io/&quot;&gt;grpc.io&lt;/a&gt;. For previous releases, see &lt;a href=&quot;https://github.com/grpc/grpc/releases&quot;&gt;Releases&lt;/a&gt;.&lt;/p&gt;
&lt;p&gt;This release contains refinements, improvements, and bug fixes, with highlights listed below.&lt;/p&gt;
&lt;h2&gt;Core&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;[xDS RBAC] Support string_match in HeaderMatcher (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/38185&quot;&gt;#38185&lt;/a&gt;). (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/38198&quot;&gt;#38198&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;Release v1.68.0&lt;/h2&gt;
&lt;p&gt;This is release 1.68.0 (&lt;a href=&quot;https://github.com/grpc/grpc/blob/master/doc/g_stands_for.md&quot;&gt;groovy&lt;/a&gt;) of gRPC Core.&lt;/p&gt;
&lt;p&gt;For gRPC documentation, see &lt;a href=&quot;https://grpc.io/&quot;&gt;grpc.io&lt;/a&gt;. For previous releases, see &lt;a href=&quot;https://github.com/grpc/grpc/releases&quot;&gt;Releases&lt;/a&gt;.&lt;/p&gt;
&lt;p&gt;This release contains refinements, improvements, and bug fixes, with highlights listed below.&lt;/p&gt;
&lt;h2&gt;Core&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;[XdsClient][Backport] Add missing authority to XdsClient metrics scope (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/38009&quot;&gt;#38009&lt;/a&gt;). (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/38023&quot;&gt;#38023&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;[Release] Bump core version in preparation for 1.68 Branch Cut. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/37941&quot;&gt;#37941&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;[ConfigFetcher] Set HTTP2 error to NO_ERROR to do graceful GOAWAYs. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/37939&quot;&gt;#37939&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;[ruby] reduce INFO log for server CQ pluck registration to DEBUG. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/37633&quot;&gt;#37633&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;[EventEngine] Enable the PosixEventEngine client experiment. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/35985&quot;&gt;#35985&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;[chttp2_server] Fix race between connection starting and it being orphaned. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/37683&quot;&gt;#37683&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;[Chttp2Server] Fix race between connection manager updates and handshake. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/37772&quot;&gt;#37772&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;[xds] Fix XdsClient race between ResourceDoesNotExist timer and receiving resources. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/37678&quot;&gt;#37678&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;C++&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;[Build] Minimum version of MSVC is now 2022. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/37687&quot;&gt;#37687&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;[Build] Bumped the minimum version of cmake. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/37702&quot;&gt;#37702&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;Python&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Add templating and support for Python 3.13. (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/pull/37643&quot;&gt;#37643&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;Release v1.68.0-pre1&lt;/h2&gt;
&lt;p&gt;This is a prerelease of gRPC Core 1.68.0 (groovy).&lt;/p&gt;
&lt;p&gt;For gRPC documentation, see &lt;a href=&quot;https://grpc.io/&quot;&gt;grpc.io&lt;/a&gt;. For previous releases, see &lt;a href=&quot;https://github.com/grpc/grpc/releases&quot;&gt;Releases&lt;/a&gt;.&lt;/p&gt;
&lt;p&gt;This prerelease contains refinements, improvements, and bug fixes.&lt;/p&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/grpc/grpc/commit/796e87f16136533977b8647b50a020519fd7a137&quot;&gt;&lt;code&gt;796e87f&lt;/code&gt;&lt;/a&gt; [Release] Bump version to 1.68.1 (on v1.68.x branch) (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/38202&quot;&gt;#38202&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/grpc/grpc/commit/ef921bf8cfe9847edd08465875dd9e4662a69e49&quot;&gt;&lt;code&gt;ef921bf&lt;/code&gt;&lt;/a&gt; [Release] Bump Core patch version in preparation for patch release (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/38201&quot;&gt;#38201&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/grpc/grpc/commit/2027e7bdab7d51e1ddfcc6240c8dac6d6eba82c5&quot;&gt;&lt;code&gt;2027e7b&lt;/code&gt;&lt;/a&gt; [xDS RBAC] Support string_match in HeaderMatcher (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/38185&quot;&gt;#38185&lt;/a&gt;) (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/38198&quot;&gt;#38198&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/grpc/grpc/commit/7e442a0f8233500c97ac8f7c8a362191b4165db5&quot;&gt;&lt;code&gt;7e442a0&lt;/code&gt;&lt;/a&gt; [CSM Observability] Add option to use Xds server (v1.68.x backport) (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/38199&quot;&gt;#38199&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/grpc/grpc/commit/e2b67e1425293d729a20937082a214563b742bef&quot;&gt;&lt;code&gt;e2b67e1&lt;/code&gt;&lt;/a&gt; [CSM] Use xds-enabled server and xds credentials in examples (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/38192&quot;&gt;#38192&lt;/a&gt;) (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/38195&quot;&gt;#38195&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/grpc/grpc/commit/6b49ae626bc9cd7033e062f89dbe0e0576b1110e&quot;&gt;&lt;code&gt;6b49ae6&lt;/code&gt;&lt;/a&gt; [Release] Bump v.1.68.x to 1.68.0 (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/38124&quot;&gt;#38124&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/grpc/grpc/commit/2bcf835e1f91001107321ef2c2545e6f23c602c2&quot;&gt;&lt;code&gt;2bcf835&lt;/code&gt;&lt;/a&gt; [Backport][chttp2] Fix channelz address (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/38022&quot;&gt;#38022&lt;/a&gt;) (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/38027&quot;&gt;#38027&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/grpc/grpc/commit/5801d12f806cf8b25e08e92784a94243a73093ee&quot;&gt;&lt;code&gt;5801d12&lt;/code&gt;&lt;/a&gt; [XdsClient][Backport] Add missing authority to XdsClient metrics scope (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/3800&quot;&gt;#3800&lt;/a&gt;...&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/grpc/grpc/commit/62e547b3c586b31ffe35e19e2538b0efff904105&quot;&gt;&lt;code&gt;62e547b&lt;/code&gt;&lt;/a&gt; Bump v1.68.x version to v1.68.0-pre1 (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/38001&quot;&gt;#38001&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/grpc/grpc/commit/1178b2d229ad7fd27df743176dbc2ea104d6b28e&quot;&gt;&lt;code&gt;1178b2d&lt;/code&gt;&lt;/a&gt; [retry e2e test] add log message about known flakiness (&lt;a href=&quot;https://redirect.github.com/grpc/grpc/issues/37974&quot;&gt;#37974&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/grpc/grpc/compare/v1.59.2...v1.68.1&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=grpcio&amp;package-manager=pip&amp;previous-version=1.59.2&amp;new-version=1.68.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt2/pull/25

-- Commit Summary --

  * Bump grpcio from 1.59.2 to 1.68.1 in /platform

-- File Changes --

    M platform/poetry.lock (125)
    M platform/pyproject.toml (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt2/pull/25.patch
https://github.com/Skogix/agent-gpt2/pull/25.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt2/pull/25
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt2/pull/25@github.com&gt;
