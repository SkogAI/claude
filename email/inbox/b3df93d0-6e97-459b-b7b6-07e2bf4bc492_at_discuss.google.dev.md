MIME-Version: 1.0
From: Google Developer forums <no-reply@discuss.google.dev>
To: emil.skogsund@gmail.com
Date: Thu, 22 Jan 2026 21:52:09 +0000
Subject: [Google Developer forums] Summary
Message-ID: <b3df93d0-6e97-459b-b7b6-07e2bf4bc492@discuss.google.dev>
Content-Type: multipart/alternative; boundary="--==_mimepart_69729c08c68cd_282d27e4185750"; charset="UTF-8"

A brief summary of [Google Developer forums][1] since 2026-01-15 21:21:51 UTC

32 New Topics
1 Unread Notifications
1729 New Users


  
  ### Popular Topics

    [Field service- help to show sites strill open][2]

      Base on this comment above, are you able to assume that any entries for equipment used at previous sites will be in a “closed” status?  In other words,  is there only ever one site record “open” for each piece of equipment? 
If so, then the expression @OptimiX_XcrY provided should suffice.  By omitting all closed entries, you should only be left with all “open” status records and there should be only one per equipment. 
You can simplify that expression like this: 
NOT(IN([status], {“closed1“, “closed2“, “closed3“, “closed4“})) 
If for some reason there can be multiple site entries in an “open” status for the same equipment, the expression becomes more complicated but is still doable.  I’ll provide that expression only if you need it. 
FYI…some additional pointers you may find helpful….. 
If you plan to expand this app with additional functionality, you will find implementations difficult having all these details in a single table.  You probably should think about a different data desi...

    
    [Images disappearing after sync][3]

      Hi everyone, 
I’m experiencing a strange issue with image display in my app. Images are uploaded through a form, saved in a Google Drive folder, and the relative path is correctly written to the Google Sheet. The image shows up initially, but after a sync, it disappears from the app view. 
What’s odd is that if I close the app and reopen it later, the image sometimes reappears. So it seems like the image file is there, and the path is correct, but AppSheet intermittently fails to load or display it right after syncing. 
A few additional details: 


The image column is set to type Image. 


The image path saved in the sheet is a relative path like: AppName/Images/filename.jpg. 


There are no security filters affecting the row. 


Offline features and delayed sync are enabled. 


Has anyone else run into this issue? Is there a known workaround to make sure the image consistently displays after sync? 
Thanks in advance!

    
    [10-Minute Agentic RAG with the New Vector Search 2.0 and ADK][4]

      Traditional RAG just retrieves and summarizes. Agentic RAG “reasons” about how to search. 
When a user asks “Find me a creative artist workspace in Hackney under £200”—the agent parses intent, builds filters, calls the right search, and responds conversationally. 
Building this used to mean stitching together embedding pipelines, vector databases, and agent frameworks. 
With Vector Search 2.0 + ADK, it’s: 

One Collection with auto-embeddings
One Python function for hybrid search
One Agent definition

My latest post walks through building a travel agent that searches 2,000 London Airbnb listings—with a runnable notebook to try it yourself: 
https://medium.com/google-cloud/10-minute-agentic-rag-with-the-new-vector-search-2-0-and-adk-655fff0bacac

    
    [How to keep decimal value in Number() expression?][5]

      Based on understanding of your description, you wish to extract a decimal value from a text string and further use it for calculation. 
If so please try the following expression in a decimal type column. 
INDEX(EXTRACTNUMBERS([Text_Column]),1) 
The above assumes that there is one decimal value in the [Text_Column] that you wish to extract and save it in a decimal type column for further calculation. 
So, if the [Text_Column] contains a text string say , “The weight of the baggage is 75.35 kgs” , the result in the decimal column would be 75.35 
Example below: 
The text string is hardcoded in a decimal type VC. 
 ![image](https://d2yds90mtvelsl.cloudfront.net/optimized/3X/d/5/d5d3bda2a9c7308b93a8a88abafabe105637cc45_2_689x225.png) 
The test pane shows the result as below 
 ![image](https://d2yds90mtvelsl.cloudfront.net/optimized/3X/8/0/80a4cc31ae400a1d924668b133201acc91f35e16_2_690x306.png) 
The result is shown in the detail view as below 
 ![image](https://d2yds90mtvelsl.cloudfront.net/...

    
    [Automating knowledge graph creation with Gemini and ApertureDB - Part 4][6]

      Authors

Tai Conley 
Ayesha Imran 

Reacp & objectives
So far we have extracted entities, properties, and relationships from a PDF corpus, ingested them into ApertureDB, generated 768-dim Gemini embeddings for every entity, stored them in a DescriptorSet, and wired each vector to its source node via has_embedding. 
We can now test two Retrieval-Augmented Generation pipelines: 
 ![1 Part 4](https://d2yds90mtvelsl.cloudfront.net/optimized/3X/0/7/07a69d35c76996c9e2f58e93e0047500912849e5_2_690x171.png) 
This part shows how to build both pipelines and, importantly, why evaluating them is more nuanced than tossing Precision@k, Recall@k and MAP at the problem. 
Notebook & data: As before, code below is trimmed for readability. The full, executable Colab notebook (with setup cells, error handling, logging, etc.) and the complete Github repo are linked. The repo also contains some sample data you can use to run the notebooks. You will find that there are two versions of the notebook: 

The clou...

    

  


  ### Popular Posts

    Denzil_Snyman - [January AppSheet Office Hours Registration is now available!][7]

    @cschalk_ws Hi, 
Any feedback on the Office hours event, it has been quiet for 2 weeks and I’m sure the community really has hopes that there is some sort of positive movement to look forward to. So many “In Preview* things incompleted and it does feel like there could be some devotion put back into this platform from its management. Please do bring good news that will most importantly be kept honoured in good time frames.
    Rifad - [January 7, 2026][8]

    All these comments directly affect when someone asks their favorite LLM, like ChatGPT or Grok, about the best low-code tool. The AI tells them that AppSheet is rated 5 out of 10 compared to other tools, and Retool is better, even though AppSheet might be actually better. This negative feedback loop isn’t good, even if I do it, but we users are forced to do it. Take a note of this Google Team!
    Suvrutt_Gurjar - [How to keep decimal value in Number() expression?][9]

    Based on understanding of your description, you wish to extract a decimal value from a text string and further use it for calculation. 
If so please try the following expression in a decimal type column. 
INDEX(EXTRACTNUMBERS([Text_Column]),1) 
The above assumes that there is one decimal value in the [Text_Column] that you wish to extract and save it in a decimal type column for further calculation. 
So, if the [Text_Column] contains a text string say , “The weight of the baggage is 75.35 kgs” , the result in the decimal column would be 75.35 
Example below: 
The text string is hardcoded in a decimal type VC. 
 ![image](https://d2yds90mtvelsl.cloudfront.net/optimized/3X/d/5/d5d3bda2a9c7308b93a8a88abafabe105637cc45_2_689x225.png) 
The test pane shows the result as below 
 ![image](https://d2yds90mtvelsl.cloudfront.net/optimized/3X/8/0/80a4cc31ae400a1d924668b133201acc91f35e16_2_690x306.png) 
The result is shown in the detail view as below 
 ![image](https://d2yds90mtvelsl.cloudfront.net/...
    WillowMobileSys - [How do I set up my AppSheet similar to the provided image?][10]

    First make sure you some kind of Events or Calendar data with Start and/or End DateTimes,  A column that describes the event and a group or category column. 
Then you would use a Calendar view in AppSheet, assign your dataset and then configure the view as described in the image below. 
I hope this helps! 
 ![image](https://d2yds90mtvelsl.cloudfront.net/optimized/3X/1/3/1357624589d7c93c3422ded01300b076949afab4_2_690x427.jpeg)
    JhunePol - [2 values can input in 1 field?][11]

    If you want the result to be “Britney - 92” and the member is not editable. You will need another physical column to put a score for every member. Let’s say, Score 1, Score 2, Score 3..Meaning Score 1 is for Member 1 and so on..In the form, you can display the column Score 1 after the Member 1. 
Then Uncheck the Editable? for the Member 1, Member 2, Member 3, etc… 
Create a virtual column Name 1, Name 2, Name 3, etc. For Member 1, put the formula CONCATENATE([Member 1], " - ", [Score 1]), then show it on your table, and hide your Member 1 column and Score 1 column in your table.


**New for you**

* [Critical Bug Report: Transaction (requestId) duplicated. Server fails Idempotency check on 10 days apart syncs, causing data overwrite (Zombie Edit)][12] - 8 - [AppSheet Q&A]
* [How do I set up my AppSheet similar to the provided image?][13] - 5 - [AppSheet Q&A]
* [Double nesting a deref][14] - 4 - [AppSheet Q&A]
* [2 values can input in 1 field?][15] - 5 - [AppSheet Q&A]
* [Focus loss with Zebra TC27 terminal][16] - 4 - [AppSheet Q&A]



[1]: https://discuss.google.dev/
[2]: https://discuss.google.dev/t/field-service-help-to-show-sites-strill-open/321213
[3]: https://discuss.google.dev/t/images-disappearing-after-sync/322605
[4]: https://discuss.google.dev/t/10-minute-agentic-rag-with-the-new-vector-search-2-0-and-adk/321872
[5]: https://discuss.google.dev/t/how-to-keep-decimal-value-in-number-expression/322004
[6]: https://discuss.google.dev/t/automating-knowledge-graph-creation-with-gemini-and-aperturedb-part-4/322574
[7]: https://discuss.google.dev/t/january-appsheet-office-hours-registration-is-now-available/294541
[8]: https://discuss.google.dev/t/january-7-2026/318825
[9]: https://discuss.google.dev/t/how-to-keep-decimal-value-in-number-expression/322004
[10]: https://discuss.google.dev/t/how-do-i-set-up-my-appsheet-similar-to-the-provided-image/322688
[11]: https://discuss.google.dev/t/2-values-can-input-in-1-field/321547
[12]: https://discuss.google.dev/t/critical-bug-report-transaction-requestid-duplicated-server-fails-idempotency-check-on-10-days-apart-syncs-causing-data-overwrite-zombie-edit/322591
[13]: https://discuss.google.dev/t/how-do-i-set-up-my-appsheet-similar-to-the-provided-image/322688
[14]: https://discuss.google.dev/t/double-nesting-a-deref/321176
[15]: https://discuss.google.dev/t/2-values-can-input-in-1-field/321547
[16]: https://discuss.google.dev/t/focus-loss-with-zebra-tc27-terminal/321825
[17]: https://discuss.google.dev/



This summary is sent from [Google Developer forums][17] when we haven't seen you in a while. Change [your email settings][18], or [click here][19] to unsubscribe.

[18]: https://discuss.google.dev/my/preferences/emails
[19]: https://discuss.google.dev/email/unsubscribe/d7bf92224082bc219422820ec6b18a164fd651c6c3a998b298f70350bca77a79



