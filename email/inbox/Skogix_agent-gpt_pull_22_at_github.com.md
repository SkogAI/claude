MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt <agent-gpt@noreply.github.com>
Date: Mon, 03 Mar 2025 00:38:44 -0800
Subject: [Skogix/agent-gpt] Bump tailwindcss from 3.3.2 to 4.0.9 in /next (PR #22)
Message-ID: <Skogix/agent-gpt/pull/22@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_67c56a94b5aa2_7ede09930d9"; charset="UTF-8"

Bumps [tailwindcss](https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss) from 3.3.2 to 4.0.9.
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/releases&quot;&gt;tailwindcss&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;v4.0.9&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Make JS APIs available to plugins and configs in the Standalone CLI (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15934&quot;&gt;#15934&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Don&#39;t crash when importing a virtual module from JavaScript that ends in &lt;code&gt;.css&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16780&quot;&gt;#16780&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix an issue where &lt;code&gt;@reference &amp;quot;…&amp;quot;&lt;/code&gt; would sometimes omit keyframe animations (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16774&quot;&gt;#16774&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure &lt;code&gt;z-*!&lt;/code&gt; utilities are properly marked as &lt;code&gt;!important&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16795&quot;&gt;#16795&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Read UTF-8 CSS files that start with a byte-order mark (BOM) (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16800&quot;&gt;#16800&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure nested functions in selectors used with JavaScript plugins are not truncated (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16802&quot;&gt;#16802&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Changed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Emit variable fallbacks when using &lt;code&gt;@reference &amp;quot;…&amp;quot;&lt;/code&gt; instead of duplicate CSS variable declarations (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16774&quot;&gt;#16774&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;v4.0.8&lt;/h2&gt;
&lt;h3&gt;Added&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Allow &lt;code&gt;@import&lt;/code&gt; with &lt;code&gt;theme(…)&lt;/code&gt; options for stylesheets that contain more than just &lt;code&gt;@theme&lt;/code&gt; rules (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16514&quot;&gt;#16514&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Don&#39;t add &lt;code&gt;!important&lt;/code&gt; to CSS variable declarations when using the important modifier (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16668&quot;&gt;#16668&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Ignore files and directories specified in your &lt;code&gt;.gitignore&lt;/code&gt; file when using automatic source detection(&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16631&quot;&gt;#16631&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Don&#39;t rely on the module graph for detecting candidates to ensure setups with multiple Vite builds work as expected (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16631&quot;&gt;#16631&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Ensure Astro production builds always contain classes used in client-only components (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16631&quot;&gt;#16631&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Always scan raw file contents for utility classes before any other transforms have been applied to ensure utility classes are scanned without any additional escaping (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16631&quot;&gt;#16631&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure utilities with more declarations are always sorted before utilities with fewer declarations when utilities only define CSS variables (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16715&quot;&gt;#16715&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Only include &lt;code&gt;translate-z-px&lt;/code&gt; utilities once in compiled CSS (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16718&quot;&gt;#16718&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Changed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Don&#39;t include theme variables that aren&#39;t used in compiled CSS (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16211&quot;&gt;#16211&lt;/a&gt;, &lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16676&quot;&gt;#16676&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;v4.0.7&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Export &lt;code&gt;tailwindcss/lib/util/flattenColorPalette.js&lt;/code&gt; for backward compatibility (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16411&quot;&gt;#16411&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix sorting of numeric utility suggestions when they have different magnitudes (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16414&quot;&gt;#16414&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Show suggestions for fractions in IntelliSense (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16353&quot;&gt;#16353&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Don’t replace &lt;code&gt;_&lt;/code&gt; in suggested theme keys (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16433&quot;&gt;#16433&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure &lt;code&gt;--default-outline-width&lt;/code&gt; can be used to change the &lt;code&gt;outline-width&lt;/code&gt; value of the &lt;code&gt;outline&lt;/code&gt; utility (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16469&quot;&gt;#16469&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure drop shadow utilities don&#39;t inherit unexpectedly (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16471&quot;&gt;#16471&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Export config and plugin types from &lt;code&gt;tailwindcss/plugin&lt;/code&gt; for backward compatibility (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16505&quot;&gt;#16505&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure JavaScript plugins that emit nested rules referencing the utility name work as expected (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16539&quot;&gt;#16539&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Statically link Visual Studio redistributables in &lt;code&gt;@tailwindcss/oxide&lt;/code&gt; Windows builds (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16602&quot;&gt;#16602&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure that Next.js splat routes are scanned for classes (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16457&quot;&gt;#16457&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Pin exact version of &lt;code&gt;tailwindcss&lt;/code&gt; in &lt;code&gt;@tailwindcss/*&lt;/code&gt; packages (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16623&quot;&gt;#16623&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Upgrade: Report errors when updating dependencies (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16504&quot;&gt;#16504&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Upgrade: Ensure a &lt;code&gt;darkMode&lt;/code&gt; JS config setting with block syntax converts to use &lt;code&gt;@slot&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16507&quot;&gt;#16507&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Upgrade: Ensure the latest version of &lt;code&gt;tailwindcss&lt;/code&gt; and &lt;code&gt;@tailwindcss/postcss&lt;/code&gt; are installed when upgrading (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16620&quot;&gt;#16620&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Changelog&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/blob/main/CHANGELOG.md&quot;&gt;tailwindcss&#39;s changelog&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;[4.0.9] - 2025-02-25&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Make JS APIs available to plugins and configs in the Standalone CLI (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/15934&quot;&gt;#15934&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Don&#39;t crash when importing a virtual module from JavaScript that ends in &lt;code&gt;.css&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16780&quot;&gt;#16780&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix an issue where &lt;code&gt;@reference &amp;quot;…&amp;quot;&lt;/code&gt; would sometimes omit keyframe animations (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16774&quot;&gt;#16774&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure &lt;code&gt;z-*!&lt;/code&gt; utilities are properly marked as &lt;code&gt;!important&lt;/code&gt; (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16795&quot;&gt;#16795&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Read UTF-8 CSS files that start with a byte-order mark (BOM) (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16800&quot;&gt;#16800&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure nested functions in selectors used with JavaScript plugins are not truncated (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16802&quot;&gt;#16802&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Changed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Emit variable fallbacks when using &lt;code&gt;@reference &amp;quot;…&amp;quot;&lt;/code&gt; instead of duplicate CSS variable declarations (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16774&quot;&gt;#16774&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;[4.0.8] - 2025-02-21&lt;/h2&gt;
&lt;h3&gt;Added&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Allow &lt;code&gt;@import&lt;/code&gt; with &lt;code&gt;theme(…)&lt;/code&gt; options for stylesheets that contain more than just &lt;code&gt;@theme&lt;/code&gt; rules (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16514&quot;&gt;#16514&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Don&#39;t add &lt;code&gt;!important&lt;/code&gt; to CSS variable declarations when using the important modifier (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16668&quot;&gt;#16668&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Ignore files and directories specified in your &lt;code&gt;.gitignore&lt;/code&gt; file when using automatic source detection(&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16631&quot;&gt;#16631&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Don&#39;t rely on the module graph for detecting candidates to ensure setups with multiple Vite builds work as expected (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16631&quot;&gt;#16631&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Ensure Astro production builds always contain classes used in client-only components (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16631&quot;&gt;#16631&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Vite: Always scan raw file contents for utility classes before any other transforms have been applied to ensure utility classes are scanned without any additional escaping (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16631&quot;&gt;#16631&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure utilities with more declarations are always sorted before utilities with fewer declarations when utilities only define CSS variables (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16715&quot;&gt;#16715&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Only include &lt;code&gt;translate-z-px&lt;/code&gt; utilities once in compiled CSS (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16718&quot;&gt;#16718&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Changed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Don&#39;t include theme variables that aren&#39;t used in compiled CSS (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16211&quot;&gt;#16211&lt;/a&gt;, &lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16676&quot;&gt;#16676&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;[4.0.7] - 2025-02-18&lt;/h2&gt;
&lt;h3&gt;Fixed&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Export &lt;code&gt;tailwindcss/lib/util/flattenColorPalette.js&lt;/code&gt; for backward compatibility (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16411&quot;&gt;#16411&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Fix sorting of numeric utility suggestions when they have different magnitudes (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16414&quot;&gt;#16414&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Show suggestions for fractions in IntelliSense (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16353&quot;&gt;#16353&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Don’t replace &lt;code&gt;_&lt;/code&gt; in suggested theme keys (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16433&quot;&gt;#16433&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure &lt;code&gt;--default-outline-width&lt;/code&gt; can be used to change the &lt;code&gt;outline-width&lt;/code&gt; value of the &lt;code&gt;outline&lt;/code&gt; utility (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16469&quot;&gt;#16469&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure drop shadow utilities don&#39;t inherit unexpectedly (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16471&quot;&gt;#16471&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Export config and plugin types from &lt;code&gt;tailwindcss/plugin&lt;/code&gt; for backward compatibility (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16505&quot;&gt;#16505&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure JavaScript plugins that emit nested rules referencing the utility name work as expected (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16539&quot;&gt;#16539&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Statically link Visual Studio redistributables in &lt;code&gt;@tailwindcss/oxide&lt;/code&gt; Windows builds (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16602&quot;&gt;#16602&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Ensure that Next.js splat routes are scanned for classes (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16457&quot;&gt;#16457&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Pin exact version of &lt;code&gt;tailwindcss&lt;/code&gt; in &lt;code&gt;@tailwindcss/*&lt;/code&gt; packages (&lt;a href=&quot;https://redirect.github.com/tailwindlabs/tailwindcss/pull/16623&quot;&gt;#16623&lt;/a&gt;)&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/85d7375b59bf31bdf20592a636625f5f1ca6112b&quot;&gt;&lt;code&gt;85d7375&lt;/code&gt;&lt;/a&gt; Prepare v4.0.9 release (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16804&quot;&gt;#16804&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/b56f12e6e737ce5333b9f98a0592f98124666c7b&quot;&gt;&lt;code&gt;b56f12e&lt;/code&gt;&lt;/a&gt; Ensure nested functions in selectors used with JavaScript plugins are not tru...&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/294952f1702fb49be2d6795ee5bd7a6ac396ae78&quot;&gt;&lt;code&gt;294952f&lt;/code&gt;&lt;/a&gt; Handle BOM (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16800&quot;&gt;#16800&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/ef57e6ea4d54280577b8622bbd9fabbcdf8f5400&quot;&gt;&lt;code&gt;ef57e6e&lt;/code&gt;&lt;/a&gt; Fix &lt;code&gt;z-*!&lt;/code&gt; utilities (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16795&quot;&gt;#16795&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/b38948337d77f7ed481a55d20b16b2aa4244ce04&quot;&gt;&lt;code&gt;b389483&lt;/code&gt;&lt;/a&gt; Make &lt;code&gt;@reference&lt;/code&gt; emit variable fallbacks instead of CSS variable declaration...&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/751eb747d418ff76581b1e6143c31d31805ae821&quot;&gt;&lt;code&gt;751eb74&lt;/code&gt;&lt;/a&gt; Add &lt;code&gt;inverted-colors&lt;/code&gt; variant (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/11693&quot;&gt;#11693&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/62d3e74694b356e855bc7f3c99d1066a67f5717f&quot;&gt;&lt;code&gt;62d3e74&lt;/code&gt;&lt;/a&gt; Add &lt;code&gt;wrap-anywhere&lt;/code&gt; utility (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/12128&quot;&gt;#12128&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/419b3dc47353b30d73aeb26e378b2ac3f3c51ec0&quot;&gt;&lt;code&gt;419b3dc&lt;/code&gt;&lt;/a&gt; Prepare v4.0.8 release (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16713&quot;&gt;#16713&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/b47b6d22909b0b047d4c3ad3eb730f4faa1eafdd&quot;&gt;&lt;code&gt;b47b6d2&lt;/code&gt;&lt;/a&gt; Remove double &lt;code&gt;translate-z-px&lt;/code&gt; values (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16718&quot;&gt;#16718&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commit/113142a0e4dc97ea01bd16740d36a8d37dc82528&quot;&gt;&lt;code&gt;113142a&lt;/code&gt;&lt;/a&gt; Use amount of properties when sorting (&lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/tree/HEAD/packages/tailwindcss/issues/16715&quot;&gt;#16715&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/tailwindlabs/tailwindcss/commits/v4.0.9/packages/tailwindcss&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=tailwindcss&amp;package-manager=npm_and_yarn&amp;previous-version=3.3.2&amp;new-version=4.0.9)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

  https://github.com/Skogix/agent-gpt/pull/22

-- Commit Summary --

  * Bump tailwindcss from 3.3.2 to 4.0.9 in /next

-- File Changes --

    M next/package-lock.json (756)
    M next/package.json (2)

-- Patch Links --

https://github.com/Skogix/agent-gpt/pull/22.patch
https://github.com/Skogix/agent-gpt/pull/22.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt/pull/22
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt/pull/22@github.com&gt;
