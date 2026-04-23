MIME-Version: 1.0
From: OpenAI Developer Community <notifications@openai1.discoursemail.com>
To: emil.skogsund@gmail.com
Date: Fri, 26 Dec 2025 22:10:08 +0000
Subject: [OpenAI Developer Community] Summary
Message-ID: <86cd621b-15c1-4d83-ba27-7425e7d6a2af@community.openai.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_694f07bfef1ab_2be2cf526853527a5"; charset="UTF-8"

A brief summary of [OpenAI Developer Community][1] since 2025-12-19 21:43:47 UTC

25 New Topics
3278 New Users


  
  ### Popular Topics

    [Gpt-image-1.5 image creator and editor app - Python, desktop UI][2]

      GPT-Image Desktop Editor: a desktop GUI for OpenAI image generation and vision-guided edits
A Christmas present by me for you - an image playground beyond OpenAI’s offerings. 
This is a developer-oriented but user-friendly single-file Python Tkinter application for generating images from prompts and editing images with prompt-guided inpainting/outfilling. It provides a canvas workspace (with transparency), an optional mask painting UI, and (for GPT-Image edits) multi-image reference inputs so you can say things like “add the penguin from image 2 into the scene”. It uses standard lib + httpx for a lighter-weight surface than the OpenAI SDK. 
 ![image](https://us1.discourse-cdn.com/openai1/optimized/4X/e/5/a/e5a2c6b35daa730e66117602cfad1bccd37560ac_2_690x477.jpeg) 
Desktop app: Image canvas UI is a set 1024x1024px, within which larger resolutions are scaled. A 1080p+ desktop resolution is encouraged to see the full UI length. 
An idea factory: not a sellable surface. 

Supported Models a...

    
    [TypeScript template for building ChatGPT Apps][3]

      Built this because I needed a decent ChatGPT app template. TypeScript, 
MCP server, React widgets, Vitest, Storybook, Pino… all the proper tooling. Feedback welcome. 


Live editing while you test your app in ChatGPT 
![CleanShot 2025-12-22 at 19.54.46](https://us1.discourse-cdn.com/openai1/original/4X/f/b/1/fb19a8b8757bf6059f985c1a6bab848a727c6cc0.gif) 
Example tool with UI showcasing how to call a tool in a widget, render tool output and use fullscreen. 
![CleanShot 2025-12-22 at 20.12.49](https://us1.discourse-cdn.com/openai1/original/4X/8/4/0/8405a7656f14fa2ec773b0f81cd772ad16c573ba.gif)

    
    [Simple Router - Agent builder tutorial][4]

      I haven’t heard much of Agent Builder lately, so here is a small Christmas gift to help get people started on this. 
I’ve seem more than once people struggle with routing or trying to use agents as a tool. Right now agent builder doesn’t support it, but there is a trick to achive something closer. 
So here is the use case: 

Suppose you have a support chat, with several specialists.
You want to route the user, but you also need a persistent conversation. You don’t want the user explaining every time who he wants to talk to.

The solution: set a variable to remember the last router recommendation. 
The overall setup look like this: 
 ![image](https://us1.discourse-cdn.com/openai1/optimized/4X/1/e/6/1e66c1a3cfdfbb3f5bfadf904379ba53b0f735f4_2_690x200.png) 
Now, lets get into more details about each step. Click on the steps to see more details: 
▶ 
Step 1 - start node
▶ 
Step 2 - agent node: trial agent
▶ 
Step 3 - Set state node
▶ 
Step 4 - If/else node
▶ 
Step 5 - Specialized agents
▶ 
Step 6 - Exam...

    
    [Please make window.openai.uploadFile(file) support csv type][5]

      Can we allow csv file type for uploadFile on top of the image types like jpeg? 
Here’s the context. 
 ![Screenshot from 2025-12-22 14-50-21](https://us1.discourse-cdn.com/openai1/optimized/4X/0/8/7/0879995a53c58d32a8b30a1b938db43a2daf1153_2_690x432.png) 
The support of csv file will make the apps be better at data processing at a much larger scale.

    
    [Did something change? Images from GPT Actions don’t render anymore][6]

      Hey everyone :waving_hand:t3: 
I am running into a weird issue with Custom GPT Actions and wondering if anyone else has seen this. 
I have an action (POST request) that returns a public PNG URL from my backend. This used to render inline in the ChatGPT UI without any issues with different models. But since 5.2 release or even before I am having the following issue 
Now: 

The action still returns the correct public URL
ChatGPT runs an internal url_safe check. I can see it in the network
The response is { "safe": false, "blocked": false }
The image no longer renders inline

What’s confusing: 

If I don’t use actions and just paste or generate the same public URL, the image renders fine. There is no request to url_safe
If I manually open the URL (or call it directly like url_safe does), the PNG is reachable and loads correctly
I tried many things in the instructions (explicit “render image”, different formatting, etc.), but nothing helped

So it feels like this is specific to URLs coming...

    

  


  ### Popular Posts

    Val_Beg - [Show us what you’re building with the ChatGPT Apps SDK 🚀][7]

    Day 23 - Advent of ChatGPT Apps :christmas_tree: 
App name: French DataGouv Explorer 
One-liner: Interactive map widget showcasing French open data from Data Gouv with real-time dataset switching 
Why: France has incredible open data on Data Gouv, but exploring it requires knowing exactly what you’re looking for. This widget lets you visualize geographic datasets directly in ChatGPT—EV charging stations, bike stations, pharmacies—all on an interactive Mapbox map with one-click switching. 
Key features: 

3 datasets: EV charging (Toulouse), bike stations (Clermont-Ferrand), pharmacies (Paris suburbs)
Custom markers showing relevant info (kW power, bike capacity, pharmacy cross)
Dark/light theme sync with ChatGPT
Widget-callable tools for dynamic data fetching

Example prompts: 

“Show me EV charging stations in France”
“Where can I find bike sharing stations?”
“Display pharmacies near Paris”

Stack: TypeScript, Skybridge, Mapbox GL, Data Gouv MCP Server 
Links: Try it: https://datagouv-...
    Wizz - [Feature Request: Model Introspection API][8]

    Having a programmatic way to retrieve model capabilities would make building BYO-key tools much more robust. Hardcoding token limits or parsing errors is fragile, especially when users can select different models at runtime. A Model Introspection API seems like a logical platform primitive to support dynamic client behavior.
    Amarand - [GPT-Image-1.5 rolling out in the API and ChatGPT][9]

    I am FLOORED by the long prompt adherence… 1,564 character complex prompt. Top image is GPT-Image-1, bottom is GPT-Image-1.5. It’s…nuts. 
 ![Untitled](https://us1.discourse-cdn.com/openai1/optimized/4X/d/8/9/d8936432e002e214d92e30d1b8a204a72566e475_2_333x500.jpeg) 
 ![AID321_Parabola_Bright_Modulation_20251221_AI](https://us1.discourse-cdn.com/openai1/optimized/4X/8/7/8/87825eafee60a9b3a7742760251b410fe63f7099_2_333x500.jpeg)
    fredisterik - [Show us what you’re building with the ChatGPT Apps SDK 🚀][10]

    :christmas_tree: Day 22 - Advent of ChatGPT Apps :christmas_tree: 
App name: Generative UI 
One-liner: A rebellious experiment that breaks every ChatGPT Apps convention—100% server-side rendered, dynamically generated with GenUI, and nested 3 iframes deep :melting_face: 
Why: ChatGPT Apps aren’t designed for SSR. The SDK needs to cache and validate UI widgets before any tool runs. So I built the exact opposite: fully server-rendered HTML with dynamic content, wrapped in an iframe inside OpenAI’s 2 runtime iframes. Pure chaos. Zero production value. Maximum fun :sweat_smile:. 
Key features: 

100% server-side rendered HTML
Dynamically generated content per request
3 nested iframes (2 from Skybridge runtime + 1 for the app)
A masterclass in what not to do

Example prompts: 

“Show me something”
“Generate an ugly interface”
“Show me what the next SpaceX shuttle dashboard will look like”
(Honestly, just click around and watch the iframes sweat)

Stack: Full typescript, skybridge, OpenAI re...
    hugebelts - [The Official ImageGen, 4o and Dall-E Megathread][11]

    ![image](https://us1.discourse-cdn.com/openai1/optimized/4X/5/6/4/56433dc07b85bbfe565b6df9f7af8304dbb359ec_2_690x376.jpeg)


**New for you**

* [Fine-tune GPT Concept and General rules to apply as rephraser][12] - 1 - [Prompting]
* [Intelligence Between Meaning And Chance][13] - 2 - [Community]
* [Continuity, Identity, and Why Current AI Architectures May Preclude AGI][14] - 1 - [Community]
* [Chat completions API returns a string][15] - 6 - [Bugs]
* [Was anybody working on a services app?][16] - 1 - [ChatGPT Apps SDK]



[1]: https://community.openai.com/
[2]: https://community.openai.com/t/gpt-image-1-5-image-creator-and-editor-app-python-desktop-ui/1370104
[3]: https://community.openai.com/t/typescript-template-for-building-chatgpt-apps/1370089
[4]: https://community.openai.com/t/simple-router-agent-builder-tutorial/1370154
[5]: https://community.openai.com/t/please-make-window-openai-uploadfile-file-support-csv-type/1370003
[6]: https://community.openai.com/t/did-something-change-images-from-gpt-actions-don-t-render-anymore/1369828
[7]: https://community.openai.com/t/show-us-what-you-re-building-with-the-chatgpt-apps-sdk/1365862
[8]: https://community.openai.com/t/feature-request-model-introspection-api/1370171
[9]: https://community.openai.com/t/gpt-image-1-5-rolling-out-in-the-api-and-chatgpt/1369443
[10]: https://community.openai.com/t/show-us-what-you-re-building-with-the-chatgpt-apps-sdk/1365862
[11]: https://community.openai.com/t/the-official-imagegen-4o-and-dall-e-megathread/1230134
[12]: https://community.openai.com/t/fine-tune-gpt-concept-and-general-rules-to-apply-as-rephraser/1369824
[13]: https://community.openai.com/t/intelligence-between-meaning-and-chance/1370026
[14]: https://community.openai.com/t/continuity-identity-and-why-current-ai-architectures-may-preclude-agi/1369891
[15]: https://community.openai.com/t/chat-completions-api-returns-a-string/1370134
[16]: https://community.openai.com/t/was-anybody-working-on-a-services-app/1370150
[17]: https://community.openai.com/



This summary is sent from [OpenAI Developer Community][17] when we haven't seen you in a while. Change [your email settings][18], or [click here][19] to unsubscribe.

[18]: https://community.openai.com/my/preferences/emails
[19]: https://community.openai.com/email/unsubscribe/86ca4043c9c358bd623b44fcd1f464e347ceb0335cb8069aa5a1d5ba6abbc894



