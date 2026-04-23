MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/llm-chat <llm-chat@noreply.github.com>
Date: Wed, 19 Nov 2025 05:01:48 -0800
Subject: Re: [SkogAI/llm-chat] feat: Add system prompt customization UI=0A=0AImplements Issue #8 - System Prompt Customization=0A=0AFeatures:=0A- Settings modal with gear icon button in header=0A- 5 preset prompt templates (Default, Code Expert, Creative Writer, Concise, Teacher)=0A- Custom prompt textarea with 2000 character limit=0A- Real-time character counter with warning at 90% capacity=0A- localStorage persistence for user preferences=0A- Reset to default functionality=0A=0ATechnical changes:=0A- Added settings.js for prompt management and localStorage handling=0A- Updated index.html with modal UI and styling=0A- Modified backend (src/index.ts) to accept custom systemPrompt parameter=0A- Updated chat.js to send custom prompt with each request=0A- Updated config.js formatRequest to support systemPrompt parameter=0A=0AUser experience:=0A- Click Settings button to open modal=0A- Select preset or enter custom prompt=0A- Changes persist across sessions=0A- Apply to new conversations immediately (PR #47)
Message-ID: <SkogAI/llm-chat/pull/47/review/3482583224@github.com>
In-Reply-To: <SkogAI/llm-chat/pull/47@github.com>
References: <SkogAI/llm-chat/pull/47@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_691dbfbcbf404_c51100182838"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR implements system prompt customization functionality, enabling users to personalize the AI assistant's behavior through a settings UI. The implementation includes a modal interface with 5 preset templates, custom prompt support, localStorage persistence, and backend integration.

Key changes:
- Added a settings modal UI with preset prompt templates and custom text input
- Integrated custom system prompt parameter into the chat API request flow
- Implemented localStorage persistence for user preferences across sessions

### Reviewed Changes

Copilot reviewed 5 out of 6 changed files in this pull request and generated 6 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| src/index.ts | Added systemPrompt parameter handling to accept custom prompts from frontend |
| public/settings.js | New file implementing settings management, preset templates, localStorage persistence, and modal interactions |
| public/index.html | Added settings button, modal UI structure, and comprehensive styling for the settings interface |
| public/config.js | Updated formatRequest function to accept and forward systemPrompt parameter |
| public/chat.js | Modified to retrieve and send custom system prompt with each chat request |
| package-lock.json | Removed "peer": true flags from dev dependencies (unrelated to feature) |
</details>






---

💡 <a href="/SkogAI/llm-chat/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +const settingsButton = document.getElementById("settings-button");
+const settingsModal = document.getElementById("settings-modal");
+const closeSettings = document.getElementById("close-settings");
+const promptPreset = document.getElementById("prompt-preset");
+const systemPromptTextarea = document.getElementById("system-prompt");
+const charCounter = document.getElementById("char-counter");
+const resetPromptButton = document.getElementById("reset-prompt");
+const saveSettingsButton = document.getElementById("save-settings");

DOM element references are accessed at module load time, which will fail if the script loads before the DOM is ready. While settings.js is currently loaded at the end of the HTML body, this creates a fragile dependency on script load order. Wrap the DOM queries in a DOMContentLoaded event listener or move them inside initSettings() to ensure elements exist before access.

>  		if (!messages.some((msg) => msg.role === "system")) {
-			messages.unshift({ role: "system", content: SYSTEM_PROMPT });
+			const promptToUse = systemPrompt || SYSTEM_PROMPT;
+			messages.unshift({ role: "system", content: promptToUse });
 		}

The systemPrompt parameter from the request body is used without validation or sanitization. While the AI model itself should handle malicious input safely, there's no length limit enforcement on the backend (only a frontend maxlength attribute). Consider adding backend validation to limit systemPrompt length (e.g., 2000 characters) and type checking to ensure it's a string, preventing potential abuse or resource exhaustion.

> +	if (!prompt) {
+		alert("System prompt cannot be empty!");
+		return;
+	}
+

The empty prompt validation is inconsistent with the getSystemPrompt() function which falls back to PROMPT_PRESETS.default when empty. If the textarea is cleared and saved, users cannot actually save an empty prompt due to this check, but getSystemPrompt() would return the default anyway. Consider either allowing empty saves (and relying on the fallback) or updating the validation message to clarify that the default will be used.
```suggestion
	// Allow empty prompt; getSystemPrompt() will fall back to default if needed
```

> @@ -75,10 +75,17 @@ async function sendMessage() {
 		// Scroll to bottom
 		chatMessages.scrollTop = chatMessages.scrollHeight;
 
+		// Get custom system prompt from settings (if available)
+		const systemPrompt =
+			window.getSystemPrompt && window.getSystemPrompt();

The logical AND operator is used incorrectly here. The expression `window.getSystemPrompt && window.getSystemPrompt()` will assign the function itself (truthy) rather than its return value when the function exists. This should be `window.getSystemPrompt ? window.getSystemPrompt() : undefined` or use optional chaining: `window.getSystemPrompt?.()`.
```suggestion
			window.getSystemPrompt?.();
```

> +// Open settings modal
+function openSettings() {
+	settingsModal.classList.add("visible");
+}
+
+// Close settings modal
+function closeSettingsModal() {
+	settingsModal.classList.remove("visible");
+}
+
+// Save settings
+function saveSettings() {
+	const prompt = systemPromptTextarea.value.trim();
+
+	if (!prompt) {
+		alert("System prompt cannot be empty!");

[nitpick] Using native alert() dialogs provides poor user experience compared to inline validation messages or modal notifications. Consider implementing a more user-friendly feedback mechanism, such as displaying error messages within the modal UI with appropriate styling.

> +}
+
+// Save settings
+function saveSettings() {
+	const prompt = systemPromptTextarea.value.trim();
+
+	if (!prompt) {
+		alert("System prompt cannot be empty!");
+		return;
+	}
+
+	localStorage.setItem(STORAGE_KEY, prompt);
+	closeSettingsModal();
+
+	// Show confirmation
+	alert("Settings saved! Changes will apply to new conversations.");

[nitpick] Using native alert() for success confirmation interrupts the user flow. Consider using a non-blocking toast notification or temporary success message within the modal that auto-dismisses after a few seconds for better UX.

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/llm-chat/pull/47#pullrequestreview-3482583224
You are receiving this because you authored the thread.

Message ID: <SkogAI/llm-chat/pull/47/review/3482583224@github.com>