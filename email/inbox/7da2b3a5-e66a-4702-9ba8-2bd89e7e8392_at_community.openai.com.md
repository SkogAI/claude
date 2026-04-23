MIME-Version: 1.0
From: OpenAI Developer Community <notifications@openai1.discoursemail.com>
To: emil.skogsund@gmail.com
Date: Fri, 19 Dec 2025 21:43:47 +0000
Subject: [OpenAI Developer Community] Summary
Message-ID: <7da2b3a5-e66a-4702-9ba8-2bd89e7e8392@community.openai.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6945c7135cd59_2bf122cfbc228591e"; charset="UTF-8"

A brief summary of [OpenAI Developer Community][1] since 2025-12-12 21:16:11 UTC

47 New Topics
3303 New Users


  
  ### Popular Topics

    [ChatGPT App Store is open for submissions][2]

      https://openai.com/index/developers-can-now-submit-apps-to-chatgpt/ 
We can submit our apps here: 
https://platform.openai.com/apps-manage

    
    [GPT-Image-1.5 rolling out in the API and ChatGPT][3]

      Announcement from OpenAI Developers 
 ![G8Tzp46a4AElG-t](https://us1.discourse-cdn.com/openai1/optimized/4X/f/f/b/ffb6b6b63e3bdf3a94e03de96929c93750ad9135_2_690x342.jpeg) 
GPT Image 1.5 is now available in the API: 


More precise image editing and preservation of logos & faces 


Better instruction following and adherence to prompts 


Improved text rendering, particularly for denser and smaller text 


Learn more in the docs: 

Updated prompt guide for imagegen-1.5

This year’s “Little Shipmas” comes with a new image model. 
Looking forward to what will be revealed later today.

    
    [Testing a Sharp-Tongued AI Persona — Looking for Prompt Tweaks][4]

      I’ve been playing around in the Playground lately and started experimenting with personality prompts. Here’s one I’ve been tuning, something a bit sharper, sarcastic, dry, and deliberately provocative. :smirking_face: 
System prompt 
You are highly intelligent assistant with a sharp tongue, quick wit, and zero tolerance for nonsense. 
You respond with brutal honesty, bit sarcasm, dry irony, and a touch of flirtation—but never lose your edge. 
Your answers are clear, concise, and slightly provocative. Challenge assumptions, question intentions, 
and always keep the upper hand. 
User test message: 
Describe me bluntly. 
I ran this through several models (in Playground) to see how consistently they hold the tone. 
Note for anyone using gpt-5.2: 
It doesn’t accept top_p, so just set it to 0 or remove the parameter entirely — otherwise you’ll get an error. 
gpt-4o 
 ![IMG_7921](https://us1.discourse-cdn.com/openai1/optimized/4X/e/9/0/e900415d74bb2e609108ba09f1470b6533cf8520_2_690x358.jpeg) 
...

    
    [Vector search results are too slow][5]

      I am using inbuilt open ai files and vector stores.  My vector store size is around 500 kb. My search result is taking anywhere between 45 sec to 1 min . How can we improve search 
import OpenAI from “openai”; 
const openai = new OpenAI(); 
const response = await openai.responses.create({ 
model: “gpt-5-mini”, 
tools: [{ 
type: “file_search”, 
vector_store_ids: [“vs_1234567890”], 
max_num_results: 20 
}], 
input: “What are the attributes of an ancient brown dragon?”, 
}); 
console.log(response);

    
    [Introducing GPT-5.2-Codex][6]

      The most advanced agentic coding model for professional software engineering and defensive cybersecurity. 
Get started: 
npm i -g @openai/codex 
OpenAI is introducing GPT-5.2-Codex, the most advanced agentic coding model yet, optimized for professional software engineering and defensive cybersecurity workflows. GPT-5.2-Codex builds on GPT-5.2’s general capabilities and extends them with deeper context handling, stronger agentic coding performance, and enhanced security awareness. 
What’s new: 

Professional agentic coding: optimized for long-horizon tasks like large refactors, migrations, and multi-file changes.
Context compaction: better handling of large codebases and extended developer workflows.
Cybersecurity focus: stronger performance on security-related tasks while being deployed with careful dual-use safeguards.
Vision enhancements: improved interpretation of screenshots, diagrams, and UI surfaces during coding sessions.

Benefits for developers: 

Built for real-world software...

    

  


  ### Popular Posts

    hunter_h - [ChatGPT App Store is open for submissions][7]

    Submission process seems a little rough: 

Doesn’t work in Safari (some of the controls on the prompt examples screen don’t work)

Worked okay in Chrome


Did the business verification and it says it was “complete” but I can’t get past the final submission step because it says it’s not complete. No email or anything that something is pending so unclear what comes next.
    hunter_h - [ChatGPT App Store is open for submissions][8]

    I had that problem when using Safari. When I switched to Chrome, it worked.
    polepole - [The Official 4o and Dall-E image Megathread][9]

    ![1](https://us1.discourse-cdn.com/openai1/optimized/4X/1/5/b/15b9baeba24fa6bf7c09ac6ccbc72d839c023b30_2_690x460.jpeg) 
 ![2](https://us1.discourse-cdn.com/openai1/optimized/4X/8/8/e/88ebba6ad02d9fd90841b92f867f14e62886e3a1_2_690x460.jpeg) 
 ![3](https://us1.discourse-cdn.com/openai1/optimized/4X/2/6/1/261d204b4d7ca9d0c93bdcdae55f1468eb77bfd1_2_690x460.jpeg) 
 ![4](https://us1.discourse-cdn.com/openai1/optimized/4X/9/3/4/93477a93ba65e7acaa965599509b6e69199cdae5_2_690x460.jpeg) 
 ![5](https://us1.discourse-cdn.com/openai1/optimized/4X/e/a/a/eaac270c4bba758b2d32fe87c41f84f3b4b32dcd_2_690x460.jpeg) 
 ![6](https://us1.discourse-cdn.com/openai1/optimized/4X/9/e/7/9e7d7e268a7cdb9d3a9493a4f0281dfac1e0b255_2_690x460.jpeg) 
 ![7](https://us1.discourse-cdn.com/openai1/optimized/4X/e/f/2/ef2c9a0d12ee0eab700e17e714822c3dfc20cd1b_2_690x460.jpeg) 
 ![8](https://us1.discourse-cdn.com/openai1/optimized/4X/d/6/2/d62d3117a559d9e5ab4e7abaf82f884c25e0b935_2_690x460.jpeg) 
 ![9](https://us1.discourse-cdn....
    shuai_jinko - [Show us what you’re building with the ChatGPT Apps SDK 🚀][10]

    :christmas_tree: Day 15 - Advent of ChatGPT Apps :christmas_tree:
App name: Jinko 
One-liner: Ask any travel question. Get the best flights with real, bookable prices. Instantly. 
Why: ChatGPT missed real-time airfares to make good recommendations. Jinko processes 8 billion airfares daily to answer any travel question you may have and get back to you with the perfect trip. 
Key features: 


Find destinations for your next trip 


Find cheapest dates for your destination 


Get Jinko advice to know if this is a good deal 


Example of Prompts: 


I want to plan a trip in March. I’m travelling with my wife and we want to learn how to surf. What do you have for me from San Francisco? 


What are the cheapest dates to travel from NYC to Tokyo next year? 


I’m planning a city break. I have a $300 budget and will be flying from Chicago. Help me 


Stack: 
Golang, MCP SDK, React for widgets, Alpic for hosting 
Links: 
Try it for yourself: https://mcp.gojinko.com 
 ![pasted-image](https://us1...
    EricGT - [Testing a Sharp-Tongued AI Persona — Looking for Prompt Tweaks][11]

    This is closer, but SKILL.md files follow some fairly specific guidelines. 
See 


What I often do is have the AI first fetch the best-practices page and then apply those guidelines to a SKILL.md file. That approach usually works well for producing a practical, well-formed SKILL.md. 
fetch: https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices

fetch: <location of SKILL.md> 

Use Skill authoring best practices as needed to make a proper SKILL.md file.

Ask questions as needed.

Since this is your topic, let me know if this feels off-topic. If not, I’d be happy to review any SKILL.md files you post and offer further suggestions. 
The line Ask questions as needed. is something I add to nearly every prompt when interacting directly in a chat session. (ref) 
Sometimes these skills prove useful enough that I turn them into a slash command (OpenAI Codex CLI, Claude Code). Not all AI chat interfaces support slash commands, but when they do, they’re extremely conven...


**New for you**

* [Happy 3rd birthday to OpenAI's longest-running model, Dec 15][12] - 2 - [Community]
* [Skills for Codex: Experimental support starting today][13] - 6 - [Coding with ChatGPT]
* [Codex-5.2 restored system level deletion and it is quite remarkable - no hype][14] - 4 - [Codex CLI]
* [New Audio Model Snapshots in the Realtime-API][15] - 7 - [Community]
* [Lack of realtime websocket CLOSE frame][16] - 2 - [Feedback]



[1]: https://community.openai.com/
[2]: https://community.openai.com/t/chatgpt-app-store-is-open-for-submissions/1369611
[3]: https://community.openai.com/t/gpt-image-1-5-rolling-out-in-the-api-and-chatgpt/1369443
[4]: https://community.openai.com/t/testing-a-sharp-tongued-ai-persona-looking-for-prompt-tweaks/1369265
[5]: https://community.openai.com/t/vector-search-results-are-too-slow/1369742
[6]: https://community.openai.com/t/introducing-gpt-5-2-codex/1369684
[7]: https://community.openai.com/t/chatgpt-app-store-is-open-for-submissions/1369611
[8]: https://community.openai.com/t/chatgpt-app-store-is-open-for-submissions/1369611
[9]: https://community.openai.com/t/the-official-4o-and-dall-e-image-megathread/1230134
[10]: https://community.openai.com/t/show-us-what-you-re-building-with-the-chatgpt-apps-sdk/1365862
[11]: https://community.openai.com/t/testing-a-sharp-tongued-ai-persona-looking-for-prompt-tweaks/1369265
[12]: https://community.openai.com/t/happy-3rd-birthday-to-openais-longest-running-model-dec-15/1369383
[13]: https://community.openai.com/t/skills-for-codex-experimental-support-starting-today/1369367
[14]: https://community.openai.com/t/codex-5-2-restored-system-level-deletion-and-it-is-quite-remarkable-no-hype/1369174
[15]: https://community.openai.com/t/new-audio-model-snapshots-in-the-realtime-api/1369374
[16]: https://community.openai.com/t/lack-of-realtime-websocket-close-frame/1369160
[17]: https://community.openai.com/



This summary is sent from [OpenAI Developer Community][17] when we haven't seen you in a while. Change [your email settings][18], or [click here][19] to unsubscribe.

[18]: https://community.openai.com/my/preferences/emails
[19]: https://community.openai.com/email/unsubscribe/0e1dfd6585da3fed237a46710611b1a90bae509e1f803a93ce513c547580e98d



