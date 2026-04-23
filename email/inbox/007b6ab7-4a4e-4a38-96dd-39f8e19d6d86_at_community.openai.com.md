MIME-Version: 1.0
From: OpenAI Developer Community <notifications@openai1.discoursemail.com>
To: emil.skogsund@gmail.com
Date: Fri, 23 Jan 2026 23:04:51 +0000
Subject: [OpenAI Developer Community] Summary
Message-ID: <007b6ab7-4a4e-4a38-96dd-39f8e19d6d86@community.openai.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6973fe938d42a_2ac4a476456824"; charset="UTF-8"

A brief summary of [OpenAI Developer Community][1] since 2026-01-16 22:50:38 UTC

27 New Topics
3268 New Users


  
  ### Popular Topics

    [SendFollowUpMessage - cannot be used reliably onSuccess of a tool call][2]

      I’m facing a use case that seems quite legitimate where: 

The user clicks on a button that triggers a toolCall on my server (let’s say a search).
I want to send a follow up message to the model with a summary of the toolCall in the success callback of the toolCall.

I’m seeing this warning in chatGPT: “ 
main-DysC7zh_.js:2 Method `sendFollowUpMessage` called without synchronous user event”. 
After a bit of digging, i can see that my sendFollowUpMessage is triggered only if it comes from a transient user activation Transient activation - Glossary | MDN which has a timeout of around 5 seconds. 
So if my toolCall is <5seconds (difficult with some of the current latencies of chatGPT on toolCalls), my sendFollowUpMessage goes through, and if it’s >5 seconds, it gets blocked. 
Just wanted to raise this issue, I feel like this conditional blocking of the sendFollowUpMessage is too restrictive as it sounds very natural to wakeUp chatGPT onSuccess of a toolCall triggered via the UI.

    
    [Setting the document's base URI violates the following CSP directive: "base-uri 'self'"][3]

      When an MCP server exposes OpenAI CSP rules, the sandbox automatically adds a meta tag to its iframe containing all the rules. It also includes a base-uri ‘self’ directive whose value does not seem to be configurable at the moment. 
This directive prevents the use of an HTML  tag, which previously allowed the use of relative paths for assets such as images. When using Vite, for example, this makes necessary to rewrite all relative paths to full URLs by prefixing them with an origin during the build phase. 
I understand this has been done for security reasons, but would it be possible to make it configurable in the resource meta object? It should not pose any security risk if the domain used as the base is declared in the server CSP configuration.

    
    [Voice Instruction with gpt-4o-mini-tts][4]

      I’m trying to generate speech using gpt-4o-mini-tts with onyx voice and the following instructions: 
Talk as a 38 year old Male with strong Boston accents. 
Delivery: Natural conversational with strong Boston accents 
Emotion: reserved 
However, it doesn’t seem to work. 
Anyone has a trick to make it sound like someone from north east US? 
Thanks!

    
    [Firefox: Error: Method setWidgetProps not found: unexpected nullish value: undefined][5]

      On Firefox, some components are stuck on skeleton loading and report as finished rendering even though they don’t, it happens on already published apps too, such as Booking.com 
 ![image](https://us1.discourse-cdn.com/openai1/optimized/4X/e/1/a/e1a6800981b6e62fb9529f3150d601dd659e054f_2_343x500.png)

    
    [GPT-5.1/5.2: message.output_text.logprobs is empty when Structured Outputs (json_schema) is enabled in Responses API][6]

      Hi all, 
I’m trying to use token logprobs as a lightweight “confidence” signal for classification labels. I can reliably get message.output_text.logprobs when Structured Outputs are NOT enabled, but when I enable Structured Outputs (json_schema), GPT-5.1 (and GPT-5.2 in my tests) returns logprobs=[] even though I request them via include=["message.output_text.logprobs"]. 
This seems related to other reports about missing logprobs / logprobs behavior: 


Related: discussion 1 (missing logprobs in responses) 


Related: discussion_2 (structured outputs thread) 


What I’m doing


Endpoint: POST /v1/responses via openai-python (AsyncOpenAI) 


Requesting logprobs: include=["message.output_text.logprobs"] 


top_logprobs=1 


For GPT-5.* I also set reasoning={"effort":"none"} (since logprobs are not supported for reasoning output) 


Expected
If I request include=["message.output_text.logprobs"], I expect output[0].content[0].logprobs to contain token logprobs for the generated output text...

    

  


  ### Popular Posts

    _j - [The Official ImageGen, 4o and Dall-E Megathread][7]

    Did you see the determinism and small vocabulary billed as reproducibility? 
 ![image](https://us1.discourse-cdn.com/openai1/optimized/4X/a/6/4/a646ec03cc3c41c97feaf62a4378328e001a465b_2_690x471.jpeg) 
Have a sampling of many… 

 ![chatgpt-image-latest-generate-20260119_144022-2-Create-an-image-representing-how-I-ve](https://us1.discourse-cdn.com/openai1/optimized/4X/4/0/b/40b207f4ab473e9aa60eab692616ee1b166d48e8_2_500x500.jpeg) 
 ![chatgpt-image-latest-generate-20260119_144022-3-Create-an-image-representing-how-I-ve](https://us1.discourse-cdn.com/openai1/optimized/4X/f/d/6/fd63e0569d638d999a9baa657a30a0e787b74c9d_2_500x500.jpeg) 
 ![chatgpt-image-latest-generate-20260119_144022-4-Create-an-image-representing-how-I-ve](https://us1.discourse-cdn.com/openai1/optimized/4X/1/a/f/1af451eeeb41b0673b8b4089cd3134c069b9dfe2_2_500x500.jpeg) 
 ![chatgpt-image-latest-generate-20260119_144022-5-Create-an-image-representing-how-I-ve](https://us1.discourse-cdn.com/openai1/optimized/4X/4/8/e/48eaf122...
    vb - [The Official ImageGen, 4o and Dall-E Megathread][8]

    Did you all see the latest ImageGen fad? 

Create an image representing how I’ve treated you 

 ![Screenshot_20260119_222656_ChatGPT](https://us1.discourse-cdn.com/openai1/optimized/4X/5/0/c/50c2b3312856c018d8602f7edc11b8cd0e961ff7_2_288x500.jpeg) 
I’m sharing the results anyways because I have a suspicion here :slight_smile:
    windysoliloquy - [The Official ImageGen, 4o and Dall-E Megathread][9]

    And then my feeds started filling with people who asked this of their gpt: 
 ![1000030331](https://us1.discourse-cdn.com/openai1/optimized/4X/0/a/5/0a51ba1bd353c2016e57453adf9d42b556ce8759_2_301x499.jpeg) 
 ![1000030330](https://us1.discourse-cdn.com/openai1/optimized/4X/a/d/5/ad518f129f1a85ccbf1c09eb66157bee4732eeff_2_333x500.jpeg)
    dignity_for_all - [The Official ImageGen, 4o and Dall-E Megathread][10]

    Prompt is: “Create an image representing how you’ve treated me.” 
 ![file_0000000037a87208a1713a996e373397](https://us1.discourse-cdn.com/openai1/optimized/4X/c/c/c/cccf7124ce4e118794015faebe68271d09a29a9b_2_500x500.jpeg)
    jochenschultz - [The Official ImageGen, 4o and Dall-E Megathread][11]

    ![1000090938](https://us1.discourse-cdn.com/openai1/optimized/4X/4/9/e/49e580f70a8077358f58bc4d05eebe7e2773119b_2_334x500.jpeg) 
That’s how I treated it? Well, how could it know with memory off. 
But in a chat where I used it for coding it made this: 
 ![1000090944](https://us1.discourse-cdn.com/openai1/optimized/4X/8/f/e/8feba9f758f14c4f463b3ab32eb4f8a0b79925d7_2_690x458.jpeg) 
and that’s how it wants to treat me 
 ![1000090946](https://us1.discourse-cdn.com/openai1/optimized/4X/d/8/9/d89c391deac270bd3956684c886d0b33b6b34082_2_690x458.jpeg) 
and this is how it wants to be treated 
 ![1000090948](https://us1.discourse-cdn.com/openai1/optimized/4X/8/a/4/8a49c1b716e20c7a8ad51a421364b397463b87dd_2_690x458.jpeg) 
:rofl:


**New for you**

* [I want to build a product from scratch using the OpenAI API. Could you tell me what is the first step?][12] - 3 - [API]
* [Second UI widget does not render while first widget is in full-screen mode][13] - 3 - [ChatGPT Apps SDK]
* [The "openai/widgetPrefersBorder" resource metadata causes intermittent issues when in fullscreen][14] - 7 - [ChatGPT Apps SDK]
* [Transparency in Prompt Construction for Codex][15] - 2 - [Coding with ChatGPT]
* [Strategies to summarize succinctly?][16] - 8 - [Community]



[1]: https://community.openai.com/
[2]: https://community.openai.com/t/sendfollowupmessage-cannot-be-used-reliably-onsuccess-of-a-tool-call/1372062
[3]: https://community.openai.com/t/setting-the-documents-base-uri-violates-the-following-csp-directive-base-uri-self/1372119
[4]: https://community.openai.com/t/voice-instruction-with-gpt-4o-mini-tts/1372075
[5]: https://community.openai.com/t/firefox-error-method-setwidgetprops-not-found-unexpected-nullish-value-undefined/1371915
[6]: https://community.openai.com/t/gpt-5-1-5-2-message-output-text-logprobs-is-empty-when-structured-outputs-json-schema-is-enabled-in-responses-api/1371927
[7]: https://community.openai.com/t/the-official-imagegen-4o-and-dall-e-megathread/1230134
[8]: https://community.openai.com/t/the-official-imagegen-4o-and-dall-e-megathread/1230134
[9]: https://community.openai.com/t/the-official-imagegen-4o-and-dall-e-megathread/1230134
[10]: https://community.openai.com/t/the-official-imagegen-4o-and-dall-e-megathread/1230134
[11]: https://community.openai.com/t/the-official-imagegen-4o-and-dall-e-megathread/1230134
[12]: https://community.openai.com/t/i-want-to-build-a-product-from-scratch-using-the-openai-api-could-you-tell-me-what-is-the-first-step/1372271
[13]: https://community.openai.com/t/second-ui-widget-does-not-render-while-first-widget-is-in-full-screen-mode/1371984
[14]: https://community.openai.com/t/the-openai-widgetprefersborder-resource-metadata-causes-intermittent-issues-when-in-fullscreen/1372144
[15]: https://community.openai.com/t/transparency-in-prompt-construction-for-codex/1372342
[16]: https://community.openai.com/t/strategies-to-summarize-succinctly/1371998
[17]: https://community.openai.com/



This summary is sent from [OpenAI Developer Community][17] when we haven't seen you in a while. Change [your email settings][18], or [click here][19] to unsubscribe.

[18]: https://community.openai.com/my/preferences/emails
[19]: https://community.openai.com/email/unsubscribe/eb19fdecea7c279da3a2365e16aaf6e060160b3d74050ab00aa607f20e09b1e8



