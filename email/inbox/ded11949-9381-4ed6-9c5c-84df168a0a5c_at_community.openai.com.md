MIME-Version: 1.0
From: OpenAI Developer Community <notifications@openai1.discoursemail.com>
To: emil.skogsund@gmail.com
Date: Fri, 02 Jan 2026 22:18:09 +0000
Subject: [OpenAI Developer Community] Summary
Message-ID: <ded11949-9381-4ed6-9c5c-84df168a0a5c@community.openai.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69584420f3e3d_2aef7c614202645"; charset="UTF-8"

A brief summary of [OpenAI Developer Community][1] since 2025-12-26 22:10:08 UTC

32 New Topics
2790 New Users


  
  ### Popular Topics

    [Random performance drop / hallucinations during certain periods of time][2]

      I’ve noticed that during certain periods of time, the model (GPT-5.2) has an extremely high hallucination rate. I spend most of that time wasting tokens and money trying to correct the model, usually having to give up. During other periods of time, the model performs almost flawlessly. These periods seem to be quite random, and now I have to depend on pure luck to get the performance I need and my work done! And this happens despite no problems being announced on the status page. 
Is anyone else experiencing this issue?

    
    [Building a role-aware guardrail layer between LLMs and production databases][3]

      I ran into a problem while building a chat-first app that lets users query real production data with LLMs: 
Once an LLM can talk to a database, access control gets blurry fast. Traditional RBAC lives in the application layer, but LLM prompts don’t naturally respect roles, field-level permissions, or audit requirements. Early on, I saw how easy it was to accidentally expose PII or internal-only fields just by slightly changing a prompt. 
To address this, I built a middleware layer that sits between the LLM and data sources and enforces: 


Role-aware field redaction (based on user + organization context) 


Query-time filtering instead of post-response cleanup 


Explicit allow/deny rules for tables, columns, and joins 


Full audit logging of what the model attempted to access vs what it actually received 


One of the bigger challenges was balancing developer ergonomics vs safety. Too many rules make the system unusable; too few rules make it dangerous. Another surprise was how often ...

    
    [System and Developer Roles in messages and Instructions in Responses.Create?][4]

      Could someone clarify the differences between the system and developer roles in messages, as well as the instructions in responses.create? 
When do you use one over the others? 
What happens if you use all three? 
Can you have multiple messages with the same role? 
What happens if they contain conflicting instructions? 
Thanks so much!

    
    [OpenAI for Developers in 2025][5]

      Hi everyone — we just published a recap of what we shipped for developers in 2025, and I wanted to share it here and say a sincere thank you. 
A lot of what made this year special was watching what you built: the demos, the hard-earned production lessons, the bug reports, the “this would be 10x better if…” threads, and the creative ways you’ve pushed the platform. It genuinely shaped what we focused on. 
Some of the big things we shipped in 2025: 


Reasoning progress (o1 → o3/o4-mini → GPT-5.2) 


Codex as a real coding surface (GPT-5.2-Codex + CLI + web/IDE) 


Real multimodality (audio + realtime, images, video, PDFs) 


Agent-native building blocks (Responses API, Agents SDK, MCP) 


Open-weight models (gpt-oss, gpt-oss-safeguard) 


And the capability curve moved fast (4o → 5.2), including benchmark jumps like: 


GPQA: 56.1% → 92.4% 


AIME: 9.3% → 100% 


SWE-bench Verified: 33.2 → 80.0 


Full recap here: https://developers.openai.com/blog/openai-for-developers-2025 
If you shi...

    
    [2025 in Review: Your Wins, Our Future, and Community Awards!][6]

      2025 Context Window Closing… Let’s Fine-Tune for 2026 :rocket:

SYSTEM PROMPT: 
Reflect on a high-velocity year of building. 
Acknowledge the grind. 
Optimize parameters for the next epoch (2026). 

Hey Community! 
The context window on 2025 is officially reaching capacity! :green_circle: 
Before we hit the max token limit and truncate the history, we need to pause the inference loop and acknowledge that the velocity of what you all built, discussed, and solved this year has been nothing short of SOTA. 
We’re combining our end-of-year retrospective with some RLHF (Real Life Human Feedback) to set the weights for 2026. We want to know what worked, what hallucinated, and who provided the best completions. 
:backhand_index_pointing_down: Run the following tasks in the comments: 
1. The Output Log (Wins) :floppy_disk:
Let’s see the logs. Big or small, if it ran, it counts. 


function ship_it(): What did you ship? Whether it was a massive enterprise deployment, a wild agent swarm, or final...

    

  


  ### Popular Posts

    PaulBellow - [LitRPG AI Dungeon Roguelike Powered by GPT-4 + DALLE3][7]

    Gonna have a FREE demo soon… 
![roguelikefree1](https://us1.discourse-cdn.com/openai1/original/4X/c/e/c/cec1916dae2fd7fd2bb68e98f534e33f82ff60a0.gif) 
 ![Screenshot 2025-12-28 at 11-41-20 Mini Dungeon Roguelike — Book Promo](https://us1.discourse-cdn.com/openai1/optimized/4X/3/8/3/383283fa8c4009939faeb46e70e0c781c9253d81_2_690x433.jpeg) 
 ![Screenshot 2025-12-27 at 20-40-29 Mini Dungeon Roguelike — Book Promo](https://us1.discourse-cdn.com/openai1/optimized/4X/2/f/d/2fd24ac3e2fd5937944521f0a2a762bb50297572_2_690x433.jpeg) 
 ![Screenshot 2025-12-27 at 21-46-31 Mini Dungeon Roguelike — Book Promo](https://us1.discourse-cdn.com/openai1/optimized/4X/5/f/4/5f4a22d0d0841ac0f321753835342b5295530501_2_690x433.png)
    _j - [The Official ImageGen, 4o and Dall-E Megathread][8]

    All this talk of “burning tokens”…let’s burn some credits.
    PaulBellow - [LitRPG AI Dungeon Roguelike Powered by GPT-4 + DALLE3][9]

    Had to spin a quick tool to test dungeons… kinda slick with the batch process! 
 ![Screenshot 2025-12-29 at 14-46-32 Dungeon Dev Lab — Map Generator Visualizer](https://us1.discourse-cdn.com/openai1/optimized/4X/6/5/1/651819134d0b13c09c53fe4299c2febe038a317c_2_690x357.png) 
 ![Screenshot 2025-12-29 at 14-46-06 Dungeon Dev Lab — Map Generator Visualizer](https://us1.discourse-cdn.com/openai1/optimized/4X/9/a/8/9a8a3fd0274ff3b233a8b1c4dc9b3bbfd4241a0a_2_690x357.png) 
 ![Screenshot 2025-12-29 at 14-46-16 Dungeon Dev Lab — Map Generator Visualizer](https://us1.discourse-cdn.com/openai1/optimized/4X/5/9/0/590f6cd44cbfd94ab248d86a3780c654149246eb_2_690x357.png) 
 ![Screenshot 2025-12-29 at 14-46-25 Dungeon Dev Lab — Map Generator Visualizer](https://us1.discourse-cdn.com/openai1/optimized/4X/9/d/2/9d2d6b21fbb6d1f10c1a28b01455e4585128350a_2_690x357.png)
    Sean-Der - [Receiving SIP 400 Bad Request when sending an INVITE from Twilio to OpenAI][10]

    Hi really sorry about this @Mack_Hendricks we are having an issue with an internal service that is impacting Realtime API. Working on this now! 
I will update when when I have a fix.
    LarisaHaster - [The Official ImageGen, 4o and Dall-E Megathread][11]

    But my thought was that the snowman was surprised and dropped the wand😆 So that’s why the green stuff is away…and I got sad when the snowman looked sad…that was the meh.. 
 ![IMG_8536](https://us1.discourse-cdn.com/openai1/optimized/4X/9/6/6/9663d0e6a68f5ad858c1aa7f504923a4710a62ae_2_500x500.jpeg) 
And now I’m officially living 2026🥳


**New for you**

* [Post LLMs Era... What next? Watch this if you you want to stay on the topic][12] - 2 - [Community]
* [Allowed Countries Submssion Question - It's unclear if we need to select EVERY country or if they are by default all allowed][13] - 2 - [ChatGPT Apps SDK]
* [2025: The Year in Review][14] - 6 - [Uncategorized]
* [Should all users have hard spending caps?][15] - 2 - [Feedback]
* [Can you tweak/fix/update while waiting for review?][16] - 1 - [ChatGPT Apps SDK]



[1]: https://community.openai.com/
[2]: https://community.openai.com/t/random-performance-drop-hallucinations-during-certain-periods-of-time/1370311
[3]: https://community.openai.com/t/building-a-role-aware-guardrail-layer-between-llms-and-production-databases/1370566
[4]: https://community.openai.com/t/system-and-developer-roles-in-messages-and-instructions-in-responses-create/1370516
[5]: https://community.openai.com/t/openai-for-developers-in-2025/1370719
[6]: https://community.openai.com/t/2025-in-review-your-wins-our-future-and-community-awards/1370613
[7]: https://community.openai.com/t/litrpg-ai-dungeon-roguelike-powered-by-gpt-4-dalle3/178296
[8]: https://community.openai.com/t/the-official-imagegen-4o-and-dall-e-megathread/1230134
[9]: https://community.openai.com/t/litrpg-ai-dungeon-roguelike-powered-by-gpt-4-dalle3/178296
[10]: https://community.openai.com/t/receiving-sip-400-bad-request-when-sending-an-invite-from-twilio-to-openai/1370561
[11]: https://community.openai.com/t/the-official-imagegen-4o-and-dall-e-megathread/1230134
[12]: https://community.openai.com/t/post-llms-era-what-next-watch-this-if-you-you-want-to-stay-on-the-topic/1370482
[13]: https://community.openai.com/t/allowed-countries-submssion-question-its-unclear-if-we-need-to-select-every-country-or-if-they-are-by-default-all-allowed/1370470
[14]: https://community.openai.com/t/2025-the-year-in-review/1370668
[15]: https://community.openai.com/t/should-all-users-have-hard-spending-caps/1370683
[16]: https://community.openai.com/t/can-you-tweak-fix-update-while-waiting-for-review/1370382
[17]: https://community.openai.com/



This summary is sent from [OpenAI Developer Community][17] when we haven't seen you in a while. Change [your email settings][18], or [click here][19] to unsubscribe.

[18]: https://community.openai.com/my/preferences/emails
[19]: https://community.openai.com/email/unsubscribe/a5da16da0f67c05eb09f03e079a6485b9a0bdbc31f29f3f90c128ce73d0c4153



