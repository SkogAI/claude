Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a50:6b90:0:0:0:0:0 with SMTP id v16csp890744ecg;
        Sun, 19 Jul 2020 03:22:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdtUAxq51Vkghn2x8wGBh1IuBcfX92AFdNSlkzgGFmhSSyWaLKuUc8IOMlC/YSGLDKgfFC
X-Received: by 2002:aa7:cd52:: with SMTP id v18mr16236525edw.196.1595154152268;
        Sun, 19 Jul 2020 03:22:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595154152; cv=none;
        d=google.com; s=arc-20160816;
        b=mTNvHwDBJD925p/0oq6bc7aegZA15zqweXvcszSEYhZWMCHwe9xUvzWOIQvTH16Z1K
         Fsb9MBBiotnSnhAiE6eyr58h9vnDdmrwhiPCCtT3ixeURUEcoHqLz1T1Z8/a9qz50sYr
         oGscou67DHZhS/CCOFSP78nN0EHmjEf8tNNPARN4qApvRa3IdrFNMW0p4OTkVHCddYHp
         BrFQYcWDlGoRtgTvGfzXseh+58JwczqW65Ofa9PSQBVeGwQCjnsaZ5n4jQ/ST2UVpYDS
         XPLC8sETDVuJrVY+v8BaX+a1drvtXX3yRMEAh8sZXySv48iOZGp83Bfb/1GRN1ZiqGU1
         eRMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature:dkim-signature;
        bh=+o99wktCP2JpISFTSiXqyAokSMjM51eA6kJdGMnBlJ0=;
        b=To8ivE7y8vuI1NtDejEfOxi0ZdcclxDMXG2MWg82EBTFeJD2guQsWTN2DM+bRPinQH
         rwkTMSUUhi4jj9yJkKiiR/EX08ePVy2Ghdwy2XmXisLj9PX168KaMUBhRP6ZAaUEi9Jl
         8W+eSSWa8euf3iPiRmvcP4eOa1swtTKMR7/CeZGa5Sffx+eKuQAuY7YFQDymArMz/RgJ
         jRSMZogYSnf9vgSlWFQREAo7PkWjUs4KWLXgntTZwWVRenQ0uJvo7HYumapRgZTRyL4g
         1cnNTYOsl9bB2ZsC/nNWpmVm3NBUMyLW7f7lDxy4H+EToGvqWSEV4AZBYSm5bC3NyICr
         NEdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ifttt.com header.s=s1 header.b=mOVm33T+;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=yaZeY9S6;
       spf=pass (google.com: domain of bounces+4296082-5721-emil.skogsund=gmail.com@emails.ifttt.com designates 167.89.109.141 as permitted sender) smtp.mailfrom="bounces+4296082-5721-emil.skogsund=gmail.com@emails.ifttt.com";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=ifttt.com
Return-Path: <bounces+4296082-5721-emil.skogsund=gmail.com@emails.ifttt.com>
Received: from o8.email.ifttt.com (o8.email.ifttt.com. [167.89.109.141])
        by mx.google.com with ESMTPS id q17si8269323eja.355.2020.07.19.03.22.31
        for <emil.skogsund@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Jul 2020 03:22:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+4296082-5721-emil.skogsund=gmail.com@emails.ifttt.com designates 167.89.109.141 as permitted sender) client-ip=167.89.109.141;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ifttt.com header.s=s1 header.b=mOVm33T+;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=yaZeY9S6;
       spf=pass (google.com: domain of bounces+4296082-5721-emil.skogsund=gmail.com@emails.ifttt.com designates 167.89.109.141 as permitted sender) smtp.mailfrom="bounces+4296082-5721-emil.skogsund=gmail.com@emails.ifttt.com";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=ifttt.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ifttt.com; 
	h=from:to:subject:mime-version:content-type:content-transfer-encoding; 
	s=s1; bh=+o99wktCP2JpISFTSiXqyAokSMjM51eA6kJdGMnBlJ0=; b=mOVm33T
	+Y4vctb282RpxoLBIK2eeAYSM1msQ4ozdvA171W/ZC56QzGRvL/cByaZ6hgjv3TI
	lJs9Le8reomKf/i0hdq3HdixYAGw0EzK+/CUwAwyhsj42XAHlx82QmhxiubdQNi8
	K7Y37dsDTP8T97IbAMi8oXS0LpEuci+sxrOY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; 
	d=sendgrid.info; 
	h=from:to:subject:mime-version:content-type:content-transfer-encoding:x-feedback-id; 
	s=smtpapi; bh=+o99wktCP2JpISFTSiXqyAokSMjM51eA6kJdGMnBlJ0=; b=ya
	ZeY9S6GL4R3lEEDf/U3t9G+QdNtqJ7x6QDMXIVbqtaEG1L2PqVZu+aEsNotq6V7R
	rOrmwoty5NfVLF8aoLO5SN7/IxRIzEPJWfRJqzgnwMoDnsF8sfY3zOihnnrUSgk6
	oykFSiobT68YS7Q7ZF3Hje0EZx/OC5xhPJInEM1JI=
Received: by filter0455p1iad2.sendgrid.net with SMTP id filter0455p1iad2-26592-5F141EE5-8
        2020-07-19 10:22:29.55745184 +0000 UTC m=+37103.264287289
Received: from ifttt.com (unknown)
	by ismtpd0039p1mdw1.sendgrid.net (SG) with ESMTP id gAMk5YLSTES1pcwU5_y38g
	for <emil.skogsund@gmail.com>; Sun, 19 Jul 2020 10:22:29.415 +0000 (UTC)
Date: Sun, 19 Jul 2020 10:22:29 +0000 (UTC)
From: IFTTT Alerts <alerts@ifttt.com>
To: emil.skogsund@gmail.com
Message-ID: <5f141ee07d77c_60902ad5fc3e9958968f1@live-channel-check.resque.ife.mail>
Subject: Action required: Gmail is offline
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="--==_mimepart_5f141ee06478d_60902ad5fc3e995896792";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SG-EID: +SNkqRZmBMW6riissBEty+5j64CfL+UIdhP0kTBbyISrSUfaBwxeGbv6Q0ZQPh++rE7VCDAluTo0bH
 Ono5BeCwio87D0FquuSaOwlViMKbi2y2VEFa//rG+2svRq8pNvemIc0SCVF8ahbg4TJALZsa7XLPhH
 ZTtJIdCA5AOtEuqhHhRckpPI/9lUh9tuzQI0gbz2cliZoPp4vdBACjG/EQ==
X-SG-ID: 2VIXiJepS9mZTUb8gBEJRjEcaaOdfgYEuyr02aEgIJqrbnnki9P79De4ww9VdK6F7NQqiRJraiA8wV
 0oTwPtzA==
X-Feedback-ID: 4296082:rjGh1C9aJP8EjQqcQ9UM8Jw2nCl6oq1q3+uiWelgiYQ=:FkzOUahKnzHfhBGJ0J2P2g==:SG
X-TUID: rr3BvWxY4Twa

----==_mimepart_5f141ee06478d_60902ad5fc3e995896792
Message-ID: <temp@test>
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi skogix,

  We still can=E2=80=99t connect to your Gmail.

  Have you updated your password recently, or made some other changes? It c=
ould also be because somewhere, somehow, an engineer has been working tirel=
essly on improvements to the service.

  The good news: you can fix it.
  Click through to reconnect.

Gmail settings: https://links.ifttt.com/ls/click?upn=3DWyAFfgEYLRIBevxki0a6=
G0tnGnJC0gIZxR3uQYxq9prfbfHaLr-2BjqCvAiRnkru0flHju_nJkiC3IbSDb8lL02sTi2tAvJ=
suzQyvYUOBBZcQTDWJwQovWsrYr4MejrMohb49LriVu7XRB0vnp-2FvsDSTa0DEWKB-2FZY8G-2=
FBT0UzFjeWB3tnZc4WPzOYY7ft7JBmINzZG6R0UkCifLeoziDAT7YolfL3Xr9Hq89Sc5UT8zvwR=
QYOuQcoZcoyArvPgMkViysqxSVhYwdwD4LSBuLaFxmwRo-2F4sJKM46Q25gCF8YZqSw2E7LaOhT=
dMJ4UIa4BBoBkOI9P46M0QnoSg8wxa9askYPQ8otGpDhvoAeDyJ1KIC5nE-3D


=E2=80=94
IFTTT

Unsubscribe from alerts (https://links.ifttt.com/ls/click?upn=3DWyAFfgEYLRI=
Bevxki0a6G1oyE8Ad-2FcHhymivGEP4HuSHtvUXmHFjUQNiZ5YlV3c04PgDpokA7cREegxYck06=
fJJLAqtmkwcme4DQroKBrXMUUoZkE2kCQBQkkowiyfSftquoVGDMI9dkhT1M0trRo0mUFEHiyPp=
Trp9xE35TxsCGS1rjF4lYJp1se2i4bHV-2BH1UX_nJkiC3IbSDb8lL02sTi2tAvJsuzQyvYUOBB=
ZcQTDWJwQovWsrYr4MejrMohb49LriVu7XRB0vnp-2FvsDSTa0DEcMe9zImRKbfhYrhYS2u0mm4=
F1diJbS-2Fb9tNVvUcthBbgSzkVwPJYuKGZlA4H6JMJa-2BwXdzj0N7oDZy8ZHI8tVDgTOD9prS=
Hi5yuTtVnvzzkkqf3rA0ekSgMPNX-2BF-2FZVmPKRHxQsyq43e0SCt5UeQ75G-2BXTvSQtfgDqX=
RIQJHdaIoiwWIEqixvJHZjN5VP7oP3-2FQB0Oz-2FH5qSS3NNydjtGE-3D )

----==_mimepart_5f141ee06478d_60902ad5fc3e995896792
Content-Type: text/html;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.=
w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns=3D"http://www.w3.org/199=
9/xhtml" xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-m=
icrosoft-com:office:office">
<head>
  <!--[if gte mso 9]>
  <xml>
    <o:OfficeDocumentSettings>
    <o:AllowPNG/>
    <o:PixelsPerInch>96</o:PixelsPerInch>
    </o:OfficeDocumentSettings>
  </xml>
  <![endif]-->
  <meta http-equiv=3D"Content-type" content=3D"text/html; charset=3Dutf-8" =
/>
  <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scale=3D=
1, maximum-scale=3D1" />
  <meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge" />
  <meta name=3D"format-detection" content=3D"date=3Dno" />
  <meta name=3D"format-detection" content=3D"address=3Dno" />
  <meta name=3D"format-detection" content=3D"telephone=3Dno" />
  <meta name=3D"x-apple-disable-message-reformatting" />
  <!--[if gte mso 9]>
  <style type=3D"text/css" media=3D"all">
    sup { font-size: 100% !important; }
  </style>
  <![endif]-->
=20=20=20=20
</head>

  <body class=3D"container body" style=3D"color: #000000; display: block; f=
ont-family: 'Helvetica Neue', 'Helvetica', 'Arial', 'sans-serif'; font-size=
: 24px; line-height: 30px; margin: 0; max-width: 640px; padding: 0 2px; tex=
t-align: left; text-decoration: none; width: 100%"><style type=3D"text/css">
body {
font-family: 'Helvetica Neue', 'Helvetica', 'Arial', 'sans-serif'; color: #=
000000; font-size: 24px; line-height: 30px; display: block; margin: 0; padd=
ing: 2px 2px 2px 2px; text-align: left; text-decoration: none; width: 100%;
}
img {
float: none; clear: both; margin: 3px 10px 3px 0; border: 0; display: block;
}
a:visited {
border: 0; color: black; text-decoration: underline;
}
.btn-primary:visited {
color: #fff;
}
a.btn-primary:visited {
color: #fff;
}
@media only screen and (max-device-width: 480px) {
  .mobile-shell {
    width: 100% !important; min-width: 100% !important;
  }
  u + .body .mobile-shell {
    width: 100vw !important;
  }
}
@media only screen and (max-width: 480px) {
  .mobile-shell {
    width: 100% !important; min-width: 100% !important;
  }
  u + .body .mobile-shell {
    width: 100vw !important;
  }
}
</style>
    <table width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" =
bgcolor=3D"#ffffff">
      <tr>
        <td align=3D"left" valign=3D"top">
          <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" class=3D"=
mobile-shell">
            <tr>
              <td>
                <p style=3D"clear: both; font-size: 24px">
                  Hi skogix,
                </p>
                  <p style=3D"clear: both; font-size: 24px">We still can=E2=
=80=99t connect to your Gmail.</p>
                  <p style=3D"clear: both; font-size: 24px">Have you update=
d your password recently, or made some other changes? It could also be beca=
use somewhere, somehow, an engineer has been working tirelessly on improvem=
ents to the service.</p>
                  <p style=3D"clear: both; font-size: 24px; font-weight: bo=
ld">The good news: you can fix it.</p>
                  <p style=3D"clear: both; font-size: 24px">Click through t=
o reconnect.</p>

                <table style=3D"background: #23448b; border-radius: 0 4.5em=
 4.5em 0; padding-right: .6em" bgcolor=3D"#23448b">
                  <tr>
                    <td style=3D"width: 80px">
                      <a href=3D"https://links.ifttt.com/uni/ls/click?upn=
=3DWyAFfgEYLRIBevxki0a6GwG1d-2B2PfzCIqcE4XR1o9mN1FOEktfgl-2BrfiQ8zftZ-2Fntj=
SA_nJkiC3IbSDb8lL02sTi2tAvJsuzQyvYUOBBZcQTDWJwQovWsrYr4MejrMohb49LruQM3hsMB=
w7fHEXscssrCHEZQYNuqFs1n302lHAOhKpy-2FcD5nkh2fXC8C2Qw54o7xdZWx3oZyL4Pz294MI=
ZaDH-2Fg8Ii7-2BNGr2RAH8yxvHjr-2Bpp48mAZzY-2Bl0hqw25DDIoo9s4pzGT3tykF36oREIC=
HXIHnDtAuqhI13OYT1Sb-2FvxNChKB8nRm69XL1jxJkUaIgVV5X4-2B27bHHsZp60cMucuFm9rQ=
fSV6kMFkl6ccZ2KE-3D" universal=3D"true" style=3D"border: 0; color: black; t=
ext-decoration: underline">
                        <img src=3D"https://assets.ifttt.com/images/channel=
s/33/icons/monochrome_large.png" alt=3D"Gmail" title=3D"Gmail" align=3D"non=
e" width=3D"80" style=3D"border: 0; clear: both; display: block; float: non=
e; margin: 12px 12px 12px 8px; text-decoration: none; vertical-align: middl=
e" />
                      </a>
                    </td>
                    <td>
                      <a href=3D"https://links.ifttt.com/uni/ls/click?upn=
=3DWyAFfgEYLRIBevxki0a6GwG1d-2B2PfzCIqcE4XR1o9mN1FOEktfgl-2BrfiQ8zftZ-2FnJj=
m4_nJkiC3IbSDb8lL02sTi2tAvJsuzQyvYUOBBZcQTDWJwQovWsrYr4MejrMohb49LruQM3hsMB=
w7fHEXscssrCHC-2F87H03VM3peTvwV-2BxtIgu424ntGTi-2B3Rn3KwetiQECi0CYFi8uYmlup=
FcxR5bLBxqRrjVd-2BBVs0tm-2BQEbgDFMhVFM0UwqzDra9a4lMeJU2ISP8p-2BvFFDXfJgrMOK=
si8qJhmE3aUXvc8oCCW1gj-2BvHl8wg6P4Fx3OA5Lwh7jgK6VU0qHznEv5Z2xpz4CHgrouQbCnF=
GrNTjtAHpWjd4m1Q-3D" class=3D"btn-primary" universal=3D"true" style=3D"back=
ground: black; border-radius: 2.5em; border: 3px solid transparent; color: =
#fff; cursor: pointer; display: inline-block; font-family: 'AvenirNext-Bold=
','AvenirNext', 'Avenir', 'Helvetica Neue', 'Helvetica', 'Arial', 'sans-ser=
if'; font-size: 36px; font-weight: bold; line-height: 1; margin: 0 auto; pa=
dding: .5em 1.5em; text-align: center; text-decoration: none; vertical-alig=
n: middle; white-space: nowrap">
                        Fix it
                      </a>
                    </td>
                  </tr>
                </table>


                <hr class=3D"footer-break" style=3D"background: none; borde=
r-bottom-color: #f5f5f5; border-bottom-style: solid; border-width: 0 0 3px;=
 height: 0; margin: 88px 0 30px; padding: 32px 0 0px" />
              </td>
            </tr>

            <tr>
              <td>
                <table class=3D"footer " style=3D"color: #999999; font-fami=
ly: 'Helvetica Neue', 'Helvetica', 'Arial', 'sans-serif'; font-size: 12px; =
font-weight: normal; line-height: 16px; padding: 30px 0; text-align: center=
; vertical-align: top; width: 100%">
  <tr>
    <td class=3D"footer-logo-container" width=3D"128" align=3D"center" styl=
e=3D"padding-bottom: 50px; padding-top: 10px; text-align: middle; vertical-=
align: middle" valign=3D"middle">
      <!-- Logo -->
          <a href=3D"#{IFTTT_FRONT_END_URL_AND_SCHEME}" class=3D"footer-log=
o" target=3D"_blank" style=3D"border: 0; color: black; margin-bottom: 0px; =
text-decoration: none; width: 128px">
              <img alt=3D"IFTTT" class=3D"footer-logo" src=3D"https://useri=
mg-bee.customeriomail.com/images/client-env-57121/IFTTT%20Logo.png" title=
=3D"IFTTT" width=3D"128" style=3D"border: 0; clear: both; display: block; f=
loat: none; margin: 0; text-decoration: none; width: 128px" align=3D"none" =
/>

          </a>
      <!-- END Logo -->
    </td>
  </tr>
      <tr>
        <td class=3D"footer-platform-button" align=3D"center" style=3D"padd=
ing-bottom: 28px; text-align: middle; vertical-align: middle" valign=3D"mid=
dle">
          <!-- Platform Button -->
          <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0">
            <tr>
              <td class=3D"img" width=3D"300"><a href=3D"https://links.iftt=
t.com/ls/click?upn=3DWyAFfgEYLRIBevxki0a6G4sXtYlxnMniHndgSSjDbdlXsCUxBV9EF0=
QTyBzKfr5w9Tt0PdeQdrvx-2BqqwyR4wRs9BFkj2B6ANklI3OlKUaqImOL7kr241gDF3F1sHa3I=
MqI0x1zs-2BVser24lirNaj-2FqfoQxWtpZ5TRbZfcgcLE6Y-3DLss3_nJkiC3IbSDb8lL02sTi=
2tAvJsuzQyvYUOBBZcQTDWJwQovWsrYr4MejrMohb49LruQM3hsMBw7fHEXscssrCHLt5SxJGQy=
5-2BMcDwGIv2QLpU2ctk-2Fktxtuwngue6GnWghnWlTl8XzBTgG4AhlqMcgAxdylAtNcN4oPTM1=
Bl7gaO-2BhGNGJ52WXYarsw9smNx-2BLuF8f80Q0RR4vdil81-2Flzrs-2F7dDS7TdD3azIZtVD=
tPJSLrvhcSQkOVG-2FNx-2FI-2Ftw6NK9MaZrL5XGGaIFeFv-2FN71oDaWU98bgJP7aLDTaSdhU=
-3D" target=3D"_blank" style=3D"border: 0; color: black; text-decoration: u=
nderline"><img src=3D"https://userimg.customeriomail.com/Zsa3e6TbTTONblUw9x=
Ad_IFTTT%20Platform%20Email%20Footer.png" width=3D"300" height=3D"110" bord=
er=3D"0" alt=3D"Build on the IFTTT Platform" title=3D"Build on the IFTTT Pl=
atform" style=3D"border: 0; clear: both; display: block; float: none; margi=
n: 0; text-decoration: none" align=3D"none" /></a></td>
            </tr>
          </table>
          <!-- END Platform Button -->
        </td>
      </tr>
    <tr>
      <td class=3D"footer-unsubscribe" style=3D"color: #999999; text-align:=
 middle" align=3D"middle">
        IFTTT =C2=B7 9=E2=80=8B2=E2=80=8B3 Market S=E2=80=8Btre=E2=80=8Bet =
=C2=B7 Sa=E2=80=8Bn Franc=E2=80=8Bisco, Calif=E2=80=8Bornia =C2=B7 941=E2=
=80=8B03
        <br />
        <a href=3D"https://links.ifttt.com/ls/click?upn=3DWyAFfgEYLRIBevxki=
0a6G1oyE8Ad-2FcHhymivGEP4HuSHtvUXmHFjUQNiZ5YlV3c04PgDpokA7cREegxYck06fJJLAq=
tmkwcme4DQroKBrXMUUoZkE2kCQBQkkowiyfSftquoVGDMI9dkhT1M0trRo0mUFEHiyPpTrp9xE=
35TxsCGS1rjF4lYJp1se2i4bHV-2BSfgR_nJkiC3IbSDb8lL02sTi2tAvJsuzQyvYUOBBZcQTDW=
JwQovWsrYr4MejrMohb49LruQM3hsMBw7fHEXscssrCHElpbMCtWdK1b5b0FfijCuOkoPhSxlc2=
LckI2YZXGIzBJkGuB4HV6D4nXxA74K4gYWVxeOem2oD5VDHUdGJl5iwyJ1QskewJr75L-2FZIj-=
2BUCXsX-2FFCZearP5X36dPG23DYREvp0XlTuqRporYJEPSps6oajwxz8qiynbkzNllNQU2xz9T=
Q0VjyT1ozw2PoCw5CQBRkYr69Fc6AGsGFfKPZTA-3D" target=3D"_blank" class=3D"link=
-footer-u" style=3D"border: 0; color: #999999; text-decoration: underline">=
<span class=3D"link-footer-u" style=3D"color: #999999; text-decoration: und=
erline">Unsubscribe</span></a>=C2=A0from helpful alerts like these=C2=A0or =
manage your <a href=3D"https://links.ifttt.com/ls/click?upn=3DWyAFfgEYLRIBe=
vxki0a6G-2B63G65dFBOjsqUzutMQUpdeq6KdtL3O3bBg-2FL5QiT2IsHo1_nJkiC3IbSDb8lL0=
2sTi2tAvJsuzQyvYUOBBZcQTDWJwQovWsrYr4MejrMohb49LruQM3hsMBw7fHEXscssrCHIDka3=
tSAVu2FcjmzpijRVqg-2BcQTna8jJlf7NoVhZfi79k8ToJqJTA3pM3vGISfxBPnU9s9vnyXTiic=
-2Fc5vUIL8QaX9Bdv8RDCeRm1nJoXuJzzYEeugXTL-2BgypSo8koOIy8m3-2B6cMSAj91kYklgY=
4Utv0854hwAdmfiNVB026Nvwgms8FbJwGQFJlwDTi05mlqoS-2FF787jJYaPVaxjUbKJ4-3D" t=
arget=3D"_blank" class=3D"link-footer-u" style=3D"border: 0; color: #999999=
; text-decoration: underline"><span class=3D"link-footer-u" style=3D"color:=
 #999999; text-decoration: underline">email
            preferences</span></a>.
      </td>
    </tr><tr></tr>
</table>

              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
=20=20
<img src=3D"https://links.ifttt.com/wf/open?upn=3DDRqiD9tOYDZdU3lRAzprPGwuE=
ipclW0P8WdG1e1iAiJ6yMsvufSMNYBDctNicG-2BOEDO3kip1yEsW9s56b6VEhHHGjNzzuBoSQa=
PsAlsSQgbsDddKtmuZ31-2FDcrS1JQyMaIo-2BgrtUtKebUnSnp5AiuWmlbjwwa9eT6iuNY0hI-=
2BQc4-2F95ZUpUXjQrQ3F93LvQnGffcf3pPkB55C1wR3Q3w8SEKVWwdc-2FU7Awazx0EsWpfEqe=
-2FIKM5Ua1CRtJUUNNqIbtcpVnL45Z3Vj7PRQqUp-2BT6aiOHcvtzySjA9JIUAsaLf-2BH36M7a=
vFaEoVP3yQwnY" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"heig=
ht:1px !important;width:1px !important;border-width:0 !important;margin-top=
:0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-l=
eft:0 !important;padding-top:0 !important;padding-bottom:0 !important;paddi=
ng-right:0 !important;padding-left:0 !important;"/>
</body>
</html>


----==_mimepart_5f141ee06478d_60902ad5fc3e995896792--
