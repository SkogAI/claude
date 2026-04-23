MIME-Version: 1.0
From: Google Developer forums <no-reply@discuss.google.dev>
To: emil.skogsund@gmail.com
Date: Thu, 29 Jan 2026 22:21:09 +0000
Subject: [Google Developer forums] Summary
Message-ID: <5b0b47e6-a1c4-4411-bbc0-58e988dde3d8@discuss.google.dev>
Content-Type: multipart/alternative; boundary="--==_mimepart_697bdd54c2679_2802af7c427634e"; charset="UTF-8"

A brief summary of [Google Developer forums][1] since 2026-01-22 21:52:09 UTC

28 New Topics
1 Unread Notifications
1928 New Users


  
  ### Popular Topics

    [Error with payment... delinquent account payment failed][2]

      I have a critical error, I have been trying to make clear my delinquent account for weeks now,  I keep getting an error after “ error paying invoice”  I have tried multiple cards and I know they are not blocking the transaction.  My app is now past due and I cannot access anything.  This is a huge issue!  Please help!  I saw in another topic that someone had the exact same problem as I am having but did not go into any detail as how to fix it.   I tried using the appsheet help with no success… I have tried emailing them and I get a response saying that the help resource is no longer available…  Thanks in advance!! 
@Jose_Arteaga

    
    [Recursive Language Models in ADK ][3]

      Implementing and extending the most exciting Agentic Paradigm of 2026
Recursive Language Models (RLM) is a promising architecture proposed by Alex Zhang and colleagues at MIT. In their paper, published at the very end of 2025, they proved that this model architecture could scale to extremely long context lengths (10M+ tokens) and perform well on information-dense tasks that other architectures struggle with. 
Brief summary of RLM
Recursive Language Models (RLM) push the frontier of agent autonomy by providing the agent complete control of its own context. Rather than feeding context directly to a language model, and facing limitations around context length and long-context reasoning quality, RLMs allow the agent to manipulate the context itself by controlling an interactive coding environment (“REPL”). Importantly, this REPL comes loaded with a few pre-defined variables and functions. 


A variable, context, contains the entire context (up to 10M+ tokens). In Zhang et. al’s paper, this...

    
    [Using QuickChart in AppSheet][4]

      Is this AppSheet’s way of telling us not to expect improvements to the built-in charting features?

    
    [Upgraded to 26 but no tabbed dashboards feature][5]

      Release notes say tabbed dashboards would be available in Looker 26. We’re on Looker 26, but no tabbed dashboards. What’s going on? 
 ![image](https://d2yds90mtvelsl.cloudfront.net/original/3X/7/1/716b8ef52d058269267a047e81a4d529c57ca46c.png) 
 ![image](https://d2yds90mtvelsl.cloudfront.net/optimized/3X/f/4/f47d4e12b4955575725054a27ec5e5b849861618_2_333x500.png)

    
    [How to resolve "Expensive Format Rule" warning when checking child records from a parent table][6]

      Please try below, in the Cost table , please add a Y/N type VC called say [Flag_Red_C] with an expression something like 
AND( 
ISNOTBLANK([End_Date]), 
TODAY() > [End_Date], 
[Total Days Run] > [Total Time], 
[Total Days Run] < FLOOR([Total Time] * 1.5) 
) 
In the parent table you could have another VC of type Y/N called say [Flag_Red_M] in the parent table  with an expression something like 
IN(TRUE, [Related Costs][Flag_RED_C]) 
Now the format rule could have an expression something like [Flag_Red_M] 
Yes, the above suggestion is based on 2 VCs. However the VC  [Flag_Red_C]  's expression is based on values from the same record. The second VC in the parent table,  [Flag_Red_M] is based on system generated reverse reference column. So it is likely less expensive. 
The above suggestion basically shifts the computation to VCs rather than in the format rule.

    

  


  ### Popular Posts

    Steve - [Using QuickChart in AppSheet][7]

    Is this AppSheet’s way of telling us not to expect improvements to the built-in charting features?
    jonas-d - [January 2026 Looker Highlights: Your 2026 Strategy Starts Now!][8]

    When are the tabbed dashboards coming to Looker (Google Cloud core) instances?
    Suvrutt_Gurjar - [How to resolve "Expensive Format Rule" warning when checking child records from a parent table][9]

    Please try below, in the Cost table , please add a Y/N type VC called say [Flag_Red_C] with an expression something like 
AND( 
ISNOTBLANK([End_Date]), 
TODAY() > [End_Date], 
[Total Days Run] > [Total Time], 
[Total Days Run] < FLOOR([Total Time] * 1.5) 
) 
In the parent table you could have another VC of type Y/N called say [Flag_Red_M] in the parent table  with an expression something like 
IN(TRUE, [Related Costs][Flag_RED_C]) 
Now the format rule could have an expression something like [Flag_Red_M] 
Yes, the above suggestion is based on 2 VCs. However the VC  [Flag_Red_C]  's expression is based on values from the same record. The second VC in the parent table,  [Flag_Red_M] is based on system generated reverse reference column. So it is likely less expensive. 
The above suggestion basically shifts the computation to VCs rather than in the format rule.
    Kirk_Masden - [Using QuickChart in AppSheet][10]

    Thanks for citing this post of mine!  I hope this new post of yours will encourage others to take the QuickChart plunge.  :slight_smile:
    WillowMobileSys - [How to resolve "Expensive Format Rule" warning when checking child records from a parent table][11]

    I believe any time you have a LIST function implemented you are going to get that warning. It’s just a warning that it MAY be expensive and that will depend on your application of the Format Rule and how big the [Related Costs] list grows to. 
Also, keep in mind that Format Rules must search the entire app for usage of the target items you want the rule applied towards.    If it is a heavily utilized area with lots of views displaying your target items, that adds to the overall performance degradation.  Each time the data associated with the rule changes, the Format Rule needs to be re-evaluated for updates.  This can be more expensive than a virtual column depending on frequency of the data changes. 
Basically, your expression is creating a Slice of data on the fly.  I would recommend creating a Virtual Column to collect these rows and move the expression to there.  Then your Format Rul will only need to do ISNOTBLANK([New Row List]). 
I hope this helps!


**New for you**

* [Tabbed Dashboard Feature has Disappeared][12] - 7 - [Looker]
* [AppSheet API Find with Properties.Selector returns no rows for strings of this pattern: #a#a#### / #A#A####][13] - 6 - [AppSheet Q&A]
* [Cross-Granularity Calculations in Looker][14] - 3 - [Technical Tips & Tricks]
* [Are AppSheet Teams restricted to a single domain?][15] - 4 - [AppSheet Q&A]
* [Telgram summary report][16] - 2 - [AppSheet Q&A]



[1]: https://discuss.google.dev/
[2]: https://discuss.google.dev/t/error-with-payment-delinquent-account-payment-failed/323493
[3]: https://discuss.google.dev/t/recursive-language-models-in-adk/323523
[4]: https://discuss.google.dev/t/using-quickchart-in-appsheet/324637
[5]: https://discuss.google.dev/t/upgraded-to-26-but-no-tabbed-dashboards-feature/324991
[6]: https://discuss.google.dev/t/how-to-resolve-expensive-format-rule-warning-when-checking-child-records-from-a-parent-table/325238
[7]: https://discuss.google.dev/t/using-quickchart-in-appsheet/324637
[8]: https://discuss.google.dev/t/january-2026-looker-highlights-your-2026-strategy-starts-now/323223
[9]: https://discuss.google.dev/t/how-to-resolve-expensive-format-rule-warning-when-checking-child-records-from-a-parent-table/325238
[10]: https://discuss.google.dev/t/using-quickchart-in-appsheet/324637
[11]: https://discuss.google.dev/t/how-to-resolve-expensive-format-rule-warning-when-checking-child-records-from-a-parent-table/325238
[12]: https://discuss.google.dev/t/tabbed-dashboard-feature-has-disappeared/324950
[13]: https://discuss.google.dev/t/appsheet-api-find-with-properties-selector-returns-no-rows-for-strings-of-this-pattern-a-a-a-a/324381
[14]: https://discuss.google.dev/t/cross-granularity-calculations-in-looker/324903
[15]: https://discuss.google.dev/t/are-appsheet-teams-restricted-to-a-single-domain/325245
[16]: https://discuss.google.dev/t/telgram-summary-report/323934
[17]: https://discuss.google.dev/



This summary is sent from [Google Developer forums][17] when we haven't seen you in a while. Change [your email settings][18], or [click here][19] to unsubscribe.

[18]: https://discuss.google.dev/my/preferences/emails
[19]: https://discuss.google.dev/email/unsubscribe/5ca5b2151120f04d254909c4b4347b4479e41c390a52841b1a19f373e0fe0234



