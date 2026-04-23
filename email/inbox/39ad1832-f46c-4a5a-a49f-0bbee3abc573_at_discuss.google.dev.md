MIME-Version: 1.0
From: Google Developer forums <no-reply@discuss.google.dev>
To: emil.skogsund@gmail.com
Date: Thu, 27 Nov 2025 19:07:24 +0000
Subject: [Google Developer forums] Summary
Message-ID: <39ad1832-f46c-4a5a-a49f-0bbee3abc573@discuss.google.dev>
Content-Type: multipart/alternative; boundary="--==_mimepart_6928a16c21559_26f4dbd4210559"; charset="UTF-8"

A brief summary of [Google Developer forums][1] since 2025-11-20 18:50:54 UTC

32 New Topics
1 Unread Notifications
1714 New Users


  
  ### Popular Topics

    [Display Image in appsheet using URL][2]

      I just played around with this for a while I found the following. 
 ![Screenshot 2025-11-24 at 19.14.25](https://d2yds90mtvelsl.cloudfront.net/original/3X/4/a/4a1984a6303cf9e796c6da7fd4ade75a66eb7c75.png) 
I made a normal image column and then made an action to write the text of a URL (not merely writing a URL column as a URL) and it worked.  It’s also possible to pull URLs into the image column on the spreadsheet side. 
For more options, please see this post of mine. 


I shows how the choice of column type matters.  Images appear differently in different column types.

    
    [Suggested Values Unique][3]

      What does “sorting them by the most recent week” mean? You seem to be incorrectly assuming I have an idea what your data looks like.

    
    [November 18, 2025][4]

      Deployment Time: 12:00 PM PST
 
Features & enhancements

None
 
Bug fixes

  
   Item
   
   Description
   
  
  
   Bug
   
   As reported in the community, fixed a bug with Export CSV action exporting unfiltered data from views where filters have been applied.
   
  

Rollout changes

None
 
Preview announcements

Preview feature releases enable you to try out new app features that are not yet fully supported. See Product launch stages.
 
No new preview features were released today.

In addition, the AppSheet preview program lets app creators try out new app features that are not yet fully supported. For more details and to opt-in, see AppSheet preview program.

    
    [Fixing pandas memory errors: 3 practical solutions][5]

      By: Robbie Jensen (NVIDIA), Will Hill (NVIDIA), and Jeff Nelson (Google Cloud) 
TL;DR: Running into memory errors when loading big CSV or Parquet files in pandas can be a headache. If your local environment crashes during this process, here are three practical fixes you can try: 

Swap space: Let your system use the hard drive as extra memory. It’s simple to enable, but can slow things down.
Sampling: Load a random portion of your data instead of the whole thing. This is quick and easy on memory, but comes at the cost of lower data fidelity.
Unified Virtual Memory (UVM): When you are using a GPU-accelerated setup, NVIDIA cuDF lets you handle datasets bigger than your GPU’s memory by “spilling” extra data to your CPU’s RAM. This maintains data fidelity and allows processing beyond GPU limits with minimal performance overhead.

To get hands-on, check out the learning path Speed Up Data Analytics on GPUs. 

Introduction
If you’ve ever faced an “Out of Memory” (OOM) error working with big ...

    
    [Navigating the Industry Shift in Client Authentication for Apigee mTLS][6]

      The secure foundation of server-to-server communication is facing a mandatory industry shift: most major Public Certificate Authorities (CAs) are getting out of the business of issuing publicly trusted certificates for use in Client Authentication. This change is not a technological one, but rather a shift in responsibility, forcing organizations to adapt their Public Key Infrastructure (PKI) models. 
If you are currently leveraging a Public CA to sign the client certificates used for Mutual TLS (mTLS) within an API Gateway environment like Apigee, you are now in a difficult position. 
The Industry Shift: The Removal of the Client Authentication EKU
The source of this transition is a policy change driven by major CAs, including Sectigo and DigiCert, and supported by policy bodies like Google Chrome. These CAs are phasing out the Client Authentication Extended Key Usage (EKU) from publicly trusted SSL/TLS certificates. 
The Technical Impact on mTLS
The removal of the EKU directly impact...

    

  


  ### Popular Posts

    Koichi_Tsuji - [Request access to the private preview of AppSheet MCP server to enable your apps as AI agent tools!][7]

    @goannsplain 
I personally agree with others who posted here, i.e. the AppSheet should address the ongoing & pending issues (fix bugs) first of all, while we also welcome the new features to be topped up to this platform. 
Before Google time, the team (AppSheet) always hosted the quick webiner to introduce the new features and address Q&A from the attendees basis real-time. Why your team abandoned the effort to host such a useful webiner?  If I m correct, the meaningful AppSheet Event never hosted for a long time. 
When your team is to introduce such a brand new features, the best way to approach to the mass audience is to quickly host the online webiner (Office Hours in the old fashioned manner it is called.) 
Is this because Google Meets is not providing a capability to host such a webiner against the large (unlimited numbers) of the attendees/audience? Or your team is just shy to show up in such a place? 
I really hope the AppSheet Office Hours (event) will be back again.
    Koichi_Tsuji - [November 18, 2025][8]

    This bug fix seems to be “half way through”…. 
The reported bug (all the rows are exported even after we apply filteres to the row) seems to be fixed.  However, the export CSV function still exporting COLUMNS which are actually hidden from the view. 
For instance, we have A, B, C column in a slice which is source of list type view such as table view.  We create the table view in the column order of B followed by C, while the A column is hidden from the table view.  With this condition, the export CSV action is excuted, but the all the column values are unexpectedly exported to the CSV in the column order of A, followed by B, and C.  This is not original behavior when this action of “Export this VIEW to a CSV file”. 
As its name suggests, “Export this VIEW to a CSV file”, the columns and rows which are visible on the surface of the app should be exported, but the current behavior is “Export the source tables or slices to the a CSV file in the column order of the source table/slice” 
If...
    Kirk_Masden - [Display Image in appsheet using URL][9]

    I just played around with this for a while I found the following. 
 ![Screenshot 2025-11-24 at 19.14.25](https://d2yds90mtvelsl.cloudfront.net/original/3X/4/a/4a1984a6303cf9e796c6da7fd4ade75a66eb7c75.png) 
I made a normal image column and then made an action to write the text of a URL (not merely writing a URL column as a URL) and it worked.  It’s also possible to pull URLs into the image column on the spreadsheet side. 
For more options, please see this post of mine. 


I shows how the choice of column type matters.  Images appear differently in different column types.


**New for you**

* [[COMMUNITY PROJECT] Desktop Push Notifications for AppSheet (Multi-App Support & Background Webhooks)][10] - 11 - [Tips & Tricks]
* [GCP Kill Switch : Introducing NoBBomb][11] - 2 - [Serverless Applications]
* [Big App Sync Delays - Data Type Conversion (Nov 7)][12] - 7 - [AppSheet Q&A]
* [How Order Lookup][13] - 2 - [AppSheet Q&A]
* [NEW official docs: Register and manage ADK and A2A agents in Gemini Enterprise][14] - 2 - [Agents]



[1]: https://discuss.google.dev/
[2]: https://discuss.google.dev/t/display-image-in-appsheet-using-url/290546
[3]: https://discuss.google.dev/t/suggested-values-unique/289970
[4]: https://discuss.google.dev/t/november-18-2025/290966
[5]: https://discuss.google.dev/t/fixing-pandas-memory-errors-3-practical-solutions/289622
[6]: https://discuss.google.dev/t/navigating-the-industry-shift-in-client-authentication-for-apigee-mtls/289627
[7]: https://discuss.google.dev/t/request-access-to-the-private-preview-of-appsheet-mcp-server-to-enable-your-apps-as-ai-agent-tools/288820
[8]: https://discuss.google.dev/t/november-18-2025/290966
[9]: https://discuss.google.dev/t/display-image-in-appsheet-using-url/290546
[10]: https://discuss.google.dev/t/community-project-desktop-push-notifications-for-appsheet-multi-app-support-background-webhooks/290653
[11]: https://discuss.google.dev/t/gcp-kill-switch-introducing-nobbomb/291612
[12]: https://discuss.google.dev/t/big-app-sync-delays-data-type-conversion-nov-7/291183
[13]: https://discuss.google.dev/t/how-order-lookup/290457
[14]: https://discuss.google.dev/t/new-official-docs-register-and-manage-adk-and-a2a-agents-in-gemini-enterprise/290762
[15]: https://discuss.google.dev/



This summary is sent from [Google Developer forums][15] when we haven't seen you in a while. Change [your email settings][16], or [click here][17] to unsubscribe.

[16]: https://discuss.google.dev/my/preferences/emails
[17]: https://discuss.google.dev/email/unsubscribe/fe606f4dc01578dcdfa5f1da7bbfda822c32565fbe6a503cdba27ca3f9aecddd



