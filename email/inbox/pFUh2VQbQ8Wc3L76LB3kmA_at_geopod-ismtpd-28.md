Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:7049:b0:ac7:37f3:5ea9 with SMTP id ws9csp3573771ejb;
        Thu, 3 Apr 2025 10:31:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHww9Q5hawEYlXIRg/gJhq+/2RhAJfqHM8vv6pFDemgOJeRvUwqYX3OkV+AyopfBF8od8Xn
X-Received: by 2002:a05:6a00:3996:b0:730:9637:b2ff with SMTP id d2e1a72fcca58-739e5a567admr230176b3a.7.1743701499809;
        Thu, 03 Apr 2025 10:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743701499; cv=none;
        d=google.com; s=arc-20240605;
        b=Sr21D7DtxGcjzMesnpUy1nWZJNvysWKTt9EshG23KWVzypchXVP97TAbnttNmU1JTe
         X3X7uwCiAnQ0FMfeMDHuFKyLfdJUTJjPV+jGNS2FBi7GwBhrrBxur13uUHi8pEFh8Njx
         ym8kfuV6Kn0eiWEuGIcTrMCSxMMq4fLYKkSVMJL4y8AivUYQHf8drAdy18NexpTi1ofq
         5zJsbB3vqQ0AR0d0FWAawPQogla/tvPaQIwBpIi3+OgHVVoCE8HPf7ucraDIC4j2QvAN
         l05GfKHZCKZHGl7CkF1bHKrTdZjhN3X6gQU6YidMO8SuBBJKNMyKGE1qUMNu9RxeGW1v
         sBPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=NZVOnVJqnMs+/lD/POo7PrulmpwMVKOYkqLt3QNTGXA=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=HOP9TJOnafp+ZHQcj8Ey9mPPmW6+8xygVSOyC4g0aK/rtFkItEVoH8uTkyzmF8Pv34
         dvSieBI9HqHbq59rWN0TduKWseK6LvIyG2VO+0TL3ZiSUVPGaGb+jW5AytS/U69dTaVK
         dGx0JKtYEWBj2lbFvkPr5isVM5JOOvD0iLsZiROBicXLsntw28rRaKWtVpF7K7uwlHmq
         MvT1SPOY1/muNs2r7KOG7JZrkLwGgK7WG7FdUTXTjAerfTCurIm5aiEiwXkljO/SfzNe
         pp6d+J04lfWrRp1W5P4ziOmL13USk5xBtgi6rMnCBy0HMJhuPKJCPeymSlvaiVEdjST/
         jEvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b="cSIib/j4";
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=t+C8wCeL;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhsb.outbound-mail.sendgrid.net (s.wfbtzhsb.outbound-mail.sendgrid.net. [159.183.224.107])
        by mx.google.com with ESMTPS id d2e1a72fcca58-739d97d1af3si2284918b3a.53.2025.04.03.10.31.37
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 10:31:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) client-ip=159.183.224.107;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b="cSIib/j4";
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=t+C8wCeL;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=NZVOnVJqnMs+/lD/POo7PrulmpwMVKOYkqLt3QNTGXA=;
	b=cSIib/j4q+4UZfAYwmbxvN8TkyycDxsysuS/PZoh6dRpGJjzlyDvXbekSPuJ5MJGFMfI
	6PfiSNDRlgN7rEhCFwBCbSjmHCoBsThvzEO/2997ns6UbjUVt0iiUboM/LO5tUq2MxDE8u
	GvwQ7VRtpGYQUFq3JsGKwxV0geHsRxl7qbpeu4fPoJco2udrw51VDGW7E7A+ef12RUqUrr
	2jBIh+765j0CUr0lumoZL+n5cWK7IZo44f07ei5ZHh0xZluIYum1m5B0/xu1srgA/NTeV4
	+4drtLwNJX45zh8dycbmOiq75bv7dJBqQYr8UdT1nHRbHJx9WavHz+gtTwBkTAHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=NZVOnVJqnMs+/lD/POo7PrulmpwMVKOYkqLt3QNTGXA=;
	b=t+C8wCeLh8bkFTlkpnPDQu5nu64PFT6i63wW36oz758PbNpqNgD9gNmbRS2/qzRa2OnF
	Wr7w/kVsAuHmbyNeJtGoJrARo85erSSauC3eFVlTYC7fUk9F3WV66jBZmNaCklQKrle/xD
	jVm2J+kyl05gZF2wlG2+Bb60hr+xzBNLw=
Received: by recvd-canary-5c597bcd97-k6q5h with SMTP id recvd-canary-5c597bcd97-k6q5h-1-67EEC5F7-D1
	2025-04-03 17:31:35.705901424 +0000 UTC m=+858264.062318148
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-28 (SG) with HTTP
	id pFUh2VQbQ8Wc3L76LB3kmA
	Thu, 03 Apr 2025 17:31:35.658 +0000 (UTC)
Content-Type: multipart/alternative; boundary=202538cb794e1b2db2a549d5cd815a601ae7f8bbc114ec69a39634b4e7af
Date: Thu, 03 Apr 2025 17:31:35 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <pFUh2VQbQ8Wc3L76LB3kmA@geopod-ismtpd-28>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n4PPeSVB56lv=2FjO+?=
 =?us-ascii?Q?ZSn1EXEDusH2g14C5ejF2Odwwz97QOA3ioW3FlF?=
 =?us-ascii?Q?1Tj+eKxhuQtIrOjt8tXHq+TCo=2FhMneqcdccO3Du?=
 =?us-ascii?Q?N58Y5l2oDIY=2FyHE5os2A4ajU952CsMA4o70DWt9?=
 =?us-ascii?Q?Ggm7RL5yTek8s0m0RROmVojYpwBFjpc=2FmTUR7=2FD?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: 5nmA2FVTvja0

--202538cb794e1b2db2a549d5cd815a601ae7f8bbc114ec69a39634b4e7af
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Overengineered Anchor Links
This article discusses the complexities involved in implementing anchor lin=
ks on web pages. The author explores various solutions to improve user expe=
rience, including adding padding, shifting trigger lines, and creating virt=
ual headings. The article emphasizes the balance between functionality and =
simplicity in web design.Top Comments:Some commenters express concern over =
the complexity introduced for a simple scroll.Others appreciate the innovat=
ive approach but question the necessity of such solutions.Overall sentiment=
 is mixed, with some finding the article insightful while others feel it co=
mplicates a straightforward task.2. A Special Build of Curl that Can Impers=
onate Browsers
This project presents a modified version of curl that mimics the behavior o=
f major browsers during TLS and HTTP handshakes. The goal is to bypass rest=
rictions imposed by web services that differentiate between clients based o=
n their handshake signatures.Top Comments:Commenters praise the project for=
 its potential to enhance web accessibility.Some express skepticism about t=
he need for such a tool, questioning its practicality.The overall sentiment=
 is positive, with many interested in its applications.3. InitWare: A Porta=
ble Systemd Fork
InitWare is introduced as a modular and portable alternative to systemd, de=
signed to manage services across various operating systems. The article hig=
hlights its compatibility with systemd interfaces and its potential benefit=
s for users seeking a more flexible service management solution.Top Comment=
s:Commenters appreciate the modularity and potential of InitWare compared t=
o systemd.Some express concerns about its development pace and long-term vi=
ability.The sentiment is generally supportive, with many hoping for its suc=
cessful adoption.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--202538cb794e1b2db2a549d5cd815a601ae7f8bbc114ec69a39634b4e7af
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Overengineered Anchor Li=
nks</h2><p>This article discusses the complexities involved in implementing=
 anchor links on web pages. The author explores various solutions to improv=
e user experience, including adding padding, shifting trigger lines, and cr=
eating virtual headings. The article emphasizes the balance between functio=
nality and simplicity in web design.</p><h3>Top Comments:</h3><ul><li>Some =
commenters express concern over the complexity introduced for a simple scro=
ll.</li><li>Others appreciate the innovative approach but question the nece=
ssity of such solutions.</li><li>Overall sentiment is mixed, with some find=
ing the article insightful while others feel it complicates a straightforwa=
rd task.</li></ul><h2>2. A Special Build of Curl that Can Impersonate Brows=
ers</h2><p>This project presents a modified version of curl that mimics the=
 behavior of major browsers during TLS and HTTP handshakes. The goal is to =
bypass restrictions imposed by web services that differentiate between clie=
nts based on their handshake signatures.</p><h3>Top Comments:</h3><ul><li>C=
ommenters praise the project for its potential to enhance web accessibility=
.</li><li>Some express skepticism about the need for such a tool, questioni=
ng its practicality.</li><li>The overall sentiment is positive, with many i=
nterested in its applications.</li></ul><h2>3. InitWare: A Portable Systemd=
 Fork</h2><p>InitWare is introduced as a modular and portable alternative t=
o systemd, designed to manage services across various operating systems. Th=
e article highlights its compatibility with systemd interfaces and its pote=
ntial benefits for users seeking a more flexible service management solutio=
n.</p><h3>Top Comments:</h3><ul><li>Commenters appreciate the modularity an=
d potential of InitWare compared to systemd.</li><li>Some express concerns =
about its development pace and long-term viability.</li><li>The sentiment i=
s generally supportive, with many hoping for its successful adoption.</li><=
/ul><footer><p>This email has been sent by Toolhouse. You can change your d=
elivery preferences at <a href=3D'http://url1228.toolhouseai.com/ls/click?u=
pn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2Bc=
mQdjMsw45Vp_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmBt4xEVPYYpu5b4Tt73r=
lz3ZeGy6xjZeZGAKpNENyMrE8AC0eKtTbyZ6BBBTzCucdb-2FmupAqc3YVF9v0Pw3Znf-2B14WK=
NieByVTymYdLfTWRJrGaJDXSJxjjRh3PR6hTheclZgHvXWQn1TQznEsW-2F8VqFrVcxnQzhpuXu=
q4sPK4oG8y7Da7Mk4Qory5-2FohytVZw-3D'>Toolhouse Settings</a>.</p></footer><i=
mg src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaq=
hc9sx2P513JhjX8oSKm62DliywF0GJrxmSzH7dA5N-2BDOvWI8RmIBz8msvJ5nPz-2Fx85lNmU-=
2B5a280VO5psWFZ9Cwmx1nTyvMMYXY5cC4u10K5fXxQGv24JXXowf8c95fnj-2F3J-2FkT-2FsR=
peiVNA9oyiqXwSDWpIkFtdukikXXn1v0JXBYVXJrQBEBkS1fjFGZ3iepVyxDJ7j-2FN3oquTYAU=
FAuLWu216V4-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"hei=
ght:1px !important;width:1px !important;border-width:0 !important;margin-to=
p:0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-=
left:0 !important;padding-top:0 !important;padding-bottom:0 !important;padd=
ing-right:0 !important;padding-left:0 !important;"/></body></html>
--202538cb794e1b2db2a549d5cd815a601ae7f8bbc114ec69a39634b4e7af--
