MIME-Version: 1.0
From: "dependabot[bot]" <notifications@github.com>
To: Skogix/agent-gpt <agent-gpt@noreply.github.com>
Date: Wed, 29 Jan 2025 00:46:22 -0800
Subject: [Skogix/agent-gpt] Bump react-dom and @types/react-dom in /next (PR #11)
Message-ID: <Skogix/agent-gpt/pull/11@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6799eade5589f_76d884685e7"; charset="UTF-8"

Bumps [react-dom](https://github.com/facebook/react/tree/HEAD/packages/react-dom) and [@types/react-dom](https://github.com/DefinitelyTyped/DefinitelyTyped/tree/HEAD/types/react-dom). These dependencies needed to be updated together.
Updates `react-dom` from 18.2.0 to 19.0.0
&lt;details&gt;
&lt;summary&gt;Release notes&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/facebook/react/releases&quot;&gt;react-dom&#39;s releases&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;19.0.0 (December 5, 2024)&lt;/h2&gt;
&lt;p&gt;Below is a list of all new features, APIs, deprecations, and breaking changes. Read &lt;a href=&quot;https://react.dev/blog/2024/04/25/react-19&quot;&gt;React 19 release post&lt;/a&gt; and &lt;a href=&quot;https://react.dev/blog/2024/04/25/react-19-upgrade-guide&quot;&gt;React 19 upgrade guide&lt;/a&gt; for more information.&lt;/p&gt;
&lt;blockquote&gt;
&lt;p&gt;Note: To help make the upgrade to React 19 easier, we’ve published a react@18.3 release that is identical to 18.2 but adds warnings for deprecated APIs and other changes that are needed for React 19. We recommend upgrading to React 18.3.1 first to help identify any issues before upgrading to React 19.&lt;/p&gt;
&lt;/blockquote&gt;
&lt;h2&gt;New Features&lt;/h2&gt;
&lt;h3&gt;React&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Actions: &lt;code&gt;startTransition&lt;/code&gt; can now accept async functions. Functions passed to &lt;code&gt;startTransition&lt;/code&gt; are called “Actions”. A given Transition can include one or more Actions which update state in the background and update the UI with one commit. In addition to updating state, Actions can now perform side effects including async requests, and the Action will wait for the work to finish before finishing the Transition. This feature allows Transitions to include side effects like &lt;code&gt;fetch()&lt;/code&gt; in the pending state, and provides support for error handling, and optimistic updates.&lt;/li&gt;
&lt;li&gt;&lt;code&gt;useActionState&lt;/code&gt;: is a new hook to order Actions inside of a Transition with access to the state of the action, and the pending state. It accepts a reducer that can call Actions, and the initial state used for first render. It also accepts an optional string that is used if the action is passed to a form &lt;code&gt;action&lt;/code&gt; prop to support progressive enhancement in forms.&lt;/li&gt;
&lt;li&gt;&lt;code&gt;useOptimistic&lt;/code&gt;: is a new hook to update state while a Transition is in progress. It returns the state, and a set function that can be called inside a transition to “optimistically” update the state to expected final value immediately while the Transition completes in the background. When the transition finishes, the state is updated to the new value.&lt;/li&gt;
&lt;li&gt;&lt;code&gt;use&lt;/code&gt;: is a new API that allows reading resources in render. In React 19, &lt;code&gt;use&lt;/code&gt; accepts a promise or Context. If provided a promise, &lt;code&gt;use&lt;/code&gt; will suspend until a value is resolved. &lt;code&gt;use&lt;/code&gt; can only be used in render but can be called conditionally.&lt;/li&gt;
&lt;li&gt;&lt;code&gt;ref&lt;/code&gt; as a prop: Refs can now be used as props, removing the need for &lt;code&gt;forwardRef&lt;/code&gt;.&lt;/li&gt;
&lt;li&gt;&lt;strong&gt;Suspense sibling pre-warming&lt;/strong&gt;: When a component suspends, React will immediately commit the fallback of the nearest Suspense boundary, without waiting for the entire sibling tree to render. After the fallback commits, React will schedule another render for the suspended siblings to “pre-warm” lazy requests.&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;React DOM Client&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;&lt;code&gt;&amp;lt;form&amp;gt; action&lt;/code&gt; prop: Form Actions allow you to manage forms automatically and integrate with &lt;code&gt;useFormStatus&lt;/code&gt;. When a &lt;code&gt;&amp;lt;form&amp;gt; action&lt;/code&gt; succeeds, React will automatically reset the form for uncontrolled components. The form can be reset manually with the new &lt;code&gt;requestFormReset&lt;/code&gt; API.&lt;/li&gt;
&lt;li&gt;&lt;code&gt;&amp;lt;button&amp;gt; and &amp;lt;input&amp;gt; formAction&lt;/code&gt; prop: Actions can be passed to the &lt;code&gt;formAction&lt;/code&gt; prop to configure form submission behavior. This allows using different Actions depending on the input.&lt;/li&gt;
&lt;li&gt;&lt;code&gt;useFormStatus&lt;/code&gt;: is a new hook that provides the status of the parent &lt;code&gt;&amp;lt;form&amp;gt; action&lt;/code&gt;, as if the form was a Context provider. The hook returns the values: &lt;code&gt;pending&lt;/code&gt;, &lt;code&gt;data&lt;/code&gt;, &lt;code&gt;method&lt;/code&gt;, and &lt;code&gt;action&lt;/code&gt;.&lt;/li&gt;
&lt;li&gt;Support for Document Metadata: We’ve added support for rendering document metadata tags in components natively. React will automatically hoist them into the &lt;code&gt;&amp;lt;head&amp;gt;&lt;/code&gt; section of the document.&lt;/li&gt;
&lt;li&gt;Support for Stylesheets: React 19 will ensure stylesheets are inserted into the &lt;code&gt;&amp;lt;head&amp;gt;&lt;/code&gt; on the client before revealing the content of a Suspense boundary that depends on that stylesheet.&lt;/li&gt;
&lt;li&gt;Support for async scripts: Async scripts can be rendered anywhere in the component tree and React will handle ordering and deduplication.&lt;/li&gt;
&lt;li&gt;Support for preloading resources: React 19 ships with &lt;code&gt;preinit&lt;/code&gt;, &lt;code&gt;preload&lt;/code&gt;, &lt;code&gt;prefetchDNS&lt;/code&gt;, and &lt;code&gt;preconnect&lt;/code&gt; APIs to optimize initial page loads by moving discovery of additional resources like fonts out of stylesheet loading. They can also be used to prefetch resources used by an anticipated navigation.&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;React DOM Server&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Added &lt;code&gt;prerender&lt;/code&gt; and &lt;code&gt;prerenderToNodeStream&lt;/code&gt; APIs for static site generation. They are designed to work with streaming environments like Node.js Streams and Web Streams. Unlike &lt;code&gt;renderToString&lt;/code&gt;, they wait for data to load for HTML generation.&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;React Server Components&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;RSC features such as directives, server components, and server functions are now stable. This means libraries that ship with Server Components can now target React 19 as a peer dependency with a react-server export condition for use in frameworks that support the Full-stack React Architecture. The underlying APIs used to implement a React Server Components bundler or framework do not follow semver and may break between minors in React 19.x. See &lt;a href=&quot;https://19.react.dev/reference/rsc/server-components&quot;&gt;docs&lt;/a&gt; for how to support React Server Components.&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;Deprecations&lt;/h2&gt;
&lt;ul&gt;
&lt;li&gt;Deprecated: &lt;code&gt;element.ref&lt;/code&gt; access: React 19 supports ref as a prop, so we’re deprecating &lt;code&gt;element.ref&lt;/code&gt; in favor of &lt;code&gt;element.props.ref&lt;/code&gt;. Accessing will result in a warning.&lt;/li&gt;
&lt;li&gt;&lt;code&gt;react-test-renderer&lt;/code&gt;: In React 19, react-test-renderer logs a deprecation warning and has switched to concurrent rendering for web usage. We recommend migrating your tests to  &lt;a href=&quot;https://github.com/testinglibrary&quot;&gt;&lt;code&gt;@​testinglibrary&lt;/code&gt;&lt;/a&gt;.com/docs/react-testing-library/intro/) or &lt;a href=&quot;https://github.com/testingesting-library&quot;&gt;&lt;code&gt;@​testingesting-library&lt;/code&gt;&lt;/a&gt;.com/docs/react-native-testing-library/intro)&lt;/li&gt;
&lt;/ul&gt;
&lt;h2&gt;Breaking Changes&lt;/h2&gt;
&lt;p&gt;React 19 brings in a number of breaking changes, including the removals of long-deprecated APIs. We recommend first upgrading to &lt;code&gt;18.3.1&lt;/code&gt;, where we&#39;ve added additional deprecation warnings. Check out the &lt;a href=&quot;https://19.react.dev/blog/2024/04/25/react-19-upgrade-guide&quot;&gt;upgrade guide&lt;/a&gt; for more details and guidance on codemodding.&lt;/p&gt;
&lt;h3&gt;React&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;New JSX Transform is now required: We introduced &lt;a href=&quot;https://legacy.reactjs.org/blog/2020/09/22/introducing-the-new-jsx-transform.html&quot;&gt;a new JSX transform&lt;/a&gt; in 2020 to improve bundle size and use JSX without importing React. In React 19, we’re adding additional improvements like using ref as a prop and JSX speed improvements that require the new transform.&lt;/li&gt;
&lt;li&gt;Errors in render are not re-thrown: Errors that are not caught by an Error Boundary are now reported to window.reportError. Errors that are caught by an Error Boundary are reported to console.error. We’ve introduced &lt;code&gt;onUncaughtError&lt;/code&gt; and &lt;code&gt;onCaughtError&lt;/code&gt; methods to &lt;code&gt;createRoot&lt;/code&gt; and &lt;code&gt;hydrateRoot&lt;/code&gt; to customize this error handling.&lt;/li&gt;
&lt;li&gt;Removed: &lt;code&gt;propTypes&lt;/code&gt;: Using &lt;code&gt;propTypes&lt;/code&gt; will now be silently ignored. If required, we recommend migrating to TypeScript or another type-checking solution.&lt;/li&gt;
&lt;li&gt;Removed: &lt;code&gt;defaultProps&lt;/code&gt; for functions: ES6 default parameters can be used in place. Class components continue to support &lt;code&gt;defaultProps&lt;/code&gt; since there is no ES6 alternative.&lt;/li&gt;
&lt;li&gt;Removed: &lt;code&gt;contextTypes&lt;/code&gt; and &lt;code&gt;getChildContext&lt;/code&gt;: Legacy Context for class components has been removed in favor of the &lt;code&gt;contextType&lt;/code&gt; API.&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Changelog&lt;/summary&gt;
&lt;p&gt;&lt;em&gt;Sourced from &lt;a href=&quot;https://github.com/facebook/react/blob/main/CHANGELOG.md&quot;&gt;react-dom&#39;s changelog&lt;/a&gt;.&lt;/em&gt;&lt;/p&gt;
&lt;blockquote&gt;
&lt;h2&gt;19.0.0 (December 5, 2024)&lt;/h2&gt;
&lt;p&gt;Below is a list of all new features, APIs, deprecations, and breaking changes. Read &lt;a href=&quot;https://react.dev/blog/2024/04/25/react-19&quot;&gt;React 19 release post&lt;/a&gt; and &lt;a href=&quot;https://react.dev/blog/2024/04/25/react-19-upgrade-guide&quot;&gt;React 19 upgrade guide&lt;/a&gt; for more information.&lt;/p&gt;
&lt;blockquote&gt;
&lt;p&gt;Note: To help make the upgrade to React 19 easier, we’ve published a react@18.3 release that is identical to 18.2 but adds warnings for deprecated APIs and other changes that are needed for React 19. We recommend upgrading to React 18.3.1 first to help identify any issues before upgrading to React 19.&lt;/p&gt;
&lt;/blockquote&gt;
&lt;h3&gt;New Features&lt;/h3&gt;
&lt;h4&gt;React&lt;/h4&gt;
&lt;ul&gt;
&lt;li&gt;Actions: &lt;code&gt;startTransition&lt;/code&gt; can now accept async functions. Functions passed to &lt;code&gt;startTransition&lt;/code&gt; are called “Actions”. A given Transition can include one or more Actions which update state in the background and update the UI with one commit. In addition to updating state, Actions can now perform side effects including async requests, and the Action will wait for the work to finish before finishing the Transition. This feature allows Transitions to include side effects like &lt;code&gt;fetch()&lt;/code&gt; in the pending state, and provides support for error handling, and optimistic updates.&lt;/li&gt;
&lt;li&gt;&lt;code&gt;useActionState&lt;/code&gt;: is a new hook to order Actions inside of a Transition with access to the state of the action, and the pending state. It accepts a reducer that can call Actions, and the initial state used for first render. It also accepts an optional string that is used if the action is passed to a form &lt;code&gt;action&lt;/code&gt; prop to support progressive enhancement in forms.&lt;/li&gt;
&lt;li&gt;&lt;code&gt;useOptimistic&lt;/code&gt;: is a new hook to update state while a Transition is in progress. It returns the state, and a set function that can be called inside a transition to “optimistically” update the state to expected final value immediately while the Transition completes in the background. When the transition finishes, the state is updated to the new value.&lt;/li&gt;
&lt;li&gt;&lt;code&gt;use&lt;/code&gt;: is a new API that allows reading resources in render. In React 19, &lt;code&gt;use&lt;/code&gt; accepts a promise or Context. If provided a promise, &lt;code&gt;use&lt;/code&gt; will suspend until a value is resolved. &lt;code&gt;use&lt;/code&gt; can only be used in render but can be called conditionally.&lt;/li&gt;
&lt;li&gt;&lt;code&gt;ref&lt;/code&gt; as a prop: Refs can now be used as props, removing the need for &lt;code&gt;forwardRef&lt;/code&gt;.&lt;/li&gt;
&lt;li&gt;&lt;strong&gt;Suspense sibling pre-warming&lt;/strong&gt;: When a component suspends, React will immediately commit the fallback of the nearest Suspense boundary, without waiting for the entire sibling tree to render. After the fallback commits, React will schedule another render for the suspended siblings to “pre-warm” lazy requests.&lt;/li&gt;
&lt;/ul&gt;
&lt;h4&gt;React DOM Client&lt;/h4&gt;
&lt;ul&gt;
&lt;li&gt;&lt;code&gt;&amp;lt;form&amp;gt; action&lt;/code&gt; prop: Form Actions allow you to manage forms automatically and integrate with &lt;code&gt;useFormStatus&lt;/code&gt;. When a &lt;code&gt;&amp;lt;form&amp;gt; action&lt;/code&gt; succeeds, React will automatically reset the form for uncontrolled components. The form can be reset manually with the new &lt;code&gt;requestFormReset&lt;/code&gt; API.&lt;/li&gt;
&lt;li&gt;&lt;code&gt;&amp;lt;button&amp;gt; and &amp;lt;input&amp;gt; formAction&lt;/code&gt; prop: Actions can be passed to the &lt;code&gt;formAction&lt;/code&gt; prop to configure form submission behavior. This allows using different Actions depending on the input.&lt;/li&gt;
&lt;li&gt;&lt;code&gt;useFormStatus&lt;/code&gt;: is a new hook that provides the status of the parent &lt;code&gt;&amp;lt;form&amp;gt; action&lt;/code&gt;, as if the form was a Context provider. The hook returns the values: &lt;code&gt;pending&lt;/code&gt;, &lt;code&gt;data&lt;/code&gt;, &lt;code&gt;method&lt;/code&gt;, and &lt;code&gt;action&lt;/code&gt;.&lt;/li&gt;
&lt;li&gt;Support for Document Metadata: We’ve added support for rendering document metadata tags in components natively. React will automatically hoist them into the &lt;code&gt;&amp;lt;head&amp;gt;&lt;/code&gt; section of the document.&lt;/li&gt;
&lt;li&gt;Support for Stylesheets: React 19 will ensure stylesheets are inserted into the &lt;code&gt;&amp;lt;head&amp;gt;&lt;/code&gt; on the client before revealing the content of a Suspense boundary that depends on that stylesheet.&lt;/li&gt;
&lt;li&gt;Support for async scripts: Async scripts can be rendered anywhere in the component tree and React will handle ordering and deduplication.&lt;/li&gt;
&lt;li&gt;Support for preloading resources: React 19 ships with &lt;code&gt;preinit&lt;/code&gt;, &lt;code&gt;preload&lt;/code&gt;, &lt;code&gt;prefetchDNS&lt;/code&gt;, and &lt;code&gt;preconnect&lt;/code&gt; APIs to optimize initial page loads by moving discovery of additional resources like fonts out of stylesheet loading. They can also be used to prefetch resources used by an anticipated navigation.&lt;/li&gt;
&lt;/ul&gt;
&lt;h4&gt;React DOM Server&lt;/h4&gt;
&lt;ul&gt;
&lt;li&gt;Added &lt;code&gt;prerender&lt;/code&gt; and &lt;code&gt;prerenderToNodeStream&lt;/code&gt; APIs for static site generation. They are designed to work with streaming environments like Node.js Streams and Web Streams. Unlike &lt;code&gt;renderToString&lt;/code&gt;, they wait for data to load for HTML generation.&lt;/li&gt;
&lt;/ul&gt;
&lt;h4&gt;React Server Components&lt;/h4&gt;
&lt;ul&gt;
&lt;li&gt;RSC features such as directives, server components, and server functions are now stable. This means libraries that ship with Server Components can now target React 19 as a peer dependency with a react-server export condition for use in frameworks that support the Full-stack React Architecture. The underlying APIs used to implement a React Server Components bundler or framework do not follow semver and may break between minors in React 19.x. See &lt;a href=&quot;https://19.react.dev/reference/rsc/server-components&quot;&gt;docs&lt;/a&gt; for how to support React Server Components.&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Deprecations&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;Deprecated: &lt;code&gt;element.ref&lt;/code&gt; access: React 19 supports ref as a prop, so we’re deprecating &lt;code&gt;element.ref&lt;/code&gt; in favor of &lt;code&gt;element.props.ref&lt;/code&gt;. Accessing will result in a warning.&lt;/li&gt;
&lt;li&gt;&lt;code&gt;react-test-renderer&lt;/code&gt;: In React 19, react-test-renderer logs a deprecation warning and has switched to concurrent rendering for web usage. We recommend migrating your tests to  &lt;a href=&quot;https://testing-library.com/docs/react-testing-library/intro/&quot;&gt;&lt;code&gt;@​testing-library/react&lt;/code&gt;&lt;/a&gt; or &lt;a href=&quot;https://testing-library.com/docs/react-native-testing-library/intro&quot;&gt;&lt;code&gt;@​testing-library/react-native&lt;/code&gt;&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;h3&gt;Breaking Changes&lt;/h3&gt;
&lt;p&gt;React 19 brings in a number of breaking changes, including the removals of long-deprecated APIs. We recommend first upgrading to &lt;code&gt;18.3.1&lt;/code&gt;, where we&#39;ve added additional deprecation warnings. Check out the &lt;a href=&quot;https://19.react.dev/blog/2024/04/25/react-19-upgrade-guide&quot;&gt;upgrade guide&lt;/a&gt; for more details and guidance on codemodding.&lt;/p&gt;
&lt;h3&gt;React&lt;/h3&gt;
&lt;ul&gt;
&lt;li&gt;New JSX Transform is now required: We introduced &lt;a href=&quot;https://legacy.reactjs.org/blog/2020/09/22/introducing-the-new-jsx-transform.html&quot;&gt;a new JSX transform&lt;/a&gt; in 2020 to improve bundle size and use JSX without importing React. In React 19, we’re adding additional improvements like using ref as a prop and JSX speed improvements that require the new transform.&lt;/li&gt;
&lt;li&gt;Errors in render are not re-thrown: Errors that are not caught by an Error Boundary are now reported to window.reportError. Errors that are caught by an Error Boundary are reported to console.error. We’ve introduced &lt;code&gt;onUncaughtError&lt;/code&gt; and &lt;code&gt;onCaughtError&lt;/code&gt; methods to &lt;code&gt;createRoot&lt;/code&gt; and &lt;code&gt;hydrateRoot&lt;/code&gt; to customize this error handling.&lt;/li&gt;
&lt;li&gt;Removed: &lt;code&gt;propTypes&lt;/code&gt;: Using &lt;code&gt;propTypes&lt;/code&gt; will now be silently ignored. If required, we recommend migrating to TypeScript or another type-checking solution.&lt;/li&gt;
&lt;li&gt;Removed: &lt;code&gt;defaultProps&lt;/code&gt; for functions: ES6 default parameters can be used in place. Class components continue to support &lt;code&gt;defaultProps&lt;/code&gt; since there is no ES6 alternative.&lt;/li&gt;
&lt;/ul&gt;
&lt;!-- raw HTML omitted --&gt;
&lt;/blockquote&gt;
&lt;p&gt;... (truncated)&lt;/p&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/facebook/react/commit/989af12f72080c17db03ead91d99b6394a215564&quot;&gt;&lt;code&gt;989af12&lt;/code&gt;&lt;/a&gt; Make prerendering always non-blocking with fix (&lt;a href=&quot;https://github.com/facebook/react/tree/HEAD/packages/react-dom/issues/31452&quot;&gt;#31452&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/facebook/react/commit/e1378902bbb322aa1fe1953780f4b2b5f80d26b1&quot;&gt;&lt;code&gt;e137890&lt;/code&gt;&lt;/a&gt; [string-refs] cleanup string ref code (&lt;a href=&quot;https://github.com/facebook/react/tree/HEAD/packages/react-dom/issues/31443&quot;&gt;#31443&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/facebook/react/commit/07aa494432e97f63fca9faf2fad6f76fead31063&quot;&gt;&lt;code&gt;07aa494&lt;/code&gt;&lt;/a&gt; Remove enableRefAsProp feature flag (&lt;a href=&quot;https://github.com/facebook/react/tree/HEAD/packages/react-dom/issues/30346&quot;&gt;#30346&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/facebook/react/commit/cae764ce81b1bd6c418e9e23651794b6b09208e8&quot;&gt;&lt;code&gt;cae764c&lt;/code&gt;&lt;/a&gt; Revert &amp;quot;[Re-land] Make prerendering always non-blocking (&lt;a href=&quot;https://github.com/facebook/react/tree/HEAD/packages/react-dom/issues/31268&quot;&gt;#31268&lt;/a&gt;)&amp;quot; (&lt;a href=&quot;https://github.com/facebook/react/tree/HEAD/packages/react-dom/issues/31355&quot;&gt;#31355&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/facebook/react/commit/d49123f73f12564223c890bfa36be537de2c571d&quot;&gt;&lt;code&gt;d49123f&lt;/code&gt;&lt;/a&gt; Expose prerender() for SSG in stable (&lt;a href=&quot;https://github.com/facebook/react/tree/HEAD/packages/react-dom/issues/31298&quot;&gt;#31298&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/facebook/react/commit/6c4bbc783286bf6eebd9927cb52e8fec5ad4dd74&quot;&gt;&lt;code&gt;6c4bbc7&lt;/code&gt;&lt;/a&gt; [Re-land] Make prerendering always non-blocking (&lt;a href=&quot;https://github.com/facebook/react/tree/HEAD/packages/react-dom/issues/31268&quot;&gt;#31268&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/facebook/react/commit/d8c90fa48d3addefe4b805ec56a3c65e4ee39127&quot;&gt;&lt;code&gt;d8c90fa&lt;/code&gt;&lt;/a&gt; Disable infinite render loop detection (&lt;a href=&quot;https://github.com/facebook/react/tree/HEAD/packages/react-dom/issues/31088&quot;&gt;#31088&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/facebook/react/commit/67fee58b1f72754cc77488c40c44e786572ef954&quot;&gt;&lt;code&gt;67fee58&lt;/code&gt;&lt;/a&gt; [Fizz] Start initial work immediately (&lt;a href=&quot;https://github.com/facebook/react/tree/HEAD/packages/react-dom/issues/31079&quot;&gt;#31079&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/facebook/react/commit/76aee6f39d94caa04c11be92d75d12cb9ee56494&quot;&gt;&lt;code&gt;76aee6f&lt;/code&gt;&lt;/a&gt; Revert &amp;quot;Make prerendering always non-blocking&amp;quot; (&lt;a href=&quot;https://github.com/facebook/react/tree/HEAD/packages/react-dom/issues/31080&quot;&gt;#31080&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://github.com/facebook/react/commit/0f1856c49febe96923e469f98c0b123130ea015c&quot;&gt;&lt;code&gt;0f1856c&lt;/code&gt;&lt;/a&gt; Make prerendering always non-blocking (&lt;a href=&quot;https://github.com/facebook/react/tree/HEAD/packages/react-dom/issues/31056&quot;&gt;#31056&lt;/a&gt;)&lt;/li&gt;
&lt;li&gt;Additional commits viewable in &lt;a href=&quot;https://github.com/facebook/react/commits/v19.0.0/packages/react-dom&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;details&gt;
&lt;summary&gt;Maintainer changes&lt;/summary&gt;
&lt;p&gt;This version was pushed to npm by &lt;a href=&quot;https://www.npmjs.com/~react-bot&quot;&gt;react-bot&lt;/a&gt;, a new releaser for react-dom since your current version.&lt;/p&gt;
&lt;/details&gt;
&lt;br /&gt;

Updates `@types/react-dom` from 18.2.7 to 19.0.3
&lt;details&gt;
&lt;summary&gt;Commits&lt;/summary&gt;
&lt;ul&gt;
&lt;li&gt;See full diff in &lt;a href=&quot;https://github.com/DefinitelyTyped/DefinitelyTyped/commits/HEAD/types/react-dom&quot;&gt;compare view&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/details&gt;
&lt;br /&gt;


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

  https://github.com/Skogix/agent-gpt/pull/11

-- Commit Summary --

  * Bump react-dom and @types/react-dom in /next

-- File Changes --

    M next/package-lock.json (757)
    M next/package.json (4)

-- Patch Links --

https://github.com/Skogix/agent-gpt/pull/11.patch
https://github.com/Skogix/agent-gpt/pull/11.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/agent-gpt/pull/11
You are receiving this because you are subscribed to this thread.

Message ID: &lt;Skogix/agent-gpt/pull/11@github.com&gt;
