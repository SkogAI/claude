MIME-Version: 1.0
From: OpenAI Developer Community <notifications@openai1.discoursemail.com>
To: emil.skogsund@gmail.com
Date: Fri, 06 Feb 2026 23:28:59 +0000
Subject: [OpenAI Developer Community] Summary
Message-ID: <ee0bb2a6-6744-4866-a47f-ce3a0ef61fc1@community.openai.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6986793ba84ee_2b79e28c689880"; charset="UTF-8"

A brief summary of [OpenAI Developer Community][1] since 2026-01-30 23:07:00 UTC

32 New Topics
3381 New Users


  
  ### Popular Topics

    [Best Practices for using Codex][2]

      Best Practices for Codex 
Let’s build a community-driven collection of practical tips to maximize productivity and efficiency when using OpenAI’s Codex. Share your favorite insights, and let’s improve our skills together! 
Initial tips: 


Choosing the Right Model: 

Stick to GPT-5.2-Codex medium/high for regular tasks; reserve xhigh reasoning for especially challenging tasks due to higher cost and slower processing.



Better Documentation: 

Equip your agents with high-quality local documentation instead of relying on web scraping.



Learning from Each Other: 

Follow community members who share valuable workflows and insights. Maybe you’re one of them?



I will update this initial list with the high value contributions from the community. This is will be a living document for the time being! 
Shout-out to @aprendendo.next, @EricGT, @merefield for initial valuable contributions!

    
    [Introducing GPT-5.3-Codex—the most powerful, interactive, and productive Codex yet][3]

      GPT-5.3-Codex significantly upgrades your coding and professional workflows. 
Available today in all Codex Surfaces:  Codex app, CLI, IDE extensions, and web 

25% Faster Performance: Accelerate your coding and agentic tasks with improved inference speed.
Interactive Agentic Coding: Steer your agent in real-time during complex, multi-file tasks without losing context.
Superior Multi-language Coding: Top performance across multiple languages, surpassing GPT-5.2-Codex on SWE-Bench Pro.
Robust Terminal & OS Interaction: Improved accuracy on Terminal-Bench 2.0 and OSWorld-Verified for seamless system-level tasks.
Better Web & Frontend Development: Automatic, production-quality website creation from simple prompts with improved UX/UI.
Advanced Cybersecurity: Direct vulnerability detection and strengthened safeguards, earning our highest cybersecurity capability rating.
Broader Professional Workflows: Enhanced productivity in tasks like documentation, presentations, data analysis, and struct...

    
    [New Codex App... Have you tried it yet?][4]

      Introducing the Codex app—now available on macOS 
The Codex app is a powerful command center for building with agents. 
• Multitask effortlessly: Work with multiple agents in parallel and keep agent changes isolated with worktrees 
• Create & use skills: package your tools + conventions into reusable capabilities 
• Set up automations: delegate repetitive work to Codex with scheduled workflows in the background 
Available starting today on macOS with Windows coming soon. 
And for a limited time, Codex is available through ChatGPT Free and Go subscriptions—and we’re doubling rate limits for Plus, Pro, Business, Enterprise, and Edu users—across the Codex app, CLI, IDE extension, and cloud. 
Download the app → openai.com/codex 


  
    ![A first look at the Codex app](https://us1.discourse-cdn.com/openai1/original/4X/c/2/7/c27598918b047b025896a9a31f8cdbc826daa5f2.jpeg)
  



  
    ![We Got Early Access to OpenAI's New Codex App: A Command Center for Agents](https://us1.discourse-cdn.co...

    
    [A competitive warning to my friends at OpenAI][5]

      We have been running an AI Chat service for over a year now.  It was originally built on top of AI’s assistants API and then rolled over to the responses API when that became preferred last year.  At some point, we saw the reliability low enough that we decided to add support for Google as a fallback generator so when OpenAI timed out or failed, we would use Google so that our users remained unaware of the problem.  (That moved our reliability from 95% to 99.5%.) 
But OpenAI was clearly the better provider.  HOWEVER, in our next release due next week, we are shifting our primary provider from OpenAI to Google.  That means that we’ll be using OpenAI only when Google times out or fails.  Essentially we’ll be shifting most of our business to Google.  I regret that because I prefer the OpenAI community and mindset.  But, at least in our application, this choice is easy.  In our application, gemini-3-flash is at least as good at gpt-5-mini in terms of response quality.  And Google is more t...

    
    [How to detect when sendFollowUpMessage actually finishes its response?][6]

      Hi, I’m using window.openai.sendFollowUpMessage in my widget. 
The issue is that the Promise returned by this function resolves immediately (0.0s), long before GPT even starts or finishes writing the response. 
JavaScript 
// It resolves instantly, regardless of the GPT's response status
await window.openai.sendFollowUpMessage({ prompt: "..." });
console.log("Resolved!"); // This prints almost at the same time as the call


Is there any way to know when GPT has completely finished generating the response? I need to sync my UI with the end of the message. 
Is there a specific callback or an event listener for this?

    

  


  ### Popular Posts

    sam.saffron - [Introducing GPT-5.3-Codex—the most powerful, interactive, and productive Codex yet][7]

    After playing with this for an hour, it is pretty fantastic. 
My favorite thing about the new model besides speed is the way it is fine tuned to do “red green” development. 
It almost insists to write failing tests prior to building features. Great move by Open AI
    af0r - [Introducing GPT-5.3-Codex—the most powerful, interactive, and productive Codex yet][8]

    Feels like being a kid, and getting gta 4 for the xbox 360, damn what a time to be alive, thanks to the openAI team they are incredible.
    _j - [The Official ImageGen, 4o and Dall-E Megathread][9]

    ![image](https://us1.discourse-cdn.com/openai1/optimized/4X/e/9/1/e91cac55ad3b5596e0f4460276adb2a93fe1d4ac_2_333x500.jpeg)
    EricGT - [Best Practices for using Codex][10]

    It is also important to emphasize that 100% test coverage of the core code is essential. Yes, it is a significant amount of work, and yes, it can feel like you are writing tests for situations that “should never happen.” 
However, the current mindset of many programmers still assumes they are programming only with other humans. When AI is involved, that assumption breaks down. An AI often has visibility into the entire codebase and will actively use any available paths to satisfy the prompt—even if those paths lead to behavior the user never intended. 
Achieving 100% test coverage helps keep the AI in check by clearly defining what is allowed, what is forbidden, and what must never occur. In that sense, exhaustive tests are no longer just about catching bugs—they are a critical part of constraining and guiding AI behavior.
    LarisaHaster - [The Official ImageGen, 4o and Dall-E Megathread][11]

    ![IMG_9627](https://us1.discourse-cdn.com/openai1/optimized/4X/a/4/1/a41e41d303cebfc5cb777313fd3d880d58e79b73_2_500x500.jpeg)


**New for you**

* [ChatGPT apps are being approved][12] - 8 - [ChatGPT Apps SDK]
* [Persistent “Invalid URL (GET /v1/vector_stores/…)” error across all vector stores — UI broken, cannot upload new files][13] - 9 - [Bugs]
* [Having 'from' instead of 'role' as keyword in jsonl files][14] - 2 - [API]
* [Is GPT 4.1 Mini API getting retired? GPT 5 Mini too SLOW][15] - 6 - [API]
* [Codalotl v0.11.0: gpt 5.2-based agent for Go codebases][16] - 1 - [Community]



[1]: https://community.openai.com/
[2]: https://community.openai.com/t/best-practices-for-using-codex/1373143
[3]: https://community.openai.com/t/introducing-gpt-5-3-codex-the-most-powerful-interactive-and-productive-codex-yet/1373453
[4]: https://community.openai.com/t/new-codex-app-have-you-tried-it-yet/1373156
[5]: https://community.openai.com/t/a-competitive-warning-to-my-friends-at-openai/1372993
[6]: https://community.openai.com/t/how-to-detect-when-sendfollowupmessage-actually-finishes-its-response/1373287
[7]: https://community.openai.com/t/introducing-gpt-5-3-codex-the-most-powerful-interactive-and-productive-codex-yet/1373453
[8]: https://community.openai.com/t/introducing-gpt-5-3-codex-the-most-powerful-interactive-and-productive-codex-yet/1373453
[9]: https://community.openai.com/t/the-official-imagegen-4o-and-dall-e-megathread/1230134
[10]: https://community.openai.com/t/best-practices-for-using-codex/1373143
[11]: https://community.openai.com/t/the-official-imagegen-4o-and-dall-e-megathread/1230134
[12]: https://community.openai.com/t/chatgpt-apps-are-being-approved/1373138
[13]: https://community.openai.com/t/persistent-invalid-url-get-v1-vector-stores-error-across-all-vector-stores-ui-broken-cannot-upload-new-files/1373404
[14]: https://community.openai.com/t/having-from-instead-of-role-as-keyword-in-jsonl-files/1372976
[15]: https://community.openai.com/t/is-gpt-4-1-mini-api-getting-retired-gpt-5-mini-too-slow/1373166
[16]: https://community.openai.com/t/codalotl-v0-11-0-gpt-5-2-based-agent-for-go-codebases/1373285
[17]: https://community.openai.com/



This summary is sent from [OpenAI Developer Community][17] when we haven't seen you in a while. Change [your email settings][18], or [click here][19] to unsubscribe.

[18]: https://community.openai.com/my/preferences/emails
[19]: https://community.openai.com/email/unsubscribe/e50f3ec2a7bc3c31eb375f839f74a2d8f4c24a41f451a8183611ee013256703d



