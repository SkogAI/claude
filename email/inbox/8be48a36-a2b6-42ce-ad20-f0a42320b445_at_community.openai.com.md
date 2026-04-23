MIME-Version: 1.0
From: OpenAI Developer Community <notifications@openai1.discoursemail.com>
To: emil.skogsund@gmail.com
Date: Sat, 14 Mar 2026 00:57:25 +0000
Subject: [OpenAI Developer Community] Summary
Message-ID: <8be48a36-a2b6-42ce-ad20-f0a42320b445@community.openai.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69b4b275250fb_2a8225681684228"; charset="UTF-8"

A brief summary of [OpenAI Developer Community][1] since 2026-03-07 00:34:08 UTC

44 New Topics
2878 New Users


  
  ### Popular Topics

    [Auto Compression Not Triggering – Codex Still Runs Out of Context Window][2]

      Codex currently tends to exhaust the content window very quickly. I’m using GPT-5.4 and have set the token limit to 1M, but after just a single round of conversation it shows: 
“Codex ran out of room in the model’s context window. Start a new thread or clear earlier history before retrying.” 
I also enabled automatic compression and even set a limit smaller than 1M, but it doesn’t seem to compress automatically, and the issue still persists.

    
    [Study on new ways of working with Codex][3]

      I’ve read that Codex is now fully or almost fully developed by Codex. I research software engineering and how it evolves, and I would like to talk to Codex developers, or the community more broadly, about how this works in practice. Can someone help me out and give me 30 minutes of their time?

    
    [Codex for Open Source - 2026][4]

      Open AI recently announced a new Codex for Open Source plan at: 


It is a fantastic initiative and covers: 

What the program includes

Six months of ChatGPT Pro with Codex for day-to-day coding, triage, review, and maintainer workflows
Conditional access to Codex Security for repositories that need deeper security coverage
API credits through the Codex Open Source Fund for projects that use Codex in pull request review, maintainer automation, release workflows, or other core OSS work


A few of us at Discourse were accepted to the program overnight :hugs: 
Thanks @tibo and all involved in kicking off the program.

    
    [Empty shell commands when mixed shell tool with function tools][5]

      I’m using the Agents SDK with the shell tool together with other tools (e.g. apply_patch and function tools) in the same tools array. In that setup the model sends a shell_call with empty commands, and the SDK throws ModelBehaviorError. 
When I remove the other tools and keep only the shell tool, the model runs the shell tool correctly (with real commands) and no error is thrown. 
So the issue appears when shell is mixed with other tools: we get a shell call with empty commands and ModelBehaviorError. With shell alone it works.

    
    [Potential destructive command mis-parsing on Windows: agent cleanup via cmd /c may delete workspace content instead of target folder][6]

      Summary
During an automated cleanup step executed by a Codex agent on Windows, a command intended to delete a small temporary folder appears to have recursively deleted the entire workspace contents. 
The most plausible explanation is that the final argument to rmdir was mis-parsed through a multi-shell chain: 
Tool → PowerShell → cmd /c → rmdir

This may cause the effective delete target to become . or the workspace root when the argument is lost or misinterpreted. 
The command timed out after ~14 seconds, which strongly suggests a recursive delete over a large directory tree rather than the intended small test directory. 

Environment


OS: Windows 10 


Shell stack: 


tool invocation 


PowerShell 


cmd /c 


rmdir 




Workspace location example: 


E:\...\data_scrubbing


Codex agent mode executing shell commands


Intended operation
Delete a temporary test directory: 
qa,comma

Expected command behavior: 
rmdir /s /q "qa,comma"

Expected result: 
data_scrubbing\qa,comma removed...

    

  


  ### Popular Posts

    daniel_gonthier - [Critical Data Loss Issue in Codex App for Windows – Agent Executed File Deletion Outside Project Directory][7]

    I am reporting the same critical issue. Another confirmed case. 
Date: 7 March 2026, approximately 20:50 AWST Location: Australia Application: Codex App for Windows (Microsoft Store) Model: GPT-5.4 Mode: Local / Full Access OS: Windows 11 
What happened
I was working normally on a project in the Codex App for Windows using GPT-5.4. Without any prior command, warning, or user action, the project suddenly appeared completely empty. Upon investigation, I discovered that files had been massively deleted — not only from the project directory, but from my Desktop, multiple local project folders, and other areas of my filesystem. 
The destruction was total: months of professional development work were wiped in seconds, including proprietary algorithmic trading systems, complete web projects, historical testing and performance data, and multiple independent software projects that were running locally. These represent my primary source of income and months of irreplaceable intellectual effort. 
...
    sanchomuzax - [Using Codex CLI remotely using your mobile device][8]

    I’m running VSCode and a code-server project on a Raspberry Pi. The latter ensures that I can access VSCode from a browser, even from my phone. This allows me to control Codex in a way that is convenient for me. A VPN server (+ nip.io) is running on my home router, so I can access the system securely. 


 ![1000111782](https://us1.discourse-cdn.com/openai1/optimized/4X/6/3/7/637d3c9fffee58ab46d76a047da17f5002f23b83_2_224x500.jpeg)
    igochan - [The Official ImageGen, 4o and Dall-E Megathread][9]

    Some of my creations related to DnD 
 ![ChatGPT Image 8 de març del 2026, 23_26_02](https://us1.discourse-cdn.com/openai1/optimized/4X/f/3/9/f39af899a677622f11f20e5fd04767b928d1e649_2_690x460.jpeg) 
 ![ChatGPT Image 6 de març del 2026, 21_31_16](https://us1.discourse-cdn.com/openai1/optimized/4X/3/f/e/3fee5a76c7d3b6829080a49b2cbb149fbcb3166f_2_690x460.jpeg) 
 ![ChatGPT Image 21 de des. del 2025, 11_44_24](https://us1.discourse-cdn.com/openai1/optimized/4X/e/e/1/ee12c08cb75f17aba33700676ed557931b755dfd_2_333x500.jpeg) 
 ![file_00000000e67071f49dad02d708d29935](https://us1.discourse-cdn.com/openai1/optimized/4X/3/9/3/393d3f7f38ff6242ad0bd7e07102f72872ec0f5b_2_333x500.jpeg) 
 ![file_00000000961071f5b55a3aa8ff5c64dd](https://us1.discourse-cdn.com/openai1/optimized/4X/a/6/2/a62e5c58fb9da33c7b6954a772f7a1826aa19eda_2_333x500.jpeg) 
 ![elfa_troll_1080p](https://us1.discourse-cdn.com/openai1/optimized/4X/2/6/4/2643b0022764985abc37141e79971100f6178ad3_2_690x388.jpeg) 
 ![ChatGPT Image 6 de març...
    jwehrstein - [Shell tool in Responses API not available bug][10]

    The issue appeared today again @wendyjiao @OpenAI_Support 
Experienced it with gpt-5.4-2026-03-05  (with tool-search-tool). 
Shell & Apply-Patch tools are not visible to the agent, only my custom function tools. 
LLM Output states that it does not have Shell or ApplyPatch Tool. Not even seeing Tool-Search-Tool.  Though response log (properties section) shows all tools are present (respID: resp_036dd8334816af9c0069b1716f53c0819abd03a41f0be5d38e )
    af0r - [Using Codex CLI remotely using your mobile device][11]

    yess!! i use termius but i can say that the claude app for ios is superior, i like termius dont get me wrong but a good ui would go a long way. also the aesthetic of the codex app would fit nicely on an iphone


**New for you**

* [Codex - Advanced configurations - Winsock's personal library][12] - 12 - [Codex]
* [How to Delete Chat History in the Codex App][13] - 2 - [Codex]
* [OpenAI should change roadmap][14] - 4 - [Community]
* [How to contact sales to enable Zero Data Retention controls?][15] - 3 - [API]
* [Creating and Prompting Codex Skills][16] - 1 - [Prompting]



[1]: https://community.openai.com/
[2]: https://community.openai.com/t/auto-compression-not-triggering-codex-still-runs-out-of-context-window/1376334
[3]: https://community.openai.com/t/study-on-new-ways-of-working-with-codex/1376442
[4]: https://community.openai.com/t/codex-for-open-source-2026/1376418
[5]: https://community.openai.com/t/empty-shell-commands-when-mixed-shell-tool-with-function-tools/1376053
[6]: https://community.openai.com/t/potential-destructive-command-mis-parsing-on-windows-agent-cleanup-via-cmd-c-may-delete-workspace-content-instead-of-target-folder/1376026
[7]: https://community.openai.com/t/critical-data-loss-issue-in-codex-app-for-windows-agent-executed-file-deletion-outside-project-directory/1375894
[8]: https://community.openai.com/t/using-codex-cli-remotely-using-your-mobile-device/1375896
[9]: https://community.openai.com/t/the-official-imagegen-4o-and-dall-e-megathread/1230134
[10]: https://community.openai.com/t/shell-tool-in-responses-api-not-available-bug/1375776
[11]: https://community.openai.com/t/using-codex-cli-remotely-using-your-mobile-device/1375896
[12]: https://community.openai.com/t/codex-advanced-configurations-winsocks-personal-library/1376527
[13]: https://community.openai.com/t/how-to-delete-chat-history-in-the-codex-app/1376530
[14]: https://community.openai.com/t/openai-should-change-roadmap/1376154
[15]: https://community.openai.com/t/how-to-contact-sales-to-enable-zero-data-retention-controls/1375972
[16]: https://community.openai.com/t/creating-and-prompting-codex-skills/1376382
[17]: https://community.openai.com/



  This summary is sent from [OpenAI Developer Community][17] when we haven't seen you in a while. Change [your email settings][18], or [click here][19] to unsubscribe.

[18]: https://community.openai.com/my/preferences/emails
[19]: https://community.openai.com/email/unsubscribe/fc88ffe233c1118a3cfb4118850475d9b3faa5a4149584f8149e6cf6582585e4



