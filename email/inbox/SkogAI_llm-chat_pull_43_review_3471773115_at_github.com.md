MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/llm-chat <llm-chat@noreply.github.com>
Date: Mon, 17 Nov 2025 01:21:35 -0800
Subject: Re: [SkogAI/llm-chat] feat: Add markdown rendering with syntax highlighting=0A=0AImplements Issue #2 - Add Markdown Rendering for AI Responses=0A=0AFeatures added:=0A- Markdown parsing using marked.js (v11.1.1)=0A- XSS protection using DOMPurify (v3.0.8)=0A- Syntax highlighting for code blocks using highlight.js (v11.9.0)=0A- Copy-to-clipboard buttons on all code blocks=0A- Comprehensive CSS styling for markdown elements=0A=0AChanges:=0A- Added CDN links for marked.js, DOMPurify, and highlight.js=0A- Created renderMarkdown() function with XSS sanitization=0A- Created addCopyButtonsToCodeBlocks() function for code block UX=0A- Updated message rendering to use innerHTML with sanitized markdown=0A- Added CSS for code blocks, headers, lists, tables, blockquotes, and links=0A- User messages remain HTML-escaped for security=0A=0ASecurity:=0A- DOMPurify sanitizes all HTML to prevent XSS attacks=0A- User input is HTML-escaped before display=0A- Only safe HTML tags and attributes are  (PR #43)
Message-ID: <SkogAI/llm-chat/pull/43/review/3471773115@github.com>
In-Reply-To: <SkogAI/llm-chat/pull/43@github.com>
References: <SkogAI/llm-chat/pull/43@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_691ae91f982d4_eb1108198639"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR implements markdown rendering for AI responses in a chat application, adding support for formatted text, code blocks with syntax highlighting, and copy-to-clipboard functionality. The implementation uses marked.js for markdown parsing, DOMPurify for XSS protection, and highlight.js for syntax highlighting.

**Key Changes:**
- Integrated three CDN libraries (marked.js v11.1.1, DOMPurify v3.0.8, highlight.js v11.9.0) for markdown rendering and security
- Created `renderMarkdown()` and `addCopyButtonsToCodeBlocks()` functions to process and enhance AI responses
- Added comprehensive CSS styling for markdown elements including code blocks, tables, lists, and headers

### Reviewed Changes

Copilot reviewed 3 out of 3 changed files in this pull request and generated 10 comments.

| File | Description |
| ---- | ----------- |
| public/index.html | Added CDN script/link tags for markdown libraries and extensive CSS styling for rendered markdown elements including code blocks, tables, and copy buttons |
| public/chat.js | Implemented markdown rendering functions, configured marked.js with syntax highlighting, updated message display logic to render markdown for assistant messages while escaping HTML for user messages |
| MARKDOWN_TEST.md | Added test documentation file with markdown examples to verify rendering functionality |





---

💡 <a href="/SkogAI/llm-chat/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> + */
+function renderMarkdown(content) {
+	if (typeof marked === 'undefined' || typeof DOMPurify === 'undefined') {
+		// Fallback to plain text if libraries not loaded
+		return content.replace(/</g, '&lt;').replace(/>/g, '&gt;');
+	}
+
+	// Parse markdown to HTML
+	const rawHtml = marked.parse(content);
+
+	// Sanitize HTML to prevent XSS
+	const cleanHtml = DOMPurify.sanitize(rawHtml, {
+		ALLOWED_TAGS: ['p', 'br', 'strong', 'em', 'u', 's', 'code', 'pre', 'a', 'ul', 'ol', 'li',
+		               'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'blockquote', 'table', 'thead', 'tbody',
+		               'tr', 'th', 'td', 'img', 'hr', 'span'],
+		ALLOWED_ATTR: ['href', 'src', 'alt', 'title', 'class', 'target', 'rel']

The DOMPurify configuration allows `target` and `rel` attributes on links, but doesn't enforce safe values. Links with `target="_blank"` should also have `rel="noopener noreferrer"` for security. Consider adding `ALLOW_ARIA_ATTR: true` for better accessibility and configuring link behavior:
```javascript
ALLOWED_ATTR: ['href', 'src', 'alt', 'title', 'class'],
FORBID_ATTR: ['target'],  // Or enforce with a hook
```
Or use DOMPurify's `ADD_ATTR` hook to ensure proper rel attributes.

>  					if (text) {
 						responseText += text;
-						assistantMessageEl.querySelector("p").textContent = responseText;
+						// Render markdown with XSS protection
+						assistantMessageEl.innerHTML = renderMarkdown(responseText);
+						// Add copy buttons to any new code blocks
+						addCopyButtonsToCodeBlocks(assistantMessageEl);

Performance concern: `renderMarkdown()` and `addCopyButtonsToCodeBlocks()` are called on every streaming chunk, which can be very expensive. This causes the entire message to be re-parsed and re-sanitized repeatedly, and can create multiple duplicate wrapper elements and buttons.

Consider accumulating the text and only rendering periodically (e.g., debounced or every N chunks) during streaming, with a final render when complete.

> @@ -176,7 +273,17 @@ async function sendMessage() {
 function addMessageToChat(role, content) {
 	const messageEl = document.createElement("div");
 	messageEl.className = `message ${role}-message`;
-	messageEl.innerHTML = `<p>${content}</p>`;
+
+	// Render markdown for assistant messages, escape HTML for user messages
+	if (role === 'assistant') {
+		messageEl.innerHTML = renderMarkdown(content);
+		addCopyButtonsToCodeBlocks(messageEl);
+	} else {
+		// For user messages, escape HTML to prevent XSS
+		const escapedContent = content.replace(/</g, '&lt;').replace(/>/g, '&gt;');

The HTML escaping for user messages is incomplete. It only escapes `<` and `>`, but doesn't handle other HTML entities like `&`, `"`, and `'`, which can lead to issues with content display or potential XSS vectors if content is later processed.

Use a more comprehensive escaping function:
```javascript
const escapedContent = content
  .replace(/&/g, '&amp;')
  .replace(/</g, '&lt;')
  .replace(/>/g, '&gt;')
  .replace(/"/g, '&quot;')
  .replace(/'/g, '&#039;');
```
```suggestion
		const escapedContent = content
			.replace(/&/g, '&amp;')
			.replace(/</g, '&lt;')
			.replace(/>/g, '&gt;')
			.replace(/"/g, '&quot;')
			.replace(/'/g, '&#039;');
```

> +			.code-block-wrapper {
+				position: relative;
+			}
+
+			.copy-button {
+				position: absolute;
+				top: 8px;
+				right: 8px;
+				padding: 4px 8px;
+				background-color: var(--primary-color);
+				color: white;
+				border: none;
+				border-radius: 4px;
+				cursor: pointer;
+				font-size: 0.75rem;
+				opacity: 0.7;

The copy button has low contrast with `opacity: 0.7` by default, which may not meet WCAG accessibility standards. Consider using a higher default opacity (e.g., 0.85-0.9) or a different approach to indicate interactivity while maintaining sufficient contrast.
```suggestion
				opacity: 0.9;
```

> @@ -176,7 +273,17 @@ async function sendMessage() {
 function addMessageToChat(role, content) {
 	const messageEl = document.createElement("div");
 	messageEl.className = `message ${role}-message`;
-	messageEl.innerHTML = `<p>${content}</p>`;
+
+	// Render markdown for assistant messages, escape HTML for user messages
+	if (role === 'assistant') {
+		messageEl.innerHTML = renderMarkdown(content);
+		addCopyButtonsToCodeBlocks(messageEl);
+	} else {
+		// For user messages, escape HTML to prevent XSS
+		const escapedContent = content.replace(/</g, '&lt;').replace(/>/g, '&gt;');

The HTML escaping logic is duplicated between the fallback in `renderMarkdown()` (line 33) and here. Consider extracting it into a reusable `escapeHtml()` function to improve maintainability and ensure consistency:
```javascript
function escapeHtml(text) {
  return text
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;');
}
```

> +			try {
+				await navigator.clipboard.writeText(code);
+				copyButton.textContent = 'Copied!';
+				copyButton.classList.add('copied');
+
+				setTimeout(() => {
+					copyButton.textContent = 'Copy';
+					copyButton.classList.remove('copied');
+				}, 2000);
+			} catch (err) {
+				console.error('Failed to copy:', err);
+				copyButton.textContent = 'Failed';
+				setTimeout(() => {
+					copyButton.textContent = 'Copy';
+				}, 2000);

The clipboard API requires a secure context (HTTPS) and may not be available in all browsers or contexts. Consider adding a fallback mechanism or checking for API availability before creating the copy button:
```javascript
if (!navigator.clipboard) {
  console.warn('Clipboard API not available');
  return;
}
```
```suggestion
			if (navigator.clipboard && window.isSecureContext) {
				try {
					await navigator.clipboard.writeText(code);
					copyButton.textContent = 'Copied!';
					copyButton.classList.add('copied');

					setTimeout(() => {
						copyButton.textContent = 'Copy';
						copyButton.classList.remove('copied');
					}, 2000);
				} catch (err) {
					console.error('Failed to copy:', err);
					copyButton.textContent = 'Failed';
					setTimeout(() => {
						copyButton.textContent = 'Copy';
					}, 2000);
				}
			} else {
				// Fallback for older browsers
				try {
					const textarea = document.createElement('textarea');
					textarea.value = code;
					// Prevent scrolling to bottom
					textarea.style.position = 'fixed';
					textarea.style.top = 0;
					textarea.style.left = 0;
					textarea.style.width = '2em';
					textarea.style.height = '2em';
					textarea.style.padding = 0;
					textarea.style.border = 'none';
					textarea.style.outline = 'none';
					textarea.style.boxShadow = 'none';
					textarea.style.background = 'transparent';
					document.body.appendChild(textarea);
					textarea.select();
					document.execCommand('copy');
					document.body.removeChild(textarea);
					copyButton.textContent = 'Copied!';
					copyButton.classList.add('copied');
					setTimeout(() => {
						copyButton.textContent = 'Copy';
						copyButton.classList.remove('copied');
					}, 2000);
				} catch (err) {
					console.error('Fallback copy failed:', err);
					copyButton.textContent = 'Failed';
					setTimeout(() => {
						copyButton.textContent = 'Copy';
					}, 2000);
				}
```

> +function addCopyButtonsToCodeBlocks(element) {
+	const codeBlocks = element.querySelectorAll('pre code');
+
+	codeBlocks.forEach((codeBlock) => {
+		const pre = codeBlock.parentElement;
+
+		// Skip if button already exists
+		if (pre.querySelector('.copy-button')) return;
+
+		// Wrap pre in a container for positioning
+		const wrapper = document.createElement('div');
+		wrapper.className = 'code-block-wrapper';
+		pre.parentNode.insertBefore(wrapper, pre);
+		wrapper.appendChild(pre);

The button existence check on line 61 may not prevent duplicate wrappers. If `addCopyButtonsToCodeBlocks()` is called multiple times (as it is in streaming mode on lines 222), the code will wrap the pre element again even if a button already exists, creating nested wrapper divs.

The check should verify if the pre is already wrapped: `if (pre.parentElement?.className === 'code-block-wrapper') return;`

> +
+	codeBlocks.forEach((codeBlock) => {
+		const pre = codeBlock.parentElement;
+
+		// Skip if button already exists
+		if (pre.querySelector('.copy-button')) return;
+
+		// Wrap pre in a container for positioning
+		const wrapper = document.createElement('div');
+		wrapper.className = 'code-block-wrapper';
+		pre.parentNode.insertBefore(wrapper, pre);
+		wrapper.appendChild(pre);
+
+		// Create copy button
+		const copyButton = document.createElement('button');
+		copyButton.className = 'copy-button';

The copy button lacks accessibility attributes. Add `aria-label` and `type="button"` for better screen reader support and to prevent form submission if this button is used within a form context.

```javascript
copyButton.type = 'button';
copyButton.setAttribute('aria-label', 'Copy code to clipboard');
```
```suggestion
		copyButton.className = 'copy-button';
		copyButton.type = 'button';
		copyButton.setAttribute('aria-label', 'Copy code to clipboard');
```

> +			return hljs.highlightAuto(code).value;
+		},
+		breaks: true,
+		gfm: true
+	});
+}
+
+/**
+ * Renders markdown content with XSS protection and syntax highlighting
+ * @param {string} content - The markdown content to render
+ * @returns {string} - Sanitized HTML
+ */
+function renderMarkdown(content) {
+	if (typeof marked === 'undefined' || typeof DOMPurify === 'undefined') {
+		// Fallback to plain text if libraries not loaded
+		return content.replace(/</g, '&lt;').replace(/>/g, '&gt;');

The fallback escaping is incomplete - it only escapes `<` and `>` but not other HTML entities like `&`, `"`, and `'`. This is the same issue as in the user message escaping. Use comprehensive escaping:
```javascript
return content
  .replace(/&/g, '&amp;')
  .replace(/</g, '&lt;')
  .replace(/>/g, '&gt;')
  .replace(/"/g, '&quot;')
  .replace(/'/g, '&#039;');
```
```suggestion
		return content
			.replace(/&/g, '&amp;')
			.replace(/</g, '&lt;')
			.replace(/>/g, '&gt;')
			.replace(/"/g, '&quot;')
			.replace(/'/g, '&#039;');
```

> +		highlight: function(code, lang) {
+			if (lang && hljs.getLanguage(lang)) {
+				try {
+					return hljs.highlight(code, { language: lang }).value;
+				} catch (err) {
+					console.error('Highlight error:', err);
+				}
+			}
+			return hljs.highlightAuto(code).value;

The highlight function is missing a check for `hljs` existence before calling `hljs.highlightAuto()` on line 18. If highlight.js isn't available when this function executes (even though marked.js is), it will throw a ReferenceError.

Add safety check:
```javascript
highlight: function(code, lang) {
	if (typeof hljs === 'undefined') return code;
	if (lang && hljs.getLanguage(lang)) {
		// ... existing code
	}
	return hljs.highlightAuto(code).value;
}
```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/llm-chat/pull/43#pullrequestreview-3471773115
You are receiving this because you authored the thread.

Message ID: <SkogAI/llm-chat/pull/43/review/3471773115@github.com>