Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:9488:b0:ac7:e5d6:90a7 with SMTP id dm8csp1137267ejc;
        Sat, 12 Apr 2025 10:31:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENG5ze4Nv2EtVmxaPR7lY3FXdPi0NzHUAKg40qaxGh/Pf9HZ1SOPL99Y4SFp1LypewZGof
X-Received: by 2002:a05:6a00:390a:b0:736:fff2:9ac with SMTP id d2e1a72fcca58-73bd12a82dbmr8485430b3a.23.1744479083195;
        Sat, 12 Apr 2025 10:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744479083; cv=none;
        d=google.com; s=arc-20240605;
        b=PvzXJB3XnfuCQ0015IwK1gRd36auY5NcxRVwSS6axu1+xjHsPmlf/bASw5KcxqlK5R
         cTnO6TT6qTLhjykF+zwN/kIz3WbS2EMhH2mZqE9m8o0iREb5WHOHeZLpcMWQrkf43KQc
         bj8mXPY+RuX6meoOY2oJZSqyhiyX7BUMsDTf/ZPi1tmdg5jgRd5EHw2WXXoirHUKS0/c
         mdsc/S3Z7NK3gClhjwYkTU+I3iCyrl6+AeK1bR8WJp64JIsdqhH9zoSO3RiepQCVwW65
         yiCH6XCpRlK131da5EpSopnNq1u2JRM0KC5QcgwDZM9TNpr3DiQdvM96uLOEOkOb3JYB
         XbVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=yM21HZz60UDZdcLsGLoB31TNt+SvxT39uoUzgDAmNTw=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=AEZYfyzHQcajPq6ILnQ+ohVp8Tx0COoUKvs9ieCOaIRioKPS7KtvN6vW5ywa68RgmW
         Jxkwj0prNiDP064tV5bnfTCwZYIGo1qgoBT9yqCnj+OAtAlVe4YsNKf4akSdVW9s+FG8
         jK7i7QQzIbmPU441nA6uOTnO+ycmkVrMagnvml57+m3a6Wc5IX5p8/gPNSDbav6PSTL7
         vefiBMMvuVurgAX0LD0DD/+lMJ6rdvArxxYWYkRdOIPFjRJu8nQBD+Zu7EsmupxcXj+b
         8MDPLiWinKlajYTKr/gEZf/OlTBN8/Pjx+T50pQZFMsoAlws6DPLyW/OLdZgL+83IjQt
         ADFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=ki2WnvhA;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=dVf6jFYJ;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.40.80 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwnvrh.outbound-mail.sendgrid.net (s.xtrwnvrh.outbound-mail.sendgrid.net. [167.89.40.80])
        by mx.google.com with ESMTPS id d2e1a72fcca58-73bd22d081dsi5129285b3a.137.2025.04.12.10.31.22
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Apr 2025 10:31:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.40.80 as permitted sender) client-ip=167.89.40.80;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=ki2WnvhA;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=dVf6jFYJ;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.40.80 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=yM21HZz60UDZdcLsGLoB31TNt+SvxT39uoUzgDAmNTw=;
	b=ki2WnvhAnMzliiv8lCoqhHxGVS6MgVb1NKg/r3jOgpmBXXSE0aGXau2gq9K65RCSopOd
	nt3MPjuzyD/b3DQkaW+uV+3VMyoid5CRR9qNJuCP5/N9zCT5T/s3/KroN9sYFEj8QSmiNe
	LBxpKEHEn5VSJuiK8cs003buqeVD6SQ1h5cpKIlGoE2nQlhvJoBaqaSoJo2zY4SlNh7W2X
	/tj8yd2BoPkTSP3w2GJYdCZHNlwijhJAlnpkl6BoS6ZrImtTHdxN66jUamBk7pYp/VXA1T
	tC5//crb4O4rFeClOhrYqH86DSobqDqReuhKjd3qQfz7gYCOR0dAYAADsff0QGmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=yM21HZz60UDZdcLsGLoB31TNt+SvxT39uoUzgDAmNTw=;
	b=dVf6jFYJxe7ahlc7N/xR7OJRloRG+oCYhxmpL1nHx7bqRO8WIe19g5HVqPPEBdIH8wLl
	+NQtWkDwiPuJ4vQR/yKJ/iINBbgxw8Df/cdR/vBLLNYHRZ8zmxInbckyvGhxonSXEi3zPh
	ApJ6wtvsiwvmk5DeSBgoqBGBGM2R6b8PQ=
Received: by recvd-84ff9c6c5c-5j9gj with SMTP id recvd-84ff9c6c5c-5j9gj-1-67FAA369-3B
	2025-04-12 17:31:21.997821205 +0000 UTC m=+328849.039129556
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-39 (SG) with HTTP
	id IXr8QcB8ThGH25dSqQ4yRw
	Sat, 12 Apr 2025 17:31:21.947 +0000 (UTC)
Content-Type: multipart/alternative; boundary=56074305a968d19fd36ff599cc9983077c94e578108d0182ab749979470b
Date: Sat, 12 Apr 2025 17:31:22 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <IXr8QcB8ThGH25dSqQ4yRw@geopod-ismtpd-39>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n4iU09L7FnjnIv8E?=
 =?us-ascii?Q?P4sHwW+K0VU6w0iyc0q4RmvhKyekV5uZljF29bA?=
 =?us-ascii?Q?xkEk3c0KZnnBWygL0EOx24wWsr6+7esicpFl0Pq?=
 =?us-ascii?Q?A0MRHvsZuCyYV5F3LP0Z1jh=2FtvTIi=2FEWKiLs9Wz?=
 =?us-ascii?Q?F9S9QlNx1S1E559sSwD=2FpKoF4lSDbrvbUZuq8LG?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: dZHR2YntRnOy

--56074305a968d19fd36ff599cc9983077c94e578108d0182ab749979470b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Open source and self hostable/private file conver=
ter
This article discusses a new open-source file converter that is self-hostab=
le. The source code is available on GitHub under the AGPL license, which re=
quires modifications to be shared with users accessing the software over a =
network.Top Comments:Users appreciate the open-source nature and the capabi=
lities of ffmpeg.Some express concerns about the practicality of web-hosted=
 solutions versus local applications.Others highlight the ease of use for n=
on-technical users.2. Tunarr: Create and configure live TV channels from me=
dia on your servers
Tunarr allows users to create live TV channels from media stored on their s=
ervers, providing a user-friendly web interface for configuration. It aims =
to modernize the experience of setting up TV channels.Top Comments:Users sh=
are their positive experiences with similar services and express excitement=
 about trying Tunarr.Some discuss the nostalgia of cycling through channels=
 without making conscious decisions.3. Paris said au revoir to cars. Air po=
llution maps reveal a dramatic change
This article highlights the significant reduction in air pollution in Paris=
 due to policies that have limited car access and increased green spaces. A=
ir quality has improved dramatically over the past two decades.Top Comments=
:Some users debate the effectiveness of banning cars versus improving vehic=
le emissions.Others comment on the overall noise reduction in the city.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--56074305a968d19fd36ff599cc9983077c94e578108d0182ab749979470b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Open source and self hos=
table/private file converter</h2><p>This article discusses a new open-sourc=
e file converter that is self-hostable. The source code is available on Git=
Hub under the AGPL license, which requires modifications to be shared with =
users accessing the software over a network.</p><h3>Top Comments:</h3><ul><=
li>Users appreciate the open-source nature and the capabilities of ffmpeg.<=
/li><li>Some express concerns about the practicality of web-hosted solution=
s versus local applications.</li><li>Others highlight the ease of use for n=
on-technical users.</li></ul><h2>2. Tunarr: Create and configure live TV ch=
annels from media on your servers</h2><p>Tunarr allows users to create live=
 TV channels from media stored on their servers, providing a user-friendly =
web interface for configuration. It aims to modernize the experience of set=
ting up TV channels.</p><h3>Top Comments:</h3><ul><li>Users share their pos=
itive experiences with similar services and express excitement about trying=
 Tunarr.</li><li>Some discuss the nostalgia of cycling through channels wit=
hout making conscious decisions.</li></ul><h2>3. Paris said au revoir to ca=
rs. Air pollution maps reveal a dramatic change</h2><p>This article highlig=
hts the significant reduction in air pollution in Paris due to policies tha=
t have limited car access and increased green spaces. Air quality has impro=
ved dramatically over the past two decades.</p><h3>Top Comments:</h3><ul><l=
i>Some users debate the effectiveness of banning cars versus improving vehi=
cle emissions.</li><li>Others comment on the overall noise reduction in the=
 city.</li></ul><footer><p>This email has been sent by Toolhouse. You can c=
hange your delivery preferences at <a href=3D'http://url1228.toolhouseai.co=
m/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0=
-2FD2kMX-2BcmQdjMswk-ae_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmCylNJ6U=
OzSkzAu5dFkqApFlvu5EaobKrZO1y1pp-2FwSBijl4POMUeYAoNuEYLmpnSr8N-2BsS5myrl-2F=
uZBnUyNVUeERy8jQ6VaOz6hhlzGOh9VMknuuvdJ0kw4cldIY7St6A8iwyC63DJ20j80ChLV0Qft=
7bqWNT7lfSkjn-2F33xifYw-3D-3D'>here</a>.</p></footer><img src=3D"http://url=
1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm6=
2DliywF0GKThdy0TyfoLLwWg6LDdau1hEPhrAZsX4zU2uMpji0cRNN-2BTzqOMO8eVPWkCTidie=
fWjCrvBlxpE1UuerREBnPz7RL1HqupfNB4gb0hL7laTpdt6MNoCC8hNDa-2FDRMx1rPFHwX5aDh=
OQcc2QAjPo9GfGZ940GkzWnVlC8ldJT29RIFVi3pn1dZwaEpJ8aXKqaA-3D" alt=3D"" width=
=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !important;width:1px !=
important;border-width:0 !important;margin-top:0 !important;margin-bottom:0=
 !important;margin-right:0 !important;margin-left:0 !important;padding-top:=
0 !important;padding-bottom:0 !important;padding-right:0 !important;padding=
-left:0 !important;"/></body></html>
--56074305a968d19fd36ff599cc9983077c94e578108d0182ab749979470b--
