MIME-Version: 1.0
From: Google Developer forums <no-reply@discuss.google.dev>
To: emil.skogsund@gmail.com
Date: Thu, 18 Sep 2025 16:07:57 +0000
Subject: [Google Developer forums] Summary
Message-ID: <1fbf0779-a4b8-45ab-91de-c16a06f35d64@discuss.google.dev>
Content-Type: multipart/alternative; boundary="--==_mimepart_68cc2e5ce0865_274f6798102135"; charset="UTF-8"

A brief summary of [Google Developer forums][1] since 2025-09-11 15:39:37 UTC

51 New Topics
1 Unread Notifications
1418 New Users


  
  ### Popular Topics

    [September 11, 2025 Release Notes][2]

      Deployment Time: 1:00 PM PST
 
Features & enhancements

  
   Item
   
   Description
   
  
  
   Enhancement
   
   Summarize long textual data into a shorter summary using AI by adding the Summarize AI task in an automation. This is a preview release of this feature. See:
Community announcement
Use the Summarize AI task in an automation.
   
  
  
   Enhancement
   
   You can now edit a team directly from the Organization dashboard. See Edit teams in an organization.
   
  

Bug fixes

  
   Item
   
   Description
   
  
  
   Bug
   
   Fixed a bug with Quick Sync not working until the app completes a sync when starting up with local cache.
   
  
  
   Bug
   
   Fixed a bug that was identified in the community that was causing intermittent 429 errors on automation bots generating email bodies or attachments from Google Docs templates.
   
  

Rollout changes

  
   Item
   
   Description
   
  
  
   Bug
   
   Update Google Maps to take into account the user locale when rend...

    
    [NEW: Agent Payments Protocol (AP2), an open and secure standard for agentic payments][3]

      ![image](https://d2yds90mtvelsl.cloudfront.net/optimized/3X/4/9/49c210b35139f830e9a281554e7d6ce48e1865ed_2_690x380.png) 
Hello everyone, 
Google just introduced the Agent Payments Protocol (AP2), an open protocol designed to provide a secure and reliable framework for AI-driven commerce. 
For those building payment applications using AI agents, a critical challenge is emerging: how do you securely handle payments initiated by a non-human agent? 
Today’s payment systems assume a human is present and interacting with a trusted interface. This leaves critical gaps when an agent acts on a user’s behalf: 

How do you prove the agent had the user’s specific authority for a purchase?
How do you protect against agent errors or “hallucinations” that could lead to incorrect purchases?
How is accountability assigned in the case of fraud or error?

AP2 is designed to solve this problem by anchoring transactions to deterministic, non-repudiable proof of intent from the user, rather than relying on...

    
    [Last Chance To Complete The Skills Scribble Challenge!][4]

      This is your last chance to jot down new skills as you automate tasks, build smart tools, secure data, and sketch insights with Looker. The Skills Scribble Challenge is crafted to help you turn quick notes of learning into lasting cloud expertise. 
Here’s what’s inside: 


Automate smarter with Cloud Scheduler 


Build productivity tools like Gmail add-ons and Google Chat bots 


Organize and modernize apps with GKE 


Protect what matters using Cloud SQL, Cloud Data Loss Prevention API, and Security Command Center 


Sketch clear insights from your data with Looker 


Think of it as a notebook where each lab is a fresh page—whether you’re scripting automation, tightening defenses, or uncovering stories in your data. By the end, you’ll have more than scribbles: you’ll have a sharper set of skills ready for real-world challenges, a shiny Skills Boost Arcade Badge, and 2 Arcade Points! 
![Skills Scribble Invite](https://d2yds90mtvelsl.cloudfront.net/original/3X/c/d/cd231768ea8ad69877dbd2...

    
    [Scaling high-performance inference cost-effectively][5]

      Authors: 
Mark Lohmeyer, VP & GM, Compute and AI Infrastructure 
Drew Bradstock, Sr. Director of Product Management, Cloud Runtimes 

At Google Cloud Next 2025, we announced new inference capabilities with GKE Inference Gateway, including support for vLLM on TPUs, Ironwood TPUs, and Anywhere Cache. 
Our inference solution is based on AI Hypercomputer, a system built on our experience running models like Gemini and Veo 3, which serve over 980 trillion tokens a month to more than 450 million users. AI Hypercomputer services provide intelligent and optimized inferencing, including resource management, workload optimization and routing, and advanced storage for scale and performance, all co-designed to work together with industry leading GPU and TPU accelerators. 
 ![image1](https://d2yds90mtvelsl.cloudfront.net/optimized/3X/3/2/3257d508240daadf3c181bdbe696daeae86c134c_2_690x326.png) 
Today, GKE Inference Gateway is generally available, and we are launching new capabilities that deliver ev...

    
    [September 16, 2025 Release Notes][6]

      Deployment Time: 1:00 PM PST
 
Features & enhancements

  
   Item
   
   Description
   
  
  
   Feature
   
   General availability release of Asia Pacific region for AppSheet data residency

You can now store your AppSheet data in Asia Pacific region. See Manage data residency.
    
  

Bug fixes

None
 
Rollout changes

  
   Item
   
   Description
   
  
  
   Bug
   
   Fixed a bug in the desktop design where SELECT() functions searching a slice when run in a form view incorrectly included the unsaved changes in the form.This fix is being rolled out gradually. 

New: Deployed to 100% of free users and 50% of paid users.
 
Previous: Deployed to 100% of free users and 25% of paid users.
    
  

Preview announcements

Preview feature releases enable you to try out new app features that are not yet fully supported. See Product launch stages.
 
No new preview features were released today.

In addition, the AppSheet preview program lets app creators try out new app features that ar...

    

  


  ### Popular Posts

    CPAB - [Pull-down sync on iPads vs. iPhones][7]

    In my experience, the pull to sync feature is ineffective in landscape for dashboard view. Let me know if this is the same as your case. 
You can also activate automatic refresh in the performance settings to keep your data updated; otherwise, manual refreshing, sync button, is recommended.
    Kirk_Masden - [AppSheet Parser Suite: Analyze and Clean Up Your Apps][8]

    In this comment, I’d like to add a little explanation about how I built this. 
I don’t know how to script in Python.  The idea to build this came up in conversation with an AI chatbot – either ChatGPT or Claude, I can’t remember which.  I pay for both services  – about $20 each.  As I recall, I started with ChatGPT but after having a number of frustrating experiences switched to Claude Opus 4.0 (later 4.1).  Regardless of whether I was using Claude or ChatGPT (or occasionally Gemini) I always edited (that is, copied and pasted) the script myself via a text editor. 
The biggest problem I had with Claude was the usage limits.  Since I was only paying $20 per month (not $200), limits came up fairly frequently, particularly if I was still working on a thread that had gotten long.  Another problem was that, even when I had not yet encountered a usage limit, I sometimes got errors indicating that Anthropic’s servers were overloaded and that Claude was not able to respond. When I felt frustra...
    Adam-google - [Http Timeout Error][9]

    Thanks, yes, we received several reports of this last week through the customer support channel and have identified the source of the problem. A fix is already in the release pipeline, but let me see if I can do anything to accelerate that.
    Aurelien - [Intermittent 429 errors on automation bots sending PDFs (started Aug 27–28, 2025)][10]

    Hi 
Situation came again here in France: 429 status for a PDF file generation 
 ![image](https://d2yds90mtvelsl.cloudfront.net/original/3X/1/b/1b46dc66de8d237345d978baa10953cbc144785b.png) 
Attn: 
@lizlynch @yashshreshtharaj @Arthur_Rallu 
Even if a document eventually gets generated, the PDf output is blank, totally ignoring the template content. 
 ![image](https://d2yds90mtvelsl.cloudfront.net/optimized/3X/5/f/5fab184fabd5f77848abcfdf55eccf77a585ee95_2_690x221.png)


**New for you**

* [Pull-down sync on iPads vs. iPhones][11] - 4 - [AppSheet Q&A]
* [Introducing Code Execution: The code sandbox for your agents on Vertex AI Agent Engine][12] - 2 - [Community Articles]
* [Webhook payload issue: data missing and inconsistent error responses][13] - 4 - [AppSheet Q&A]
* [A Practical Guide to Production-Ready Agentic Workflows with ADK and Agent Engine][14] - 1 - [Agents]
* [Keep getting "could not save" error][15] - 1 - [Looker]



[1]: https://discuss.google.dev/
[2]: https://discuss.google.dev/t/september-11-2025-release-notes/264342
[3]: https://discuss.google.dev/t/new-agent-payments-protocol-ap2-an-open-and-secure-standard-for-agentic-payments/265614
[4]: https://discuss.google.dev/t/last-chance-to-complete-the-skills-scribble-challenge/265134
[5]: https://discuss.google.dev/t/scaling-high-performance-inference-cost-effectively/265377
[6]: https://discuss.google.dev/t/september-16-2025-release-notes/265666
[7]: https://discuss.google.dev/t/pull-down-sync-on-ipads-vs-iphones/265380
[8]: https://discuss.google.dev/t/appsheet-parser-suite-analyze-and-clean-up-your-apps/262946
[9]: https://discuss.google.dev/t/http-timeout-error/263905
[10]: https://discuss.google.dev/t/intermittent-429-errors-on-automation-bots-sending-pdfs-started-aug-27-28-2025/260013
[11]: https://discuss.google.dev/t/pull-down-sync-on-ipads-vs-iphones/265380
[12]: https://discuss.google.dev/t/introducing-code-execution-the-code-sandbox-for-your-agents-on-vertex-ai-agent-engine/264336
[13]: https://discuss.google.dev/t/webhook-payload-issue-data-missing-and-inconsistent-error-responses/264767
[14]: https://discuss.google.dev/t/a-practical-guide-to-production-ready-agentic-workflows-with-adk-and-agent-engine/265828
[15]: https://discuss.google.dev/t/keep-getting-could-not-save-error/265020
[16]: https://discuss.google.dev/



This summary is sent from [Google Developer forums][16] when we haven't seen you in a while. Change [your email settings][17], or [click here][18] to unsubscribe.

[17]: https://discuss.google.dev/my/preferences/emails
[18]: https://discuss.google.dev/email/unsubscribe/a052167b0d17f1a2c6586831a9d7e2556fbc94e39336b027ed0db1fcf719ecc7



