MIME-Version: 1.0
From: Google Developer forums <no-reply@discuss.google.dev>
To: emil.skogsund@gmail.com
Date: Thu, 13 Nov 2025 18:35:09 +0000
Subject: [Google Developer forums] Summary
Message-ID: <1db1d25d-9cdf-4733-989d-a869faba1276@discuss.google.dev>
Content-Type: multipart/alternative; boundary="--==_mimepart_691624dd5f702_2694fccc1772dc"; charset="UTF-8"

A brief summary of [Google Developer forums][1] since 2025-11-06 18:22:46 UTC

56 New Topics
1 Unread Notifications
1637 New Users


  
  ### Popular Topics

    [Swag Drop: The Arcade Laptop Sleeve][2]

      Picture this: You’re packing up for the day — laptop, charger, earphones, a few notes you might need later. It’s all there, but somehow it never fits right, and there’s always that one tangled cable waiting to test your patience. 
That’s where the Arcade Laptop Sleeve comes in. Available from the Ranger Tier onwards, it’s designed to keep everything in one place — neat, protected, and easy to carry. 
![_C2  2025 Swag Drop  (7)](https://d2yds90mtvelsl.cloudfront.net/original/3X/9/0/90e4e7281fb00873c9e70f7a3293e1a4c9470d6c.gif) 
Here’s what makes it special: 


Magnetic Laptop Stand: Prop up your laptop anywhere and get the perfect viewing angle — no extra stand needed. 


Protective Interior: Soft plush lining keeps your laptop safe from scratches and bumps. 


Durable Exterior: Water-resistant and scratch-proof PVC artificial leather that can handle daily use. 


Carry Handle: Easy to grab and go — whether it’s to class, the office, or a café. 


Accessories: Comes with a mouse and cha...

    
    [Email server is down?][3]

      Hi everyone, 
Is anyone else experiencing issues with AppSheet automations or bots not sending emails today? 
All of my existing apps and automations that are configured to send emails suddenly stopped working. 
The bots are still enabled, and no configuration has been changed — but no emails are being sent out at all. 
It seems like either the AppSheet BOT service or the email delivery system might be down. 
Could anyone confirm if this is a known issue or a temporary outage? 
From Thailand

    
    [Automation email feature not working][4]

      Sure thing! Case ID 7-8740000040210 
 ![image](https://d2yds90mtvelsl.cloudfront.net/optimized/3X/3/d/3dbfb915da974744cbbe4cfad1dd99fddbf8c4b6_2_690x117.png)

    
    [Device Location Services][5]

      The reason for your issue, I think, is because of the polling described in the document.  The AppSheet container app POLLS the device once a minute.  If you turn off the Location services, I suspect the app cannot detect that Location Services are OFF until the next polling cycle. 
You can easily test that assertion by turning off Location Services and waiting a couple of minutes and then trying the function in your app that detects that location services are off. 
HOWEVER, since it seems like your goal is to detect that person is physically onsite when they are entering their time,  I can tell you, from experience, that you WILL NOT be able to handle that 100% accurately with AppSheet’s GPS polling.  There are other issues.  Namely, just like any other GPS device, phones must be able to TRIANGULATE their location - meaning they need to read location information from 3 different satellites. 
When the phones move to a new location (such as driving from home to a work facility), that tri...

    
    [Mismatch schema errors][6]

      Do you have EDIT access on that spreadsheet?  That is, to be able to open it as a Google Sheet and hand edit the sheet?  If you can do this, then the simplest way to fix your problem without removing any protected formulas from your team workers is to add column headers for every column all the way up to column AE in your screenshot.  This was suggested by @Suvrutt_Gurjar  earlier on. 
Once you have added the column names then refresh the schema in your app so that all the new column names are showing. 
Then you can use the tick boxes in AppSheet Editor to stop the columns from being edited and shown. 
I can see that you are NOT allowed to modify the sheet.  Does that mean that your app will only use the data in that sheet as a READ ONLY datasource whereby the actual updates to rows in the sheet are performed by your team members using manual data entry?  If this is the case then your only option is to use a new google sheet file and have an IMPORTRANGE() formula that grabs the data an...

    

  


  ### Popular Posts

    ayush007 - [Swag Drop: The Arcade Laptop Sleeve][7]

    Thanks a lot, ma’am, for actually listening to the community feedback and implementing it! :raising_hands: 
This Arcade Laptop Sleeve is a huge improvement — far better than the previous drops like the bulbs or vacuum cleaner tool kit pens :sweat_smile:. Our whole community really loved this one! Even though it appeared in an earlier cohort, it’s useful, practical, and perfect for daily use — exactly the kind of swag everyone appreciates. :laptop::sparkles: 
For future drops, it would be great to see more utility-based items like: 
:hot_beverage: Magnetic stirrer mugs 
:three_o_clock: Thermo-coaster or an Arcade-style clock 
Google cloud motion light 
Google cloud power bank 
These kinds of thoughtful, usable swags make the experience even more special for all of us! :blue_heart: 
@Yugali
    RAOKS - [Swag Drop: The Arcade Laptop Sleeve][8]

    @yugali, We have received this few seasons back in higher tiers. It’s just laptop sleeve without protection. If anyone carries laptop in this , laptop will damage. Please look into this,
    Ayush5 - [Swag Drop: The Arcade Laptop Sleeve][9]

    Waiting for this :heart_eyes:
    itsomg143 - [Swag Drop: The Arcade Refresh Water Bottle][10]

    Finally, a bottle that can survive longer than my motivation during late-night coding sessions :sweat_smile::droplet: triple-layer armor for my triple-shot coffee
    Sourav_Bisui - [Swag Drop: The Arcade Laptop Sleeve][11]

    that’s a cool swag for all ranger and upwards tiers 
I will take this opportunity to add a suggestion on bringing a game changer and motivator swag. 
For most of us it’s been a great journey of learning but as the arcade points keep increasing each cohort. 
I would suggest that at least for challenger or legend tiers only bring mechanical keyboards where we actually going to build ourselves and it would keep reminding us about the dedication and learning we put on throughout this program.


**New for you**

* [AppSheet View Customize Extension Update – Boost Your Efficiency][12] - 4 - [AppSheet Q&A]
* [Accelerating Autonomous Vehicles Development: Finetuning Vision Language Models][13] - 1 - [Open Models]
* [Introducing native A2A protocol support in AG2: Building interoperable multi-agent systems at scale][14] - 2 - [Community Articles]
* [November 6, 2025][15] - 1 - [Release Notes]
* [Connect to APAC region apps for data source of Looker Studio][16] - 2 - [AppSheet Q&A]



[1]: https://discuss.google.dev/
[2]: https://discuss.google.dev/t/swag-drop-the-arcade-laptop-sleeve/286273
[3]: https://discuss.google.dev/t/email-server-is-down/284548
[4]: https://discuss.google.dev/t/automation-email-feature-not-working/285283
[5]: https://discuss.google.dev/t/device-location-services/284908
[6]: https://discuss.google.dev/t/mismatch-schema-errors/285903
[7]: https://discuss.google.dev/t/swag-drop-the-arcade-laptop-sleeve/286273
[8]: https://discuss.google.dev/t/swag-drop-the-arcade-laptop-sleeve/286273
[9]: https://discuss.google.dev/t/swag-drop-the-arcade-laptop-sleeve/286273
[10]: https://discuss.google.dev/t/swag-drop-the-arcade-refresh-water-bottle/283341
[11]: https://discuss.google.dev/t/swag-drop-the-arcade-laptop-sleeve/286273
[12]: https://discuss.google.dev/t/appsheet-view-customize-extension-update-boost-your-efficiency/285518
[13]: https://discuss.google.dev/t/accelerating-autonomous-vehicles-development-finetuning-vision-language-models/284584
[14]: https://discuss.google.dev/t/introducing-native-a2a-protocol-support-in-ag2-building-interoperable-multi-agent-systems-at-scale/286168
[15]: https://discuss.google.dev/t/november-6-2025/284496
[16]: https://discuss.google.dev/t/connect-to-apac-region-apps-for-data-source-of-looker-studio/286224
[17]: https://discuss.google.dev/



This summary is sent from [Google Developer forums][17] when we haven't seen you in a while. Change [your email settings][18], or [click here][19] to unsubscribe.

[18]: https://discuss.google.dev/my/preferences/emails
[19]: https://discuss.google.dev/email/unsubscribe/e459d1dba2df25b3f9bfa2d9bb7fa9091a9fc7ba6c1b132ecffe03122ea63364



