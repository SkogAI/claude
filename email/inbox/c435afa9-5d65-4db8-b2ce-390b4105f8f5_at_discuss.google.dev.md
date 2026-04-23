MIME-Version: 1.0
From: Google Developer forums <no-reply@discuss.google.dev>
To: emil.skogsund@gmail.com
Date: Thu, 25 Sep 2025 16:34:44 +0000
Subject: [Google Developer forums] Summary
Message-ID: <c435afa9-5d65-4db8-b2ce-390b4105f8f5@discuss.google.dev>
Content-Type: multipart/alternative; boundary="--==_mimepart_68d56f2459d13_2724a48418750"; charset="UTF-8"

A brief summary of [Google Developer forums][1] since 2025-09-18 16:07:57 UTC

44 New Topics
1 Unread Notifications
1255 New Users


  
  ### Popular Topics

    [A Honest Reflection on AppSheet’s Direction (and Why We’re Getting Frustrated)][2]

      As someone who has loved AppSheet for years, trained thousands of users, and built hundreds of management solutions with it, I had high hopes when Google acquired AppSheet back in 2020. I truly believed this would be the moment for AppSheet to accelerate and compete head-to-head with platforms like PowerApps, LarkSuite, or Glide. 
But here we are, 5 years later — and I have to admit, I feel disappointed. The pace of improvement has been painfully slow, sometimes even regressing, while competitors have been pushing forward aggressively. 
Take LarkSuite, for example: in just this year alone, they have rolled out remarkable improvements in UX, automation, mobile views, AI integration, and extended data to millions of rows. Meanwhile, AppSheet updates from Google feel like a slow drip — minor features here and there, often overshadowed by persistent bugs that frustrate both developers and end-users. 
In the age of AI, when tools like VibeCode AI or PowerApps’ AI Builder allow you to spin u...

    
    [Unable to save editor][3]

      To share what I see new errors in editor, let me post and share the screenshot. 
Not seeing the save error on all the apps, but see in some of our complex apps. 
Currently utterly unable to save what we made changes in app config. Anyone else sees the same errors? 
 ![2025-09-23_09-00-49](https://d2yds90mtvelsl.cloudfront.net/optimized/3X/e/a/ea6b36986265a733764754cef9edaa8939d813af_2_690x337.png)

    
    [New Mobile Framework (Preview) - Columns Disappearing from Form View][4]

      Hello, 
I’m experiencing an issue with the New mobile framework (preview) where specific column data isn’t displaying correctly in a system-generated form view. The app works as expected with the classic framework. 
Problem Description 
In my app “TomaPedidos18,” the Detalles_form view, which is system-generated, is not displaying data for two specific columns: “Observaciones del Renglón (para preparar)” and “Observaciones de Artículo (para la factura)”. This occurs only when the new mobile framework is enabled. 
Strange Behavior Observed 
I’ve noticed a peculiar behavior in the App as well as in the AppSheet editor: 

When I manually remove one of the two problem columns from the Column Order list in the Detalles_form UX, the other column immediately becomes visible in the preview.
However, as soon as I click Save, both columns disappear again from the view.
This also happens if I remove a column and then add it back to the Column Order list before saving. The data remains hidden afte...

    
    [CRITICAL error after transferring app (data issue?)][5]

      I transferred my app to my google workspace account and instead of sharing the Google Sheet with my workspace account I went to just select it again in Appsheet data sources. Then I started to get this error below (even though the rows are the same) and when I try to regenerate the table the page just hangs. I’ve tried to copy the app, go back to previous versions, go back to prototype, go into recovery mode and nothing changes the errors. 
 ![image](https://d2yds90mtvelsl.cloudfront.net/original/3X/6/f/6f19ce9deb1d06868259dd4fa59ff91ef25dec24.png) 
This is my table: 
 ![image](https://d2yds90mtvelsl.cloudfront.net/original/3X/4/d/4dd4a4945fc823072ed1e2cd39bb827b1eccd236.png) 
This is the Google Sheet: 
![image](https://d2yds90mtvelsl.cloudfront.net/original/3X/9/c/9c35daeff9527ebdcc172915d6d9cb9ae841d233.png) 
I’ve contacted Appsheet support but it takes 24 hours for Appsheet to respond to me and it’s always in the middle of the night (I’m MST) and they’re not digging into the problem...

    
    [September 22, 2025][6]

      Deployment Time: 2:00 PM PST
 
Features & enhancements

  
   Item
   
   Description
   
  
  
   Enhancement
   
   As an admin with an AppSheet Enterprise Plus license, you can generate a summary of the apps owned by an enterprise creator in your organization.

See Generate an app summary using Gemini. This is a preview release of this feature.
    
  

Bug fixes

  
   Item
   
   Description
   
  
  
   Bug
   
   Interactive dashboard now prompts user to keep editing or discard changes when changing row selection while editing a detail view in place.
   
  
  
   Bug
   
   In the desktop design, detail view edit-in-place mode now scrolls to validation errors if saving changes fails. Previously the save button might just seem unresponsive if invalid fields were scrolled off-screen.
   
  

Rollout changes

None
 

Preview feature releases enable you to try out new app features that are not yet fully supported. See Product launch stages.
 
No new preview features were released t...

    

  


  ### Popular Posts

    Steve - [A Honest Reflection on AppSheet’s Direction (and Why We’re Getting Frustrated)][7]

    I agree, the team is likely understaffed and underfunded. I have not researched alternatives. 
Here’s my hope for AppSheet: the reason they aren’t communicating and releasing is because the team has undergone extensive training in AI-assisted coding (as all developers should be) and are now deeply entrenched in an AI-assisted overhaul of the entire platform with a goal of making no-code app creation almost if not entirely possible with just natural language and drag-and-drop/WYSIWYG. 
Myself, I’m learning to use Firebase Studio to reimplement an AppSheet app I worked on for several years. It’s not trivial, and learning the quirks of working with AI is a challenge in itself. But some of the things that are tedious in AppSheet are obscenely easy with AI. And it lacks the built-in constraints of AppSheet. I don’t recommend this approach for most AppSheet app creators, as there are a lot of risks involved! But the exercise has demonstrated to me that AI-assisted development is 100% the way...
    Suvrutt_Gurjar - [Query about community stats of a member][8]

    Thank you.
    bcairns - [Unable to save editor][9]

    AppSheet engineering here. 
We have identified a root cause for the issue. The issue prevents changes to more complex apps from being saved, particularly apps with complex formulas. 
We are rolling out a fix for the issue now.
    DaveBarnes - [A Honest Reflection on AppSheet’s Direction (and Why We’re Getting Frustrated)][10]

    Hi @Steve I am not sure that I fully agree with you, although most of your comments are pretty accurate for me, and I am sure many others. However, most of the other comments by other users are a little unfair. Having tried several low code / no code tools Appsheet still comes top overall. Yes, of course, it has flaws, but so do the other tools. With a lot of testing and perserverance Appsheet can still deliver exceptional applications. I have written about half a dozen serios apps and always end up using Appsheet. My latest project includes a massive application that seems to grow by the day, but the power of Appsheet is far better than any other app creator, even witht he flaws. As I said with perserverance there seems to always be a solution 
My main disappointment is not with Appsheet, but with Gemini and its interpretation of Appsheet. Despite very detailed Gems, Gemini really struggles with suggestions and solutions to apply to Appsheet. Maybe that is just me. 
THis thread has be...
    Michelle - [Query about community stats of a member][11]

    @Suvrutt_Gurjar - Thank you for this inquiry.  We will draft a support document that outlines the stats on a user’s profile. 
I will add the link to this thread after it’s been created.  It will be located in the Getting Started section, under Account Info & Registration area.


**New for you**

* [New codelab: Introduction to the Conversational Analytics API][12] - 1 - [Community News & Announcements]
* [Current on Google Cloud][13] - 2 - [Community News & Announcements]
* [Query about community stats of a member][14] - 5 - [Site Feedback]
* [Accelerate Apigee API Development with YAML & Templates | September 2025][15] - 1 - [Events]
* [September 19, 2025][16] - 6 - [Release Notes]



[1]: https://discuss.google.dev/
[2]: https://discuss.google.dev/t/a-honest-reflection-on-appsheet-s-direction-and-why-we-re-getting-frustrated/266437
[3]: https://discuss.google.dev/t/unable-to-save-editor/267291
[4]: https://discuss.google.dev/t/new-mobile-framework-preview-columns-disappearing-from-form-view/267162
[5]: https://discuss.google.dev/t/critical-error-after-transferring-app-data-issue/267536
[6]: https://discuss.google.dev/t/september-22-2025/267440
[7]: https://discuss.google.dev/t/a-honest-reflection-on-appsheet-s-direction-and-why-we-re-getting-frustrated/266437
[8]: https://discuss.google.dev/t/query-about-community-stats-of-a-member/267064
[9]: https://discuss.google.dev/t/unable-to-save-editor/267291
[10]: https://discuss.google.dev/t/a-honest-reflection-on-appsheet-s-direction-and-why-we-re-getting-frustrated/266437
[11]: https://discuss.google.dev/t/query-about-community-stats-of-a-member/267064
[12]: https://discuss.google.dev/t/new-codelab-introduction-to-the-conversational-analytics-api/267661
[13]: https://discuss.google.dev/t/current-on-google-cloud/267021
[14]: https://discuss.google.dev/t/query-about-community-stats-of-a-member/267064
[15]: https://discuss.google.dev/t/accelerate-apigee-api-development-with-yaml-templates-september-2025/266341
[16]: https://discuss.google.dev/t/september-19-2025/266603
[17]: https://discuss.google.dev/



This summary is sent from [Google Developer forums][17] when we haven't seen you in a while. Change [your email settings][18], or [click here][19] to unsubscribe.

[18]: https://discuss.google.dev/my/preferences/emails
[19]: https://discuss.google.dev/email/unsubscribe/4c677345045ec4dd58a228e93a8cc9963191ca4ede80d2aff945c09560fccac7



