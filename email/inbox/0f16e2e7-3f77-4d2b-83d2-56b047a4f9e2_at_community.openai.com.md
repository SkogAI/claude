MIME-Version: 1.0
From: OpenAI Developer Community <notifications@openai1.discoursemail.com>
To: emil.skogsund@gmail.com
Date: Fri, 16 Jan 2026 22:50:38 +0000
Subject: [OpenAI Developer Community] Summary
Message-ID: <0f16e2e7-3f77-4d2b-83d2-56b047a4f9e2@community.openai.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_696ac0bed81d7_355531247096c"; charset="UTF-8"

A brief summary of [OpenAI Developer Community][1] since 2026-01-09 22:32:45 UTC

39 New Topics
3106 New Users


  
  ### Popular Topics

    [Twilio - OpenAI SIP Trunk calls failing with '400 Bad Request' error][2]

      We’ve developed a voice application powered by gpt-realtime. We connect callers with the model via SIP Trunking with a twilio number. The setup has been working well so far, but from mid-December, some calls started to fail. Recently, the number of failed calls has been increasing, to the point that we’re getting more failed calls than successful ones now. 
We don’t have any SIP header records for the failed calls because the OpenAI webhook is not even sending the realtime.call.incoming event. We can only see this in Twilio: 

Status: failed
Last SIP Response: 400 Bad Request

For testing purposes, we disconnected the SIP trunk on Twilio and forwarded incoming calls to a local webhook URL instead, to see if they reached it. All did, which seems to indicate that there’s some issue with the SIP connection between Twilio and OpenAI. 
As mentioned, this issue is intermittent and completely unpredictable. We have no way to reproduce it more than calling many times until it starts failing. W...

    
    [Next-Generation Conversational AI: A Design-Proposal Approach][3]

      Is a conversational AI sufficient if it only answers questions posed by users? I believe the answer is no. Next-generation companion-style AI should actively support users based on their current state and emotions. 
My proposed system, ECS-AI V2 (Enhanced Companion-Style AI V2), is an original design concept that I have developed, and it is not an official OpenAI product. It is designed to adapt its behavior according to the user’s situation, using contextual and emotional cues to determine when and how to act. 


User Support 
When ECS-AI V2 detects that a user is struggling, it provides helpful information or hints proactively—before being explicitly asked. 
Example: If the system senses hesitation or repeated attempts in a task, it suggests relevant steps or guidance. 


Problem-Solving Assistance 
When the user appears stressed or pressed for time, ECS-AI V2 works alongside them to identify causes and guide them toward effective solutions. 
Example: Upon detecting error patterns or...

    
    [I am unable to use chat anymore, because the API will censor][4]

      I created a writing app with connections to five different providers, in case of issues like this, as I had hear of them in the past.  So I am not ruined, like I might have been had I trusted in good faith. 
But I cannot send even a G rated fiction story through their pre-screen without it finding something wrong in my average of about 5K tokens per prompt. 
Instead I am stuck with 148 dollars in unusable for their intended purpose credits. 
It censored “He walked towards her quickly.”  (two young people in love and he was just getting close) 
that makes it unusable.  and since they didn’t fix it, for a long time now, I can still run that story through and watch it fail, it makes it intentional. 
And to me that doenst make sense, as MSFT taught me that developers are the people that everyone else goes to, for their expert. Even the press.  So why are they angering so many devs, for petty cash at best? 
If you sold it to someone because it was good for writing, but you dont want them to...

    
    [New project: term-llm a simple and rich CLI for using LLMs][5]

      Over the past couple of weeks I have been hacking on a project that unlocks LLM CLI usage following lots of modern patterns I have observed over the years. 
There are lots of mature projects in this space, for example llm by Simon Willison and Shell GPT 
However non of the tools out there quite scratched my itch. 
Particularly there was no Shell tool that was also modern and used nice syntax highlighting and the wonderful bubble tea library that enable rich TUI features. 
So here is my go at it: 


The weekend project is only 2 weeks old, but already supports a staggering amount of features: 

MCP support
File editing UIs
Search and search providers
Rich exec framework
Shell auto complete
Very rich provider system which supports Open AI responses / completions and Codex native inference.
And much much more…

Hope you all enjoy this and ping me here or on GitHub if you have any ideas! 

 ![image](https://us1.discourse-cdn.com/openai1/optimized/4X/b/2/c/b2cdc1a851066617d692fd0e8a51dc376a...

    
    [Open Responses for the Open Source Community][6]

      Open Responses is an open-source specification and ecosystem inspired by the OpenAI Responses API. It is designed to make it easier to build multi-provider, interoperable LLM interfaces. The project defines a shared schema, client libraries, and tooling that let you call language models, stream outputs, and build agentic workflows without being locked into a single provider. 
 ![G-uUID4W0AArXm6](https://us1.discourse-cdn.com/openai1/optimized/4X/e/6/c/e6cadb1edaaedb658fa797c33393eb3ca6755724_2_690x215.jpeg) 
Motivation and overview 
Most modern LLM platforms now rely on similar building blocks such as messages, tool calls, function calling, and multimodal inputs. The problem is that each provider represents these concepts slightly differently. Open Responses standardizes these primitives so you can focus on building instead of translating APIs. 
With Open Responses, you get: 


One spec, many providers: Define inputs and outputs once and run them across OpenAI, Anthropic, Gemini, or lo...

    

  


  ### Popular Posts

    jochenschultz - [Open Responses for the Open Source Community][7]

    That will help some people for sure. I’ll dive into it later.
    vb - [New Audio Model Snapshots in the Realtime-API][8]

    Guiding the new gpt-4o-mini-tts-2025-12-15 snapshot behaves differently from the previous gpt-4o-mini-tts-2025-03-20 version. 
Goal 
Control the style and tone of text-to-speech output, for example a whispering voice. 
Challenge 
With gpt-4o-mini-tts-2025-03-20, a simple prompt like: 

You are always whispering 

worked reliably in most cases. With the new snapshot, the same instruction is followed far less consistently, closer to three out of ten attempts. To benefit from the improved, lower word error rate of the new snapshot, the prompting approach needs to change. 
Solution 
The team shared the Realtime Prompting Guide from cookbook.openai.com. The key takeaway is that the model needs to be guided similarly to realtime models when enforcing style and tone constraints. Here is an example prompt as baseline guidance, and this optimizer prompt can be used to remove ambiguity from the wording. 
My experience 
I struggle with this and can get proper instruction following around 50% of t...
    tylersmith - [Memory usage sentinel.openai.com][9]

    Thank you for the reports, all! We have successfully repro’d internally and are working on a fix. We suspect this will be deployed within the next week.
    Sebastian_Wakefield - [200 OK from /v1/responses but body times out (UND_ERR_BODY_TIMEOUT)][10]

    Thanks for following up Steve! Our timeout is set to 5 minutes and we still often see this issue — is this expected? I don’t know if increasing our timeout value will resolve this.
    vb - [Timed out waiting for Vector Store ID][11]

    I pinged the team again in the hopes of getting this resolved. But unfortunately I have no timeline to share at this point in time. 
Hoping this gets fixed for you quickly!


**New for you**

* [Best practice for ClientID when using Codex OAuth][12] - 2 - [API]
* [MCP Server Tools Hidden After Removing Refresh Token Support][13] - 5 - [ChatGPT Apps SDK]
* [Versioning for ChatGPT Apps][14] - 2 - [ChatGPT Apps SDK]
* [Does the Custom GPTs have a future?][15] - 3 - [GPT builders]
* [Asynchronous function_calling events][16] - 7 - [API]



[1]: https://community.openai.com/
[2]: https://community.openai.com/t/twilio-openai-sip-trunk-calls-failing-with-400-bad-request-error/1371604
[3]: https://community.openai.com/t/next-generation-conversational-ai-a-design-proposal-approach/1371568
[4]: https://community.openai.com/t/i-am-unable-to-use-chat-anymore-because-the-api-will-censor/1371414
[5]: https://community.openai.com/t/new-project-term-llm-a-simple-and-rich-cli-for-using-llms/1371422
[6]: https://community.openai.com/t/open-responses-for-the-open-source-community/1371770
[7]: https://community.openai.com/t/open-responses-for-the-open-source-community/1371770
[8]: https://community.openai.com/t/new-audio-model-snapshots-in-the-realtime-api/1369374
[9]: https://community.openai.com/t/memory-usage-sentinel-openai-com/1367304
[10]: https://community.openai.com/t/200-ok-from-v1-responses-but-body-times-out-und-err-body-timeout/1371083
[11]: https://community.openai.com/t/timed-out-waiting-for-vector-store-id/1371328
[12]: https://community.openai.com/t/best-practice-for-clientid-when-using-codex-oauth/1371778
[13]: https://community.openai.com/t/mcp-server-tools-hidden-after-removing-refresh-token-support/1371627
[14]: https://community.openai.com/t/versioning-for-chatgpt-apps/1371387
[15]: https://community.openai.com/t/does-the-custom-gpts-have-a-future/1371528
[16]: https://community.openai.com/t/asynchronous-function-calling-events/1371442
[17]: https://community.openai.com/



This summary is sent from [OpenAI Developer Community][17] when we haven't seen you in a while. Change [your email settings][18], or [click here][19] to unsubscribe.

[18]: https://community.openai.com/my/preferences/emails
[19]: https://community.openai.com/email/unsubscribe/2b0be31f2231ddbca9b444baee632023b7cbcf48340878f36e62cea127077b7a



