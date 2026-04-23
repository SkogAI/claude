Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a59:bd02:0:b0:2bd:2fa1:323e with SMTP id i2csp3239779vqz;
        Sun, 22 May 2022 21:37:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmhFImgGdd4Ke/UQJM0kB6N+JYQeO3S7CzRX3KSMHPI4GhpnKqdgqR9HUUO0479YBnYSMe
X-Received: by 2002:a7b:c082:0:b0:394:3a45:bcc5 with SMTP id r2-20020a7bc082000000b003943a45bcc5mr18473443wmh.138.1653280633883;
        Sun, 22 May 2022 21:37:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653280633; cv=none;
        d=google.com; s=arc-20160816;
        b=iQdJCvXGnpf/+x6VaBRXkIHZfejDgOqMU1mhPdu24DNjjhlQ51mXt/xIuFo4ml3Frj
         dxbjHT+MydleC0JmbZpGSw5y24Bo6AWEaaamiHeh1OQglcY1j6Z5kj1ynVFQAZDn+QDR
         sWt7Wtt6CxOGGDXEPLXTL/M7F6nKdg9QdOLl9mPSYGqqXF12RMtLHUWsx2GUCitJURPZ
         rTItONzOGh/an3atgneh13oqpa7fR0MXDA+XPihIP9bGB2SZg/4Cg43qknbEHBBsc+QJ
         7XU3a1Jbp6eZxIOKayDjxZ87bP+Qma0hReR60j42Qyv1T+tb0tZ8UaUU4ZfCBSPAsG9r
         mC4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=precedence:message-id:mime-version:reply-to:to:subject:date:from
         :dkim-signature;
        bh=ameOYHaraS0+8XLOv8AUAdXyyPLBi+LBrxBGEM0maVc=;
        b=uWM2iAevuxuhXNdQ4MLJyJR9BFci6Qvc4xqC04VF+v20N4Ua/pX+Q1vtylTAs9zPdq
         x7iAPTM9n/198coQl/GXxk18GddWu7tiktsgtFDc1InKTfFode/MODWDdSbczp8jolbC
         ianc1vnem1XBj87+kB5VfHTBmWzBiWLgOMQ/dIuhyMFFnepvqNjZybI5vSydwo/nC43H
         Ma5ZJ3IoenocEi1jCxaSdKFiCo0MThEN9z2hM+f67/Q0eVilE9/+/X6EDWnd7lxK+PWI
         aOxGZ5xb/m7urs/qyL5M1kLizDtQ8qsoI/uWgJ6fjslQJkbCbMmiGsbucS/Saztvsoev
         p+SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@messages.tallinksilja.se header.s=tallinksailja header.b=SLLg003y;
       spf=pass (google.com: domain of bounce@messages.tallinksilja.se designates 172.82.232.157 as permitted sender) smtp.mailfrom=bounce@messages.tallinksilja.se
Return-Path: <bounce@messages.tallinksilja.se>
Received: from r157.messages.tallink.com (r157.messages.tallink.com. [172.82.232.157])
        by mx.google.com with ESMTPS id y5-20020adffa45000000b0020d02ed38b2si7548149wrr.229.2022.05.22.21.37.13
        for <emil.skogsund@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 May 2022 21:37:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounce@messages.tallinksilja.se designates 172.82.232.157 as permitted sender) client-ip=172.82.232.157;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@messages.tallinksilja.se header.s=tallinksailja header.b=SLLg003y;
       spf=pass (google.com: domain of bounce@messages.tallinksilja.se designates 172.82.232.157 as permitted sender) smtp.mailfrom=bounce@messages.tallinksilja.se
Return-Path: <bounce@messages.tallinksilja.se>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=messages.tallinksilja.se; s=tallinksailja; t=1653280633;
	bh=ameOYHaraS0+8XLOv8AUAdXyyPLBi+LBrxBGEM0maVc=;
	h=From:Date:Subject:To:MIME-Version:Message-ID:Content-Type;
	b=SLLg003yo/RdlIj+z3awWSKSnc1IW/Nw5pabyNtoZZ/6K1e22lkxS+co38X2TvXSS
	 iB8o0gDOMQ0BA58XGCmYO5YrDqlpfifom0I6iae//IuhRswEAZX+Gtf9J+sBXPBXax
	 5UCRvFVm7B4xJSfPP+1aJyvMt1a8IkLSDuA2v8ouy5DiHvmH5OSStBhw6Zs13dFJSt
	 FyTBNFhjKPGqj/yaKx1E3Ly395Yf3sFspXZFfecXB2r2AriMI6ViqK9lKTkEdATCeq
	 ClxZw20zDq2ha5wbS/bA2Wg0BSCimQcBbJwz3XdhjJ1vuFEGfhwch5ZN3eALBLNwlO
	 FyKRyLOtpZkPQ==
X-MSFBL: YVSO9K6BWDB4UW27q3A4V8koOpoEHnwNOQsZL5PGJ+c=|eyJyY3B0X21ldGEiOns
	gImluIjogInRhbGxpbmtfbWt0X3Byb2Q2IiwgInIiOiAiZW1pbC5za29nc3VuZEB
	nbWFpbC5jb20iLCAibSI6ICI2NzQ4MDkzMTAiLCAiZCI6ICIzNDg0MjY2OTUiLCA
	iaSI6ICJBRThCNUFENzU5MUFDMTU2MEE0OTVEMjVAQWRvYmVPcmciIH0sImciOiJ
	kZWZhdWx0XzE5NmE3MjU2LTI3YmUtNGFjNC05ZWU1LWU2NzM5OWQ5OWNjNSIsImI
	iOiJhd3NfdGFsbGlua3NhaWxqYV9wcm9kNl9kZWZhdWx0X21vbWVudHVtMDZfbXR
	hMDA5XzE3Mi44Mi4yMzIuMTU3IiwiciI6ImVtaWwuc2tvZ3N1bmRAZ21haWwuY29
	tIn0=
Received: from [10.98.212.164] ([10.98.212.164:18399] helo=r158.messages.tallink.com)
	by momentum06.lon7.cpt.adobe.net (envelope-from <bounce@messages.tallinksilja.se>)
	(ecelerity 4.2.31.59853 r(Core:4.2.31.1)) with ESMTP
	id 99/9C-29388-97F0B826; Mon, 23 May 2022 05:37:13 +0100
From: "Club One" <no-reply@messages.tallinksilja.se>
Date: Mon, 23 May 2022 05:37:12 +0100
Subject: =?windows-1252?Q?Du_har_f=F6rtur_p=E5_sommarrean!?=
To: <emil.skogsund@gmail.com>
Reply-To: "Club One" <bounce@messages.tallinksilja.se>
MIME-Version: 1.0
X-mailer: nlserver, Build 7.0.0.10634
Message-ID: <AC7000000002838C5DE14C491C7tallink_mkt_prod6@messages.tallinksilja.se>
Precedence: bulk
Content-Type: multipart/alternative;
	boundary="----=_NextPart_522_51709C50.51709C50"
X-TUID: mn3aX9ozQ1WR

This is a multi-part message in MIME format.

------=_NextPart_522_51709C50.51709C50
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Som medlem i Club One f=C3=A5r du nu chansen att nyttja v=C3=A5r sommarrea =
f=C3=B6re alla andra och boka med upp till 40% rabatt!

------=_NextPart_522_51709C50.51709C50
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html style=3D""><head><meta name=3D"content-version" content=3D"3.3.9"><ba=
se href=3D"https://t.messages.tallink.com"/><meta name=3D"x-apple-disable-m=
essage-reformatting"><meta name=3D"viewport" content=3D"width=3Ddevice-widt=
h,initial-scale=3D1.0"><style data-name=3D"default" type=3D"text/css">body{=
font-family:sans-serif;margin:0 !important;padding:0 !important;background:=
#FFFFFF;min-width:750px;}td{padding:0;border-collapse:collapse;}th{font-wei=
ght:normal;text-align:left;}.acr-fragment,.acr-component{padding:0;}.divide=
r-container{padding:5px 0;font-size:0px;}.text-container p{margin:0;}.image=
-container{line-height:0;}.acr-tmp-component img,.image-container img{heigh=
t:auto;}.button-container a{text-decoration:none;color:inherit;}.acr-struct=
ure{background-size:auto;background-repeat:no-repeat;}.structure__table{tab=
le-layout:fixed;margin:0 auto;border-spacing:0;background-size:auto;backgro=
und-repeat:no-repeat;mso-table-lspace:0pt !important;mso-table-rspace:0pt !=
important;}.colspan1,.colspan2,.colspan3,.colspan4,.colspan33,.colspan66{ba=
ckground-size:auto;background-repeat:no-repeat;box-sizing:border-box;}.cols=
pan1{width:100%;}.colspan2{width:50%;}.colspan3{width:75%;}.colspan4{width:=
25%;}.colspan33{width:33%;}.colspan66{width:66%;}.component-social-containe=
r{width:100%;text-align:center;}span.preheader{display:none !important;visi=
bility:hidden;mso-hide:all;opacity:0;}.ExternalClass{width:100%;}.ExternalC=
lass,.ExternalClass p,.ExternalClass span,.ExternalClass font,.ExternalClas=
s td,.ExternalClass div{line-height:100%;}h1,h2,h3,h4,h5{display:block;font=
-weight:bold;}h1{font-size:24px;margin:19px 0 19px 0;}h2{font-size:24px;mar=
gin:20px 0 20px 0;}h3{font-size:19px;margin:19px 0 19px 0;}h4{font-size:16p=
x;margin:21px 0 21px 0;}h5{font-size:13px;margin:22px 0 22px 0;}h6{font-siz=
e:11px;margin:25px 0 25px 0;}.mso-is-desktop-hidden,.mso-is-desktop-hidden =
table{mso-hide:all;}@media screen and (min-width: 500px){.is-desktop-hidden=
{display:none !important;}}</style><style data-name=3D"media-default-max-wi=
dth-500px" type=3D"text/css">@media screen and (max-width: 500px){body{widt=
h:100% !important;min-width:0px !important;}.structure__table{width:100%;}t=
h{display:block !important;min-width:100%;}.container-small-size th{display=
:table-cell !important;width:100% !important;}.is-mobile-hidden{display:non=
e !important;}}</style><style data-name=3D"media-custom-max-width-500px" ty=
pe=3D"text/css">@media screen and (max-width: 500px){#acr-61323970 th{displ=
ay:table-cell !important;}}</style><style type=3D"text/css">@media screen a=
nd (max-width: 500px) {.colspan1,.colspan2,.colspan3 {width:100%;}}</style>=
<!--[if gte mso 9]><style acrite-mso-css=3D"true">.image-container div {  d=
isplay: block;}.structure__table td {  padding: 0;  border: none;}.button-c=
ontainer {  border: none !important;  padding: 0 !important;  margin: 0 !im=
portant;  line-height: normal !important;}.acr-structure {  margin: 0 !impo=
rtant;}.acr-component {  margin: 0 !important;}.acr-fragment {  margin: 0 !=
important;}.colspan1, .colspan2, .colspan3, .colspan4, .colspan33, .colspan=
66 {  box-sizing: border-box !important;}</style><![endif]--></head><body c=
lass=3D"" style=3D"background:#eef1f1;">
<span style=3D"display: none !important; visibility: hidden; mso-hide: all;=
 opacity: 0;" class=3D"acr-preheader">F=C3=A5 upp till 40% rabatt p=C3=A5 s=
ommarens resor</span>
<div class=3D"acr-container" style=3D"background: #eef1f1;">
<div class=3D"acr-structure" data-structure-id=3D"1-1-column" data-structur=
e-name=3D"richtext.structure_1_1_column">
<table class=3D"structure__table" align=3D"center" cellpadding=3D"0" cellsp=
acing=3D"0" border=3D"0" width=3D"750">
<tbody>
<tr><th class=3D"colspan1">
<div class=3D"acr-fragment acr-component" data-component-id=3D"text" style=
=3D"padding-top: 8px; padding-bottom: 8px; border-width: 0px; border-style:=
 none;" data-contenteditable=3D"false"><!--[if mso]><table cellpadding=3D"0=
" cellspacing=3D"0" border=3D"0" width=3D"100%"><tr><td style=3D"padding-to=
p: 8px; padding-bottom: 8px; border-width: 0px; border-style: none;"><![end=
if]-->
<div class=3D"text-container" data-contenteditable=3D"true">
<div class=3D"text-container" style=3D"text-align: center;"><a href=3D"http=
s://t.messages.tallink.com/r/=3Fid=3Dh2838c5de,14c491c7,14c491c9&e=3DY2tleT=
0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3JnAxPUBKMzlYZnN3ZGxTMFJsVnJKLWY4QW5zaVlIS=
EFKeDBiV2xxUWRuR19QTmxvMkJzWHNTY1dFZVNoVVNGTUlHa2NYUTAtS3ZIMUUxSVlXbnY4ZFJz=
azdoNGh5YVVRTDF6NmpIcVRaRjJHVG40R09Qb1Rp&s=3Dlht6j2gox07vloGC7P6V8JkANY0C8H=
itSg4oGHiAn4w" name=3D"view_online" style=3D"color: #004152; font-size: 10p=
x;" target=3D"_blank" xt=3D"SPCLICKTOVIEW" data-id=3D"al15371712726814d7fe6=
" data-nl-type=3D"externalLink" title=3D"" alt=3D"" >Klicka h=C3=A4r f=C3=
=B6r webbversion av mailet</a></div>
</div>
<!--[if mso]></td></tr></table><![endif]--></div>
</th></tr>
</tbody>
</table>
</div>
<div class=3D"acr-structure" data-structure-id=3D"1-1-column" data-structur=
e-name=3D"richtext.structure_1_1_column" data-nl-format=3D"datetime">
<table class=3D"structure__table" align=3D"center" cellpadding=3D"0" cellsp=
acing=3D"0" border=3D"0" width=3D"750">
<tbody>
<tr><th class=3D"colspan1">
<!--[if gte mso 9]><style acrite-mso-css=3D"true">.image-container div {  d=
isplay: block;}.structure__table td {  padding: 0;  border: none;}.button-c=
ontainer {  border: none !important;  padding: 0 !important;  margin: 0 !im=
portant;  line-height: normal !important;}.acr-structure {  margin: 0 !impo=
rtant;}.acr-component {  margin: 0 !important;}.acr-fragment {  margin: 0 !=
important;}.colspan1, .colspan2, .colspan3, .colspan4, .colspan33, .colspan=
66 {  box-sizing: border-box !important;}</style><![endif]--><div class=3D"=
acr-fragment is-locked" data-fragment-id=3D"@WI4N1IRtYIXzo9sOe0iRKBaiUgAI5C=
Kdu68Uqm1uQbZTW7F3L58AmGt0TbxMMWwQ2NrPrCA7MMVIcL_Sj06iHi6g8YA" data-fragmen=
t-ref=3D"CMDL1002" data-nl-name=3D"FF_CO_HDR (CMDL1002)" data-fragment-name=
=3D"FF_CO_HDR (CMDL1002)"><table align=3D"center" cellpadding=3D"0" cellspa=
cing=3D"0" border=3D"0" style=3D"width: 100%; table-layout: fixed;"><tbody>=
<tr><th class=3D"colspan1"><div><table align=3D"center" border=3D"0" bgcolo=
r=3D"#FFFFFF" cellpadding=3D"0" cellspacing=3D"0" data-component-id=3D"text=
" data-component-name=3D"richtext.component_html" style=3D"width:100%;table=
-layout:fixed;" data-contenteditable=3D"true"><tbody><tr><th class=3D"colsp=
an1" align=3D"center" style=3D"padding-left:40px;padding-right:40px;">

                        </th></tr></tbody></table></div></th></tr></tbody><=
/table><table align=3D"center" cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"width: 100%; table-layout: fixed;"><tbody><tr><th class=3D"=
colspan1"></th></tr></tbody></table><table align=3D"center" cellpadding=3D"=
0" cellspacing=3D"0" border=3D"0" style=3D"width: 100%; table-layout: fixed=
;"><tbody><tr><th class=3D"colspan1"><div><table align=3D"center" border=3D=
"0" bgcolor=3D"#004152" cellpadding=3D"0" cellspacing=3D"0" data-component-=
id=3D"text" data-component-name=3D"richtext.component_html" style=3D"width:=
100%;table-layout:fixed;" data-contenteditable=3D"true"><tbody><tr><th><div=
 data-component-id=3D"html" data-component-name=3D"richtext.component_html"=
 style=3D"background-color:#004152;"><table bgcolor=3D"#004152" border=3D"0=
" cellpadding=3D"0" cellspacing=3D"0" width=3D"100%" style=3D"width:100%;ba=
ckground-color:#004152;" align=3D"center"><tbody><tr><th colspan=3D"2" clas=
s=3D"colspan1" style=3D"width:100%;vertical-align:top;" width=3D"100%" bgco=
lor=3D"#004152"><div class=3D"acr-tmp-component" data-contenteditable=3D"tr=
ue" data-tmp-component-id=3D"html"><table cellpadding=3D"0" cellspacing=3D"=
0" border=3D"0" width=3D"100%"><tbody><tr><td style=3D"line-height:0;height=
:30px;" height=3D"30">
                                            </td></tr></tbody></table></div=
></th></tr><tr><th colspan=3D"2" class=3D"colspan1" style=3D"width:100%;ver=
tical-align:top;" width=3D"100%" bgcolor=3D"#004152"><div class=3D"acr-tmp-=
component" data-contenteditable=3D"true" data-tmp-component-id=3D"html"><ta=
ble cellpadding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100%"><tbody>=
<tr><td align=3D"center" height=3D"" class=3D"logoco" style=3D"border-colla=
pse:collapse;padding:0;vertical-align:top;padding-left:20px;padding-right:2=
0px;line-height:30px;">
                                              <img alt=3D"Club One" border=
=3D"0" height=3D"" name=3D"logo_co_mail.png" src=3D"http://res.messages.tal=
link.com/res/tallink_mkt_prod6/ab2dc9b329653e0a60067186e122385c59a4a20e0fef=
71e35b917464671087e6.png" style=3D"display:block;" title=3D"Club One" width=
=3D"275" data-upload=3D"uploadLoader-1624959272115-46159192">
                                            </td></tr><tr><td style=3D"line=
-height:0;height:30px;" height=3D"30">
                                            </td></tr></tbody></table></div=
></th></tr></tbody></table></div></th></tr></tbody></table></div></th></tr>=
</tbody></table></div>
</th></tr>
</tbody>
</table>
</div>
<div class=3D"acr-structure" data-structure-id=3D"1-1-column" data-structur=
e-name=3D"richtext.structure_1_1_column">
<table class=3D"structure__table" align=3D"center" cellpadding=3D"0" cellsp=
acing=3D"0" border=3D"0" width=3D"750">
<tbody>
<tr><th class=3D"colspan1">
<!--[if gte mso 9]><style acrite-mso-css=3D"true">.image-container div {  d=
isplay: block;}.structure__table td {  padding: 0;  border: none;}.button-c=
ontainer {  border: none !important;  padding: 0 !important;  margin: 0 !im=
portant;  line-height: normal !important;}.acr-structure {  margin: 0 !impo=
rtant;}.acr-component {  margin: 0 !important;}.acr-fragment {  margin: 0 !=
important;}.colspan1, .colspan2, .colspan3, .colspan4, .colspan33, .colspan=
66 {  box-sizing: border-box !important;}</style><![endif]-->
    <div class=3D"acr-fragment is-locked" data-fragment-id=3D"@WI4N1IRtYIXz=
o9sOe0iRKCv90eAREgbKkYddC3PrEPq1sshYFjigvItTVMPTdqbnRDCDUvacgSHd35Vn8YYSHh8=
mauE" data-fragment-ref=3D"CMDL992" data-nl-name=3D"FF_CO_21_HDR_sv_SE (CMD=
L992)" data-fragment-name=3D"FF_CO_21_HDR_sv_SE (CMDL992)">
      <style data-name=3D"media-custom-max-width-500px" type=3D"text/css">
@media screen and (max-width: 500px) {
  #acr-54743749 {
    margin-left: 60px !important;
    margin-right: 60px !important;
  }
}
</style><table align=3D"center" cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"width: 100%; table-layout: fixed;">
          <tbody>
            <tr>
              <th class=3D"colspan1">
                <div class=3D"" data-fragment-id=3D"@WI4N1IRtYIXzo9sOe0iRKG=
Q9TpqhbfcI9VvPeShFpHFSES7BFPYWqur8FYwMFDNBKgIJsRSgDX8dm-NBNP-o5SC2E6E" data=
-fragment-ref=3D"CMDL999" data-nl-name=3D"CMDL999" data-fragment-name=3D"" =
id=3D"acr-54743749">
                  <style data-name=3D"media-custom-max-width-500px" type=3D=
"text/css">
@media screen and (max-width: 500px) {
  #acr-36385392 {
    margin-left: 65px !important;
  }
}
</style>
                  <table align=3D"center" border=3D"0" bgcolor=3D"#ffffff" =
cellpadding=3D"0" cellspacing=3D"0" data-component-id=3D"text" data-compone=
nt-name=3D"richtext.component_html" style=3D"width:100%;table-layout:fixed;=
" data-contenteditable=3D"true">
                    <tbody>
                      <tr>
                        <th>
                          
                          
                          
                          <div data-structure-id=3D"1-1-column" data-struct=
ure-name=3D"richtext.structure_1_1_column">
                            <table align=3D"center" border=3D"0" cellpaddin=
g=3D"0" cellspacing=3D"0" data-component-id=3D"text" data-component-name=3D=
"richtext.component_html" data-contenteditable=3D"true" style=3D"width: 100=
%; table-layout: fixed;">
                              <tbody>
                                <tr>
                                  <th align=3D"center" class=3D"colspan1">
                                    <div style=3D"padding:0;vertical-align:=
top;">
                                      <table bgcolor=3D"#ffffff" align=3D"c=
enter" cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"width:100%=
;">
                                        <tbody>
                                          <tr>
                                            <th class=3D"colspan1" bgcolor=
=3D"#ffffff" style=3D"color:#ffffff;background-repeat:no-repeat;background-=
size:auto;font-weight:normal;text-align:left;width:100%;">
                                              <div class=3D"" data-componen=
t-id=3D"text" data-component-name=3D"richtext.component_text" data-contente=
ditable=3D"false">
                                                <!--[if mso]><table cellpad=
ding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100%"><tr><td style=3D"b=
ackground-color: #ffffff;"><![endif]-->
                                                <table align=3D"center" cel=
lpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"width:100%;">
                                                  <tbody>
                                                    <tr>
                                                      <th class=3D"colspan1=
" style=3D"background-repeat:no-repeat;background-size:auto;font-weight:nor=
mal;text-align:left;width:100%;">
                                                        <div>
                                                        </div>
                                                        <table align=3D"cen=
ter" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"" width=3D"1=
00" style=3D"width:100%;vertical-align:top;">
                                                          <tbody>
                                                            <tr>
                                                              <th align=3D"=
left" class=3D"colspan1" colspan=3D"2" height=3D"15" style=3D"border-collap=
se:collapse;line-height:15px;mso-line-height-rule:exactly;mso-table-lspace:=
0pt;mso-table-rspace:0pt;padding:0;" valign=3D"top">

                                                              </th>
                                                            </tr>
                                                            <tr>
                                                              <th class=3D"=
colspan4" valign=3D"top" width=3D"25%" style=3D"border-collapse:collapse;pa=
dding:0;" data-nl-format=3D"datetime">
                                                                <table cell=
padding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100" style=3D"width:1=
00%;">
                                                                  <tbody>
                                                                    <tr>
                                                                      <th h=
eight=3D"4" style=3D"height:4px;line-height:4px;">

                                                                      </th>
                                                                    </tr>
                                                                    <tr>
                                                                      <th w=
idth=3D"230" class=3D"colspan1" align=3D"left" style=3D"font-family:Arial, =
Helvetica, sans-serif;color:#004152;font-size:14px;line-height:18px;text-al=
ign:left;width:230px;min-width:230px;max-width:100%;vertical-align:top;" va=
lign=3D"top">
                                                                        <di=
v class=3D"acr-tmp-component" style=3D"" data-contenteditable=3D"false" dat=
a-tmp-component-id=3D"text">
                                                                          <=
div class=3D"text-container" data-contenteditable=3D"true">
                                                                           =
 <table align=3D"left" width=3D"230px" border=3D"0" cellspacing=3D"0" cellp=
adding=3D"0" style=3D"min-width:230px;max-width:100%;">
                                                                           =
   <tbody>
                                                                           =
     <tr valign=3D"top">
                                                                           =
       <td align=3D"left" valign=3D"top" style=3D"padding-right:8px;padding=
-left:40px;padding-top:5px;"><img src=3D"http://res.messages.tallink.com/re=
s/tallink_mkt_prod6/ab777933185f7f2ffc591725c6fcf314c94b9268434032e7b31a222=
965cfd8f3.png" width=3D"36" data-img-inline=3D"true" data-upload=3D"uploadL=
oader-1623154045505-195147733"></td>
                                                                           =
       <td align=3D"left" style=3D"line-height:20px;font-size:14px;text-ali=
gn-last:left;padding-left:8px;padding-right:25px;color:#004152;">
                                                                           =
         <p align=3D"left"><strong>Emil&nbsp;<br>Skogsund</strong></p>
                                                                           =
       </td>
                                                                           =
     </tr>
                                                                           =
   </tbody>
                                                                           =
 </table>
                                                                          <=
/div>
                                                                        </d=
iv>
                                                                      </th>
                                                                    </tr>
                                                                    <tr>
                                                                      <th h=
eight=3D"8" style=3D"height:8px;line-height:8px;">

                                                                      </th>
                                                                    </tr>
                                                                  </tbody>
                                                                </table>
                                                              </th>
                                                              <th class=3D"=
colspan4" valign=3D"top" width=3D"25%" style=3D"border-collapse:collapse;pa=
dding:0;" data-nl-format=3D"datetime">
                                                                <table cell=
padding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100" style=3D"width:1=
00%;">
                                                                  <tbody>
                                                                    <tr>
                                                                      <th h=
eight=3D"4" style=3D"height:4px;line-height:4px;">

                                                                      </th>
                                                                    </tr>
                                                                    <tr>
                                                                      <th w=
idth=3D"270" class=3D"colspan1" align=3D"left" style=3D"font-family:Arial, =
Helvetica, sans-serif;color:#004152;font-size:14px;line-height:18px;text-al=
ign:left;border:none;width:270px;min-width:270px;max-width:100%;vertical-al=
ign:top;" valign=3D"top">
                                                                        <di=
v class=3D"acr-tmp-component" style=3D"" data-contenteditable=3D"false" dat=
a-tmp-component-id=3D"text">
                                                                          <=
div class=3D"text-container" data-contenteditable=3D"true">
                                                                           =
 <table align=3D"left" width=3D"270px" border=3D"0" cellspacing=3D"0" cellp=
adding=3D"0" style=3D"min-width:270px;max-width:100%;">
                                                                           =
   <tbody>
                                                                           =
     <tr valign=3D"top">
                                                                           =
       <td align=3D"left" valign=3D"top" style=3D"padding-right:5px;padding=
-left:16px;border-left:#EEF1F1;border-left-style:solid;border-left-width:th=
in;color:#004152;">
                                                                           =
         <p align=3D"left" style=3D"color:#004152;vertical-align:top;font-s=
ize:12px;line-height:22px;"><span style=3D"color:rgb(119, 153, 161);">Konto=
:</span><br><strong>23082500</strong></p>
                                                                           =
       </td>
                                                                           =
       <td align=3D"left" valign=3D"top" style=3D"padding-right:5px;padding=
-left:16px;border-left:#EEF1F1;border-left-style:solid;border-left-width:th=
in;color:#004152;">
                                                                           =
         <p align=3D"left" style=3D"color:#004152;vertical-align:top;font-s=
ize:12px;line-height:22px;"><span style=3D"color:rgb(119, 153, 161);">Bonus=
po&#xE4;ng:</span><strong><br>0</strong></p>
                                                                           =
       </td>
                                                                           =
     </tr>
                                                                           =
   </tbody>
                                                                           =
 </table>
                                                                          <=
/div>
                                                                        </d=
iv>
                                                                      </th>
                                                                    </tr>
                                                                    <tr>
                                                                      <th h=
eight=3D"8" style=3D"height:8px;line-height:8px;">

                                                                      </th>
                                                                    </tr>
                                                                  </tbody>
                                                                </table>
                                                              </th>
                                                              <th class=3D"=
" valign=3D"top" width=3D"35%" style=3D"border-collapse:collapse;padding:0;=
" data-nl-format=3D"datetime">
                                                                <table cell=
padding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100" style=3D"width:1=
00%;">
                                                                  <tbody>
                                                                    <tr>
                                                                      <th h=
eight=3D"4" style=3D"height:4px;line-height:4px;">

                                                                      </th>
                                                                    </tr>
                                                                    <tr>
                                                                      <th w=
idth=3D"170" class=3D"colspan1" align=3D"left" style=3D"font-family:Arial, =
Helvetica, sans-serif;color:#004152;font-size:14px;line-height:18px;text-al=
ign:left;width:170px;padding-right:10px;padding-left:10px;" valign=3D"top">
                                                                        <di=
v class=3D"acr-tmp-component" style=3D"" data-contenteditable=3D"false" dat=
a-tmp-component-id=3D"text">
                                                                          <=
!--[if mso]><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0">
<tr valign=3D"middle"><td width=3D"17" > </td>
<td style=3D"display:inline-block;text-align:center;font-weight:bold;font-f=
amily:Arial, Helvetica, sans-serif;text-transform:uppercase;text-decoration=
:none;cursor:pointer;color:rgb(0, 65, 82);background-color:#eef1f1;font-siz=
e:14px;line-height:20px;padding:7px 20px;border:none;"><![endif]-->
                                                                          <=
div class=3D"button-container" style=3D"display:inline-block;text-align:cen=
ter;font-weight:bold;font-family:Arial, Helvetica, sans-serif;text-transfor=
m:uppercase;text-decoration:none;cursor:pointer;color:rgb(0, 65, 82);backgr=
ound-color:#eef1f1;font-size:14px;line-height:20px;padding:7px 20px;border:=
none;">
                                                                           =
 <table width=3D"100%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" bac=
kground=3D"#eef1f1" bgcolor=3D"#eef1f1">
                                                                           =
   <tbody>
                                                                           =
     <tr>
                                                                           =
       <td width=3D"38%" align=3D"right" style=3D"background-color:#eef1f1;=
"><img src=3D"http://res.messages.tallink.com/res/tallink_mkt_prod6/8d9aee9=
4a5131c29549ca00f5bb6321acf246c8c5915333874e4f9105893d067.jpg" data-img-inl=
ine=3D"true"></td>
                                                                           =
       <td align=3D"left"><a href=3D"https://t.messages.tallink.com/r/=3Fid=
=3Dh2838c5de,14c491c7,14c491cd&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3=
&s=3D31d7FfUvzIRTsoGIwvaQV67pmKnv47vNAsUeIvh2-qs" style=3D"display:inline-b=
lock;text-align:center;font-weight:bold;font-family:Arial, Helvetica, sans-=
serif;text-transform:uppercase;text-decoration:none;cursor:pointer;color:#0=
04152;background-color:#eef1f1;font-size:12px;line-height:20px;" data-conte=
nteditable=3D"true" >LOGGA&nbsp;IN</a></td>
                                                                           =
     </tr>
                                                                           =
   </tbody>
                                                                           =
 </table>
                                                                          <=
/div>
                                                                          <=
!--[if mso]></td><td width=3D"17" bgcolor=3D"#eef1f1"> </td></tr></table><!=
[endif]-->
                                                                        </d=
iv>
                                                                      </th>
                                                                    </tr>
                                                                    <tr>
                                                                      <th h=
eight=3D"8" style=3D"height:8px;line-height:8px;">

                                                                      </th>
                                                                    </tr>
                                                                  </tbody>
                                                                </table>
                                                              </th>
                                                            </tr>
                                                            <tr>
                                                              <th align=3D"=
left" class=3D"colspan1" colspan=3D"2" height=3D"10" style=3D"border-collap=
se:collapse;line-height:10px;mso-line-height-rule:exactly;mso-table-lspace:=
0pt;mso-table-rspace:0pt;padding:0;" valign=3D"top">
                                                              </th>
                                                            </tr>
                                                          </tbody>
                                                        </table>
                                                      </th>
                                                    </tr>
                                                  </tbody>
                                                </table>
                                                <!--[if mso]></td></tr></ta=
ble><![endif]-->
                                              </div>
                                            </th>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </div>
                                  </th>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </th>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </th>
            </tr>
          </tbody>
        </table>
    </div>
  

</th></tr>
</tbody>
</table>
</div>
<div class=3D"acr-structure" data-structure-id=3D"1-1-column" data-structur=
e-name=3D"richtext.structure_1_1_column">
<table class=3D"structure__table" align=3D"center" cellpadding=3D"0" cellsp=
acing=3D"0" border=3D"0" width=3D"750">
<tbody>
<tr><th class=3D"colspan1">
<div class=3D"acr-fragment acr-component image-container" data-component-id=
=3D"image" style=3D"width: 100%; text-align: center;" data-contenteditable=
=3D"false"><!--[if mso]><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" width=3D"100%"><tr><td style=3D"text-align: center;"><![endif]--><a =
class=3D"arc-link" data-nl-type=3D"externalLink" href=3D"https://t.messages=
.tallink.com/r/=3Fid=3Dh2838c5de,14c491c7,14c49246&e=3DY2tleT0yODM4YzVkZS01=
NjQ0MDk2My0xMTM3NzI3&s=3DaY8ew0oZMJwJ-p_5PCs0oNdkq7PGyJCzn112d-crCJM" ><img=
 src=3D"http://res.messages.tallink.com/res/tallink_mkt_prod6/0bb22d2ebfd73=
4a32221e550a68ab85236562e15f2bec8ddd2aa2864fc53cefc.jpg" style=3D"width: 10=
0%; height: auto;" height=3D"340" width=3D"750" title=3D"Sommarens rea" alt=
=3D"Sommarens rea" /></a><!--[if mso]></td></tr></table><![endif]--></div>
</th></tr>
</tbody>
</table>
</div>
<div class=3D"acr-structure" data-structure-id=3D"1-1-column" data-structur=
e-name=3D"richtext.structure_1_1_column">
<table class=3D"structure__table" align=3D"center" cellpadding=3D"0" cellsp=
acing=3D"0" border=3D"0" width=3D"750">
<tbody>
<tr><th class=3D"colspan1">
<div>
<table align=3D"center" border=3D"0" bgcolor=3D"#FFFFFF" cellpadding=3D"0" =
cellspacing=3D"0" data-component-id=3D"text" data-component-name=3D"richtex=
t.component_html" style=3D"width: 100%; table-layout: fixed;" data-contente=
ditable=3D"true">
<tbody>
<tr><th class=3D"colspan1" align=3D"center" style=3D"padding-left: 20px; pa=
dding-right: 20px;">
<div class=3D"acr-fragment acr-component" data-component-id=3D"html" data-c=
ontenteditable=3D"true">
<table cellpadding=3D"0" cellspacing=3D"0" align=3D"center" border=3D"0" wi=
dth=3D"100%">
<tbody>
<tr>
<td align=3D"center" height=3D"24"></td>
</tr>
<tr>
<td align=3D"center" class=3D"hide" height=3D"24"></td>
</tr>
<tr>
<td align=3D"left" class=3D"innertable colspan1" style=3D"font-family: Aria=
l, Helvetica, sans-serif; color: #004152; font-size: 24px; line-height: 26p=
x; text-align: left;" valign=3D"top">
<div class=3D"acr-fragment acr-component" data-component-name=3D"richtext.c=
omponent_text" data-component-id=3D"text" data-contenteditable=3D"false">
<div class=3D"text-container" data-contenteditable=3D"true"><strong>Du har =
f=C3=B6rtur p=C3=A5 v=C3=A5r sommarrea!</strong></div>
</div>
</td>
</tr>
<tr>
<td align=3D"left" height=3D"20" style=3D"border-collapse: collapse; mso-ta=
ble-lspace: 0pt; mso-table-rspace: 0pt; mso-line-height-rule: exactly; line=
-height: 20px;" valign=3D"top"><!--[if gte mso 15]>&#xA0;<![endif]--></td>
</tr>
<tr>
<td align=3D"left" class=3D"innertable colspan1" style=3D"font-family: Aria=
l, Helvetica, sans-serif; color: #004152; font-size: 16px; line-height: 22p=
x; text-align: left;" valign=3D"top">
<div class=3D"acr-fragment acr-component" data-component-id=3D"text" data-u=
pload=3D"uploadLoader-1653033058975-1640377" data-contenteditable=3D"false"=
>
<div class=3D"text-container" data-contenteditable=3D"true">Som medlem i Cl=
ub One f=C3=A5r du nu chansen att nyttja v=C3=A5r sommarrea f=C3=B6re alla =
andra och boka med <span style=3D"font-weight: bold;">upp till 40% rabatt</=
span>! Boka sk=C3=B6na sommarkryssningar till alla v=C3=A5ra resm=C3=A5l. V=
ill du stanna lite l=C3=A4ngre med hotellpaket s=C3=A5 f=C3=A5r du alltid f=
ina medlemserbjudanden. Packa med solglas=C3=B6gonen p=C3=A5 resan och vila=
 ute p=C3=A5 sold=C3=A4ck! <br /><br /><span style=3D"font-size: 14px;">Upp=
ge bokningskod </span><span style=3D"font-weight: bold; font-size: 16px; co=
lor: #00bea2;">SOMMARREA</span><span style=3D"font-size: 14px;">. Logga in =
f=C3=B6r att ta del av ditt erbjudande. G=C3=A4ller endast nya bokningar oc=
h begr=C3=A4nsat antal hytter och rum. Boka senast 31 maj och res senast 31=
 augusti=C2=A02022. Br=C3=A4nsletill=C3=A4gg till</span><span style=3D"font=
-size: 14px;">kommer p=C3=A5 alla v=C3=A5ra resor.</span><span style=3D"fon=
t-size: 14px;"><br /><br /></span>
<div>
<div></div>
<div><span style=3D"font-weight: bold;">Psst! </span>V=C3=A5ra anslutningsb=
ussar =C3=A4r tillbaka! L=C3=A4s mer <a class=3D"arc-link" data-nl-type=3D"=
externalLink" href=3D"https://t.messages.tallink.com/r/=3Fid=3Dh2838c5de,14=
c491c7,14c49247&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3&s=3DWEBXkfQaeO=
lCE2r2aQf7Zn3v9eSUoQUxjU5oqje8wnA" style=3D"color: #00bea2;" >h=C3=A4r</a>.=
=C2=A0<br /><br /><img src=3D"http://res.messages.tallink.com/res/tallink_m=
kt_prod6/b489418884c81d7dfc8d95a39feb84494482b389e7c4469e00dafbfeb99eab93.j=
pg" data-img-inline=3D"true" /><br /><span style=3D"font-weight: bold; font=
-size: 14px;">Boka nu, betala senare med Klarna. Nu kan du =C3=A4ven betala=
 direkt med Swish.<br /><br /></span></div>
</div>
</div>
</div>
<div class=3D"acr-fragment acr-component" style=3D"width: 100%; text-align:=
 left;" data-component-name=3D"richtext.component_button" data-component-id=
=3D"button" data-contenteditable=3D"false"><!--[if mso]><table cellpadding=
=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100%"><tr><td height=3D"16">=
&#xA0;</td></tr>
<tr><td style=3D"text-align: left;"><![endif]-->
<div style=3D"height: 16px;">=C2=A0</div>
<!--[if mso]><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0">
<tr><td width=3D"17" bgcolor=3D"#00ecc9">&#xA0;</td>
<td align=3D"center" height=3D"32" bgcolor=3D"#00ecc9"><![endif]-->
<div class=3D"button-container" style=3D"display: inline-block; text-align:=
 center; font-weight: bold; font-family: Arial, Helvetica, sans-serif; text=
-transform: uppercase; text-decoration: none; cursor: pointer; color: #0041=
52; background-color: #00ecc9; font-size: 16px; line-height: normal; paddin=
g-left: 17px; padding-right: 17px; padding-top: 11px; padding-bottom: 11px;=
"><a href=3D"https://t.messages.tallink.com/r/=3Fid=3Dh2838c5de,14c491c7,14=
c49248&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3&s=3DQQtN71bjMLWnzQ10wIG=
pALOkjMJ_MGS55gheb2Wjkdc" style=3D"display: inline-block; text-align: cente=
r; font-weight: bold; font-family: Arial, Helvetica, sans-serif; text-trans=
form: uppercase; text-decoration: none; cursor: pointer; color: #004152; ba=
ckground-color: #00ecc9; font-size: 16px; line-height: normal;" data-nl-typ=
e=3D"externalLink" data-contenteditable=3D"true" >Boka sommarens kryssning<=
/a></div>
<!--[if mso]></td><td width=3D"17" bgcolor=3D"#00ecc9">&#xA0;</td></tr></ta=
ble><![endif]--><!--[if mso]></td></tr></table><![endif]--></div>
</td>
</tr>
<tr>
<td align=3D"left" height=3D"48" style=3D"border-collapse: collapse; mso-ta=
ble-lspace: 0; mso-table-rspace: 0; mso-line-height-rule: exactly; line-hei=
ght: 24px;" valign=3D"top"><!--[if gte mso 15]>&#xA0;<![endif]--></td>
</tr>
</tbody>
</table>
</div>
</th></tr>
</tbody>
</table>
</div>
</th></tr>
</tbody>
</table>
</div>
<div class=3D"acr-structure" data-structure-id=3D"1-1-column" data-structur=
e-name=3D"richtext.structure_1_1_column">
<table class=3D"structure__table" align=3D"center" cellpadding=3D"0" cellsp=
acing=3D"0" border=3D"0" width=3D"750">
<tbody>
<tr><th class=3D"colspan1"><!--[if mso]><table align=3D"center" cellpadding=
=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100%"><tr><td style=3D"backg=
round:#ffffff;padding-top:14px;padding-bottom:14px;width:100%;table-layout:=
fixed;vertical-align: middle"><![endif]-->
<div class=3D"acr-fragment acr-component" data-structure-id=3D"1-1-column" =
data-structure-name=3D"richtext.structure_1_1_column" data-component-id=3D"=
null" data-contenteditable=3D"true">
<table align=3D"center" cellpadding=3D"0" cellspacing=3D"0" border=3D"0" he=
ight=3D"80" style=3D"background: #CDF8EB; padding-top: 14px; padding-bottom=
: 14px; width: 100%; table-layout: fixed; vertical-align: middle; align-con=
tent: center;">
<tbody>
<tr><th valign=3D"middle" align=3D"center" style=3D"font-family: Arial, Hel=
vetica, sans-serif; text-align: center; color: #004152; font-size: 28px;" d=
ata-contenteditable=3D"true"><span style=3D"font-weight: bold;">Uppt=C3=A4c=
k sommarens resor</span></th></tr>
</tbody>
</table>
</div>
<!--[if mso]></td></tr></table><![endif]--></th></tr>
</tbody>
</table>
</div>
<div class=3D"acr-structure" data-structure-id=3D"1-1-column" data-structur=
e-name=3D"richtext.structure_1_1_column">
<table class=3D"structure__table" align=3D"center" cellpadding=3D"0" cellsp=
acing=3D"0" border=3D"0" width=3D"750">
<tbody>
<tr><th class=3D"colspan1">
<!--[if gte mso 9]><style acrite-mso-css=3D"true">.image-container div {  d=
isplay: block;}.structure__table td {  padding: 0;  border: none;}.button-c=
ontainer {  border: none !important;  padding: 0 !important;  margin: 0 !im=
portant;  line-height: normal !important;}.acr-structure {  margin: 0 !impo=
rtant;}.acr-component {  margin: 0 !important;}.acr-fragment {  margin: 0 !=
important;}.colspan1, .colspan2, .colspan3, .colspan4, .colspan33, .colspan=
66 {  box-sizing: border-box !important;}</style><![endif]-->
    <div class=3D"acr-fragment is-locked" data-fragment-id=3D"@WI4N1IRtYIXz=
o9sOe0iRKMA0F1R8h9RqZLmiWMpWUwO7EFhXZItT6qsboiKqiEbQilYf3p9EnLNF4V-IxeKhAJh=
P689rZo64TiqwY6DGQwu0iPxy" data-fragment-ref=3D"CMDL988" data-nl-name=3D"FF=
_DR_full_midnight (CMDL988)" data-fragment-name=3D"FF_DR_full_midnight (CMD=
L988)">
      <table align=3D"center" border=3D"0" bgcolor=3D"#004251" cellpadding=
=3D"0" cellspacing=3D"0" data-component-id=3D"text" data-component-name=3D"=
richtext.component_html" data-contenteditable=3D"true" style=3D"width: 100%=
; table-layout: fixed;">
          <tbody>
            <tr>
              <td class=3D"colspan1" align=3D"center" bgcolor=3D"#004152" s=
tyle=3D"padding-left:0px;padding-right:0px;">
                <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" ali=
gn=3D"center" width=3D"100%">
                  <tbody>
                    <!-- DEVIDER LINE START -->
                    <tr>
                      <td align=3D"left" bgcolor=3D"#004152" height=3D"2" s=
tyle=3D"border-collapse:collapse;mso-table-lspace:0pt;mso-table-rspace:0pt;=
mso-line-height-rule:exactly;line-height:2px;" valign=3D"top">
                        <!--[if gte mso 15]>&#xA0;<![endif]-->
                      </td>
                    </tr>
                    <!-- DEVIDER LINE END -->
                  </tbody>
                </table>
              </td>
            </tr>
          </tbody>
        </table>
    </div>
  

</th></tr>
</tbody>
</table>
</div>
<div class=3D"acr-structure" data-structure-id=3D"1-1-column" data-structur=
e-name=3D"richtext.structure_1_1_column">
<table class=3D"structure__table" align=3D"center" cellpadding=3D"0" cellsp=
acing=3D"0" border=3D"0" width=3D"750">
<tbody>
<tr><th class=3D"colspan1">
<div>
<table align=3D"center" border=3D"0" bgcolor=3D"#cdf8eb" cellpadding=3D"0" =
cellspacing=3D"0" data-component-id=3D"html" data-component-name=3D"richtex=
t.component_html" style=3D"width: 100%; table-layout: fixed;" data-contente=
ditable=3D"true">
<tbody>
<tr><th colspan=3D"2" class=3D"colspan1" style=3D"width: 100%; vertical-ali=
gn: top;" width=3D"100%">
<div class=3D"acr-fragment acr-component" data-component-id=3D"html" data-c=
ontenteditable=3D"true">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0">
<tbody>
<tr>
<td style=3D"line-height: 0; height: 40px;" width=3D"100%" height=3D"40"></=
td>
</tr>
</tbody>
</table>
</div>
</th></tr>
<tr><th class=3D"colspan2" style=3D"width: 50%; vertical-align: top; paddin=
g-left: 20px; padding-right: 20px;">
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" cl=
ass=3D"innertable" width=3D"100%">
<tbody>
<tr>
<td class=3D"colspan1">
<div class=3D"acr-fragment acr-component image-container" style=3D"width: 1=
00%; text-align: center; max-width: 100%;" data-component-id=3D"image" data=
-upload=3D"uploadLoader-1653035861380-624022731" data-contenteditable=3D"fa=
lse"><!--[if mso]><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" w=
idth=3D"100%"><tr><td style=3D"text-align: center;"><![endif]--><a class=3D=
"arc-link" data-nl-type=3D"externalLink" href=3D"https://t.messages.tallink=
.com/r/=3Fid=3Dh2838c5de,14c491c7,14c49249&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2=
My0xMTM3NzI3&s=3DP0uWSg3pfFGsjEWvqBJljwr6RHDF_mE7SNLOcg5SXvI" ><img class=
=3D"content-img" src=3D"http://res.messages.tallink.com/res/tallink_mkt_pro=
d6/3189a0390b9faa6dd166fef0e84e2f275ba006cea30bd2e528f281507a18a19b.jpg" wi=
dth=3D"325" style=3D"display: block; width: 100%; max-width: 100%; min-widt=
h: 100%; height: auto;" alt=3D"Kryssningar" title=3D"Kryssningar" /></a><!-=
-[if mso]></td></tr></table><![endif]--></div>
</td>
</tr>
<tr>
<td align=3D"left" height=3D"15" style=3D"border-collapse: collapse; mso-ta=
ble-lspace: 0pt; mso-table-rspace: 0pt; mso-line-height-rule: exactly; line=
-height: 15px;" valign=3D"top"><!--[if gte mso 15]>&#xA0;<![endif]--></td>
</tr>
<tr>
<td class=3D"colspan1" align=3D"left" style=3D"font-family: Arial, Helvetic=
a, sans-serif; color: #004152; font-size: 16px; line-height: 18px; text-ali=
gn: left; font-weight: bold;" valign=3D"top">
<div class=3D"acr-fragment acr-component" data-component-id=3D"text" data-c=
ontenteditable=3D"false">
<div class=3D"text-container" data-contenteditable=3D"true">Kryssningar i s=
ommar</div>
</div>
</td>
</tr>
<tr>
<td align=3D"left" height=3D"10" style=3D"border-collapse: collapse; mso-ta=
ble-lspace: 0pt; mso-table-rspace: 0pt; mso-line-height-rule: exactly; line=
-height: 10px;" valign=3D"top"><!--[if gte mso 15]>&#xA0;<![endif]--></td>
</tr>
<tr>
<td class=3D"colspan1" align=3D"left" style=3D"font-family: Arial, Helvetic=
a, sans-serif; color: #004152; font-size: 14px; line-height: 18px; text-ali=
gn: left;" valign=3D"top">
<div class=3D"acr-fragment acr-component" data-component-id=3D"text" data-c=
ontenteditable=3D"false">
<div class=3D"text-container" data-contenteditable=3D"true">Boka en sommark=
ryssning till n=C3=A5gon av v=C3=A5ra destinationer eller kliv ombord Galax=
y f=C3=B6r en minisemester p=C3=A5 23h. Just nu f=C3=A5r du <span style=3D"=
font-weight: bold;">upp till 40% rabatt</span> p=C3=A5 sommarens kryssninga=
r n=C3=A4r du loggar in och uppger bokningskod <span style=3D"font-weight: =
bold; color: #00bea2;">SOMMARREA</span>.=C2=A0S=C3=A5 ta med familjen och v=
=C3=A4nnerna p=C3=A5 en fullsp=C3=A4ckad resa med massor av aktiviteter omb=
ord och platser att utforska i land!</div>
</div>
</td>
</tr>
<tr>
<td class=3D"colspan1">
<div class=3D"acr-fragment acr-component" style=3D"width: 100%; text-align:=
 left;" data-component-name=3D"richtext.component_button" data-component-id=
=3D"button" data-contenteditable=3D"false"><!--[if mso]><table cellpadding=
=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100%"><tr><td height=3D"16">=
&#xA0;</td></tr>
<tr><td style=3D"text-align: left;"><![endif]-->
<div style=3D"height: 16px;">=C2=A0</div>
<!--[if mso]><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0">
<tr><td width=3D"17" bgcolor=3D"#00ecc9">&#xA0;</td>
<td align=3D"center" height=3D"32" bgcolor=3D"#00ecc9"><![endif]-->
<div class=3D"button-container" style=3D"display: inline-block; text-align:=
 center; font-weight: bold; font-family: Arial, Helvetica, sans-serif; text=
-transform: uppercase; text-decoration: none; cursor: pointer; color: #0041=
52; background-color: #00ecc9; font-size: 14px; line-height: normal; paddin=
g-left: 17px; padding-right: 17px; padding-top: 6px; padding-bottom: 6px;">=
<a href=3D"https://t.messages.tallink.com/r/=3Fid=3Dh2838c5de,14c491c7,14c4=
924a&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3&s=3Dxml1Xj1Ly-jvTEcc-0klY=
kdZPITAhNGibHnAy8_YL0U" style=3D"display: inline-block; text-align: center;=
 font-weight: bold; font-family: Arial, Helvetica, sans-serif; text-transfo=
rm: uppercase; text-decoration: none; cursor: pointer; color: #004152; back=
ground-color: #00ecc9; font-size: 14px; line-height: normal;" data-nl-type=
=3D"externalLink" data-contenteditable=3D"true" >boka kryssning</a></div>
<!--[if mso]></td><td width=3D"17" bgcolor=3D"#00ecc9">&#xA0;</td></tr></ta=
ble><![endif]--><!--[if mso]></td></tr></table><![endif]--></div>
</td>
</tr>
</tbody>
</table>
<div class=3D"acr-fragment acr-component" data-component-id=3D"html" data-c=
ontenteditable=3D"true">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100%">
<tbody>
<tr>
<td style=3D"line-height: 0; height: 40px;" width=3D"100%" height=3D"40"></=
td>
</tr>
</tbody>
</table>
</div>
</th><th class=3D"colspan2" style=3D"width: 50%; vertical-align: top; paddi=
ng-left: 20px; padding-right: 20px;">
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" cl=
ass=3D"innertable" width=3D"100%">
<tbody>
<tr>
<td class=3D"colspan1">
<div class=3D"acr-fragment acr-component image-container" style=3D"width: 1=
00%; text-align: center; max-width: 100%;" data-component-id=3D"image" data=
-upload=3D"uploadLoader-1653037324108-20802887" data-contenteditable=3D"fal=
se"><!--[if mso]><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" wi=
dth=3D"100%"><tr><td style=3D"text-align: center;"><![endif]--><a class=3D"=
arc-link" data-nl-type=3D"externalLink" href=3D"https://t.messages.tallink.=
com/r/=3Fid=3Dh2838c5de,14c491c7,14c4924b&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2M=
y0xMTM3NzI3&s=3DkBHDl4nMjFrJG1aROJmLU0M3xzHzdryoCIldgv7sk-s" ><img class=3D=
"content-img" src=3D"http://res.messages.tallink.com/res/tallink_mkt_prod6/=
2b7fb2f547ffbea727f9048380b188ef382192f23e2eaa42d55f78f8d6b28753.jpg" width=
=3D"325" style=3D"display: block; width: 100%; max-width: 100%; min-width: =
100%; height: auto;" alt=3D"Tallinn" title=3D"Tallinn" /></a><!--[if mso]><=
/td></tr></table><![endif]--></div>
</td>
</tr>
<tr>
<td align=3D"left" height=3D"15" style=3D"border-collapse: collapse; mso-ta=
ble-lspace: 0pt; mso-table-rspace: 0pt; mso-line-height-rule: exactly; line=
-height: 15px;" valign=3D"top"><!--[if gte mso 15]>&#xA0;<![endif]--></td>
</tr>
<tr>
<td class=3D"colspan1" align=3D"left" style=3D"font-family: Arial, Helvetic=
a, sans-serif; color: #004152; font-size: 16px; line-height: 18px; text-ali=
gn: left; font-weight: bold;" valign=3D"top">
<div class=3D"acr-fragment acr-component" data-component-id=3D"text" data-c=
ontenteditable=3D"false">
<div class=3D"text-container" data-contenteditable=3D"true">Res regulj=C3=
=A4rt till v=C3=A5ra destinationer</div>
</div>
</td>
</tr>
<tr>
<td align=3D"left" height=3D"10" style=3D"border-collapse: collapse; mso-ta=
ble-lspace: 0pt; mso-table-rspace: 0pt; mso-line-height-rule: exactly; line=
-height: 10px;" valign=3D"top"><!--[if gte mso 15]>&#xA0;<![endif]--></td>
</tr>
<tr>
<td class=3D"colspan1" align=3D"left" style=3D"font-family: Arial, Helvetic=
a, sans-serif; color: #004152; font-size: 14px; line-height: 18px; text-ali=
gn: left;" valign=3D"top">
<div class=3D"acr-fragment acr-component" data-component-id=3D"text" data-c=
ontenteditable=3D"false">
<div class=3D"text-container" data-contenteditable=3D"true">Packa f=C3=B6r =
en l=C3=A4ngre vistelse i Tallinn, Helsingfors, =C3=85bo eller Mariehamn! G=
l=C3=B6m inte att boka bilplats f=C3=B6r mer tid och frihet att uppt=C3=A4c=
ka. H=C3=A4lsa p=C3=A5 v=C3=A4nner och familj och stanna s=C3=A5 l=C3=A4nge=
 ni vill. Boka idag och f=C3=A5 <span style=3D"font-weight: bold;">upp till=
 40% rabatt</span> p=C3=A5 din n=C3=A4sta resa, logga in p=C3=A5 ditt Club =
One-konto och uppge bokningskoden <span style=3D"font-weight: bold; color: =
#00bea2;">SOMMARREA</span>.</div>
</div>
</td>
</tr>
<tr>
<td class=3D"colspan1">
<div class=3D"acr-fragment acr-component" style=3D"width: 100%; text-align:=
 left;" data-component-name=3D"richtext.component_button" data-component-id=
=3D"button" data-contenteditable=3D"false"><!--[if mso]><table cellpadding=
=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100%"><tr><td height=3D"16">=
&#xA0;</td></tr>
<tr><td style=3D"text-align: left;"><![endif]-->
<div style=3D"height: 16px;">=C2=A0</div>
<!--[if mso]><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0">
<tr><td width=3D"17" bgcolor=3D"#00ecc9">&#xA0;</td>
<td align=3D"center" height=3D"32" bgcolor=3D"#00ecc9"><![endif]-->
<div class=3D"button-container" style=3D"display: inline-block; text-align:=
 center; font-weight: bold; font-family: Arial, Helvetica, sans-serif; text=
-transform: uppercase; text-decoration: none; cursor: pointer; color: #0041=
52; background-color: #00ecc9; font-size: 14px; line-height: normal; paddin=
g-left: 17px; padding-right: 17px; padding-top: 6px; padding-bottom: 6px;">=
<a href=3D"https://t.messages.tallink.com/r/=3Fid=3Dh2838c5de,14c491c7,14c4=
924c&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3&s=3Dkpy2c0h68bvglzx_z4Dg6=
LxzNqmyZuVPDlSMdmP1_RI" style=3D"display: inline-block; text-align: center;=
 font-weight: bold; font-family: Arial, Helvetica, sans-serif; text-transfo=
rm: uppercase; text-decoration: none; cursor: pointer; color: #004152; back=
ground-color: #00ecc9; font-size: 14px; line-height: normal;" data-nl-type=
=3D"externalLink" data-contenteditable=3D"true" >boka resa</a></div>
<!--[if mso]></td><td width=3D"17" bgcolor=3D"#00ecc9">&#xA0;</td></tr></ta=
ble><![endif]--><!--[if mso]></td></tr></table><![endif]--></div>
</td>
</tr>
</tbody>
</table>
<div class=3D"acr-fragment acr-component" data-component-id=3D"html" data-c=
ontenteditable=3D"true">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100%">
<tbody>
<tr>
<td style=3D"line-height: 0; height: 40px;" width=3D"100%" height=3D"40"></=
td>
</tr>
</tbody>
</table>
</div>
</th></tr>
</tbody>
</table>
</div>
</th></tr>
</tbody>
</table>
</div>
<div class=3D"acr-structure" data-structure-id=3D"1-1-column" data-structur=
e-name=3D"richtext.structure_1_1_column">
<table class=3D"structure__table" align=3D"center" cellpadding=3D"0" cellsp=
acing=3D"0" border=3D"0" width=3D"750">
<tbody>
<tr><th class=3D"colspan1">
<div>
<table align=3D"center" border=3D"0" bgcolor=3D"#f5f8f7" cellpadding=3D"0" =
cellspacing=3D"0" data-component-id=3D"html" data-component-name=3D"richtex=
t.component_html" style=3D"width: 100%; table-layout: fixed;" data-contente=
ditable=3D"true">
<tbody>
<tr><th colspan=3D"2" class=3D"colspan1" style=3D"width: 100%; vertical-ali=
gn: top;" width=3D"100%">
<div class=3D"acr-fragment acr-component" data-component-id=3D"html" data-c=
ontenteditable=3D"true">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0">
<tbody>
<tr>
<td style=3D"line-height: 0; height: 40px;" width=3D"100%" height=3D"40"></=
td>
</tr>
</tbody>
</table>
</div>
</th></tr>
<tr><th class=3D"colspan2" style=3D"width: 50%; vertical-align: top; paddin=
g-left: 20px; padding-right: 20px;">
<div class=3D"acr-fragment acr-component image-container" style=3D"width: 1=
00%; text-align: center; max-width: 100%;" data-component-id=3D"image" data=
-upload=3D"uploadLoader-1653035806806-33237360" data-contenteditable=3D"fal=
se"><!--[if mso]><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" wi=
dth=3D"100%"><tr><td style=3D"text-align: center;"><![endif]--><a class=3D"=
arc-link" data-nl-type=3D"externalLink" href=3D"https://t.messages.tallink.=
com/r/=3Fid=3Dh2838c5de,14c491c7,14c4924d&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2M=
y0xMTM3NzI3&s=3DpEPyEYhs-cYV9lBASk3alUQCgcW1VGd0GU4xBMzdujI" ><img class=3D=
"content-img" src=3D"http://res.messages.tallink.com/res/tallink_mkt_prod6/=
b43bf0e1ad5e696873fba0e24cdb11acd888bb1d5a2000695ee056851c996983.jpg" width=
=3D"325" style=3D"display: block; width: 100%; max-width: 100%; min-width: =
100%; height: auto;" alt=3D"Dagskryssning" title=3D"Dagskryssning" /></a><!=
--[if mso]></td></tr></table><![endif]--></div>
<div class=3D"acr-fragment acr-component" data-component-id=3D"html" data-c=
ontenteditable=3D"true">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100%">
<tbody>
<tr>
<td style=3D"line-height: 0; height: 40px;" width=3D"100%" height=3D"40"></=
td>
</tr>
</tbody>
</table>
</div>
</th><th class=3D"colspan2" style=3D"width: 50%; vertical-align: top; paddi=
ng-left: 20px; padding-right: 20px;">
<div class=3D"acr-fragment acr-component" data-component-id=3D"html" data-c=
ontenteditable=3D"true"></div>
<table align=3D"right" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" cla=
ss=3D"innertable" width=3D"100%">
<tbody>
<tr>
<td class=3D"colspan1" align=3D"left" style=3D"font-family: Arial, Helvetic=
a, sans-serif; color: #004152; font-size: 16px; line-height: 18px; text-ali=
gn: left; font-weight: bold; text-decoration: none;" valign=3D"top">
<div class=3D"acr-fragment acr-component" data-component-id=3D"text" data-c=
ontenteditable=3D"false">
<div class=3D"text-container" data-contenteditable=3D"true">Vi bjuder p=C3=
=A5 dagskryssningen!</div>
</div>
</td>
</tr>
<tr>
<td align=3D"left" height=3D"10" style=3D"border-collapse: collapse; mso-ta=
ble-lspace: 0pt; mso-table-rspace: 0pt; mso-line-height-rule: exactly; line=
-height: 10px;" valign=3D"top"><!--[if gte mso 15]>&#xA0;<![endif]--></td>
</tr>
<tr>
<td class=3D"colspan1" align=3D"left" style=3D"font-family: Arial, Helvetic=
a, sans-serif; color: #004152; font-size: 14px; line-height: 18px; text-ali=
gn: left;" valign=3D"top">
<div class=3D"acr-fragment acr-component" data-component-id=3D"text" data-c=
ontenteditable=3D"false">
<div class=3D"text-container" data-contenteditable=3D"true">Sk=C3=A4rg=C3=
=A5rdskryssa =C3=B6ver dagen! F=C3=B6rboka en m=C3=A5ltid s=C3=A5 bjuder vi=
 p=C3=A5 resan. 11 timmar med sol p=C3=A5 sold=C3=A4ck, shopping och god ma=
t. En perfekt dagsutflykt helt enkelt!=C2=A0<br /><br />Logga in p=C3=A5 di=
tt Club One-konto och uppge bokningskod <span style=3D"font-weight: bold; c=
olor: #00bea2;">SOMMARREA</span> f=C3=B6r att ta del av erbjudandet. Br=C3=
=A4nsletill=C3=A4gg tillkommer.</div>
</div>
</td>
</tr>
<tr>
<td>
<table align=3D"left" border=3D"0" cellpadding=3D"0" cellspacing=3D"0">
<tbody>
<tr>
<td class=3D"colspan1">
<div class=3D"acr-fragment acr-component" style=3D"width: 100%; text-align:=
 left;" data-component-name=3D"richtext.component_button" data-component-id=
=3D"button" data-contenteditable=3D"false"><!--[if mso]><table cellpadding=
=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100%"><tr><td height=3D"16">=
&#xA0;</td></tr>
<tr><td style=3D"text-align: left;"><![endif]-->
<div style=3D"height: 16px;">=C2=A0</div>
<!--[if mso]><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0">
<tr><td width=3D"17" bgcolor=3D"#00ecc9">&#xA0;</td>
<td align=3D"center" height=3D"32" bgcolor=3D"#00ecc9"><![endif]-->
<div class=3D"button-container" style=3D"display: inline-block; text-align:=
 center; font-weight: bold; font-family: Arial, Helvetica, sans-serif; text=
-transform: uppercase; text-decoration: none; cursor: pointer; color: #0041=
52; background-color: #00ecc9; font-size: 14px; line-height: normal; paddin=
g-left: 17px; padding-right: 17px; padding-top: 6px; padding-bottom: 6px;">=
<a href=3D"https://t.messages.tallink.com/r/=3Fid=3Dh2838c5de,14c491c7,14c4=
924e&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3&s=3DzAQJ6xfmHICyaFzpzEnC7=
KxIOOAQfbqMlTXnIZcVINI" style=3D"display: inline-block; text-align: center;=
 font-weight: bold; font-family: Arial, Helvetica, sans-serif; text-transfo=
rm: uppercase; text-decoration: none; cursor: pointer; color: #004152; back=
ground-color: #00ecc9; font-size: 14px; line-height: normal;" data-nl-type=
=3D"externalLink" data-contenteditable=3D"true" >L=C3=A4s mer om dagskryssn=
ing</a></div>
<!--[if mso]></td><td width=3D"17" bgcolor=3D"#00ecc9">&#xA0;</td></tr></ta=
ble><![endif]--><!--[if mso]></td></tr></table><![endif]--></div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr></tr>
</tbody>
</table>
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100%">
<tbody>
<tr>
<td style=3D"line-height: 0; height: 40px;" width=3D"100%" height=3D"40"></=
td>
</tr>
</tbody>
</table>
</th></tr>
</tbody>
</table>
</div>
</th></tr>
</tbody>
</table>
</div>
<div class=3D"acr-structure" data-structure-id=3D"1-1-column" data-structur=
e-name=3D"richtext.structure_1_1_column">
<table class=3D"structure__table" align=3D"center" cellpadding=3D"0" cellsp=
acing=3D"0" border=3D"0" width=3D"750">
<tbody>
<tr><th class=3D"colspan1">
<!--[if gte mso 9]><style acrite-mso-css=3D"true">.image-container div {  d=
isplay: block;}.structure__table td {  padding: 0;  border: none;}.button-c=
ontainer {  border: none !important;  padding: 0 !important;  margin: 0 !im=
portant;  line-height: normal !important;}.acr-structure {  margin: 0 !impo=
rtant;}.acr-component {  margin: 0 !important;}.acr-fragment {  margin: 0 !=
important;}.colspan1, .colspan2, .colspan3, .colspan4, .colspan33, .colspan=
66 {  box-sizing: border-box !important;}</style><![endif]--><div class=3D"=
acr-fragment is-locked" data-fragment-id=3D"@WI4N1IRtYIXzo9sOe0iRKLwa5gDgEl=
M-ykPlzeGGwDoeUeI1kze80SMmIMO0ARim9sb_9-Hdcki06MoF-zeZbGDIrh4" data-fragmen=
t-ref=3D"CMDL982" data-nl-name=3D"FF_DR_full_gray (CMDL982)" data-fragment-=
name=3D"FF_DR_full_gray (CMDL982)"><table align=3D"center" border=3D"0" bgc=
olor=3D"#eef1f1" cellpadding=3D"0" cellspacing=3D"0" data-component-id=3D"t=
ext" data-component-name=3D"richtext.component_html" data-contenteditable=
=3D"true" style=3D"width: 100%; table-layout: fixed;"><tbody><tr><td class=
=3D"colspan1" align=3D"center" bgcolor=3D"#eef1f1" style=3D"padding-left:0p=
x;padding-right:0px;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"=
0" align=3D"center" width=3D"100%"><tbody><!-- DEVIDER LINE START --><tr><t=
d align=3D"left" bgcolor=3D"#eef1f1" height=3D"2" style=3D"border-collapse:=
collapse;mso-table-lspace:0pt;mso-table-rspace:0pt;mso-line-height-rule:exa=
ctly;line-height:2px;" valign=3D"top"><!--[if gte mso 15]>&#xA0;<![endif]--=
></td></tr><!-- DEVIDER LINE END --></tbody></table></td></tr></tbody></tab=
le></div>
</th></tr>
</tbody>
</table>
</div>
<div class=3D"acr-structure" data-structure-id=3D"1-1-column" data-structur=
e-name=3D"richtext.structure_1_1_column">
<table class=3D"structure__table" align=3D"center" cellpadding=3D"0" cellsp=
acing=3D"0" border=3D"0" width=3D"750">
<tbody>
<tr><th class=3D"colspan1">
<div>
<table align=3D"center" border=3D"0" bgcolor=3D"#f5f8f7" cellpadding=3D"0" =
cellspacing=3D"0" data-component-id=3D"html" data-component-name=3D"richtex=
t.component_html" style=3D"width: 100%; table-layout: fixed;" data-contente=
ditable=3D"true">
<tbody>
<tr><th colspan=3D"2" class=3D"colspan1" style=3D"width: 100%; vertical-ali=
gn: top;" width=3D"100%">
<div class=3D"acr-fragment acr-component" data-component-id=3D"html" data-c=
ontenteditable=3D"true">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0">
<tbody>
<tr>
<td style=3D"line-height: 0; height: 40px;" width=3D"100%" height=3D"40"></=
td>
</tr>
</tbody>
</table>
</div>
</th></tr>
<tr><th class=3D"colspan2" style=3D"width: 50%; vertical-align: top; paddin=
g-left: 20px; padding-right: 20px;">
<div class=3D"acr-fragment acr-component" data-component-id=3D"html" data-c=
ontenteditable=3D"true"></div>
<table align=3D"right" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" cla=
ss=3D"innertable" width=3D"100%">
<tbody>
<tr>
<td class=3D"colspan1" align=3D"left" style=3D"font-family: Arial, Helvetic=
a, sans-serif; color: #004152; font-size: 16px; line-height: 18px; text-ali=
gn: left; font-weight: bold; text-decoration: none;" valign=3D"top">
<div class=3D"acr-fragment acr-component" data-component-id=3D"text" data-c=
ontenteditable=3D"false">
<div class=3D"text-container" data-contenteditable=3D"true">Stanna l=C3=A4n=
gre p=C3=A5 Tallink Hotels</div>
</div>
</td>
</tr>
<tr>
<td align=3D"left" height=3D"10" style=3D"border-collapse: collapse; mso-ta=
ble-lspace: 0pt; mso-table-rspace: 0pt; mso-line-height-rule: exactly; line=
-height: 10px;" valign=3D"top"><!--[if gte mso 15]>&#xA0;<![endif]--></td>
</tr>
<tr>
<td class=3D"colspan1" align=3D"left" style=3D"font-family: Arial, Helvetic=
a, sans-serif; color: #004152; font-size: 14px; line-height: 18px; text-ali=
gn: left;" valign=3D"top">
<div class=3D"acr-fragment acr-component" data-component-id=3D"text" data-c=
ontenteditable=3D"false">
<div class=3D"text-container" data-contenteditable=3D"true">F=C3=B6rl=C3=A4=
ng din vistelse och checka in p=C3=A5 hotell i Tallinn. Sk=C3=A4m bort dig =
med pool och spa p=C3=A5 <a class=3D"arc-link" data-nl-type=3D"externalLink=
" href=3D"https://t.messages.tallink.com/r/=3Fid=3Dh2838c5de,14c491c7,14c49=
24f&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3&s=3DLIzI34OGP7Z6VRuwxf6YQX=
_Cpm_JvxOxROy9gkAnHwo" style=3D"color: #00bea2;" >Tallink Spa &amp; Confere=
nce Hotel</a>, bo centralt p=C3=A5 <a class=3D"arc-link" data-nl-type=3D"ex=
ternalLink" href=3D"https://t.messages.tallink.com/r/=3Fid=3Dh2838c5de,14c4=
91c7,14c49250&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3&s=3DxvjniisPwxKG=
4MI9NVbVkqsLgf9vLh34lTOOEEvMwts" style=3D"color: #00bea2;" >Tallink City Ho=
tel</a> eller bo billigare p=C3=A5 <a class=3D"arc-link" data-nl-type=3D"ex=
ternalLink" href=3D"https://t.messages.tallink.com/r/=3Fid=3Dh2838c5de,14c4=
91c7,14c49251&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3&s=3D2raqEQwxkXMu=
7T2bwGFTeY8Kh0SionRyfu2EGn8TOzw" style=3D"color: #00bea2;" >Tallink Express=
 Hotel</a> n=C3=A4ra hamnen och Gamla stan.<br /><br />Bo 2 n=C3=A4tter p=
=C3=A5 hotell till specialpris! G=C3=A4ller utvalda avg=C3=A5ngar och begr=
=C3=A4nsat antal platser. Res senast 31 juli 2022.<br /><br />
<div>Prisex <span style=3D"font-weight: bold; font-size: 16px; color: #00be=
a2;">1590:=E2=80=93</span> /person (ord. pris 2105:=E2=80=93)</div>
</div>
</div>
</td>
</tr>
<tr>
<td>
<table align=3D"left" border=3D"0" cellpadding=3D"0" cellspacing=3D"0">
<tbody>
<tr>
<td class=3D"colspan1">
<div class=3D"acr-fragment acr-component" style=3D"width: 100%; text-align:=
 left;" data-component-name=3D"richtext.component_button" data-component-id=
=3D"button" data-contenteditable=3D"false"><!--[if mso]><table cellpadding=
=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100%"><tr><td height=3D"16">=
&#xA0;</td></tr>
<tr><td style=3D"text-align: left;"><![endif]-->
<div style=3D"height: 16px;">=C2=A0</div>
<!--[if mso]><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0">
<tr><td width=3D"17" bgcolor=3D"#00ecc9">&#xA0;</td>
<td align=3D"center" height=3D"32" bgcolor=3D"#00ecc9"><![endif]-->
<div class=3D"button-container" style=3D"display: inline-block; text-align:=
 center; font-weight: bold; font-family: Arial, Helvetica, sans-serif; text=
-transform: uppercase; text-decoration: none; cursor: pointer; color: #0041=
52; background-color: #00ecc9; font-size: 14px; line-height: normal; paddin=
g-left: 17px; padding-right: 17px; padding-top: 6px; padding-bottom: 6px;">=
<a href=3D"https://t.messages.tallink.com/r/=3Fid=3Dh2838c5de,14c491c7,14c4=
9252&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3&s=3DaaZAYfeq1z6WAoh7zgUTw=
ZtrnBU6J1pZ_Am17yFFhU0" style=3D"display: inline-block; text-align: center;=
 font-weight: bold; font-family: Arial, Helvetica, sans-serif; text-transfo=
rm: uppercase; text-decoration: none; cursor: pointer; color: #004152; back=
ground-color: #00ecc9; font-size: 14px; line-height: normal;" data-nl-type=
=3D"externalLink" data-contenteditable=3D"true" >boka nu</a></div>
<!--[if mso]></td><td width=3D"17" bgcolor=3D"#00ecc9">&#xA0;</td></tr></ta=
ble><![endif]--><!--[if mso]></td></tr></table><![endif]--></div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr></tr>
</tbody>
</table>
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100%">
<tbody>
<tr>
<td style=3D"line-height: 0; height: 40px;" width=3D"100%" height=3D"40"></=
td>
</tr>
</tbody>
</table>
</th><th class=3D"colspan2" style=3D"width: 50%; vertical-align: top; paddi=
ng-left: 20px; padding-right: 20px;">
<div class=3D"acr-fragment acr-component image-container" style=3D"width: 1=
00%; text-align: center; max-width: 100%;" data-component-id=3D"image" data=
-upload=3D"uploadLoader-1653033379438-550293491" data-contenteditable=3D"fa=
lse"><!--[if mso]><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" w=
idth=3D"100%"><tr><td style=3D"text-align: center;"><![endif]--><a class=3D=
"arc-link" data-nl-type=3D"externalLink" href=3D"https://t.messages.tallink=
.com/r/=3Fid=3Dh2838c5de,14c491c7,14c49253&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2=
My0xMTM3NzI3&s=3DTJzFxMXMO-A3WkSbB1iANOvqfXZbl_s5eT8oLfo94X8" ><img class=
=3D"content-img" src=3D"http://res.messages.tallink.com/res/tallink_mkt_pro=
d6/0ab8fc15d1e377f3c07e3754928b5d2ec8343a6c44c1c2a397010fdcb88ebe2b.jpg" wi=
dth=3D"335" style=3D"display: block; width: 100%; max-width: 100%; min-widt=
h: 100%; height: auto;" alt=3D"Tallink City Hotel" title=3D"Tallink City Ho=
tel" height=3D"223" /></a><!--[if mso]></td></tr></table><![endif]--></div>
<div class=3D"acr-fragment acr-component" data-component-id=3D"html" data-c=
ontenteditable=3D"true">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100%">
<tbody>
<tr>
<td style=3D"line-height: 0; height: 40px;" width=3D"100%" height=3D"40"></=
td>
</tr>
</tbody>
</table>
</div>
</th></tr>
</tbody>
</table>
</div>
</th></tr>
</tbody>
</table>
</div>
<div class=3D"acr-structure" data-structure-id=3D"1-1-column" data-structur=
e-name=3D"richtext.structure_1_1_column">
<table class=3D"structure__table" align=3D"center" cellpadding=3D"0" cellsp=
acing=3D"0" border=3D"0" width=3D"750">
<tbody>
<tr><th class=3D"colspan1">
<div>
<table align=3D"center" border=3D"0" bgcolor=3D"#cdf8eb" cellpadding=3D"0" =
cellspacing=3D"0" data-component-id=3D"html" data-component-name=3D"richtex=
t.component_html" style=3D"width: 100%; table-layout: fixed;" data-contente=
ditable=3D"true">
<tbody>
<tr><th colspan=3D"2" class=3D"colspan1" style=3D"width: 100%; vertical-ali=
gn: top;" width=3D"100%">
<div class=3D"acr-fragment acr-component" data-component-id=3D"html" data-c=
ontenteditable=3D"true">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0">
<tbody>
<tr>
<td style=3D"line-height: 0; height: 40px;" width=3D"100%" height=3D"40"></=
td>
</tr>
</tbody>
</table>
</div>
</th></tr>
<tr><th class=3D"colspan2" style=3D"width: 50%; vertical-align: top; paddin=
g-left: 20px; padding-right: 20px;">
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" cl=
ass=3D"innertable" width=3D"100%">
<tbody>
<tr>
<td class=3D"colspan1">
<div class=3D"acr-fragment acr-component image-container" style=3D"width: 1=
00%; text-align: center; max-width: 100%;" data-component-id=3D"image" data=
-upload=3D"uploadLoader-1653035951681-798436329" data-contenteditable=3D"fa=
lse"><!--[if mso]><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" w=
idth=3D"100%"><tr><td style=3D"text-align: center;"><![endif]--><a class=3D=
"arc-link" data-nl-type=3D"externalLink" href=3D"https://t.messages.tallink=
.com/r/=3Fid=3Dh2838c5de,14c491c7,14c49254&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2=
My0xMTM3NzI3&s=3DEiZW7gN3nn8jbBRZnnNQq9EjxHK7cZc74xGj--fRn1M" style=3D"text=
-decoration: underline;" ><img class=3D"content-img" src=3D"http://res.mess=
ages.tallink.com/res/tallink_mkt_prod6/398718bcdcff15a31321c87e816b4c6e43e7=
f59f024c9791527066562fc6697d.jpg" width=3D"325" style=3D"display: block; wi=
dth: 100%; max-width: 100%; min-width: 100%; height: auto;" title=3D"Shoppi=
ng ombord" alt=3D"Shopping ombord" /></a><!--[if mso]></td></tr></table><![=
endif]--></div>
</td>
</tr>
<tr>
<td align=3D"left" height=3D"15" style=3D"border-collapse: collapse; mso-ta=
ble-lspace: 0pt; mso-table-rspace: 0pt; mso-line-height-rule: exactly; line=
-height: 15px;" valign=3D"top"><!--[if gte mso 15]>&#xA0;<![endif]--></td>
</tr>
<tr>
<td class=3D"colspan1" align=3D"left" style=3D"font-family: Arial, Helvetic=
a, sans-serif; color: #004152; font-size: 16px; line-height: 18px; text-ali=
gn: left; font-weight: bold;" valign=3D"top">
<div class=3D"acr-fragment acr-component" data-component-id=3D"text" data-c=
ontenteditable=3D"false">
<div class=3D"text-container" data-contenteditable=3D"true">Sommarens shopp=
ing ombord</div>
</div>
</td>
</tr>
<tr>
<td align=3D"left" height=3D"10" style=3D"border-collapse: collapse; mso-ta=
ble-lspace: 0pt; mso-table-rspace: 0pt; mso-line-height-rule: exactly; line=
-height: 10px;" valign=3D"top"><!--[if gte mso 15]>&#xA0;<![endif]--></td>
</tr>
<tr>
<td class=3D"colspan1" align=3D"left" style=3D"font-family: Arial, Helvetic=
a, sans-serif; color: #004152; font-size: 14px; line-height: 18px; text-ali=
gn: left;" valign=3D"top">
<div class=3D"acr-fragment acr-component" data-component-id=3D"text" data-c=
ontenteditable=3D"false">
<div class=3D"text-container" data-contenteditable=3D"true">Fynda sommarens=
 nyheter i v=C3=A5ra butiker ombord. Uppdatera din sommargarderob med nya s=
olglas=C3=B6gon eller sk=C3=B6na sandaler. I taxfreebutiken hittar du solkr=
=C3=A4m, fr=C3=A4scha parfymer och snacks till sommarens picknickar!</div>
</div>
</td>
</tr>
<tr>
<td class=3D"colspan1">
<div class=3D"acr-fragment acr-component" style=3D"width: 100%; text-align:=
 left;" data-component-name=3D"richtext.component_button" data-component-id=
=3D"button" data-contenteditable=3D"false"><!--[if mso]><table cellpadding=
=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100%"><tr><td height=3D"16">=
&#xA0;</td></tr>
<tr><td style=3D"text-align: left;"><![endif]-->
<div style=3D"height: 16px;">=C2=A0</div>
<!--[if mso]><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0">
<tr><td width=3D"17" bgcolor=3D"#00ecc9">&#xA0;</td>
<td align=3D"center" height=3D"32" bgcolor=3D"#00ecc9"><![endif]-->
<div class=3D"button-container" style=3D"display: inline-block; text-align:=
 center; font-weight: bold; font-family: Arial, Helvetica, sans-serif; text=
-transform: uppercase; text-decoration: none; cursor: pointer; color: #0041=
52; background-color: #00ecc9; font-size: 14px; line-height: normal; paddin=
g-left: 17px; padding-right: 17px; padding-top: 6px; padding-bottom: 6px;">=
<a href=3D"https://t.messages.tallink.com/r/=3Fid=3Dh2838c5de,14c491c7,14c4=
9255&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3&s=3D9vkNLRTjnvimQiSI_jlxo=
0MigxiBjYsKRo80x--l1hI" style=3D"display: inline-block; text-align: center;=
 font-weight: bold; font-family: Arial, Helvetica, sans-serif; text-transfo=
rm: uppercase; text-decoration: none; cursor: pointer; color: #004152; back=
ground-color: #00ecc9; font-size: 14px; line-height: normal;" data-nl-type=
=3D"externalLink" data-contenteditable=3D"true" >L=C3=A4s mer h=C3=A4r</a><=
/div>
<!--[if mso]></td><td width=3D"17" bgcolor=3D"#00ecc9">&#xA0;</td></tr></ta=
ble><![endif]--><!--[if mso]></td></tr></table><![endif]--></div>
</td>
</tr>
</tbody>
</table>
<div class=3D"acr-fragment acr-component" data-component-id=3D"html" data-c=
ontenteditable=3D"true">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100%">
<tbody>
<tr>
<td style=3D"line-height: 0; height: 40px;" width=3D"100%" height=3D"40"></=
td>
</tr>
</tbody>
</table>
</div>
</th><th class=3D"colspan2" style=3D"width: 50%; vertical-align: top; paddi=
ng-left: 20px; padding-right: 20px;">
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" cl=
ass=3D"innertable" width=3D"100%">
<tbody>
<tr>
<td class=3D"colspan1">
<div class=3D"acr-fragment acr-component image-container" style=3D"width: 1=
00%; text-align: center; max-width: 100%;" data-component-id=3D"image" data=
-upload=3D"uploadLoader-1653035495399-162784214" data-contenteditable=3D"fa=
lse"><!--[if mso]><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" w=
idth=3D"100%"><tr><td style=3D"text-align: center;"><![endif]--><a class=3D=
"arc-link" data-nl-type=3D"externalLink" href=3D"https://t.messages.tallink=
.com/r/=3Fid=3Dh2838c5de,14c491c7,14c49256&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2=
My0xMTM3NzI3&s=3DljoDHuZ2Ka85H0L0SDJYN4xfgYqLX3Xrz4xa2IoCWCQ" ><img class=
=3D"content-img" src=3D"http://res.messages.tallink.com/res/tallink_mkt_pro=
d6/1feb568e05a39884b4f8e764be8fea3853d5e9aa732d955ebed8b78190042337.jpg" wi=
dth=3D"325" style=3D"display: block; width: 100%; max-width: 100%; min-widt=
h: 100%; height: auto;" title=3D"Nya menyer" alt=3D"Nya menyer" /></a><!--[=
if mso]></td></tr></table><![endif]--></div>
</td>
</tr>
<tr>
<td align=3D"left" height=3D"15" style=3D"border-collapse: collapse; mso-ta=
ble-lspace: 0pt; mso-table-rspace: 0pt; mso-line-height-rule: exactly; line=
-height: 15px;" valign=3D"top"><!--[if gte mso 15]>&#xA0;<![endif]--></td>
</tr>
<tr>
<td class=3D"colspan1" align=3D"left" style=3D"font-family: Arial, Helvetic=
a, sans-serif; color: #004152; font-size: 16px; line-height: 18px; text-ali=
gn: left; font-weight: bold;" valign=3D"top">
<div class=3D"acr-fragment acr-component" data-component-id=3D"text" data-c=
ontenteditable=3D"false">
<div class=3D"text-container" data-contenteditable=3D"true">NYHET! Nya sp=
=C3=A4nnande menyer</div>
</div>
</td>
</tr>
<tr>
<td align=3D"left" height=3D"10" style=3D"border-collapse: collapse; mso-ta=
ble-lspace: 0pt; mso-table-rspace: 0pt; mso-line-height-rule: exactly; line=
-height: 10px;" valign=3D"top"><!--[if gte mso 15]>&#xA0;<![endif]--></td>
</tr>
<tr>
<td class=3D"colspan1" align=3D"left" style=3D"font-family: Arial, Helvetic=
a, sans-serif; color: #004152; font-size: 14px; line-height: 18px; text-ali=
gn: left;" valign=3D"top">
<div class=3D"acr-fragment acr-component" data-component-id=3D"text" data-c=
ontenteditable=3D"false">
<div class=3D"text-container" data-contenteditable=3D"true">Ta en tugga av =
v=C3=A5ra nya menyer! V=C3=A4lkommen ombord och prova p=C3=A5 sommarens tem=
abord i Grande Buffet, med inspiration av det svenska sm=C3=B6rg=C3=A5sbord=
et. Eller avnjut v=C3=A5ra restaurangers nya =C3=A0 la carte-menyer med f=
=C3=A4rska r=C3=A5varor och sp=C3=A4nnande smaker.</div>
</div>
</td>
</tr>
<tr>
<td class=3D"colspan1">
<div class=3D"acr-fragment acr-component" style=3D"width: 100%; text-align:=
 left;" data-component-name=3D"richtext.component_button" data-component-id=
=3D"button" data-contenteditable=3D"false"><!--[if mso]><table cellpadding=
=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100%"><tr><td height=3D"16">=
&#xA0;</td></tr>
<tr><td style=3D"text-align: left;"><![endif]-->
<div style=3D"height: 16px;">=C2=A0</div>
<!--[if mso]><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0">
<tr><td width=3D"17" bgcolor=3D"#00ecc9">&#xA0;</td>
<td align=3D"center" height=3D"32" bgcolor=3D"#00ecc9"><![endif]-->
<div class=3D"button-container" style=3D"display: inline-block; text-align:=
 center; font-weight: bold; font-family: Arial, Helvetica, sans-serif; text=
-transform: uppercase; text-decoration: none; cursor: pointer; color: #0041=
52; background-color: #00ecc9; font-size: 14px; line-height: normal; paddin=
g-left: 17px; padding-right: 17px; padding-top: 6px; padding-bottom: 6px;">=
<a href=3D"https://t.messages.tallink.com/r/=3Fid=3Dh2838c5de,14c491c7,14c4=
9257&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3&s=3DRUV82Hmx3qgp-W-oKc1zg=
wgoPTxeij6FyY0OLP1X0ag" style=3D"display: inline-block; text-align: center;=
 font-weight: bold; font-family: Arial, Helvetica, sans-serif; text-transfo=
rm: uppercase; text-decoration: none; cursor: pointer; color: #004152; back=
ground-color: #00ecc9; font-size: 14px; line-height: normal;" data-nl-type=
=3D"externalLink" data-contenteditable=3D"true" >L=C3=A4s mer h=C3=A4r</a><=
/div>
<!--[if mso]></td><td width=3D"17" bgcolor=3D"#00ecc9">&#xA0;</td></tr></ta=
ble><![endif]--><!--[if mso]></td></tr></table><![endif]--></div>
</td>
</tr>
</tbody>
</table>
<div class=3D"acr-fragment acr-component" data-component-id=3D"html" data-c=
ontenteditable=3D"true">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100%">
<tbody>
<tr>
<td style=3D"line-height: 0; height: 40px;" width=3D"100%" height=3D"40"></=
td>
</tr>
</tbody>
</table>
</div>
</th></tr>
</tbody>
</table>
</div>
</th></tr>
</tbody>
</table>
</div>
<div class=3D"acr-structure" data-structure-id=3D"1-1-column" data-structur=
e-name=3D"richtext.structure_1_1_column">
<table class=3D"structure__table" align=3D"center" cellpadding=3D"0" cellsp=
acing=3D"0" border=3D"0" width=3D"750">
<tbody>
<tr><th class=3D"colspan1">
<div>
<table align=3D"center" border=3D"0" bgcolor=3D"#004152" cellpadding=3D"0" =
cellspacing=3D"0" data-component-id=3D"text" data-component-name=3D"richtex=
t.component_html" style=3D"width: 100%; table-layout: fixed;" data-contente=
ditable=3D"true">
<tbody>
<tr><th colspan=3D"2" class=3D"colspan1" style=3D"width: 100%; vertical-ali=
gn: top;" width=3D"100%">
<div class=3D"acr-fragment acr-component" data-component-id=3D"html" data-c=
ontenteditable=3D"true">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0">
<tbody>
<tr>
<td style=3D"line-height: 0; height: 40px;" width=3D"100%" height=3D"40"></=
td>
</tr>
</tbody>
</table>
</div>
</th></tr>
<tr><th class=3D"colspan1" colspan=3D"2" style=3D"width: 100%; vertical-ali=
gn: top; padding: 0 40px;">
<table cellpadding=3D"0" cellspacing=3D"0" align=3D"center" border=3D"0" wi=
dth=3D"100%">
<tbody></tbody>
</table>
</th></tr>
<tr><th class=3D"colspan2" style=3D"width: 50%; vertical-align: top;">
<div class=3D"acr-fragment acr-component" style=3D"padding-left: 20px; padd=
ing-right: 20px; color: #ffffff; font-family: Arial; font-size: 10px; line-=
height: 12px;" data-component-id=3D"text" data-contenteditable=3D"false"><!=
--[if mso]><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" width=3D=
"100%"><tr><td style=3D"padding-left: 20px; padding-right: 20px; color:#fff=
fff; font-family: Arial; font-size:10px; line-height: 12px;"><![endif]--><s=
pan align=3D"left" style=3D"font-family: Arial, Helvetica, sans-serif; colo=
r: #ffffff; font-size: 12px; line-height: 14px; text-align: left;">KONTAKTA=
 OSS:</span><br /> <br /> <a style=3D"color: #ffffff; text-decoration: unde=
rline !important;" target=3D"_blank" href=3D"https://t.messages.tallink.com=
/r/=3Fid=3Dh2838c5de,14c491c7,14c49258&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2My0x=
MTM3NzI3&s=3Dptx-4vtMESQngICQvzsmtje4y3-3ZCVdCPwwyoocHrk" >Kontaktformul=C3=
=A4r</a><br />

<div data-component-id=3D"html" data-component-name=3D"richtext.component_h=
tml">Information och bokning: +46 8 22 21 40</div>
Tallink Silja AB, Box 27295, 115 74 Stockholm, Sverige<br /> <a style=3D"co=
lor: #ffffff; text-decoration: underline !important;" target=3D"_blank" hre=
f=3D"https://t.messages.tallink.com/r/=3Fid=3Dh2838c5de,14c491c7,14c49259&e=
=3DY2tleT0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3&s=3DQrNMmuy1q0lFayb_mGkwcsdZSqU=
w1Ik1ooUZWQqDE28" >www.clubone.se</a><br /> <br /> <span align=3D"left" sty=
le=3D"font-family: Arial, Helvetica, sans-serif; color: #ffffff; font-size:=
 12px; line-height: 14px; text-align: left;">F=C3=96RE DIN RESA:</span><br =
/> Samtliga resen=C3=A4rer till Finland, Estland och Lettland m=C3=A5ste<br=
 /> kunna uppvisa giltiga resehandlingar (pass eller nationellt id-kort). <=
a style=3D"color: #ffffff; text-decoration: underline !important;" target=
=3D"_blank" href=3D"https://t.messages.tallink.com/r/=3Fid=3Dh2838c5de,14c4=
91c7,14c4925a&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3&s=3DB8jD5NR6bJnL=
DKMKYiuqiHrMRwbY5VD4czJjnTHaKQU" >L=C3=A4s mer h=C3=A4r.</a><br /> <br /> <=
span align=3D"left" style=3D"font-family: Arial, Helvetica, sans-serif; col=
or: #ffffff; font-size: 12px; line-height: 14px; text-align: left;">HITTA H=
IT:</span><br /> Samtliga fartyg ankommer/avg=C3=A5r fr=C3=A5n V=C3=A4rtate=
rminalen.<br /> Terminalen n=C3=A5r du fr=C3=A5n G=C3=A4rdets tunnelbanesta=
tion, samt<br /> fr=C3=A5n bussh=C3=A5llplatsen V=C3=A4rtahamnens f=C3=A4rj=
eterminal. F=C3=B6lj<br /> skyltarna. <a style=3D"color: #ffffff; text-deco=
ration: underline !important;" target=3D"_blank" href=3D"https://t.messages=
.tallink.com/r/=3Fid=3Dh2838c5de,14c491c7,14c4925b&e=3DY2tleT0yODM4YzVkZS01=
NjQ0MDk2My0xMTM3NzI3&s=3Dk7up-g-36OI0CJLomqWpidICOik_l4Z8SRLd9fiK7cg" >Se k=
arta =C3=B6ver omr=C3=A5det.</a> <br /> <br /> Avregistrera dig <a href=3D"=
https://t.messages.tallink.com/r/=3Fid=3Dh2838c5de,14c491c7,14c4925c&e=3DY2=
tleT0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3JnAxPUxYQkx6cnVwTW96V0swUEN5UDUwZnNPS=
TV3SWNyNzJ0am1pR1BFWlBTenc9&s=3DZ2zR3zw1xHHXwt8cbnXs2c2v9f6GciqnpDamjs2YQPA=
" style=3D"color: #ffffff; text-decoration: underline !important;" id=3D"" =
data-nl-type=3D"externalLink" data-contenteditable=3D"true" >h=C3=A4r.</a><=
br /><!--[if mso]></td></tr></table><![endif]--></div>
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0">
<tbody>
<tr>
<td height=3D"12" style=3D"line-height: 0; height: 12px;"></td>
</tr>
</tbody>
</table>
</th><th class=3D"colspan2" style=3D"vertical-align: top; width: 50%;">
<div class=3D"acr-fragment acr-component" style=3D"padding-left: 20px; padd=
ing-right: 20px; font-family: Arial; font-size: 10px; line-height: 12px;" d=
ata-component-id=3D"html" data-contenteditable=3D"true"><!--[if mso]><table=
 cellpadding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"100%"><tr><td st=
yle=3D"padding-left: 20px; padding-right: 20px; font-family: Arial; line-he=
ight: 12px; font-size: 10px;"><![endif]--><span align=3D"left" style=3D"fon=
t-family: Arial, Helvetica, sans-serif; color: #f5f8f7; font-size: 12px; li=
ne-height: 14px; text-align: left;">F=C3=96LJ OSS:</span><br /><br />
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"184" style=
=3D"width: 184px!important; border-collapse: collapse; mso-line-height-rule=
: exactly;">
<tbody>
<tr>
<td><a href=3D"https://t.messages.tallink.com/r/=3Fid=3Dh2838c5de,14c491c7,=
14c4925d&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3&s=3DYSl47_Uy_m8_4VzVg=
1wXs40w9pPScIxAHVakfs0qKno" name=3D"Facebook link" target=3D"_blank" style=
=3D"color: #ffffff; text-decoration: none;" ><img border=3D"0" name=3D"Face=
book" src=3D"http://res.messages.tallink.com/res/tallink_mkt_prod6/346ef212=
316c6b5bba2884cc8e618d70974e461fab4618fa70520fcd46cd1191.png" style=3D"disp=
lay: block;" width=3D"30
    " xt=3D"SPIMAGE" title=3D"Facebook logo" alt=3D"Facebook logo" /> </a><=
/td>
<td><a href=3D"https://t.messages.tallink.com/r/=3Fid=3Dh2838c5de,14c491c7,=
14c4925e&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3&s=3DcTPS4pbeAJ6S2Bulh=
GirKNx5dvyenRXL_4JgZSLqaKs" name=3D"Instagram link" target=3D"_blank" style=
=3D"color: #ffffff; text-decoration: none;" ><img border=3D"0" name=3D"Inst=
agram" src=3D"http://res.messages.tallink.com/res/tallink_mkt_prod6/1423d04=
2a624171f741a3d89b29e3d65b231518cff4b1d558fb85f4ea94bfcdd.png" style=3D"dis=
play: block;" width=3D"30
    " xt=3D"SPIMAGE" title=3D"Instagram logo" alt=3D"Instagram logo" /> </a=
></td>
<td><a href=3D"https://t.messages.tallink.com/r/=3Fid=3Dh2838c5de,14c491c7,=
14c4925f&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3&s=3DB6zB81GS3yCu2f5ds=
Em7MJrsFxX__Oz9iBoiozH3i2A" name=3D"Linkedin link" target=3D"_blank" style=
=3D"color: #ffffff; text-decoration: none;" ><img border=3D"0" name=3D"Link=
edin" src=3D"http://res.messages.tallink.com/res/tallink_mkt_prod6/f09b284c=
1bb2ed19979842d6dc032fd8a40699bb7042e1f7413f50c1cf5f50ce.png" style=3D"disp=
lay: block;" width=3D"30" xt=3D"SPIMAGE" title=3D"Linkedin logo" alt=3D"Lin=
kedin logo" /> </a></td>
<td><a href=3D"https://t.messages.tallink.com/r/=3Fid=3Dh2838c5de,14c491c7,=
14c49260&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3&s=3DkKBozhZN6dnQkcn8n=
zdLEZDJnAy3cNul4w_HPhhncNc" name=3D"Youtube link" target=3D"_blank" style=
=3D"color: #ffffff; text-decoration: none;" ><img border=3D"0" name=3D"Yout=
ube" src=3D"http://res.messages.tallink.com/res/tallink_mkt_prod6/36497c089=
fe9c1c5754fc5f826ab9694e26bddc80651197950d0c48936d65636.png" style=3D"displ=
ay: block;" width=3D"40" xt=3D"SPIMAGE" title=3D"Youtube logo" alt=3D"Youtu=
be logo" /> </a></td>
</tr>
<tr>
<td colspan=3D"4">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"100%">
<tbody>
<tr>
<td height=3D"20" style=3D"background-color: #004152; color: #004152; borde=
r: 0; line-height: 0; height: 20px;"></td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
<table align=3D"left" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" widt=
h=3D"100%">
<tbody>
<tr>
<td align=3D"left" style=3D"font-family: Arial, Helvetica, sans-serif; colo=
r: #ffffff; font-size: 12px; line-height: 14px; text-align: left;">BOKA NU,=
 BETALA SEN</td>
</tr>
<tr>
<td align=3D"left">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"260">
<tbody>
<tr>
<td height=3D"30px" width=3D"90"><img border=3D"0" height=3D"20px" name=3D"=
Cont_0" src=3D"https://cdn.klarna.com/1.0/shared/image/generic/logo/sv_se/b=
asic/logo_white.png" style=3D"display: block;" width=3D"85" /></td>
</tr>
<tr>
<td align=3D"left" colspan=3D"8" height=3D"10" style=3D"background-color: #=
004152; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace:=
 0pt; mso-line-height-rule: exactly; line-height: 10px;" valign=3D"top"></t=
d>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"width: 100=
%;">
<tbody>
<tr>
<td align=3D"left" colspan=3D"3" style=3D"border: 0px; font-family: Arial, =
Helvetica, sans-serif; color: #f5f8f7; font-size: 12px; line-height: 14px; =
text-align: left; border-collapse: collapse; mso-line-height-rule: exactly;=
">LADDA NER V=C3=85R APP</td>
</tr>
</tbody>
</table>
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"width: aut=
o; display: inline-block;" align=3D"left">
<tbody>
<tr>
<td colspan=3D"2" height=3D"4" style=3D"height: 4px; line-height: 0;"></td>
</tr>
<tr class=3D"component-social-container">
<td style=3D"padding: 0 5px 0 0;"><a style=3D"text-decoration: none;" href=
=3D"https://t.messages.tallink.com/r/=3Fid=3Dh2838c5de,14c491c7,14c49261&e=
=3DY2tleT0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3&s=3D81IyXfELXtV9GkDo4XqiwHnuOJL=
eGSSoI0fp8k2PLoM" data-component-social-icon-id=3D"appstore" name=3D"app_st=
ore" target=3D"_blank" ><img width=3D"112.5" style=3D"height: 32px; width: =
112.5px;" src=3D"https://www.tallink.ee/documents/10192/66843353/appstore.p=
ng" title=3D"App Store" alt=3D"App Store" name=3D"Cont_4" border=3D"0" /> <=
/a></td>
<td style=3D"padding: 0 0 0 5px;"><a style=3D"text-decoration: none;" href=
=3D"https://t.messages.tallink.com/r/=3Fid=3Dh2838c5de,14c491c7,14c49262&e=
=3DY2tleT0yODM4YzVkZS01NjQ0MDk2My0xMTM3NzI3&s=3D7x-pctQgiw_3xa014k7kOHQaROm=
H_5R57Q2Bq5LbocU" data-component-social-icon-id=3D"googleplay" name=3D"goog=
le_play" target=3D"_blank" ><img width=3D"112.5" style=3D"height: 32px; wid=
th: 112.5px;" src=3D"https://www.tallink.ee/documents/10192/66843353/google=
play.png" title=3D"Google Play" alt=3D"Google Play" name=3D"Cont_5" border=
=3D"0" /> </a></td>
</tr>
</tbody>
</table>
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" align=3D"left" styl=
e=3D"width: 100%;">
<tbody>
<tr>
<td height=3D"12" style=3D"line-height: 0; height: 12px;"></td>
</tr>
</tbody>
</table>
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"width: aut=
o; display: inline-block;" align=3D"left">
<tbody>
<tr class=3D"component-social-container">
<td><a style=3D"text-decoration: none;" href=3D"https://t.messages.tallink.=
com/r/=3Fid=3Dh2838c5de,14c491c7,14c49263&e=3DY2tleT0yODM4YzVkZS01NjQ0MDk2M=
y0xMTM3NzI3&s=3DYwOeD2Y5bfR2oXd1T0nP_eD4O_pVNGrks2OHA7A_1ao" data-component=
-social-icon-id=3D"combined" name=3D"bottom_logo" target=3D"_blank" xt=3D"S=
PCLICK" ><img border=3D"0" height=3D"18" name=3D"Cont_6" src=3D"https://www=
.tallink.ee/documents/10192/66843353/combinedlogofooter.png" style=3D"displ=
ay: block;" width=3D"208" title=3D"Tallink Silja logo" alt=3D"Tallink Silja=
 logo" /> </a></td>
</tr>
</tbody>
</table>
<!--[if mso]></td></tr></table><![endif]--></div>
</th></tr>
<tr><th colspan=3D"2" class=3D"colspan1" style=3D"width: 100%; vertical-ali=
gn: top;">
<div class=3D"acr-fragment acr-component" data-component-id=3D"html" data-c=
ontenteditable=3D"true">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"">
<tbody>
<tr>
<td style=3D"line-height: 0; height: 40px;" width=3D"100%" height=3D"40"></=
td>
</tr>
</tbody>
</table>
</div>
</th></tr>
</tbody>
</table>
</div>
</th></tr>
</tbody>
</table>
</div>
</div>

<img height=3D'0' width=3D'0' alt=3D'' src=3D'https://t.messages.tallink.co=
m/r/=3Fid=3Dh2838c5de,14c491c7,1'/>
</body></html>

------=_NextPart_522_51709C50.51709C50--

