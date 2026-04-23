Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:9488:b0:ac7:e5d6:90a7 with SMTP id dm8csp596133ejc;
        Fri, 11 Apr 2025 10:31:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtkwbY2EQujXEWb7I1swiaBozaVhtoQ6ggJGHyadvj0+hvccPvDgfgMD3DD3ZlYcVVxpuW
X-Received: by 2002:a05:6e02:250b:b0:3d3:d229:f166 with SMTP id e9e14a558f8ab-3d7ec2655afmr42698785ab.17.1744392698319;
        Fri, 11 Apr 2025 10:31:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744392698; cv=none;
        d=google.com; s=arc-20240605;
        b=Kx69JUOLcyLaOQaq/apr93sZ6Tb+h+UXQd5e3fCICjVHOTlmrbBciXGBpr8LWWLdVH
         kR4iidgfsyDgrZf8+jslufD0uGOwvvJgmjZdO3Qpc8ZNpu/nBUZMClNRigCE7XOMIRn9
         t0rBMSmuZyH/HeVIUD2j5bmx5MEKgcXdlavuJuBQTdj5R37ASt11psJHOqDZTGNpNzTb
         m5N/Et+I2G5WeWPsASlRAyO23qSytfs3SURYLDfFYwNbLbFKYx346/f7Fb8D++EKI89N
         fwP6a1CjwFnx7Q+nlmdKs2HQjg4MlUYCnibLb7pyGMwkK2AW7D0NmfcNmE5KDktOorgO
         CviA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=4lugXPngCq3B6ZnsHZ6pCqbeXDEIgwZnwKaKeRcu7Ms=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=Ja3wbRbPzjwVoB3xdho3iEpjyV0SrkudbiaTXWWIIXXhouru4HIe2JNTTnwDrrSopr
         BBC3mL8S3TLGeYe84x+uHaD99U3f6z5wWbVICmyskLqjzSIzppwNS6mJ1wXmy+6Ffqha
         vyvVD8LSxp0wYp94v915Dj3A+ZXsShFPVjOt7GmzW/Pgn/5ZMJOEHfRWqOY9HMc+mjkB
         j0mTixoHuhTVADbL/VuxYhum4I0sAnju+wHzwMbQB0Y8/CItT4pyiPPvtoOTyfJGHnWk
         WTvA3nUwTIVQWAhi7Nlw1wtEXgdOzjTuNfDqkUAFJVbmQTE327L9i9eiAvGVgTH8fQ5y
         RQRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=YClnu8Lg;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=nnFvO6i4;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhss.outbound-mail.sendgrid.net (s.wfbtzhss.outbound-mail.sendgrid.net. [159.183.224.102])
        by mx.google.com with ESMTPS id 8926c6da1cb9f-4f505d44c1asi6127065173.81.2025.04.11.10.31.37
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 10:31:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) client-ip=159.183.224.102;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=YClnu8Lg;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=nnFvO6i4;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=4lugXPngCq3B6ZnsHZ6pCqbeXDEIgwZnwKaKeRcu7Ms=;
	b=YClnu8LgleS0+rIYIv3zlfGakYi9egCexriDAn0zUI21nMfl+44fllJCJk2dFCt2YQlF
	YlCUOPZPNVMUQ712O7qR5XGGpzrePHr5bsfiNPu5ydjrEu0X/PnJJzD2k7y+58zKOQ5XIU
	1cKtZauu6oEDKKmekcYAVY6fRWwxVsqaTov158McEV7YquSf7ql2SSGsZfc0N6fa1Qi6kG
	UoMzz3294NvyjKSG2EwfspX3InhKzKOKFFDD8wBScfmCeCQNL0UK/NHMToAZ2FsLM0bYOn
	FFqia7dy0O2yCeqZ+UsV9Myn7salsV4fs+Hit8+ysLo9p9sg5tPvmaT5fyErw4tQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=4lugXPngCq3B6ZnsHZ6pCqbeXDEIgwZnwKaKeRcu7Ms=;
	b=nnFvO6i4bUvXcGYruQmXReSCYmrEyHm5CO/0rK0d17bgEO+x5Z1bI95nsSTJmWcMcfmJ
	bij4Btai6WevlngAzPHhdMt+OYPmf93YWz0MYmmih7iCxP2jB2ub35fwDQRPCEnP2XQWXm
	WIedTYirjdJsjaMXPcjOpeEweu09/zO2E=
Received: by recvd-545d4d4647-748np with SMTP id recvd-545d4d4647-748np-1-67F951F7-3F
	2025-04-11 17:31:35.890077715 +0000 UTC m=+242594.002146025
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-4 (SG) with HTTP
	id fABfpVEHQL6R4gwkAJwZRA
	Fri, 11 Apr 2025 17:31:35.880 +0000 (UTC)
Content-Type: multipart/alternative; boundary=564a0be141bcfb5ffd85a8655068baabf878c6e22171dae359d46a5fa004
Date: Fri, 11 Apr 2025 17:31:35 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <fABfpVEHQL6R4gwkAJwZRA@geopod-ismtpd-4>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n5y6ailADppnvk=2F7?=
 =?us-ascii?Q?+pdWDVo9zXMgA7qD8IWkZKhVNiSMKrIBWh+mWrj?=
 =?us-ascii?Q?UCZFORCSV4q6ZlpnLDPuZ7w9yCTjGTXmQ0H2zx9?=
 =?us-ascii?Q?2kAPWOK4pAvRQuYMEAieTjuXjVom63A6ICUhnVn?=
 =?us-ascii?Q?0IbQjyu2X74=2FFIo9RJZZ6ednE9isRLRcAtFolTU?=
 =?us-ascii?Q?A=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: LjBz0+Frxa5V

--564a0be141bcfb5ffd85a8655068baabf878c6e22171dae359d46a5fa004
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. But what if I want a faster horse?
This article discusses the evolution of tech products, particularly streami=
ng services like Netflix and Spotify, and how they have shifted from user-c=
entric experiences to algorithms that prioritize engagement over quality. T=
he author argues that this shift leads to a homogenization of content, wher=
e the focus is on maximizing user time rather than providing meaningful exp=
eriences.Top Comments:Many users feel that the current algorithms prioritiz=
e engagement over quality, leading to a frustrating experience.Some comment=
ers express nostalgia for earlier versions of these services, which offered=
 better user experiences.There is a consensus that the focus on maximizing =
engagement is detrimental to the quality of content.2. Fedora change aims f=
or 99% package reproducibility
This article highlights Fedora's initiative to achieve 99% reproducibility =
in package builds, a significant step towards enhancing security and trust =
in software distribution. The proposal has received positive feedback, focu=
sing on how to achieve this goal with minimal disruption to packagers.Top C=
omments:Many users support the initiative, emphasizing the importance of re=
producibility in software security.Some express concerns about the potentia=
l challenges for packagers in adapting to these changes.Overall sentiment i=
s positive, with a focus on the benefits of reproducibility.3. Bilinear int=
erpolation on a quadrilateral using Barycentric coordinates
This article presents a new method for bilinear interpolation that maintain=
s continuity across quadrilaterals, addressing common issues in computer gr=
aphics. The proposed method is based on Barycentric coordinates and aims to=
 improve the rendering of 3D models.Top Comments:Commenters appreciate the =
technical depth of the article and its practical implications for 3D graphi=
cs.There is a discussion about the challenges of implementing such methods =
in existing graphics pipelines.Overall, the sentiment is one of excitement =
for the potential improvements in rendering techniques.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--564a0be141bcfb5ffd85a8655068baabf878c6e22171dae359d46a5fa004
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. But what if I want a fas=
ter horse?</h2><p>This article discusses the evolution of tech products, pa=
rticularly streaming services like Netflix and Spotify, and how they have s=
hifted from user-centric experiences to algorithms that prioritize engageme=
nt over quality. The author argues that this shift leads to a homogenizatio=
n of content, where the focus is on maximizing user time rather than provid=
ing meaningful experiences.</p><h3>Top Comments:</h3><ul><li>Many users fee=
l that the current algorithms prioritize engagement over quality, leading t=
o a frustrating experience.</li><li>Some commenters express nostalgia for e=
arlier versions of these services, which offered better user experiences.</=
li><li>There is a consensus that the focus on maximizing engagement is detr=
imental to the quality of content.</li></ul><h2>2. Fedora change aims for 9=
9% package reproducibility</h2><p>This article highlights Fedora's initiati=
ve to achieve 99% reproducibility in package builds, a significant step tow=
ards enhancing security and trust in software distribution. The proposal ha=
s received positive feedback, focusing on how to achieve this goal with min=
imal disruption to packagers.</p><h3>Top Comments:</h3><ul><li>Many users s=
upport the initiative, emphasizing the importance of reproducibility in sof=
tware security.</li><li>Some express concerns about the potential challenge=
s for packagers in adapting to these changes.</li><li>Overall sentiment is =
positive, with a focus on the benefits of reproducibility.</li></ul><h2>3. =
Bilinear interpolation on a quadrilateral using Barycentric coordinates</h2=
><p>This article presents a new method for bilinear interpolation that main=
tains continuity across quadrilaterals, addressing common issues in compute=
r graphics. The proposed method is based on Barycentric coordinates and aim=
s to improve the rendering of 3D models.</p><h3>Top Comments:</h3><ul><li>C=
ommenters appreciate the technical depth of the article and its practical i=
mplications for 3D graphics.</li><li>There is a discussion about the challe=
nges of implementing such methods in existing graphics pipelines.</li><li>O=
verall, the sentiment is one of excitement for the potential improvements i=
n rendering techniques.</li></ul><footer><p>This email has been sent by Too=
lhouse. You can change your delivery preferences at <a href=3D'http://url12=
28.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZ=
ZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswE7S0_zKD9qStml-2FkjU46ulTqeWVsrM3061nr9=
8hteMD12SmD22prGcxDYtZO8mv0WMpkJZMIka52cAPKpYca-2BS4j808K80QW97tCV3Vh96e1fS=
IgrNaV6PssLZ-2FZzyRMV4-2BSwlzlFYQWLvxVwXJBggy6llypQM-2BYRpLfCryvEgw3-2BYbl7=
qnt4TVKTt0RK0m5wWMwXK7DJDW2PhK3takdPnlejrQ-3D-3D'>Toolhouse Settings</a>.</=
p></footer><img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-=
2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF0GIqpOwe6b-2BSQHTKR9uNRXx-2F7VvrI96=
HwDvGIq4AaD82Qmdrty-2FFFKELiU0rTvTP8N5Ddl6sqfU5iGg8wL05oLkySAKFdMEM2kj1D-2F=
FdyYfacM0g91BtLjFQtOjtnXgp6Nec-2F1loLxyeqgHI6YFuBsqBCxqIVMTgxJolxR0I958IpOM=
3Pqr8wzGx2k8E-2FOgTvjk-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" s=
tyle=3D"height:1px !important;width:1px !important;border-width:0 !importan=
t;margin-top:0 !important;margin-bottom:0 !important;margin-right:0 !import=
ant;margin-left:0 !important;padding-top:0 !important;padding-bottom:0 !imp=
ortant;padding-right:0 !important;padding-left:0 !important;"/></body></htm=
l>
--564a0be141bcfb5ffd85a8655068baabf878c6e22171dae359d46a5fa004--
