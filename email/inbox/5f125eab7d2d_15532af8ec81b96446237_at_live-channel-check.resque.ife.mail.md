Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a50:6b90:0:0:0:0:0 with SMTP id v16csp109337ecg;
        Fri, 17 Jul 2020 19:30:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9+9+mSCWUAINyNUoFVcFE6xi3bcwVF+llA0r4oWC9blczrUVvA5sAE8EeEqLO2y/Qit/H
X-Received: by 2002:a17:906:594c:: with SMTP id g12mr11305566ejr.255.1595039414327;
        Fri, 17 Jul 2020 19:30:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595039414; cv=none;
        d=google.com; s=arc-20160816;
        b=Dq5wr3aAl6KLJLKf8wXWeqaYKfw9/d/svC7Ug5pNbM2jCSwlXXR7SUPB3spx/llkzi
         Ea8axnlTPSiEMAx94HgAEB8LX64yEfDjGOHv62S3YG5HP19iobH5HN3ZBtx/oLaSlX9H
         wN481SkPXAmpiEqifa0Rdk1y6qD+zAKjXD7/XcvufwS+KNW6Lvv7c7pwJmGyPb9GAOPY
         inW6c43/ajSqDde4ob5lIH+pc9GXjqdBKdK8x45NZo8/EksgTgyixK/GyIFzRIpHCG3V
         V7QXOQp+q0v7x48J9jxCB+xfZ9Y4xaVsHeZD5dmlBGYoT/cCPTswcq96Y1ReShviUEJs
         Q5ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature:dkim-signature;
        bh=ci3oRLYJwhdyrNQKR6eiu674iJayBV78moyE8y3VFys=;
        b=wExx71oF8our5n/XJk4l+Uz09VQTD7ocK+X+DeI0VBbIQu43DV3hYmr8fyarXX/wbG
         oWpBpxjSTmq0KMJVfS00cYyAn230r1s3DrbQ8XVjCQgYuxRUTcBdYY53jUrL1F0OKsuW
         PYvmvHQyR82ZlXjyAO5M2FYykIX9Y1G29lav/5GJvzkcn/R+KmOMvEmFt2JnH98/rOwV
         zRthxJTolpRX6FA9v2eFbM6H+eWXNCH/PltTTRVIzDha7xXrgYPnymZundOeqJpY84P4
         pP8hnCIS9hCdObLN7NQ8/Zc8AjJuWs2s9lA7H46KxYx5cu9WnZNj6+AhB3s0Dyj/kNnn
         emIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ifttt.com header.s=s1 header.b=GelEl7SG;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=g8fOf1Qi;
       spf=pass (google.com: domain of bounces+4296082-5721-emil.skogsund=gmail.com@emails.ifttt.com designates 167.89.109.141 as permitted sender) smtp.mailfrom="bounces+4296082-5721-emil.skogsund=gmail.com@emails.ifttt.com";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=ifttt.com
Return-Path: <bounces+4296082-5721-emil.skogsund=gmail.com@emails.ifttt.com>
Received: from o8.email.ifttt.com (o8.email.ifttt.com. [167.89.109.141])
        by mx.google.com with ESMTPS id o10si6764897ejj.111.2020.07.17.19.30.13
        for <emil.skogsund@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jul 2020 19:30:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+4296082-5721-emil.skogsund=gmail.com@emails.ifttt.com designates 167.89.109.141 as permitted sender) client-ip=167.89.109.141;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ifttt.com header.s=s1 header.b=GelEl7SG;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=g8fOf1Qi;
       spf=pass (google.com: domain of bounces+4296082-5721-emil.skogsund=gmail.com@emails.ifttt.com designates 167.89.109.141 as permitted sender) smtp.mailfrom="bounces+4296082-5721-emil.skogsund=gmail.com@emails.ifttt.com";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=ifttt.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ifttt.com; 
	h=from:to:subject:mime-version:content-type:content-transfer-encoding; 
	s=s1; bh=ci3oRLYJwhdyrNQKR6eiu674iJayBV78moyE8y3VFys=; b=GelEl7S
	GwMWxkOuamL5RnlScWFm61OBx+mCtgFF6hIX2jRlhjLi+ir6xBHv6/Lw9TRhgnTG
	FOgNazyYU3g1owO03JlfiCijEJzqECa2nXS4CFN8s1VF9MpW5RME6nbwdZvoV8O9
	XlkpMnmsKf+Oh6MtrPO0c0nVcFJKyOwl9jiY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; 
	d=sendgrid.info; 
	h=from:to:subject:mime-version:content-type:content-transfer-encoding:x-feedback-id; 
	s=smtpapi; bh=ci3oRLYJwhdyrNQKR6eiu674iJayBV78moyE8y3VFys=; b=g8
	fOf1QixHiIrw4wrqg114oiuDyMh4ZoS7E0KgADRA6KZvy/UIhgHlV6MNkGNvJh1X
	s2oMgGqOegEYqCDIjITwr19migdSreEVSQ355AY1fh2MbxJCmG1WzmvHSJZaryES
	oXTkWS2ktPjjFLiMxmfCd2aCzgkkyeQfMrxXIgvQ0=
Received: by filter0435p1iad2.sendgrid.net with SMTP id filter0435p1iad2-1741-5F125EB2-13
        2020-07-18 02:30:10.46796136 +0000 UTC m=+367067.316769073
Received: from ifttt.com (unknown)
	by ismtpd0092p1iad2.sendgrid.net (SG) with ESMTP id 9qM66rxFReC7HGb2DEC4wQ
	for <emil.skogsund@gmail.com>; Sat, 18 Jul 2020 02:30:10.391 +0000 (UTC)
Date: Sat, 18 Jul 2020 02:30:10 +0000 (UTC)
From: IFTTT Alerts <alerts@ifttt.com>
To: emil.skogsund@gmail.com
Message-ID: <5f125eab7d2d_15532af8ec81b96446237@live-channel-check.resque.ife.mail>
Subject: You can fix it! Gmail is offline
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="--==_mimepart_5f125eaabf488_15532af8ec81b9644616f";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SG-EID: +SNkqRZmBMW6riissBEty+5j64CfL+UIdhP0kTBbyIQFJCpLAKbfKsZQil87jy+ZJ/9tfGOJ1GZ0ge
 jAuNND1w22OhDrFgwadvPUpwlE6XQ4g/q2F1K2qSD7ICDMXSkpReYejPaXeD0LCXE8qXdack3NktlJ
 ndGCL+7hqxHVwefxbazSlpEK04KloPHEHV9Cz+WlTawzYbBbfILXPtO34A==
X-SG-ID: 2VIXiJepS9mZTUb8gBEJRjEcaaOdfgYEuyr02aEgIJqrbnnki9P79De4ww9VdK6Fjke+/OhrYuMj0e
 TykVSV0A==
X-Feedback-ID: 4296082:rjGh1C9aJP8EjQqcQ9UM8Jw2nCl6oq1q3+uiWelgiYQ=:FkzOUahKnzHfhBGJ0J2P2g==:SG
X-TUID: 5xRTh/UdnRIR

----==_mimepart_5f125eaabf488_15532af8ec81b9644616f
Message-ID: <temp@test>
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi skogix,

  We can=E2=80=99t connect to your Gmail.

  Have you updated your password recently, or made some other changes? It c=
ould also be due to improvements that have been made to the service.

  The good news: you can fix it.

  Click through to reconnect.

Gmail settings: https://links.ifttt.com/ls/click?upn=3DWyAFfgEYLRIBevxki0a6=
G0tnGnJC0gIZxR3uQYxq9prfbfHaLr-2BjqCvAiRnkru0f5KHN_nJkiC3IbSDb8lL02sTi2tAvJ=
suzQyvYUOBBZcQTDWJw0CpDCFZpbTUa4WN929c8UK8VpDfdpEVkKiGK4YC-2BOxS-2Fvj6P5-2B=
qUe9p8lBMronGffSpChQDAyHRYhOJNXNskCEwVCdU7m8oWhrMh-2BJ66C-2FaC9KNfeYCg4G1r4=
jlMrRsfiRYiAGu8LH3EMoV5ee-2BJQIuepytBEz0fyNou994bjTkydwlJxJS9HI3Cfot3yb8MUL=
V67lj5UqUJ9CEtohne3wfwAzpeWF4cHAYOHOeWGxVXImgmQWZRpz-2BL-2F-2Bdo7qOM-3D


=E2=80=94
IFTTT

Unsubscribe from alerts (https://links.ifttt.com/ls/click?upn=3DWyAFfgEYLRI=
Bevxki0a6G1oyE8Ad-2FcHhymivGEP4HuSHtvUXmHFjUQNiZ5YlV3c04PgDpokA7cREegxYck06=
fJJLAqtmkwcme4DQroKBrXMUUoZkE2kCQBQkkowiyfSftquoVGDMI9dkhT1M0trRo0mUFEHiyPp=
Trp9xE35TxsCGS1rjF4lYJp1se2i4bHV-2BNgNg_nJkiC3IbSDb8lL02sTi2tAvJsuzQyvYUOBB=
ZcQTDWJw0CpDCFZpbTUa4WN929c8UK8VpDfdpEVkKiGK4YC-2BOxUNXaVOht8R07fxCZ3226pUe=
Hl8mRLeVSRZDHy8gzONIeaCs6LHW7AkQwhVklAOiTUOzuVvDBtCFxgTHs3KW6w2zIswuxARS6sR=
oUaOjLg-2BdXOcM9yESYC6TEpvxJpzR3BFzvGhV8hzhEy-2FUozNVOweoGUps1RSSeV1N9AkLeD=
LCZcR8Bn06BtLtrACTUawBnlCHytCDtgfCF41neLQzgR8-3D )

----==_mimepart_5f125eaabf488_15532af8ec81b9644616f
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
                  <p style=3D"clear: both; font-size: 24px">We can=E2=80=99=
t connect to your Gmail.</p>
                  <p style=3D"clear: both; font-size: 24px">Have you update=
d your password recently, or made some other changes? It could also be due =
to improvements that have been made to the service.</p>
                  <p style=3D"clear: both; font-size: 24px; font-weight: bo=
ld">The good news: you can fix it.</p>
                  <p style=3D"clear: both; font-size: 24px">Click through t=
o reconnect.</p>

                <table style=3D"background: #23448b; border-radius: 0 4.5em=
 4.5em 0; padding-right: .6em" bgcolor=3D"#23448b">
                  <tr>
                    <td style=3D"width: 80px">
                      <a href=3D"https://links.ifttt.com/uni/ls/click?upn=
=3DWyAFfgEYLRIBevxki0a6GwG1d-2B2PfzCIqcE4XR1o9mN1FOEktfgl-2BrfiQ8zftZ-2FnA7=
eA_nJkiC3IbSDb8lL02sTi2tAvJsuzQyvYUOBBZcQTDWJw0CpDCFZpbTUa4WN929c8UApSwXx4f=
7NWLK9h4TXlHGY0lbHjBEuzHEaoajImq0UqRYoMWX6LlmcDaj0AlNIqoAgtC8Malu73X-2FQyx-=
2Beq-2FcGGrH-2FH0vY6VbTQxT-2Fs08xFkztfTw6NRSW-2FAdZS8DxwohDG8Xo-2Fh3rZGHfhH=
BpeVRyaewFmnY2CxPYCGeKDgqQB4aR52BrbYOPClPtfpoOgGeBy5jeutikDNCm-2F7p1JTrdrj7=
t4kQNZXGA84FjKz60o-3D" universal=3D"true" style=3D"border: 0; color: black;=
 text-decoration: underline">
                        <img src=3D"https://assets.ifttt.com/images/channel=
s/33/icons/monochrome_large.png" alt=3D"Gmail" title=3D"Gmail" align=3D"non=
e" width=3D"80" style=3D"border: 0; clear: both; display: block; float: non=
e; margin: 12px 12px 12px 8px; text-decoration: none; vertical-align: middl=
e" />
                      </a>
                    </td>
                    <td>
                      <a href=3D"https://links.ifttt.com/uni/ls/click?upn=
=3DWyAFfgEYLRIBevxki0a6GwG1d-2B2PfzCIqcE4XR1o9mN1FOEktfgl-2BrfiQ8zftZ-2FnlI=
wI_nJkiC3IbSDb8lL02sTi2tAvJsuzQyvYUOBBZcQTDWJw0CpDCFZpbTUa4WN929c8UApSwXx4f=
7NWLK9h4TXlHGeml8gw2rh5Kk7mZrejRtEjrRGbP7-2BPLlEd3r9GExYZZ87WlFG3-2F7HKUetX=
cB-2FZXgVLNWu5oy28HCiJzalIniZV9qq8QrjthjtKOijrlir2fxfADbSDctTxRLAh2ajg8YIKN=
DzL1CUoYk1ShZDcAFZxCsb7gVGtCysm02sdKh1XuWVeQTZ8nqciVEfVpWyVNlCxCyxVh-2Ba4-2=
FLhNnMiuq2oc-3D" class=3D"btn-primary" universal=3D"true" style=3D"backgrou=
nd: black; border-radius: 2.5em; border: 3px solid transparent; color: #fff=
; cursor: pointer; display: inline-block; font-family: 'AvenirNext-Bold','A=
venirNext', 'Avenir', 'Helvetica Neue', 'Helvetica', 'Arial', 'sans-serif';=
 font-size: 36px; font-weight: bold; line-height: 1; margin: 0 auto; paddin=
g: .5em 1.5em; text-align: center; text-decoration: none; vertical-align: m=
iddle; white-space: nowrap">
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
MqI0x1zs-2BVser24lirNaj-2FqfoQxWtpZ5TRbZfcgcLE6Y-3DuiBc_nJkiC3IbSDb8lL02sTi=
2tAvJsuzQyvYUOBBZcQTDWJw0CpDCFZpbTUa4WN929c8UApSwXx4f7NWLK9h4TXlHGYriugc1c9=
uFZQ7cuDb9SQNMTJKU0mRGDw0WBh2WyS-2F4zOykg6MLVNy-2B2EW-2FL6P9B-2F-2FvxKkgpeK=
NdJx3Pvprnu36zXwXpFJIujBzgCdPNB91ihk-2BFdlkXKEh5iYOYukzs5NgR-2BAy-2FPMSRLnh=
5afarmwq4U4yMdG4LcXWYK-2FTv4NN1VjYzW4Fd2qTaKK6lBm1qEcgeiA-2FK7Y7ZevF0o7tQ4A=
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
35TxsCGS1rjF4lYJp1se2i4bHV-2BPWiK_nJkiC3IbSDb8lL02sTi2tAvJsuzQyvYUOBBZcQTDW=
Jw0CpDCFZpbTUa4WN929c8UApSwXx4f7NWLK9h4TXlHGUu8OLPKDy0ISe7T85Jrla0z7cVhZ-2F=
yiciEKZVMGLv2GvN5QVeGVYWoPoN6B21HWfudML-2FfEXsZEBqGgPKYhd0dCQSOKBgdjfgi4ywF=
moOyEaIRN86T-2FF03pvOBBBtzlW9TwagpsO1Q-2B63wEF6-2BZtsD5CYhZQbQlbiDDOft-2FVV=
utO833Iuscd3TdJk3391MZAWHos3N7V-2B-2Bya-2BNnznAWBMA-3D" target=3D"_blank" c=
lass=3D"link-footer-u" style=3D"border: 0; color: #999999; text-decoration:=
 underline"><span class=3D"link-footer-u" style=3D"color: #999999; text-dec=
oration: underline">Unsubscribe</span></a>=C2=A0from helpful alerts like th=
ese=C2=A0or manage your <a href=3D"https://links.ifttt.com/ls/click?upn=3DW=
yAFfgEYLRIBevxki0a6G-2B63G65dFBOjsqUzutMQUpdeq6KdtL3O3bBg-2FL5QiT2IGHM0_nJk=
iC3IbSDb8lL02sTi2tAvJsuzQyvYUOBBZcQTDWJw0CpDCFZpbTUa4WN929c8UApSwXx4f7NWLK9=
h4TXlHGXiv0J5Yr5W75cpk7-2FdRWn7rBAAoLNxvb7tJ7tMCVEinJslPbFby9GnB8GVn-2BDWMD=
E6OrFX3PgyQr5EywDPOGkfYg2HjZb2gPSmEDxM5Ju8oCxqqg6DyQVcEmH8x0eY198ti07EQd81y=
0YkCCfQYVuKIE-2F6hUQxr0Byk0jH5s-2FBCXx5tdiPsFDGraHsDZTjeBIFmqfdpHQn-2Fogry0=
UDcOcA-3D" target=3D"_blank" class=3D"link-footer-u" style=3D"border: 0; co=
lor: #999999; text-decoration: underline"><span class=3D"link-footer-u" sty=
le=3D"color: #999999; text-decoration: underline">email
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
ipclW0P8WdG1e1iAiIK7DTsphMUfYSugW2DFxJNoZUazkPZ8hPwhDvQJ76b6t91wQJ5OXe4Xo3F=
lWz6iR-2FgTYsvvEi5qNNCrDVCaBh3vEc-2FiNFUArbVaUJV2vzKZZ-2BroMiSW59aczQ-2FHWr=
iSWBUAqMYySd9du9Ovqx98bpkDpSCJCh-2FJmODIazplRuaX3-2B08EfODYsGiFtoZFRjFvzEmC=
EsAFlHAYHFWqn2q6FrXzT-2BSD554CHke-2BMMlqhvDxojQU5hQH-2Bd1n-2FCEtaWzvw7RB-2B=
q6SpoK3lgwgo-2FXe0A" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=
=3D"height:1px !important;width:1px !important;border-width:0 !important;ma=
rgin-top:0 !important;margin-bottom:0 !important;margin-right:0 !important;=
margin-left:0 !important;padding-top:0 !important;padding-bottom:0 !importa=
nt;padding-right:0 !important;padding-left:0 !important;"/>
</body>
</html>


----==_mimepart_5f125eaabf488_15532af8ec81b9644616f--
