MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt <agent-gpt@noreply.github.com>
Date: Sun, 23 Feb 2025 23:47:42 -0800
Subject: [Skogix/agent-gpt] Bump pinecone-client from 2.2.4 to 6.0.0 in /platform (PR #20)
Message-ID: <Skogix/agent-gpt/pull/20@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_67bc241e2f91c_bbda8342026"; charset="UTF-8"

Bumps [pinecone-client](https://github.com/pinecone-io/pinecone-python-client) from 2.2.4 to 6.0.0.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/pinecone-io/pinecone-python-client/releases&quot;&gt;pinecone-client&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;Release v6.0.0&lt;/h2&gt;
&lt;h1&gt;What&#39;s new in this release?&lt;/h1&gt;
&lt;h2&gt;Indexes with Integrated Inference&lt;/h2&gt;
&lt;p&gt;This release adds a new &lt;code&gt;create_index_for_model&lt;/code&gt; method as well as &lt;code&gt;upsert_records&lt;/code&gt;, and &lt;code&gt;search&lt;/code&gt; methods. Together these methods provide a way for you to easily store your data and let us manage the process of creating embeddings. To learn about available models, see the &lt;a href=&quot;https://docs.pinecone.io/models/overview&quot;&gt;Model Gallery&lt;/a&gt;.&lt;/p&gt;
&lt;p&gt;Note: If you were previously using the preview versions of this functionality via the &lt;code&gt;pinecone-plugin-records&lt;/code&gt; package, you will need to uninstall that package in order to use the v6 &lt;code&gt;pinecone&lt;/code&gt; release.&lt;/p&gt;
&lt;pre lang=&quot;python&quot;&gt;&lt;code&gt;from pinecone import (
    Pinecone,
    CloudProvider,
    AwsRegion,
    EmbedModel,
)
&lt;h1&gt;1. Instantiate the Pinecone client&lt;/h1&gt;
&lt;p&gt;pc = Pinecone(api_key=&amp;quot;&amp;lt;&amp;lt;PINECONE_API_KEY&amp;gt;&amp;gt;&amp;quot;)&lt;/p&gt;
&lt;h1&gt;2. Create an index configured for use with a particular model&lt;/h1&gt;
&lt;p&gt;index_config = pc.create_index_for_model(
name=&amp;quot;my-model-index&amp;quot;,
cloud=CloudProvider.AWS,
region=AwsRegion.US_EAST_1,
embed=IndexEmbed(
model=EmbedModel.Multilingual_E5_Large,
field_map={&amp;quot;text&amp;quot;: &amp;quot;my_text_field&amp;quot;}
)
)&lt;/p&gt;
&lt;h1&gt;3. Instantiate an Index client&lt;/h1&gt;
&lt;p&gt;idx = pc.Index(host=index_config.host)&lt;/p&gt;
&lt;h1&gt;4. Upsert records&lt;/h1&gt;
&lt;p&gt;idx.upsert_records(
namespace=&amp;quot;my-namespace&amp;quot;,
records=[
{
&amp;quot;_id&amp;quot;: &amp;quot;test1&amp;quot;,
&amp;quot;my_text_field&amp;quot;: &amp;quot;Apple is a popular fruit known for its sweetness and crisp texture.&amp;quot;,
},
{
&amp;quot;_id&amp;quot;: &amp;quot;test2&amp;quot;,
&amp;quot;my_text_field&amp;quot;: &amp;quot;The tech company Apple is known for its innovative products like the iPhone.&amp;quot;,
},
{
&amp;quot;_id&amp;quot;: &amp;quot;test3&amp;quot;,
&amp;quot;my_text_field&amp;quot;: &amp;quot;Many people enjoy eating apples as a healthy snack.&amp;quot;,
},
&amp;lt;/tr&amp;gt;&amp;lt;/table&amp;gt;
&lt;/code&gt;&lt;/pre&gt;&lt;/p&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pinecone-io/pinecone-python-client/commit/8f40d4db2ce37d3dd54fa092abc64c7ce0a8585c&quot;&gt;&lt;code&gt;8f40d4d&lt;/code&gt;&lt;/a&gt; [skip ci] Bump version to v6.0.0&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pinecone-io/pinecone-python-client/commit/7d14c23a49727140680d3caa995383fcfc9c6dfb&quot;&gt;&lt;code&gt;7d14c23&lt;/code&gt;&lt;/a&gt; Adjust tagging&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pinecone-io/pinecone-python-client/commit/e6988aa54332919556a48fbd23cfc734c3407f0d&quot;&gt;&lt;code&gt;e6988aa&lt;/code&gt;&lt;/a&gt; Adjust readme&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pinecone-io/pinecone-python-client/commit/26505767ebf15022b12eb0a26583036bade36846&quot;&gt;&lt;code&gt;2650576&lt;/code&gt;&lt;/a&gt; Add more info to README&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pinecone-io/pinecone-python-client/commit/11c0060e848332cb840c931201525f3ddc93a822&quot;&gt;&lt;code&gt;11c0060&lt;/code&gt;&lt;/a&gt; Adjust README&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pinecone-io/pinecone-python-client/commit/867bdb6b5a60def23155084aaed5ef7aeeb25cc2&quot;&gt;&lt;code&gt;867bdb6&lt;/code&gt;&lt;/a&gt; Adjust readme&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pinecone-io/pinecone-python-client/commit/2e67c48e8927f83323f7e73cc812c5bd2441f0ae&quot;&gt;&lt;code&gt;2e67c48&lt;/code&gt;&lt;/a&gt; Adjust message&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pinecone-io/pinecone-python-client/commit/1981fd8a030efc84072b3d29622264c96801b272&quot;&gt;&lt;code&gt;1981fd8&lt;/code&gt;&lt;/a&gt; Raise exception on load&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pinecone-io/pinecone-python-client/commit/9363c143140e6c2b0c285c9e0da7264436a14765&quot;&gt;&lt;code&gt;9363c14&lt;/code&gt;&lt;/a&gt; Update CONTRIBUTING.md with Poetry shell install (&lt;a href=&quot;https://redirect.github.com/pinecone-io/pinecone-python-client/issues/458&quot;&gt;#458&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/pinecone-io/pinecone-python-client/commit/3c49f9ffa906cbcba0650d1b07bb85177285fa04&quot;&gt;&lt;code&gt;3c49f9f&lt;/code&gt;&lt;/a&gt; [docs] Remove extra async call in PineconeAsyncio example (&lt;a href=&quot;https://redirect.github.com/pinecone-io/pinecone-python-client/issues/459&quot;&gt;#459&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/pinecone-io/pinecone-python-client/compare/v2.2.4...pinecone-client-v6.0.0&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pinecone-client&amp;package-manager=pip&amp;previous-version=2.2.4&amp;new-version=6.0.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt/pull/20

-- Commit Summary --

  * Bump pinecone-client from 2.2.4 to 6.0.0 in /platform

-- File Changes --

    M platform/poetry.lock (60)
    M platform/pyproject.toml (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt/pull/20.patch
https://github.com/Skogix/agent-gpt/pull/20.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt/pull/20
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt/pull/20@github.com&gt;
