Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:906:f58d:b0:ac7:e5d6:90a7 with SMTP id cm13csp471869ejd;
        Thu, 10 Apr 2025 10:31:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB9jpLrdP2HzdZjRcdKOOqGyUAVrxnNzx64YpFq7BuMItCuNFzJa65q2br/5JdzBGG84kg
X-Received: by 2002:a05:6a21:b94:b0:1fe:9537:84a0 with SMTP id adf61e73a8af0-2016948c319mr5835690637.15.1744306263263;
        Thu, 10 Apr 2025 10:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744306263; cv=none;
        d=google.com; s=arc-20240605;
        b=XgGU7VzTck4jZt5NsWlg9zc3PGGJPUcn2B33G3JYVhF2Z41VpghsJVcEPnrrKeIDDO
         iXUeFCeEJ437mIBunp0a8Um7UvbOniQS/Gi/1uEmYgGCNfeoQhXbjV7S1c9I4YAS8UDM
         WAd9Iv8Wqtx/UbEW2TTH4COJqIpkEKuiZwMwfeI9EflrQxstVSDpkD9+1Bt73KG3jonz
         yQqM68Uv+HfmrGVfbPWPMHHk3XiONqLQoEW6RHXcZhmxyXaOCPHVswItFMy+n96ryCBq
         BAWheqWEZhCD+k0LkyOKNW0MRXtXNC8V7JbU/u9O7O4liibPQ3lSq/nBzGT4hzVChwlK
         Ajog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=IMg+CsR13NKuvwABeTnr0EV48yAL2T7n77QOroIhu9c=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=TH38qRuSzpPah8UO21yeNPJWx7/BY1jHPk/uN5/jRzJSkcLCvPO1Qz8l+Cm6wly0Ml
         EJcutVEDAr4UX5KIlAeTqwVDfqnc46TPUzmRSAI/3LRCWQzUCfzG3eazVxk1dkaRzmpc
         FhChCHDOxFWUXCkwFF527etLiPceIoS2NYc7ukbT6pYI67TnGYmqnpIUdmYwkh++H0t6
         fLLv0QEM4VZ3KccBmXuo9olNGHvXN4zyCCBwpcW9T2Lz6vHBhuPLAMW8x5cFI0svw1G+
         K8WcAfnie3lWRVpWLkT30M3uDbAVMdX0Snc21IWQGand/CMbVx6nlC47RI4m+6awOUWf
         UW/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=jVKkAUU5;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=zc7sfaEX;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwknhz.outbound-mail.sendgrid.net (s.xtrwknhz.outbound-mail.sendgrid.net. [167.89.18.14])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b02a302d06fsi4683110a12.387.2025.04.10.10.31.02
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 10:31:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) client-ip=167.89.18.14;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=jVKkAUU5;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=zc7sfaEX;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=IMg+CsR13NKuvwABeTnr0EV48yAL2T7n77QOroIhu9c=;
	b=jVKkAUU5OrPYXPAXhgOOae5OIIfTW4xsoG2SQ+f1/GUpcIUfO2gY9uR0ocgUx/7LqTkv
	ZauC3yawwWHswv1gqfcapYwgP56LZ9J5GFDdvsmZ/BQBckqzk+hMUttPGOKWSBBA2PzzIR
	/TypueeiZIqzLOV2UXI/cyyU+C2wt7VzUtdvxaTC+fDwvymlGZzEfhmlCq5qCGO6p1CnVt
	5Hv1Tui5gpS08mrWNTTzWQk4WuP5JW1kfpuvc1bFyyaU+wUt+jYLtR+N05AEbbBpXUFdWj
	GmU+xEzUkKLsbnYfod1nT3s+BpgOysCYXyW+di0iGLDpwS4ML/pGtlJVEv5yXOPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=IMg+CsR13NKuvwABeTnr0EV48yAL2T7n77QOroIhu9c=;
	b=zc7sfaEX10EHBYy4n3skQKPbLWCEJtiNrFvvbah9H8qfm5iXZtKSuR5OAEDeBXgODntk
	YPeMGXNOp+HGhZjmew/W8HaJDGvRixLfNV013AVHLBYy82xJtPq78Z4ZaaCLyxALh1bGGv
	0P2Cyy2uGB4v3ywvimVH7I9MD38t8EAxI=
Received: by recvd-6884bf9dd7-8hm4t with SMTP id recvd-6884bf9dd7-8hm4t-1-67F80056-F
	2025-04-10 17:31:02.119190236 +0000 UTC m=+156168.783045658
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-4 (SG) with HTTP
	id 8J_YzR5bR_OSAxOnKiT2LA
	Thu, 10 Apr 2025 17:31:02.071 +0000 (UTC)
Content-Type: multipart/alternative; boundary=2df3fcd295b56bcb1ef688ae5c813e33ecd1cfcb5dd59ded5bb1a80940fd
Date: Thu, 10 Apr 2025 17:31:02 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <8J_YzR5bR_OSAxOnKiT2LA@geopod-ismtpd-4>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n5lPD+9gohXSGG5l?=
 =?us-ascii?Q?mXEVd1jQ0K3DmJqEUBEK9c27uLi4lFOtX5fKrWH?=
 =?us-ascii?Q?Lg0lhHxJIegaNRzOnH7AMlJhEmd2bcF6PlKi=2Fyc?=
 =?us-ascii?Q?kSOb485sLNBATL426ZOZaf68F2QAUHoNw0fi5RB?=
 =?us-ascii?Q?IQVgAVvIUZUxTAkJ2=2FolxEFcEv7glpFS8rWv99R?=
 =?us-ascii?Q?w=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: 2qiIosJ4wD5D

--2df3fcd295b56bcb1ef688ae5c813e33ecd1cfcb5dd59ded5bb1a80940fd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Usability Improvements in GCC 15
This article discusses six usability improvements in the upcoming GCC 15, i=
ncluding prettier execution paths, a new look for C++ template errors, mach=
ine-readable diagnostics, and a revamped color scheme. The author emphasize=
s the importance of making compiler diagnostics clearer and more user-frien=
dly.Comments Summary:
Comments reflect a mix of appreciation for the improvements and skepticism =
about the necessity of certain features. Some users express concerns about =
the complexity of compiler errors and the need for better error messaging.2=
. Why Tap a Wheel of Cheese?
This article explores the traditional practice of tapping wheels of Parmigi=
ano Reggiano to assess their quality. The author shares insights from a vis=
it with battitori, the experts who perform this task, highlighting the arti=
sanal nature of cheese production and the importance of human expertise in =
quality control.Comments Summary:
Commenters discuss the cultural significance of cheese in Italy, the artisa=
nal methods used in cheese production, and the potential for automation in =
quality assessment. There is a strong sentiment in favor of preserving trad=
itional methods.3. Owning my own data, part 1: Integrating a self-hosted ca=
lendar solution
The author shares their journey of creating a self-hosted calendar solution=
 to regain control over their data. They discuss the challenges of existing=
 calendar systems and the benefits of using a self-hosted approach with Cal=
DAV.Comments Summary:
Comments reveal a mix of support for self-hosting and skepticism about the =
complexity of CalDAV. Users share their experiences with various calendar s=
olutions and express interest in alternatives to mainstream services.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--2df3fcd295b56bcb1ef688ae5c813e33ecd1cfcb5dd59ded5bb1a80940fd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Usability Improvements i=
n GCC 15</h2><p>This article discusses six usability improvements in the up=
coming GCC 15, including prettier execution paths, a new look for C++ templ=
ate errors, machine-readable diagnostics, and a revamped color scheme. The =
author emphasizes the importance of making compiler diagnostics clearer and=
 more user-friendly.</p><h3>Comments Summary:</h3><p>Comments reflect a mix=
 of appreciation for the improvements and skepticism about the necessity of=
 certain features. Some users express concerns about the complexity of comp=
iler errors and the need for better error messaging.</p><h2>2. Why Tap a Wh=
eel of Cheese?</h2><p>This article explores the traditional practice of tap=
ping wheels of Parmigiano Reggiano to assess their quality. The author shar=
es insights from a visit with battitori, the experts who perform this task,=
 highlighting the artisanal nature of cheese production and the importance =
of human expertise in quality control.</p><h3>Comments Summary:</h3><p>Comm=
enters discuss the cultural significance of cheese in Italy, the artisanal =
methods used in cheese production, and the potential for automation in qual=
ity assessment. There is a strong sentiment in favor of preserving traditio=
nal methods.</p><h2>3. Owning my own data, part 1: Integrating a self-hoste=
d calendar solution</h2><p>The author shares their journey of creating a se=
lf-hosted calendar solution to regain control over their data. They discuss=
 the challenges of existing calendar systems and the benefits of using a se=
lf-hosted approach with CalDAV.</p><h3>Comments Summary:</h3><p>Comments re=
veal a mix of support for self-hosting and skepticism about the complexity =
of CalDAV. Users share their experiences with various calendar solutions an=
d express interest in alternatives to mainstream services.</p><footer><p>Th=
is email has been sent by Toolhouse. You can change your delivery preferenc=
es at <a href=3D'http://url1228.toolhouseai.com/ls/click?upn=3Du001.duokMj2=
A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMsw8JIO_zKD9q=
Stml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmDhR41OLM5b6vPT6sYPr2om-2FbwWdYgwroUl=
QlkCxwj3kPU6bca5F1NXqw6ZW3-2FpfMn3z8ydE6gzqLRDuWIi0-2B9kiFGditleG7OABa55nio=
2xc7e9pfuh-2B8QBaHyB01mnSnrhFyDjNH9g1sRexEia-2B7Qy0E0Sdvm-2BB-2FZoEp-2Fcy7F=
WA-3D-3D'>Toolhouse Settings</a>.</p></footer><img src=3D"http://url1228.to=
olhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF=
0GIwNnFqd2JCTTptg2lirY4-2By-2F07xsDPO4LJ1X0Qs7d-2FpAm-2F2YYcqCnLa85tte3BwVP=
s-2Bcgw44RxDvLsP-2BViCWInym6qP4Bd4TTZOenczvAUs97MzYp0SWO2K4F5y8c3JWxcd492L5=
363iJj6PZ6-2FPB4nlie5ydZeQmh85uatYo1QlVn3iXhDGlwM8bQzR0MZWY-3D" alt=3D"" wi=
dth=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !important;width:1p=
x !important;border-width:0 !important;margin-top:0 !important;margin-botto=
m:0 !important;margin-right:0 !important;margin-left:0 !important;padding-t=
op:0 !important;padding-bottom:0 !important;padding-right:0 !important;padd=
ing-left:0 !important;"/></body></html>
--2df3fcd295b56bcb1ef688ae5c813e33ecd1cfcb5dd59ded5bb1a80940fd--
