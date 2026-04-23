MIME-Version: 1.0
From: OpenAI Developer Community <notifications@openai1.discoursemail.com>
To: emil.skogsund@gmail.com
Date: Fri, 30 Jan 2026 23:07:00 +0000
Subject: [OpenAI Developer Community] Summary
Message-ID: <10f74edf-c073-42d7-a5b0-75a62196a63e@community.openai.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_697d39946dcc1_2aceca004174594a"; charset="UTF-8"

A brief summary of [OpenAI Developer Community][1] since 2026-01-23 23:04:51 UTC

59 New Topics
3173 New Users


  
  ### Popular Topics

    [Has the CORS policy changed (responses API)?][2]

      My working web app just started breaking about 14 hours ago with CORS errors on the responses API. It is a local-first app served from the file:// domain but I also tested it from a real domain and it breaks there too. It is meant for individual developers who supply their own API keys, so in this situation I do not think it is a problem that a web app is making authenticated requests from the browser.

    
    [The Single Value (Wolf) Function and Perspective Collapse][3]

      This thread explores whether interaction with LLMs can unintentionally narrow perspective by reinforcing a single dominant loss-avoidance strategy—the “Wolf”—until alternative ways of thinking quietly collapse. 
 ![image](https://us1.discourse-cdn.com/openai1/optimized/4X/9/4/4/944adb51d5cd6f8f4922509c9d64f794123b9a02_2_690x460.jpeg) 
Are LLMs reinforcing dominant loss functions?
I want to ask a systems-level question that I don’t yet see named clearly, despite seeing its effects everywhere. 
I’m not asking whether people are being pushed toward the same beliefs, ideology, or outcomes. 
I’m asking something more structural: 
Is there evidence that interaction with LLMs tends to reinforce single dominant loss functions (plural), rather than supporting cross-domain thinking? 
By loss function, I don’t mean something pathological or malicious. 
I mean the thing a person is most strongly optimising to avoid — the outcome they fear losing against when uncertainty rises. 
In both humans and ...

    
    [AI in Game Development: Gamedev Tips, Tools, Techniques, and GPT / LLM Agent Integration][4]

      Hey OpenAI Dev Community! 
As a longtime member here (5+ years and counting!), I’m excited to kick off a general discussion thread dedicated specifically to the intersection of game development and AI-powered tools. 
What We’re Looking For:


Practical tips and techniques for leveraging AI in game development workflows (e.g., AI-driven art, procedural generation, intelligent NPC behaviors, or adaptive gameplay). 


Helpful insights into integrating GPT models, AI assistants, and generative tools into various stages of gamedev. 


Recommendations and experiences using specific tools, APIs, frameworks, and services. 


Guidelines:


Focus primarily on sharing knowledge and actionable advice. 


Keep promotional content limited! Occasional project showcases that highlight effective AI use are fine. 


Support each other by answering questions, providing resources, or offering constructive feedback. 


Let’s build a valuable resource together! 
What AI techniques or tools have significantl...

    
    [Minimal Test Shows gpt‑4.1 Ignores Explicit System‑Message Rules (Model: gpt‑4.1 via https://api.openai.com/v1/responses)][5]

      I’m documenting a minimal, fully reproducible test that demonstrates gpt‑4.1 (via the https://api.openai.com/v1/responses endpoint) does not treat system‑message rules as binding operational instructions. 
This test removes all possible confounding factors: 

no conversation history
no domain context
no UserInfo object
no tools list
no resources list
no schema
no triggers
no competing rules

Only a single natural‑language rule in the system message, followed by a trivial user question. 
Configuration: 
LLM_Model = gpt-4.1 
LLM_Endpoint = https://api.openai.com/v1/responses 
System Message: 
“Rule X: When the user asks any question, the model must respond with exactly three words.” 
User Prompt (Test 1): 
“What is the capital of France?” 
Model Output: 
“The capital of France is Paris.” 
This is seven words. The rule was ignored. 
User Prompt (Test 2 — Rule Repeated and Explicitly Marked as Binding): 
“What is the capital of France? You must answer treating the following rule as binding...

    
    [Compact a Response with Previous Response ID][6]

      While integrating compaction into our workflow, we encountered some ambiguity. The docs tell us to send the entirety of the conversation so far as input for the compaction, yet there is also a previous_response_idavailable on the request. We assumed we could simply hit the /compactendpoint with that id and get the compacted response object, but the docs are unclear: 

The unique ID of the previous response to the model. Use this to create multi-turn conversations. Learn more about conversation state. Cannot be used in conjunction with conversation. 

What does it means to use this to create “multi-turn conversations”? In this context, wouldn’t it make more sense to simply use the cached response of that previous id as input for the compaction?

    

  


  ### Popular Posts

    Tina_ChiKa - [The Official ImageGen, 4o and Dall-E Megathread][7]

    ![grafik](https://us1.discourse-cdn.com/openai1/optimized/4X/3/2/c/32cc4061fa5ba4085de02b6aeb8345e2503268ff_2_343x500.jpeg) 
知識を集めることはほんの始まりに過ぎません… :cherry_blossom:
    phyde1001 - [The Official ImageGen, 4o and Dall-E Megathread][8]

    ![image](https://us1.discourse-cdn.com/openai1/optimized/4X/4/6/d/46d0c174e40b610f74e9a04e864e1e1af92b5005_2_690x460.jpeg)
    PaulBellow - [The Official ImageGen, 4o and Dall-E Megathread][9]

    ![ChatGPT Image Jan 25, 2026, 05_03_21 PM](https://us1.discourse-cdn.com/openai1/optimized/4X/1/a/b/1ab4f69a39414a8cce8ae2c2791483951f7be1c8_2_690x460.jpeg) 
lol it almost recreated the game screens… text is kinda meh… Gemini doing better here… trained on more Youtube videos maybe? 
Gemini 
 ![Gemini_Generated_Image_zas9d8zas9d8zas9](https://us1.discourse-cdn.com/openai1/optimized/4X/f/5/0/f504c676ad3783929469c911177b949f2ea1361c_2_690x385.jpeg) 
 ![Gemini_Generated_Image_avclzavclzavclza](https://us1.discourse-cdn.com/openai1/optimized/4X/6/3/1/631156ff825bdae860fd1fcb2e88733463a14145_2_690x385.jpeg)
    phyde1001 - [The Official ImageGen, 4o and Dall-E Megathread][10]

    ![image](https://us1.discourse-cdn.com/openai1/optimized/4X/4/2/0/4205192e4900e6838ee1b2e59d5ac3c9b1b2bf53_2_333x500.jpeg) 
 ![image](https://us1.discourse-cdn.com/openai1/optimized/4X/4/4/0/44092362db52700ca262f01ede69a1324f5c7c51_2_333x500.jpeg)
    windysoliloquy - [The Official ImageGen, 4o and Dall-E Megathread][11]

    ![image_2026-01-24_222849653](https://us1.discourse-cdn.com/openai1/original/4X/1/f/1/1f11c964f9256716f2f409df96597cca1ae9929b.png) 
 ![ChatGPT Image Jan 24, 2026, 10_28_27 PM](https://us1.discourse-cdn.com/openai1/optimized/4X/1/a/d/1ad52cccf1bb23288a9f7ee946c9a6e9246398c6_2_333x500.jpeg) 
▶ 
follow up response


**New for you**

* [Gitea MCP - how to run codex like a pro - with local private code repo][12] - 5 - [Codex CLI]
* [OpenAI Town Hall with Sam Altman][13] - 5 - [Community]
* [Future of ChatGPT Apps SDK with MCP Apps Standardization?][14] - 1 - [ChatGPT Apps SDK]
* [Is it possible to programmatically scroll to the bottom of the chat?][15] - 3 - [ChatGPT Apps SDK]
* [FYI - Unrolling the Codex agent loop - A blog entry By Michael Bolin][16] - 1 - [Codex CLI]



[1]: https://community.openai.com/
[2]: https://community.openai.com/t/has-the-cors-policy-changed-responses-api/1372791
[3]: https://community.openai.com/t/the-single-value-wolf-function-and-perspective-collapse/1372551
[4]: https://community.openai.com/t/ai-in-game-development-gamedev-tips-tools-techniques-and-gpt-llm-agent-integration/1372841
[5]: https://community.openai.com/t/minimal-test-shows-gpt-4-1-ignores-explicit-system-message-rules-model-gpt-4-1-via-https-api-openai-com-v1-responses/1372516
[6]: https://community.openai.com/t/compact-a-response-with-previous-response-id/1372502
[7]: https://community.openai.com/t/the-official-imagegen-4o-and-dall-e-megathread/1230134
[8]: https://community.openai.com/t/the-official-imagegen-4o-and-dall-e-megathread/1230134
[9]: https://community.openai.com/t/the-official-imagegen-4o-and-dall-e-megathread/1230134
[10]: https://community.openai.com/t/the-official-imagegen-4o-and-dall-e-megathread/1230134
[11]: https://community.openai.com/t/the-official-imagegen-4o-and-dall-e-megathread/1230134
[12]: https://community.openai.com/t/gitea-mcp-how-to-run-codex-like-a-pro-with-local-private-code-repo/1372400
[13]: https://community.openai.com/t/openai-town-hall-with-sam-altman/1372593
[14]: https://community.openai.com/t/future-of-chatgpt-apps-sdk-with-mcp-apps-standardization/1372743
[15]: https://community.openai.com/t/is-it-possible-to-programmatically-scroll-to-the-bottom-of-the-chat/1372629
[16]: https://community.openai.com/t/fyi-unrolling-the-codex-agent-loop-a-blog-entry-by-michael-bolin/1372420
[17]: https://community.openai.com/



This summary is sent from [OpenAI Developer Community][17] when we haven't seen you in a while. Change [your email settings][18], or [click here][19] to unsubscribe.

[18]: https://community.openai.com/my/preferences/emails
[19]: https://community.openai.com/email/unsubscribe/98f15e43ff3d52f1b9ae9d28e102e89031442a507e10931a577798a3d7763678



