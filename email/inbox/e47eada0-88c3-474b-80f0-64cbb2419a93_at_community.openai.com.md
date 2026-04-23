MIME-Version: 1.0
From: OpenAI Developer Community <notifications@openai1.discoursemail.com>
To: emil.skogsund@gmail.com
Date: Fri, 26 Sep 2025 18:46:56 +0000
Subject: [OpenAI Developer Community] Summary
Message-ID: <e47eada0-88c3-474b-80f0-64cbb2419a93@community.openai.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68d6df9fdea18_2a824d21442828185"; charset="UTF-8"

A brief summary of [OpenAI Developer Community][1] since 2025-09-19 18:37:21 UTC

46 New Topics
4597 New Users


  
  ### Popular Topics

    [Codex Web UI unable to generate tasks][2]

      Since about 12-14 hours ago, Codex has stopped being able to generate tasks in the web UI. For example, I might ask it: ‘Review the repo and find 3 ways to improve maintainability, generate a task for each’ to which it would respond with 3 places I could improve my code, a brief overview, and a button to ‘Start Task’ for each item. 
No matter how I phrase my request, it will not generate a ‘Start Task’ button. I’m not sure if this is related to the ‘Ask/Code’ button being consolidated or a model update, but I am sorely missing this feature already as I’m having to copy/paste much more when using Codex, as I can’t generate tasks.

    
    [Prompts Comparison and Solution][3]

      Hi, I need a initial prompt, my goal is to compare my prompt creation framework with exiisisting prompts.I would be glad if you could find any and execute the folloeing GPT: https://chatgpt.com/g/g-68c3a3af4b90819189195848ca025000-10x-better-prompts 
what i need is just the ICF comparisson between the initial prompt and the especialists one. It will be down the end and ir may be sent to markocch@hotmaim.com or here thru message

    
    [Vector Stores are not retrievable via list all][4]

      Currently the list vector stores endpoint in the OpenAI API is not returning any vector stores. Getting the vector store directly via id is working fine, but using the list all will yield no results. 
I used the following endpoint as described in the API reference: 
curl --location 'https://api.openai.com/v1/vector_stores' 
--header 'Authorization: Bearer OPENAI_APIKEY' 
--header 'Content-Type: application/json'
--header 'OpenAI-Beta: assistants=v2'

I can even reproduce this behavior directly on the platform.openai.com site. 
Pressing ‘Create’ on the Vector Store tab in the Storage page will successfully create a vector store. Refreshing the page and going back to the vector stores tab will not list any vector stores still. Searching for the vector store by providing an id in the URL will show it: https://platform.openai.com/storage/vector_stores/vs_someid 
This behavior is happening across all our projects since today morning. 
Thanks!

    
    [[gpt-5-nano issue] Something is seriously wrong: "The server had an error while processing your request" + "Your request rate has increased suddenly" errors][5]

      My entire app is down. We started getting these errors out of nowhere. Nothing works! 
“error”: { 
“message”: “The server had an error while processing your request. Sorry about that!”, 
“type”: “server_error”, 
“param”: null, 
“code”: null 
EDITED: 
Now i’m receiving the following error: 
AgentFollowUpWorkflow: { 
“error”: { 
“message”: “Your request rate has increased suddenly, overloading the model. Please reduce your request rate to its original level, keep it stable for at least 15 minutes, and then gradually increase it. If the error persists, please contact us through our help center at help.openai.com.”, 
“type”: “slow_down”, 
“param”: null, 
“code”: “slow_down” 
} 
} 
Note I’m literally not doing absolutely any requests. 
EDIT2: 
I believe this is happening only with gpt-5-nano

    
    [How to reach a human at OpenAI support regarding high latency on the API?][6]

      I’ve previously posted about issues we face with high latency on the GPT4o API endpoints. We are once again facing these same issues, been happening now for 6 days (started 2025-09-18). No acknowledgement of the issue on the status page (as usual), and now it’s nearly impossible to reach a human at OpenAI to talk about the problem: half the time I get a response from an LLM. The other half the time they ask me to repeat the same info I’ve already repeated over and over. 
We process thousands of requests a day that are all very similar (in size/shape), and send them to GPT 4o. Normally ~2% of our requests take more than 30 seconds. Since 9/18, we’re seeing the average to be 12% of requests, with some days over 15%, some hours over 20%. 
 ![screenshot 2025-09-24 at 13.06.28](https://us1.discourse-cdn.com/openai1/optimized/4X/e/4/8/e48181fb3c1dc00f00bc477564195b58a9663bef_2_690x427.png) 
Meanwhile we can get no help from OpenAI, no clarity on when this will be resolved, or even that they ...

    

  


  ### Popular Posts

    tibo-oai - [Codex Web UI unable to generate tasks][7]

    We are temporarily going to revert this change as we unintentionally negatively affected suggested tasks. We will bring this unification back more thoughtfully in the future.
    shanth - [Vector Stores are not retrievable via list all][8]

    Thanks for the reports!  We’re able to reproduce it as well, root-causing it actively.
    dogi - [Codex Web UI unable to generate tasks][9]

    ![image](https://us1.discourse-cdn.com/openai1/original/4X/e/a/a/eaacca5896395c39072ef616da95918ac389259c.png)
    hugebelts - [The Official 4o and Dall-E image Megathread][10]

    ![image-6](https://us1.discourse-cdn.com/openai1/optimized/4X/0/4/a/04a71e3349da489acdf1577d7c20ee9be8a7b1a9_2_500x500.jpeg) 
 ![image-2](https://us1.discourse-cdn.com/openai1/optimized/4X/8/d/0/8d037d7a21397036ce5ff109b91cc067e1c4e939_2_500x500.jpeg) 
 ![image-3](https://us1.discourse-cdn.com/openai1/optimized/4X/d/4/9/d49169d3f76ea00c1c2d182e513989df3108c8fd_2_500x500.jpeg) 
 ![image-4](https://us1.discourse-cdn.com/openai1/optimized/4X/5/f/b/5fb6b6ef66e38e0228583ace03d9f43390e0ac49_2_500x500.jpeg) 
 ![image-5](https://us1.discourse-cdn.com/openai1/optimized/4X/5/f/d/5fde51c8701dee13e18ae6d0f5abc47827b610ba_2_500x500.jpeg)
    BranchManager69 - [Upgrades to Codex — gpt-5-codex][11]

    I’m not sure if something changed when the new model came out but I have noticed a significant increase in the rate limits (Pro). 
1-2 weeks ago, I was hitting the weekly capacity every single day. And it did not take a full week, I’ll tell you that. 
Now I am raw dogging 6+ consoles all day and night on high – no limits (yet).  Big improvement. 
THX SAM! 
Edit: Just seeing some of the above comments about gpt-5-codex … I don’t want to be That Guy, but I’ve consumed tens of billions of tokens this year… and it is the best agentic coding model in the world right now, bar none.  It’s really remarkable. It’s so far and above all other CLI models including Claude Code (which isn’t saying much nowadays) that I am surprised there has not been much more fanfare over it even compared to gpt-5-high! If I had to pick one qualm, it’s the degradation with context growth. The speed is actually great. 
Again, THX SAM.


**New for you**

* [Inserting random strings to prevent prompt injection][12] - 18 - [Prompting]
* [DevDay [Exchange] • São Paulo • London • Bengaluru • Tokyo • Seoul][13] - 2 - [Community]
* [GPT-5 Codex available in the API][14] - 1 - [API]
* [Sam Altman, OpenAI will reportedly back a startup that takes on Musk’s Neuralink][15] - 2 - [Community]
* [I’d like to see GPTs renewed and upgraded][16] - 1 - [GPT builders]



[1]: https://community.openai.com/
[2]: https://community.openai.com/t/codex-web-ui-unable-to-generate-tasks/1359696
[3]: https://community.openai.com/t/prompts-comparison-and-solution/1359130
[4]: https://community.openai.com/t/vector-stores-are-not-retrievable-via-list-all/1359423
[5]: https://community.openai.com/t/gpt-5-nano-issue-something-is-seriously-wrong-the-server-had-an-error-while-processing-your-request-your-request-rate-has-increased-suddenly-errors/1359929
[6]: https://community.openai.com/t/how-to-reach-a-human-at-openai-support-regarding-high-latency-on-the-api/1359740
[7]: https://community.openai.com/t/codex-web-ui-unable-to-generate-tasks/1359696
[8]: https://community.openai.com/t/vector-stores-are-not-retrievable-via-list-all/1359423
[9]: https://community.openai.com/t/codex-web-ui-unable-to-generate-tasks/1359696
[10]: https://community.openai.com/t/the-official-4o-and-dall-e-image-megathread/1230134
[11]: https://community.openai.com/t/upgrades-to-codex-gpt-5-codex/1358210
[12]: https://community.openai.com/t/inserting-random-strings-to-prevent-prompt-injection/1359720
[13]: https://community.openai.com/t/devday-exchange-sao-paulo-london-bengaluru-tokyo-seoul/1359554
[14]: https://community.openai.com/t/gpt-5-codex-available-in-the-api/1359549
[15]: https://community.openai.com/t/sam-altman-openai-will-reportedly-back-a-startup-that-takes-on-musk-s-neuralink/1359717
[16]: https://community.openai.com/t/i-d-like-to-see-gpts-renewed-and-upgraded/1359264
[17]: https://community.openai.com/



This summary is sent from [OpenAI Developer Community][17] when we haven't seen you in a while. Change [your email settings][18], or [click here][19] to unsubscribe.

[18]: https://community.openai.com/my/preferences/emails
[19]: https://community.openai.com/email/unsubscribe/424341beb11f4a78a93680082a6834cfbb84c8271578e48670b99b298428d7db



