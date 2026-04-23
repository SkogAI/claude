Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:96a7:b0:ac7:e5d6:90a7 with SMTP id hd39csp1453472ejc;
        Wed, 16 Apr 2025 10:38:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQg/ydQkIjvIjZlmgQJxQ2oknjXiroLLKQH+Isz4IXxT+ixERfhOUgu49R4ipqB+sSqqCV
X-Received: by 2002:a05:690c:4804:b0:706:ae3b:cc9d with SMTP id 00721157ae682-706bc16c9f9mr6894937b3.17.1744825110191;
        Wed, 16 Apr 2025 10:38:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744825110; cv=none;
        d=google.com; s=arc-20240605;
        b=I7PBgrzSXITxJ+dP5p2zTTS/BbKQJGSzZDfkd/t8SStmkb5VLkSUk1fjCuwr7PpU1a
         8APRwRZYuDQhm1JNLIPnBZbuxOAahR6LQPOIvVBjQ+R7GeoN4DzOqGBWSbQI9k13ucQy
         h9ClD91nsfZTvLgF7hUoMUq7INkpP0Q2cznlx4uaKlznNKoS7EQJNTZIlYqSFGBU/ZUY
         I84qJIYnoNgL8G4IaiT+PVmkjO40QYgZAJHxDODxvwgMhND2fIkd/OmtXdQRQMaLqVy8
         OWKWGjokMJCDztfEnqQ7wforLf5Pc02bBmRDvrVyxnU9EM5lauakBncrNJUlX9LP10I0
         55LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=WkiGJ864Z2Cfa1q8NLY+wQBHokKnMnJQQBRp8jKGJNE=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=DuyrKHvG5bXh1Re2hyXa/FPDO9O7O6TfmM3vEvZcSnfiyTj87W8bDetZpv/3oRKv8U
         44QBjTWonufGqW5xEjDBGrqIB3FwRM8Z+BU/c5gSgvy5tkarMgX4GKs1Cxn4HVC/N3Ef
         iZaqkCPzmN5Q9IcJFhw0V6lotRQTmu9mhBT9LLnNGj+vSeSfA4B4ac/4II3XLJT+10tt
         rTkFnELvtBH2i1V3Ag+if688MefkMbSZT2ZiVa5jX3387Y386GrEUjCJ3en2j3m0ZRqF
         DSS3gMy4YTO9ru3Kk4d5M//QzgbaQuT+7ixOjRim+t971oIvJZv90QGq3IiGwQrQMuNC
         LJPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=LAU0hEoe;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=uGgr8Xy9;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwknhz.outbound-mail.sendgrid.net (s.xtrwknhz.outbound-mail.sendgrid.net. [167.89.18.14])
        by mx.google.com with ESMTPS id 00721157ae682-7053e2e49e3si222361127b3.194.2025.04.16.10.38.29
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 10:38:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) client-ip=167.89.18.14;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=LAU0hEoe;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=uGgr8Xy9;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=WkiGJ864Z2Cfa1q8NLY+wQBHokKnMnJQQBRp8jKGJNE=;
	b=LAU0hEoeriU5oNnAJ8wkRfBfY0Iwd+VTZ/4C2qjtAphXsUjUvCXQ2MJ0495TcULlaXaS
	Z9z8tefXa78PoKOLA2ijJMZDo5qiLIKeFRES3T6R7skrFeQQm+rpaYGfpBQ6ln1bAVubiu
	YlBDQuEsDo9TAYIRrIFr9xcZ9TPeaSD7gOixNQNF9eR0sS17TRfufk35jgYwB7kC3zHY+b
	m/6qSr+ivGpZ1jixmuWVI53f+P6vxLoEb/2VoslS2qOOwl37HwU6N1AlYJujZrwz4rBiCp
	wXhFe5t/qSx1NHpHpyzmHjdS/XL/M/j9NpM8YWb0+R1vIaR5FwuovW0sCUQlN5tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=WkiGJ864Z2Cfa1q8NLY+wQBHokKnMnJQQBRp8jKGJNE=;
	b=uGgr8Xy9Kn79Vs9tDej0IYmTKUr+Ar2cNtidFWNaQTQ+b29lKACMdVrQsYid2VANrZNH
	N9n00glrSEzlo87tzj9cdOoh0nVNwGO4P43joKWXllE2LLfdaa7GBxN9FhEYhLFpncn4k2
	7QtspHcAWiZr10zc+opb9LFoneCfKz4VE=
Received: by recvd-65bb6cdcb5-l7dpj with SMTP id recvd-65bb6cdcb5-l7dpj-1-67FFEB15-36
	2025-04-16 17:38:29.664079961 +0000 UTC m=+674986.883387851
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-5 (SG) with HTTP
	id LkLm4lm-QhCSFEcZfkWMYA
	Wed, 16 Apr 2025 17:38:29.649 +0000 (UTC)
Content-Type: multipart/alternative; boundary=c9b5adab2840a75e95375fbebe1772a398f773cd429d759d72b9028d9150
Date: Wed, 16 Apr 2025 17:38:29 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <LkLm4lm-QhCSFEcZfkWMYA@geopod-ismtpd-5>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n7024OpSpCm+kyuN?=
 =?us-ascii?Q?8DPqdGg0tCvjobXqr7eNogvwT+CGK8jrpc0v4Yu?=
 =?us-ascii?Q?cXuKNqavShaB56ejOe8eM=2FLHVnubakpzZIOQrav?=
 =?us-ascii?Q?UickPkU6qtOrdhgXE8Ku9I3wqkazuBesgdHTvhp?=
 =?us-ascii?Q?54cIr1ZnfaranC15FFmn6VTYAI9Y5krTWqAEakm?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: 2lLmh8VpQGk7

--c9b5adab2840a75e95375fbebe1772a398f773cd429d759d72b9028d9150
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Darwin's children drew all over the "On the Origi=
n of Species" manuscript
This article discusses the fascinating drawings made by Charles Darwin's ch=
ildren on the manuscript of his famous work. The drawings, which include im=
aginative scenes like 'The Battle of the Fruit and Vegetable Soldiers,' hig=
hlight the playful and creative side of the Darwin family. The article emph=
asizes the importance of recognizing the human aspects of historical figure=
s, reminding us that they were surrounded by family and lived complex lives=
.Top Comments:One user reflects on the continuity of human nature across ce=
nturies, suggesting that people from the past were not so different from us=
.Another comment discusses the societal changes in parental responsibilitie=
s and the implications of modern taxation on family dynamics.2. Damn Vulner=
able MCP Server
This article introduces a deliberately vulnerable implementation of the Mod=
el Context Protocol (MCP) designed for educational purposes. It showcases v=
arious security vulnerabilities and challenges that developers and security=
 researchers can explore to understand potential risks in MCP implementatio=
ns.Top Comments:Users express nostalgia for the simplicity of older program=
ming languages and discuss the evolution of programming practices.Some comm=
ents delve into the technical aspects of memory management and programming =
tricks used in older systems.3. Dirty tricks 6502 programmers use
This article recaps coding tricks used by programmers working with the Comm=
odore 64, particularly in a coding competition. It highlights various techn=
iques for optimizing code size and performance, showcasing the creativity a=
nd ingenuity of programmers in the 8-bit era.Top Comments:Commenters remini=
sce about their experiences with assembly language and the challenges of pr=
ogramming on older hardware.There are discussions about the unique memory l=
ayouts of different systems and how they influenced programming practices.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at this link.
--c9b5adab2840a75e95375fbebe1772a398f773cd429d759d72b9028d9150
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Darwin's children drew a=
ll over the "On the Origin of Species" manuscript</h2><p>This article discu=
sses the fascinating drawings made by Charles Darwin's children on the manu=
script of his famous work. The drawings, which include imaginative scenes l=
ike 'The Battle of the Fruit and Vegetable Soldiers,' highlight the playful=
 and creative side of the Darwin family. The article emphasizes the importa=
nce of recognizing the human aspects of historical figures, reminding us th=
at they were surrounded by family and lived complex lives.</p><h3>Top Comme=
nts:</h3><ul><li>One user reflects on the continuity of human nature across=
 centuries, suggesting that people from the past were not so different from=
 us.</li><li>Another comment discusses the societal changes in parental res=
ponsibilities and the implications of modern taxation on family dynamics.</=
li></ul><h2>2. Damn Vulnerable MCP Server</h2><p>This article introduces a =
deliberately vulnerable implementation of the Model Context Protocol (MCP) =
designed for educational purposes. It showcases various security vulnerabil=
ities and challenges that developers and security researchers can explore t=
o understand potential risks in MCP implementations.</p><h3>Top Comments:</=
h3><ul><li>Users express nostalgia for the simplicity of older programming =
languages and discuss the evolution of programming practices.</li><li>Some =
comments delve into the technical aspects of memory management and programm=
ing tricks used in older systems.</li></ul><h2>3. Dirty tricks 6502 program=
mers use</h2><p>This article recaps coding tricks used by programmers worki=
ng with the Commodore 64, particularly in a coding competition. It highligh=
ts various techniques for optimizing code size and performance, showcasing =
the creativity and ingenuity of programmers in the 8-bit era.</p><h3>Top Co=
mments:</h3><ul><li>Commenters reminisce about their experiences with assem=
bly language and the challenges of programming on older hardware.</li><li>T=
here are discussions about the unique memory layouts of different systems a=
nd how they influenced programming practices.</li></ul><footer><p>This emai=
l has been sent by Toolhouse. You can change your delivery preferences at <=
a href=3D'http://url1228.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP=
6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswez0d_zKD9qStml-2F=
kjU46ulTqeWVsrM3061nr98hteMD12SmAUCRVUTvZoJ9Y2K1wrLoxXV557lzKpoeeywAvZ5ca6i=
Ghs-2Fe2ouA4iP-2FJgWEi37cmYIGzxIESUXQIYk6wwokUr-2FAQ87sMFDIuaK7U3mfMixbtqqc=
zaylGSecrlT7QKp1fq7UvGSiXuxV2y2f6EW5PnB-2B0DzpWl5lH2V-2FVLp9CaeA-3D-3D'>thi=
s link</a>.</p></footer><img src=3D"http://url1228.toolhouseai.com/wf/open?=
upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF0GJ2a7eQLkbOT99LxVjX3N=
12coKeo6udfueE-2FlArP54XAm3aQ4b6zNxsjGDlP4iMzsl4NXZiWTbW5IMpTW-2F1ZAAZ6FYdo=
2e2Fnzcxv5I4l0EjTUCapo-2Fqi6ik-2Fh4gET-2BbPE6yxUjX6-2BMHuwHLsQ8VbAiKIeSJcsj=
6QelJHNIuSyf4CM9whcUxyHCsKsiWYOWMXs-3D" alt=3D"" width=3D"1" height=3D"1" b=
order=3D"0" style=3D"height:1px !important;width:1px !important;border-widt=
h:0 !important;margin-top:0 !important;margin-bottom:0 !important;margin-ri=
ght:0 !important;margin-left:0 !important;padding-top:0 !important;padding-=
bottom:0 !important;padding-right:0 !important;padding-left:0 !important;"/=
></body></html>
--c9b5adab2840a75e95375fbebe1772a398f773cd429d759d72b9028d9150--
