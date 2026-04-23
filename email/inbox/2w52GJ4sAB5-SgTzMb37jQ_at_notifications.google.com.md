Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a59:a42f:0:b0:2a3:ae73:4441 with SMTP id e15csp2689779vqn;
        Mon, 28 Mar 2022 10:43:20 -0700 (PDT)
X-Received: by 2002:a05:6602:150c:b0:64c:6878:25ed with SMTP id g12-20020a056602150c00b0064c687825edmr5532148iow.27.1648489400779;
        Mon, 28 Mar 2022 10:43:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648489400; cv=none;
        d=google.com; s=arc-20160816;
        b=KjpfgG2uLP2C39jIa1lBiZpPKNGb/yLEcjunOcmC6wpzcGFTvAOA4FYKjAhDVEy4ny
         Zi8OMfrIxSug/JFuuvOAxTVLAkiNNVDF8KbiNJYRBqBJ8jvOXbeVIeCwbu1yifopON+m
         qncWYpLnfYnA1sELiTdt1tBDdVo0grfLMk3h+BbxAg+auuaSNcBqxB6hZt3S2atk0mTX
         7pWNGW2SDeNz33JkQbkqMQebRDEwSXkF/FCHV3BEHe+P9bOYD5jNHiLk6MawgWFVh6cK
         j9ynIjkil6yHlHYmvpoNAWcllz7FO2HkL+Cu9bhxAMCTS5nlZt4c3tuvXW5Qly6xmAQk
         MwjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:from:subject:message-id:feedback-id:date:mime-version
         :dkim-signature;
        bh=TQaZha15ZkrjBY8TkLHswjWm+ta1QEcxkIMcaOUNgAQ=;
        b=qFlmRyH466WIHUczXHNO7BxrSewm0MjXTuonrkqMzW7/mU5BhT21vFrFwUodY2eyoc
         JMA8FZnfB4yccr2ccfbWG2TeynJZpNsDwMNpB7ushp0xloxHSem04F6rF34BJ/TmbIaF
         CN61+cwopYHR2Ycr1yGqk0AGDxjsIM5TzEL+44kCLX/NQGYbJpKdMnYhdX03TaD60iSz
         iHZMghUEzmTXtBa9wQQOIsjxAz2kp1RJYv28WxfynJC89VGGOUw/zR2GfFFL2C+U6yBf
         /LS2e0DFTvYjJlRE8gT0dzTrzVEKJj7WKRPCoL8fuiGuF747D+m/sPKgP6uC8Dok+Qz4
         9APg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@accounts.google.com header.s=20210112 header.b=f+Av1Q0Q;
       spf=pass (google.com: domain of 3upnbyggtdb8st-wjuq3fhhtzsyx.lttlqj.htrjrnq.xptlxzsilrfnq.htr@gaia.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3uPNBYggTDb8st-wjuq3fhhtzsyx.lttlqj.htrjrnq.xptlxzsilrfnq.htr@gaia.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=accounts.google.com
Return-Path: <3uPNBYggTDb8st-wjuq3fhhtzsyx.lttlqj.htrjrnq.xptlxzsilrfnq.htr@gaia.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id a10-20020a056e02180a00b002c9af4da5c8sor1301034ilv.89.2022.03.28.10.43.20
        for <emil.skogsund@gmail.com>
        (Google Transport Security);
        Mon, 28 Mar 2022 10:43:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3upnbyggtdb8st-wjuq3fhhtzsyx.lttlqj.htrjrnq.xptlxzsilrfnq.htr@gaia.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@accounts.google.com header.s=20210112 header.b=f+Av1Q0Q;
       spf=pass (google.com: domain of 3upnbyggtdb8st-wjuq3fhhtzsyx.lttlqj.htrjrnq.xptlxzsilrfnq.htr@gaia.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3uPNBYggTDb8st-wjuq3fhhtzsyx.lttlqj.htrjrnq.xptlxzsilrfnq.htr@gaia.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=accounts.google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=accounts.google.com; s=20210112;
        h=mime-version:date:feedback-id:message-id:subject:from:to;
        bh=TQaZha15ZkrjBY8TkLHswjWm+ta1QEcxkIMcaOUNgAQ=;
        b=f+Av1Q0QTEHgKlzKoayegqWBtAGH3UQoZMqaDXJvuz7jnj4MQmGkLDhUSJa4GOWz5m
         Wi0OMMS2YnsNQDA1p46zOQImO+y+nPxwYxGlDXeoS/QTZtdBIWRIAsN8/vrPPdPYuMGC
         bMPAZ9khLM4w/yddliQCTWahfyEHVMxC4EEouCxN+LjaqsQvfyQi7bIYr212yWTFol5b
         4T6aMx2qiQ10NeOBG4ts4g+pBJNlY9wWrJe9G5JxxqlIRBd0jMoWt8BHdO2PN7yCRQ1A
         LxtTpoXBZbGxtUkxgeRyhKv4V2Ncopduvm7Jvpw7Dr6zPIlFgZr6EFc0oY3BHdj+LGpG
         TGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:feedback-id:message-id:subject
         :from:to;
        bh=TQaZha15ZkrjBY8TkLHswjWm+ta1QEcxkIMcaOUNgAQ=;
        b=2WdyZEFE6FtEL0Kn7xU3VtIF3N3o4e/fiO5jr7tpHnduw94If4UHUZpWf4++kPZuYx
         zxREyTgIbWpkg/K4C2hXZRFswfqd4De5/qYsrb4itIwSZLQEoHssZqrl/L1yenn37VaV
         438/v3vWZwRzplgrCxb4uEUTAC2Y1ZB/CGVIdC+VQ6NcPVzQF0xLGI9rJwERahBnZY3g
         Q1yV0Q4dIvyvlHmiRokilgNzXlWZvNO2Ty3jexAUU3GmaF4MIsHc6XwN9tgTzjZHyWpu
         EjricZuLhyISpMvMeAgKraddHbSCdTxJnTmKnU9mcTLRWlOJHTlIEGK/iP+IvRfX4g8/
         ig3g==
X-Gm-Message-State: AOAM532Tz6q+Ipda9uSu1MuetCVApLaWjH1dwnsanvLoMkiJeqN4UIpW
	Drrr2cQD8NVPZXbGHOc3F3pNlJjIr8pBtTofuZ+ouQ==
X-Google-Smtp-Source: ABdhPJyXrRwwO1AoK62xAIFOzYA4BsMT9KhiuWzRPbtexq05T6d1RlXGHGP8Zy6D5Pn1T36ToqjyCXDej/1/IJQBxvPQ1Q==
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d8d:b0:2c8:8b83:d970 with SMTP id
 h13-20020a056e021d8d00b002c88b83d970mr6232623ila.319.1648489400240; Mon, 28
 Mar 2022 10:43:20 -0700 (PDT)
Date: Mon, 28 Mar 2022 17:43:19 GMT
X-Account-Notification-Type: 325-RECOVERY-anexp#nret-fa
Feedback-ID: 325-RECOVERY-anexp#nret-fa:account-notifier
X-Notifications: bd93734c9c300000
X-Notifications-Bounce-Info: AXvZQxeVYA0vi5PPVrSQRxLTlqnLNQHr0Zio9SNtdLLcY4oMhUIWYnc4mz7Pq9cGssirPr7VBHwpOZdVbTAWRVFqklcnEA_ciD8Bwmb907QZvC_moY4AwZKsCDt5G-xjRa2DegChdqwHnRet7pGQCNtMZpwNjAwNjA0MDQxNTM1NTk2OTMzMg
Message-ID: <2w52GJ4sAB5-SgTzMb37jQ@notifications.google.com>
Subject: Security alert for skogix@gmail.com
From: Google <no-reply@accounts.google.com>
To: emil.skogsund@gmail.com
Content-Type: multipart/alternative; boundary="0000000000001e099005db4ad931"
X-TUID: J9XI6PG1tYIz

--0000000000001e099005db4ad931
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

VGhpcyBpcyBhIGNvcHkgb2YgYSBzZWN1cml0eSBhbGVydCBzZW50IHRvIHNrb2dpeEBnbWFpbC5j
b20uDQplbWlsLnNrb2dzdW5kQGdtYWlsLmNvbSBpcyB0aGUgcmVjb3ZlcnkgZW1haWwgZm9yIHRo
aXMgYWNjb3VudC4gSWYgeW91DQpkb24ndCByZWNvZ25pc2UgdGhpcyBhY2NvdW50LCBkaXNjb25u
ZWN0DQo8aHR0cHM6Ly9hY2NvdW50cy5nb29nbGUuY29tL0FjY291bnREaXNhdm93P2FkdD1BT1g4
a2lyRXJLTE5oOTY2aDRMRFRqbVhSLWYxMkJTYUNXUjV1ZmUxUDR3eU5lUE82R1JWdy1kMWtqZEFs
QWVnbkhIY2pnJnJmbj0zMjUmYW5leHA9bnJldC1mYT4NCml0Lg0KW2ltYWdlOiBHb29nbGVdDQpO
ZXcgc2lnbi1pbiB0byB5b3VyIGxpbmtlZCBhY2NvdW50DQoNCg0Kc2tvZ2l4QGdtYWlsLmNvbQ0K
V2Ugbm90aWNlZCBhIG5ldyBzaWduLWluIHRvIHlvdXIgR29vZ2xlIEFjY291bnQgb24gYSBXaW5k
b3dzIGRldmljZS4gSWYNCnRoaXMgd2FzIHlvdSwgeW91IGRvbuKAmXQgbmVlZCB0byBkbyBhbnl0
aGluZy4gSWYgbm90LCB3ZeKAmWxsIGhlbHAgeW91IHNlY3VyZQ0KeW91ciBhY2NvdW50Lg0KQ2hl
Y2sgYWN0aXZpdHkNCjxodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20vQWNjb3VudENob29zZXI/
RW1haWw9c2tvZ2l4QGdtYWlsLmNvbSZjb250aW51ZT1odHRwczovL215YWNjb3VudC5nb29nbGUu
Y29tL2FsZXJ0L250LzE2NDg0ODkzOTkwMDA/cmZuJTNEMzI1JTI2cmZuYyUzRDElMjZlaWQlM0Qx
MTMwODUyMTIxOTk4NTQwOTA2JTI2ZXQlM0QxJTI2YW5leHAlM0RucmV0LWZhPg0KWW91IGNhbiBh
bHNvIHNlZSBzZWN1cml0eSBhY3Rpdml0eSBhdA0KaHR0cHM6Ly9teWFjY291bnQuZ29vZ2xlLmNv
bS9ub3RpZmljYXRpb25zDQpZb3UgcmVjZWl2ZWQgdGhpcyBlbWFpbCB0byBsZXQgeW91IGtub3cg
YWJvdXQgaW1wb3J0YW50IGNoYW5nZXMgdG8geW91cg0KR29vZ2xlIEFjY291bnQgYW5kIHNlcnZp
Y2VzLg0KwqkgMjAyMiBHb29nbGUgSXJlbGFuZCBMdGQuLCBHb3Jkb24gSG91c2UsIEJhcnJvdyBT
dHJlZXQsIER1YmxpbiA0LCBJcmVsYW5kDQo=
--0000000000001e099005db4ad931
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html lang=3D"en"><head><meta name=3D"format-detection" cont=
ent=3D"email=3Dno"/><meta name=3D"format-detection" content=3D"date=3Dno"/>=
<style nonce=3D"pLuLAc4R8UM+/ieUMV2VhQ">.awl a {color: #FFFFFF; text-decora=
tion: none;} .abml a {color: #000000; font-family: Roboto-Medium,Helvetica,=
Arial,sans-serif; font-weight: bold; text-decoration: none;} .adgl a {color=
: rgba(0, 0, 0, 0.87); text-decoration: none;} .afal a {color: #b0b0b0; tex=
t-decoration: none;} @media screen and (min-width: 600px) {.v2sp {padding: =
6px 30px 0px;} .v2rsp {padding: 0px 10px;}} @media screen and (min-width: 6=
00px) {.mdv2rw {padding: 40px 40px;}} </style><link href=3D"//fonts.googlea=
pis.com/css?family=3DGoogle+Sans" rel=3D"stylesheet" type=3D"text/css" nonc=
e=3D"pLuLAc4R8UM+/ieUMV2VhQ"/></head><body style=3D"margin: 0; padding: 0;"=
 bgcolor=3D"#FFFFFF"><table width=3D"100%" height=3D"100%" style=3D"min-wid=
th: 348px;" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" lang=3D"en"><t=
r height=3D"32" style=3D"height: 32px;"><td></td></tr><tr align=3D"center">=
<td><div itemscope itemtype=3D"//schema.org/EmailMessage"><div itemprop=3D"=
action" itemscope itemtype=3D"//schema.org/ViewAction"><link itemprop=3D"ur=
l" href=3D"https://accounts.google.com/AccountChooser?Email=3Dskogix@gmail.=
com&amp;continue=3Dhttps://myaccount.google.com/alert/nt/1648489399000?rfn%=
3D325%26rfnc%3D1%26eid%3D1130852121998540906%26et%3D1%26anexp%3Dnret-fa"/><=
meta itemprop=3D"name" content=3D"Review Activity"/></div></div><table bord=
er=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"padding-bottom: 20px;=
 max-width: 516px; min-width: 220px;"><tr><td width=3D"8" style=3D"width: 8=
px;"></td><td><div style=3D"background-color: #F5F5F5; direction: ltr; padd=
ing: 16px;margin-bottom: 6px;"><table width=3D"100%" border=3D"0" cellspaci=
ng=3D"0" cellpadding=3D"0"><tbody><tr><td style=3D"vertical-align: top;"><i=
mg height=3D"20" src=3D"https://www.gstatic.com/accountalerts/email/Icon_re=
covery_x2_20_20.png"></td><td width=3D"13" style=3D"width: 13px;"></td><td =
style=3D"direction: ltr;"><span style=3D"font-family: Roboto-Regular,Helvet=
ica,Arial,sans-serif; font-size: 13px; color: rgba(0,0,0,0.87); line-height=
: 1.6; color: rgba(0,0,0,0.54);">This is a copy of a security alert sent to=
 <a style=3D"text-decoration: none; color: rgba(0,0,0,0.87);">skogix@gmail.=
com</a>. <a style=3D"text-decoration: none; color: rgba(0,0,0,0.87);">emil.=
skogsund@gmail.com</a> is the recovery email for this account.</span> <span=
><span style=3D"font-family: Roboto-Regular,Helvetica,Arial,sans-serif; fon=
t-size: 13px; color: rgba(0,0,0,0.87); line-height: 1.6; color: rgba(0,0,0,=
0.54);">If you don't recognise this account, <a href=3D"https://accounts.go=
ogle.com/AccountDisavow?adt=3DAOX8kirErKLNh966h4LDTjmXR-f12BSaCWR5ufe1P4wyN=
ePO6GRVw-d1kjdAlAegnHHcjg&amp;rfn=3D325&amp;anexp=3Dnret-fa" data-meta-key=
=3D"disavow" style=3D"text-decoration: none; color: #4285F4;" target=3D"_bl=
ank">disconnect</a> it.</span></span></td></tr></tbody></table></div><div s=
tyle=3D"border-style: solid; border-width: thin; border-color:#dadce0; bord=
er-radius: 8px; padding: 40px 20px;" align=3D"center" class=3D"mdv2rw"><img=
 src=3D"https://www.gstatic.com/images/branding/googlelogo/2x/googlelogo_co=
lor_74x24dp.png" width=3D"74" height=3D"24" aria-hidden=3D"true" style=3D"m=
argin-bottom: 16px;" alt=3D"Google"><div style=3D"font-family: &#39;Google =
Sans&#39;,Roboto,RobotoDraft,Helvetica,Arial,sans-serif;border-bottom: thin=
 solid #dadce0; color: rgba(0,0,0,0.87); line-height: 32px; padding-bottom:=
 24px;text-align: center; word-break: break-word;"><div style=3D"font-size:=
 24px;">New sign-in to your linked account </div><table align=3D"center" st=
yle=3D"margin-top:8px;"><tr style=3D"line-height: normal;"><td align=3D"rig=
ht" style=3D"padding-right:8px;"><img width=3D"20" height=3D"20" style=3D"w=
idth: 20px; height: 20px; vertical-align: sub; border-radius: 50%;;" src=3D=
"https://lh3.googleusercontent.com/a-/AOh14Ggc9OhBWgEp5-jN9Lt5kQzt5Fh9eFRuP=
m1pTqC-Jg=3Ds96" alt=3D""></td><td><a style=3D"font-family: &#39;Google San=
s&#39;,Roboto,RobotoDraft,Helvetica,Arial,sans-serif;color: rgba(0,0,0,0.87=
); font-size: 14px; line-height: 20px;">skogix@gmail.com</a></td></tr></tab=
le> </div><div style=3D"font-family: Roboto-Regular,Helvetica,Arial,sans-se=
rif; font-size: 14px; color: rgba(0,0,0,0.87); line-height: 20px;padding-to=
p: 20px; text-align: center;">We noticed a new sign-in to your Google Accou=
nt on a Windows device. If this was you, you don=E2=80=99t need to do anyth=
ing. If not, we=E2=80=99ll help you secure your account.<div style=3D"paddi=
ng-top: 32px; text-align: center;"><a href=3D"https://accounts.google.com/A=
ccountChooser?Email=3Dskogix@gmail.com&amp;continue=3Dhttps://myaccount.goo=
gle.com/alert/nt/1648489399000?rfn%3D325%26rfnc%3D1%26eid%3D113085212199854=
0906%26et%3D1%26anexp%3Dnret-fa" target=3D"_blank" link-id=3D"main-button-l=
ink" style=3D"font-family: &#39;Google Sans&#39;,Roboto,RobotoDraft,Helveti=
ca,Arial,sans-serif; line-height: 16px; color: #ffffff; font-weight: 400; t=
ext-decoration: none;font-size: 14px;display:inline-block;padding: 10px 24p=
x;background-color: #4184F3; border-radius: 5px; min-width: 90px;">Check ac=
tivity</a></div></div><div style=3D"padding-top: 20px; font-size: 12px; lin=
e-height: 16px; color: #5f6368; letter-spacing: 0.3px; text-align: center">=
You can also see security activity at<br><a style=3D"color: rgba(0, 0, 0, 0=
.87);text-decoration: inherit;">https://myaccount.google.com/notifications<=
/a></div></div><div style=3D"text-align: left;"><div style=3D"font-family: =
Roboto-Regular,Helvetica,Arial,sans-serif;color: rgba(0,0,0,0.54); font-siz=
e: 11px; line-height: 18px; padding-top: 12px; text-align: center;"><div>Yo=
u received this email to let you know about important changes to your Googl=
e Account and services.</div><div style=3D"direction: ltr;">&copy; 2022 Goo=
gle Ireland Ltd., <a class=3D"afal" style=3D"font-family: Roboto-Regular,He=
lvetica,Arial,sans-serif;color: rgba(0,0,0,0.54); font-size: 11px; line-hei=
ght: 18px; padding-top: 12px; text-align: center;">Gordon House, Barrow Str=
eet, Dublin 4, Ireland</a></div></div></div></td><td width=3D"8" style=3D"w=
idth: 8px;"></td></tr></table></td></tr><tr height=3D"32" style=3D"height: =
32px;"><td></td></tr></table></body></html>
--0000000000001e099005db4ad931--
