Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:906:f58d:b0:ac7:e5d6:90a7 with SMTP id cm13csp471941ejd;
        Thu, 10 Apr 2025 10:31:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4tVwUk/OycaltiCL+J44qDSWLetFpaIYrBhQuKgjzke6z0b/1ELob8ihweOcbAuWCRGRK
X-Received: by 2002:a05:6e02:144f:b0:3d2:b72d:a507 with SMTP id e9e14a558f8ab-3d7e477b7b9mr37175895ab.19.1744306257904;
        Thu, 10 Apr 2025 10:30:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744306257; cv=none;
        d=google.com; s=arc-20240605;
        b=fBHmZhq0NVTijuorAjSwHJcvAq7DEPKYK7CcasgE/1+aLCV3N8pvT6SZ40J4rvaNqj
         u3tjEXqn7vOs74WsBHbFnfY3vGPxGGzBQSN1HaT3H0m9LEa0KwwFsiLS6nwBdLsJiswk
         gFU7Cn2zmL2jYjifzW3JuQV7B0PhFptHj8nCma4Ggrjc2VoNdqgfAqTPK5acLcoSXP1D
         XF3etIipY1trRPBJwT7+o2S0iD2M7x+AlIU2lbWuCTxlaXcwyYc5LbEZQdIF4pRWBO2M
         ZWDnZqlJhpi0izlPalcrv5ntshtnPkguVbYfxzf/dEeH1MrUXTZQf6kUCTwlg+a2A8mE
         ZHbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=XChB2IPfUntq3jU4pJ3g2b37e1K66oJUWLVAnB2OUNk=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=fLFvy/YeIxTPlbbN0/nfhH6wy1wZGbnLEvq7sZYi88txICr4PMDggSOeVkPbd0QJHQ
         4RrXSLSthmUUKUgEf41e5VFgsmqDZdBmcSTFfNeReuXycsM1e5u035z1LLiuKPR0cciZ
         gJXeFP87cpEdvXClD0xx13UN3sIqUg587ECbS6DiAww3Zl1sNsQRcL53Lv59bo1Ojs5B
         im+Ue1bhQBSpBHUWFIzgdRqnbJdHFb/9qTJsjxPmfsCWd4MhI5W8dPR2u6r14U87nyPY
         KaFN32VbQ3GJuRsv9PDh7JRM7FYfrFUK51Kjy/ijDqRLynsSxH9kjT3cl9+GnQu2tsMZ
         SjKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=alQnUOaY;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=JLyZEuec;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.40.80 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwnvrh.outbound-mail.sendgrid.net (s.xtrwnvrh.outbound-mail.sendgrid.net. [167.89.40.80])
        by mx.google.com with ESMTPS id e9e14a558f8ab-3d7dc57e92esi47068375ab.84.2025.04.10.10.30.57
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 10:30:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.40.80 as permitted sender) client-ip=167.89.40.80;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=alQnUOaY;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=JLyZEuec;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.40.80 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=XChB2IPfUntq3jU4pJ3g2b37e1K66oJUWLVAnB2OUNk=;
	b=alQnUOaYIhRP4XAEkaDWiRJEAu7s8wSv8p2K5/Ww+zRE06QF43Esi0AxeWrLczt73xef
	xxXh14Lj38l4zKY70T4GY/W7fG7KIkdIUrwmUrNS479nm7334PlgPJ+FwJQylTlfy+1u01
	rsfJLih7K/NgLnuUC/OhtLvJVRhpLYgF8cKBP4MFw2ZZt0Dh2REjijNFaYDr0keIf17O76
	LJH+pCOImZ7YKgPsat/4NrSzP2bOSEUyxrHH1dxYrELogO6or2+WVoFCam0uCgVgEbxSLd
	Y6Ycbx5D1uZUQj6LciIqBc1sTp9tAWmWHuR7mbZWSW2L1CH7w2ODN6g5g5r/EOwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=XChB2IPfUntq3jU4pJ3g2b37e1K66oJUWLVAnB2OUNk=;
	b=JLyZEuec4yxbi/WDomvCzeP+0nMmbnvRTjI3rn5Ln+Jr8VG5+JfvTYCHcp7yp5Bl8pqb
	StrELFDgy/xkJevr38WIa0ubf6CBfjFOgKBoIv9RpJqWNG6ecTZJqnsuoouYQLnSIG4z7t
	HPMaHzMpq/gj/hXp4OCe1w4sjSZ5LmQ6U=
Received: by recvd-65bb6cdcb5-pww92 with SMTP id recvd-65bb6cdcb5-pww92-1-67F80050-43
	2025-04-10 17:30:56.933912294 +0000 UTC m=+156186.898535687
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-2 (SG) with HTTP
	id 2CUn_iAJSE2cIt9oHsInLQ
	Thu, 10 Apr 2025 17:30:56.905 +0000 (UTC)
Content-Type: multipart/alternative; boundary=e46a67b2d008e74f9af4aa20b101cbf6271efb49464090cd220ec63cf66f
Date: Thu, 10 Apr 2025 17:30:57 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <2CUn_iAJSE2cIt9oHsInLQ@geopod-ismtpd-2>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n56bvg6dihh3dtwc?=
 =?us-ascii?Q?BuaP1oXECGvdVLcOUIDgP0ZqOOEp+Rrn0p8PKh9?=
 =?us-ascii?Q?6AtUrG3lIunrZDAov4O2Zf2utwXTBvEPddQhNl+?=
 =?us-ascii?Q?QHBx60IS1eAGKq4fkvp=2FSO=2FsYof70JWqm=2FFGV5O?=
 =?us-ascii?Q?xfWHxBMEQReQKH+pTDJJy+Vymm2oi8B5wU6qp3c?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: Z1Iz9C3B6kCW

--e46a67b2d008e74f9af4aa20b101cbf6271efb49464090cd220ec63cf66f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Usability Improvements in GCC 15
This article discusses six usability improvements in the upcoming GCC 15, i=
ncluding prettier execution paths, a new look for C++ template errors, mach=
ine-readable diagnostics, and a revamped color scheme. The author emphasize=
s the importance of making compiler diagnostics clearer and more user-frien=
dly.Comments Summary:
Commenters appreciate the improvements, especially the hierarchical present=
ation of template errors. Some express concerns about the use of emojis in =
compiler output, while others discuss the implications of GCC's changes on =
the broader programming community.2. Why Tap a Wheel of Cheese?
This article explores the traditional practice of tapping wheels of Parmigi=
ano Reggiano to assess their quality. The author shares insights from a vis=
it with battitori, the experts responsible for this task, and highlights th=
e artisanal nature of cheese production.Comments Summary:
Many commenters share their love for Parmigiano Reggiano and discuss the im=
portance of maintaining traditional methods in cheese production. There are=
 debates about the potential for automation in the process, with some argui=
ng that human expertise is irreplaceable.3. Owning my own data, part 1: Int=
egrating a self-hosted calendar solution
The author shares their journey of creating a self-hosted calendar solution=
 to regain control over their data. They discuss the challenges of existing=
 calendar systems and outline their requirements for a new solution.Comment=
s Summary:
Commenters discuss various self-hosted calendar solutions, sharing their ex=
periences with CalDAV and alternatives like Nextcloud. There are mixed opin=
ions on the usability of these systems, with some expressing frustration ov=
er the complexity of CalDAV.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--e46a67b2d008e74f9af4aa20b101cbf6271efb49464090cd220ec63cf66f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Usability Improvements i=
n GCC 15</h2><p>This article discusses six usability improvements in the up=
coming GCC 15, including prettier execution paths, a new look for C++ templ=
ate errors, machine-readable diagnostics, and a revamped color scheme. The =
author emphasizes the importance of making compiler diagnostics clearer and=
 more user-friendly.</p><h3>Comments Summary:</h3><p>Commenters appreciate =
the improvements, especially the hierarchical presentation of template erro=
rs. Some express concerns about the use of emojis in compiler output, while=
 others discuss the implications of GCC's changes on the broader programmin=
g community.</p><h2>2. Why Tap a Wheel of Cheese?</h2><p>This article explo=
res the traditional practice of tapping wheels of Parmigiano Reggiano to as=
sess their quality. The author shares insights from a visit with battitori,=
 the experts responsible for this task, and highlights the artisanal nature=
 of cheese production.</p><h3>Comments Summary:</h3><p>Many commenters shar=
e their love for Parmigiano Reggiano and discuss the importance of maintain=
ing traditional methods in cheese production. There are debates about the p=
otential for automation in the process, with some arguing that human expert=
ise is irreplaceable.</p><h2>3. Owning my own data, part 1: Integrating a s=
elf-hosted calendar solution</h2><p>The author shares their journey of crea=
ting a self-hosted calendar solution to regain control over their data. The=
y discuss the challenges of existing calendar systems and outline their req=
uirements for a new solution.</p><h3>Comments Summary:</h3><p>Commenters di=
scuss various self-hosted calendar solutions, sharing their experiences wit=
h CalDAV and alternatives like Nextcloud. There are mixed opinions on the u=
sability of these systems, with some expressing frustration over the comple=
xity of CalDAV.</p><footer><p>This email has been sent by Toolhouse. You ca=
n change your delivery preferences at <a href=3D'http://url1228.toolhouseai=
.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAq=
Um0-2FD2kMX-2BcmQdjMsw93IF_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmDKXk=
VjqamRFJRYePiEHPlXNmOa10bZBvd6R7zfZXtjgMFXdHslRpl9jV2wUPLLJxybHwUD9UOlNJDg5=
eT4Mm0Irbty7rvwcTmjIkmH-2FQwVEeomoqOd82PVHOWO3nuzV27mb-2BzDx86m7JliH0kDF-2F=
Vat7XnTcYrSaNcXA1ZAcTa8g-3D-3D'>Toolhouse Settings</a>.</p></footer><img sr=
c=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx=
2P513JhjX8oSKm62DliywF0GJ0MurM3siIYGpoSsXo7cCSkV0U5a-2Bv5SvDId0vjNEfVPNgTUl=
EkCIYygfSKDqpeztoLf3O7jnDZTlqVYX7uNHZZ6Cb3vw495J8sbCO-2FuX2lXFIBw3vFImIdzV-=
2BXiDZY5Q5AWESeSm-2FmCiu-2FSnIHs2Wt1EeZlJievAbSPWrAwfeQ08RRJuwkr8qEzoiUpFfs=
rY-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !=
important;width:1px !important;border-width:0 !important;margin-top:0 !impo=
rtant;margin-bottom:0 !important;margin-right:0 !important;margin-left:0 !i=
mportant;padding-top:0 !important;padding-bottom:0 !important;padding-right=
:0 !important;padding-left:0 !important;"/></body></html>
--e46a67b2d008e74f9af4aa20b101cbf6271efb49464090cd220ec63cf66f--
