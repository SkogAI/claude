MIME-Version: 1.0
From: OpenAI Developer Community <notifications@openai1.discoursemail.com>
To: emil.skogsund@gmail.com
Date: Fri, 28 Nov 2025 21:01:13 +0000
Subject: [OpenAI Developer Community] Summary
Message-ID: <9fdc15d8-caca-4e84-93f3-398910cdeb46@community.openai.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_692a0d999c0bb_2b1bc2c9415141b7"; charset="UTF-8"

A brief summary of [OpenAI Developer Community][1] since 2025-11-21 20:33:53 UTC

42 New Topics
4893 New Users


  
  ### Popular Topics

    [VS Code - Codex Extension responses not loading/completing][2]

      Codex Extension on VS code has not been working (there was a new udpate for 5.1). Cloud seems to be working fine, but the VS Code extension chats perpetually stall. Is anyone else having this issue? 
 ![image](https://us1.discourse-cdn.com/openai1/optimized/4X/a/5/3/a53a67eb83020758dd1882d8caa9afa1300b8152_2_690x488.png)

    
    [How to build a great ChatGPT app][3]

      New guidance posted for what makes a great ChatGPT app: a practical guide for capability choice and conversation- & discovery-first design

    
    [Apps SDK UI Components shipped and is amazing!][4]

      Just saw this on GitHub and just wanted to let devs here know about this. Really good stuff, will make shipping ChatGPT Apps so easy. 
Contains a bunch of really nicely designed components + the animations are slick. 
@tylersmith thank you and team :hand_with_index_finger_and_thumb_crossed:

    
    [Gpt-4.1-nano seems to be down][5]

      I have this simple code that has been working for several months without any errors: 
from openai import AsyncOpenAI

client = AsyncOpenAI()


async def get_product_name(description: str) -> str:
    prompt = (
        f"Create a product name given the description. *Important:* your response must be one to three words long."
        f" <BEGIN DESCRIPTION>\n{description}\n<END DESCRIPTION>\n\n"
        f"**Your response must be a one to three words long description of the product above.**")

    response = await client.responses.create(model="gpt-4.1-nano", input=prompt)

    return response.output_text

This is now producing errors 100% of the time: 
openai.InternalServerError: Error code: 500 - {‘error’: {‘message’: ‘An error occurred while processing your request. You can retry your request, or contact us through our help center at ``help.openai.com`` if the error persists. Please include the request ID req_11454ab6bee9437fab7fcb2fa905972b in your message.’, ‘type’: ‘server_error’, ‘...

    
    [OpenAI is making a huge mistake by deprecating DALL-E-3][6]

      OpenAI is scheduled to deprecate DALL-E-3 on 05/02/2026: 

On November 14th, 2025, we notified developers using DALL·E model snapshots of their deprecation and removal from the API on May 12, 2026. 






Shutdown date
Model / system
Recommended replacement




2026-05-12
dall-e-2
gpt-image-1 or gpt-image-1-mini


2026-05-12
dall-e-3
gpt-image-1 or gpt-image-1-mini




Here is the problem: While gpt-image-1 is a great model, it cannot do what DALL-E-3 does. Example: 
A simple prompt: 

It is daytime. The sun is very bright, the sky is blue, and white “pillow” clouds are floating high in the sky. A beautiful, colorful and majestic dragon is purched on a large bolder looking down into a lush green valley surrounded by a tall pine forrest. 

DALL-E-3 
 ![Dragon#1](https://us1.discourse-cdn.com/openai1/optimized/4X/9/a/b/9ab96e1e7210eda57f122dbf173a252f3b4429fc_2_690x394.jpeg) 
GPT-Image-1 (same prompt) 
 ![Dragon#2](https://us1.discourse-cdn.com/openai1/optimized/4X/c/d/1/cd16e03bfdd29e7a...

    

  


  ### Popular Posts

    Rabbonidin_Kamoliddi - [How can I download files referenced as sandbox://file.pdf from an Assistant response when using the Threads API?][7]

    sandbox:/mnt/data/Matritsa_Rangi_Teskari_Matritsa_Referat_FULL.pdf
    Pascal_Briod - [Show us what you’re building with the ChatGPT Apps SDK 🚀][8]

    App name: Monito - Money Transfer Comparison
 ![Monito's app in ChatGPT](https://us1.discourse-cdn.com/openai1/optimized/4X/1/9/3/193e63e3c81172ee0ee272b3cb63f6f31dd39855_2_301x500.png) 
One-liner: Compare dozens of international money transfer providers to find the cheapest option to send money abroad. 
Who it’s for / problem it solves: A tool for people making international money transfers (supporting their family, moving their savings to a new country, investing abroad, travelling, etc.), helping them find the provider offering the lowest fees and best exchange rates for a specific money transfer. 
Key features: Live comparison of money transfer providers fees and exchange rates for a specified transfer (currencies, amount, pay-in and pay-out methods, etc.). Users can compare promotions and indicate if they already have accounts with some providers to compare them against the competition. 
The tool uses the same API powering our comparison website Monito, which collects data from do...
    aprendendo.next - [VS Code - Codex Extension responses not loading/completing][9]

    ![image](https://us1.discourse-cdn.com/openai1/original/4X/f/3/9/f399157e94ddd3c84110a1644c07b8af4438445b.png)


**New for you**

* [Serious Vector Store bug!][10] - 2 - [Bugs]
* [Getting Started with ChatGPT Apps SDK: Tips and Best Practices][11] - 2 - [ChatGPT Apps SDK]
* [“Premature close” when sending messages to Assistants API threads?][12] - 9 - [Bugs]
* [Finding tools/files too slow to be usable][13] - 5 - [Feedback]
* [GPT 4 models vs GPT 5 models][14] - 3 - [API]



[1]: https://community.openai.com/
[2]: https://community.openai.com/t/vs-code-codex-extension-responses-not-loading-completing/1367221
[3]: https://community.openai.com/t/how-to-build-a-great-chatgpt-app/1367520
[4]: https://community.openai.com/t/apps-sdk-ui-components-shipped-and-is-amazing/1367135
[5]: https://community.openai.com/t/gpt-4-1-nano-seems-to-be-down/1367130
[6]: https://community.openai.com/t/openai-is-making-a-huge-mistake-by-deprecating-dall-e-3/1367228
[7]: https://community.openai.com/t/how-can-i-download-files-referenced-as-sandbox-file-pdf-from-an-assistant-response-when-using-the-threads-api/1364800
[8]: https://community.openai.com/t/show-us-what-you-re-building-with-the-chatgpt-apps-sdk/1365862
[9]: https://community.openai.com/t/vs-code-codex-extension-responses-not-loading-completing/1367221
[10]: https://community.openai.com/t/serious-vector-store-bug/1367531
[11]: https://community.openai.com/t/getting-started-with-chatgpt-apps-sdk-tips-and-best-practices/1367183
[12]: https://community.openai.com/t/premature-close-when-sending-messages-to-assistants-api-threads/1367608
[13]: https://community.openai.com/t/finding-tools-files-too-slow-to-be-usable/1367294
[14]: https://community.openai.com/t/gpt-4-models-vs-gpt-5-models/1367384
[15]: https://community.openai.com/



This summary is sent from [OpenAI Developer Community][15] when we haven't seen you in a while. Change [your email settings][16], or [click here][17] to unsubscribe.

[16]: https://community.openai.com/my/preferences/emails
[17]: https://community.openai.com/email/unsubscribe/e30b94f83613818ff79912b7673db158bc46105264497844335ce479911801d6



