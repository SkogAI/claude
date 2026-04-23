MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt <agent-gpt@noreply.github.com>
Date: Mon, 10 Mar 2025 00:45:25 -0700
Subject: [Skogix/agent-gpt] Bump tailwindcss from 3.3.2 to 4.0.12 in /next (PR #25)
Message-ID: <Skogix/agent-gpt/pull/25@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_67ce9895a7eea_88de05095be"; charset="UTF-8"

Bumps [tailwindcss](https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss) from 3.3.2 to 4.0.12.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/releases&quot;&gt;tailwindcss&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;v4.0.12&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Vite: Fix &lt;code&gt;url(…)&lt;/code&gt; rebasing in transitively imported CSS files (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16965&quot;&gt;#16965&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;PostCSS: Rebase &lt;code&gt;url(…)&lt;/code&gt;s in imported CSS files (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16965&quot;&gt;#16965&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure utilities are sorted based on their actual property order (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16995&quot;&gt;#16995&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure strings in Pug and Slim templates are handled correctly (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17000&quot;&gt;#17000&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure classes between &lt;code&gt;}&lt;/code&gt; and &lt;code&gt;{&lt;/code&gt; are properly extracted (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17001&quot;&gt;#17001&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix &lt;code&gt;razor&lt;/code&gt;/&lt;code&gt;cshtml&lt;/code&gt; pre-processing (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17027&quot;&gt;#17027&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure extracting candidates from JS embedded in a PHP string works as expected (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17031&quot;&gt;#17031&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;v4.0.11&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Ensure classes containing &lt;code&gt;--&lt;/code&gt; are extracted correctly (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16972&quot;&gt;#16972&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure classes containing numbers followed by dash or underscore are extracted correctly (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16980&quot;&gt;#16980&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure arbitrary container queries are extracted correctly (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16984&quot;&gt;#16984&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure classes ending in &lt;code&gt;[&lt;/code&gt; are extracted in Slim templating language (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16985&quot;&gt;#16985&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure arbitrary variables with data types are extracted correctly (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16986&quot;&gt;#16986&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;v4.0.10&lt;/h2&gt;
&lt;h3&gt;Added&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Add &lt;code&gt;col-&amp;lt;number&amp;gt;&lt;/code&gt; and &lt;code&gt;row-&amp;lt;number&amp;gt;&lt;/code&gt; utilities for &lt;code&gt;grid-column&lt;/code&gt; and &lt;code&gt;grid-row&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15183&quot;&gt;#15183&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Ensure &lt;code&gt;not-*&lt;/code&gt; does not remove &lt;code&gt;:is(…)&lt;/code&gt; from variants (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16825&quot;&gt;#16825&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure &lt;code&gt;@keyframes&lt;/code&gt; are correctly emitted when using a prefix (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16850&quot;&gt;#16850&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Don&#39;t swallow &lt;code&gt;@utility&lt;/code&gt; declarations when &lt;code&gt;@apply&lt;/code&gt; is used in nested rules (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16940&quot;&gt;#16940&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure &lt;code&gt;outline-hidden&lt;/code&gt; behaves like &lt;code&gt;outline-none&lt;/code&gt; outside of forced colors mode (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16943&quot;&gt;#16943&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Allow &lt;code&gt;!important&lt;/code&gt; on CSS variables again (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16873&quot;&gt;#16873&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Do not crash when encountering an &lt;code&gt;.svg&lt;/code&gt; file with &lt;code&gt;#&lt;/code&gt; or &lt;code&gt;?&lt;/code&gt; in the filename (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16957&quot;&gt;#16957&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure utilities are properly detected within square brackets (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16306&quot;&gt;#16306&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure utilities are properly detected using Angular&#39;s conditional class binding syntax (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16306&quot;&gt;#16306&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure utilities starting with numbers are properly extracted from Slim templates (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16306&quot;&gt;#16306&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Discard arbitrary property candidates that have guaranteed-invalid property names (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16306&quot;&gt;#16306&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Changed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Removed &lt;code&gt;max-w-auto&lt;/code&gt; and &lt;code&gt;max-h-auto&lt;/code&gt; utilities as they generate invalid CSS (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16917&quot;&gt;#16917&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Replaced the existing candidate extractor with a brand new extractor to improve maintainability, correctness, and performance (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16306&quot;&gt;#16306&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;v4.0.9&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Make JS APIs available to plugins and configs in the Standalone CLI (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15934&quot;&gt;#15934&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Don&#39;t crash when importing a virtual module from JavaScript that ends in &lt;code&gt;.css&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16780&quot;&gt;#16780&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix an issue where &lt;code&gt;@reference &amp;quot;…&amp;quot;&lt;/code&gt; would sometimes omit keyframe animations (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16774&quot;&gt;#16774&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure &lt;code&gt;z-*!&lt;/code&gt; utilities are properly marked as &lt;code&gt;!important&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16795&quot;&gt;#16795&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Changelog&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/blob/main/CHANGELOG.md&quot;&gt;tailwindcss&#39;s changelog&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;[4.0.12] - 2025-03-07&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Vite: Fix &lt;code&gt;url(…)&lt;/code&gt; rebasing in transitively imported CSS files (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16965&quot;&gt;#16965&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;PostCSS: Rebase &lt;code&gt;url(…)&lt;/code&gt;s in imported CSS files (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16965&quot;&gt;#16965&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure utilities are sorted based on their actual property order (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16995&quot;&gt;#16995&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure strings in Pug and Slim templates are handled correctly (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17000&quot;&gt;#17000&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure classes between &lt;code&gt;}&lt;/code&gt; and &lt;code&gt;{&lt;/code&gt; are properly extracted (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17001&quot;&gt;#17001&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix &lt;code&gt;razor&lt;/code&gt;/&lt;code&gt;cshtml&lt;/code&gt; pre-processing (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17027&quot;&gt;#17027&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure extracting candidates from JS embedded in a PHP string works as expected (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/17031&quot;&gt;#17031&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;[4.0.11] - 2025-03-06&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Ensure classes containing &lt;code&gt;--&lt;/code&gt; are extracted correctly (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16972&quot;&gt;#16972&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure classes containing numbers followed by dash or underscore are extracted correctly (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16980&quot;&gt;#16980&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure arbitrary container queries are extracted correctly (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16984&quot;&gt;#16984&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure classes ending in &lt;code&gt;[&lt;/code&gt; are extracted in Slim templating language (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16985&quot;&gt;#16985&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure arbitrary variables with data types are extracted correctly (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16986&quot;&gt;#16986&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;[4.0.10] - 2025-03-05&lt;/h2&gt;
&lt;h3&gt;Added&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Add &lt;code&gt;col-&amp;lt;number&amp;gt;&lt;/code&gt; and &lt;code&gt;row-&amp;lt;number&amp;gt;&lt;/code&gt; utilities for &lt;code&gt;grid-column&lt;/code&gt; and &lt;code&gt;grid-row&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15183&quot;&gt;#15183&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Ensure &lt;code&gt;not-*&lt;/code&gt; does not remove &lt;code&gt;:is(…)&lt;/code&gt; from variants (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16825&quot;&gt;#16825&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure &lt;code&gt;@keyframes&lt;/code&gt; are correctly emitted when using a prefix (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16850&quot;&gt;#16850&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Don&#39;t swallow &lt;code&gt;@utility&lt;/code&gt; declarations when &lt;code&gt;@apply&lt;/code&gt; is used in nested rules (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16940&quot;&gt;#16940&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure &lt;code&gt;outline-hidden&lt;/code&gt; behaves like &lt;code&gt;outline-none&lt;/code&gt; outside of forced colors mode (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16943&quot;&gt;#16943&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Allow &lt;code&gt;!important&lt;/code&gt; on CSS variables again (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16873&quot;&gt;#16873&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Do not crash when encountering an &lt;code&gt;.svg&lt;/code&gt; file with &lt;code&gt;#&lt;/code&gt; or &lt;code&gt;?&lt;/code&gt; in the filename (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16957&quot;&gt;#16957&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure utilities are properly detected within square brackets (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16306&quot;&gt;#16306&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure utilities are properly detected using Angular&#39;s conditional class binding syntax (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16306&quot;&gt;#16306&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure utilities starting with numbers are properly extracted from Slim templates (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16306&quot;&gt;#16306&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Discard arbitrary property candidates that have guaranteed-invalid property names (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16306&quot;&gt;#16306&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Changed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Removed &lt;code&gt;max-w-auto&lt;/code&gt; and &lt;code&gt;max-h-auto&lt;/code&gt; utilities as they generate invalid CSS (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16917&quot;&gt;#16917&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Replaced the existing candidate extractor with a brand new extractor to improve maintainability, correctness, and performance (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16306&quot;&gt;#16306&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;[4.0.9] - 2025-02-25&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/2f28e5fbcb961f474990b290f593a096ffc23d84&quot;&gt;&lt;code&gt;2f28e5f&lt;/code&gt;&lt;/a&gt; Prepare v4.0.12 release (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/17033&quot;&gt;#17033&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/3d0606b82d582752f87b543e9bd4fa4afca389c7&quot;&gt;&lt;code&gt;3d0606b&lt;/code&gt;&lt;/a&gt; Fix sorting of classes that have undefined declarations (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16995&quot;&gt;#16995&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/b676da8ace131fcf7ada72752f54738c90137939&quot;&gt;&lt;code&gt;b676da8&lt;/code&gt;&lt;/a&gt; Prepare v4.0.11 release (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16987&quot;&gt;#16987&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/1638b16fee33c0a4454919e22d96c4f57627413d&quot;&gt;&lt;code&gt;1638b16&lt;/code&gt;&lt;/a&gt; Prepare v4.0.10 release (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16963&quot;&gt;#16963&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/1c2ad57f037fa3f073cb3ecb4d6286947d9eb99d&quot;&gt;&lt;code&gt;1c2ad57&lt;/code&gt;&lt;/a&gt; Add &lt;code&gt;pointer-*&lt;/code&gt; variants (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16946&quot;&gt;#16946&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/2eecb4d0b621cc296aec4210cd08170d2ad21481&quot;&gt;&lt;code&gt;2eecb4d&lt;/code&gt;&lt;/a&gt; Remove &lt;code&gt;max-w-auto&lt;/code&gt; and &lt;code&gt;max-h-auto&lt;/code&gt; (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16917&quot;&gt;#16917&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/57b080c5f2b224096b0d6ef585cbed553db111f8&quot;&gt;&lt;code&gt;57b080c&lt;/code&gt;&lt;/a&gt; Allow &lt;code&gt;!important&lt;/code&gt; on CSS variables (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16873&quot;&gt;#16873&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/db405304f40f85629ae8e2cff53eb88054939415&quot;&gt;&lt;code&gt;db40530&lt;/code&gt;&lt;/a&gt; Don&#39;t swallow &lt;code&gt;@utility&lt;/code&gt; declarations when &lt;code&gt;@apply&lt;/code&gt; is used in nested rules (...&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/b0aa20c30eb68dc5d4bb636307e4d245d1c781b0&quot;&gt;&lt;code&gt;b0aa20c&lt;/code&gt;&lt;/a&gt; Ensure &lt;code&gt;outline-hidden&lt;/code&gt; behaves like &lt;code&gt;outline-none&lt;/code&gt; in non-&lt;code&gt;forced-colors&lt;/code&gt; mo...&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/595b88f2718d07cf8a22be9416fc2fbc10c5c841&quot;&gt;&lt;code&gt;595b88f&lt;/code&gt;&lt;/a&gt; Support bare &lt;code&gt;col-*&lt;/code&gt; and &lt;code&gt;row-*&lt;/code&gt; utilities (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/15183&quot;&gt;#15183&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commits/v4.0.12/packages/tailwindcss&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=tailwindcss&amp;package-manager=npm_and_yarn&amp;previous-version=3.3.2&amp;new-version=4.0.12)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt/pull/25

-- Commit Summary --

  * Bump tailwindcss from 3.3.2 to 4.0.12 in /next

-- File Changes --

    M next/package-lock.json (756)
    M next/package.json (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt/pull/25.patch
https://github.com/Skogix/agent-gpt/pull/25.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt/pull/25
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt/pull/25@github.com&gt;
