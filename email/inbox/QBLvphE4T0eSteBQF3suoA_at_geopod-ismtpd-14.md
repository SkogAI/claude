Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:906:6206:b0:abc:2b0f:5fd9 with SMTP id si6csp606513ejc;
        Sat, 22 Feb 2025 09:31:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9gBftFfI3U+OM+DSviIk57Q363MPgrYtnzMh3RjXZuhzcsoGeSc/zzGP5L01loD5x4043
X-Received: by 2002:ac8:7f8e:0:b0:472:2bc:8763 with SMTP id d75a77b69052e-47222cf522cmr107295081cf.17.1740245479511;
        Sat, 22 Feb 2025 09:31:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740245479; cv=none;
        d=google.com; s=arc-20240605;
        b=bs4vCBy2Ba9enxbcVKFcSdl8dlaTEgY7kXZ//jXE5EuK0j6vXn1JFAPMc1TWeVD7sC
         6ga8dblGDcCeSVjb2bxdsJErcopUtxbK75QQSU/NNksgQXF+OOhxPny2bPCgSx8ZP1pz
         ydsvvSAuuZ/9/p41LdaLNf07HM28CsMfTRoZsuzwUFj+RU2Jl7B5quzCz0/BD9dFFLMp
         SUoJM8rEyyx9zfZGhq9gOKEIzGtdD7vg7PFwKN/+bVxuYA+g5P5iPHlelPVIUTEccPaq
         eGpzA0NY0hUvCacxTJkhRFvokm44qUhDJggOrAs7m2TbiFiTnAtKoJGAIdYRvIauutYC
         fS2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=R7+pbktWkKiuo4Hu8MGqAeWrWim0PVxUH+SDW/CibqM=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=d0RKfX3RNzJveyZrAlSpnVj5lQAZeBHCKOimQrl69Zk17vdH7BeLaLNWni36LC61yq
         kpkVXrLoRFYtH1YjmQXKL3i+sh/FV1XfZOQUxY4hTk7XgU1PrIBe86RHpD89bsqElnYT
         idOhmnFystLD8aXhrjHzOP9NIVu9L6VG6eXJBexMkKKUELFYQw+4yNNigRD065fjOVb/
         157u15WycYkZts5dHY8lGH4afYAdFI83EGYYhEG6R0KX/KQ+Aquw6fSFvI1iE0t2lQAq
         SEqk8riynt9SWRoiWYFN04x4DEBhfGVwb0KuoeAe7HBy5kPquyfMuMAxd1WxCREzXyjO
         flow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b="yQLe2X/X";
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=U1O7XIoH;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwkqxb.outbound-mail.sendgrid.net (s.xtrwkqxb.outbound-mail.sendgrid.net. [167.89.20.171])
        by mx.google.com with ESMTPS id d75a77b69052e-471e980e85dsi128538761cf.159.2025.02.22.09.31.19
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2025 09:31:19 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) client-ip=167.89.20.171;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b="yQLe2X/X";
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=U1O7XIoH;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=R7+pbktWkKiuo4Hu8MGqAeWrWim0PVxUH+SDW/CibqM=;
	b=yQLe2X/XHxaoAbJPthjd0oSNhZM7o9Zf4f6qx5HY5tiXzrMumrlS31kWh6QU7jfYM3PE
	qCa/61IeWIJ6YJB8j4fGj+84UdqrkaOn587n8GmCNnTKpQwEPZiONyGdbJAFok15jd8Wkr
	8z138NTrPeCbDNXQbp4veH2s4Y0hZjjsSzWvlaW1jLkBvEjrNZnejGhrHJXKPnrz6qx+Ea
	ztxWji6Fm7YFivw5LsVMRtcbQiq0Ck+Zh72ffeLwIfhKh4SQwQldoPzgJUhIltKVDP+xou
	b314wFDGV2jNOqgcjz5ZdWhchLTSNufCKzqVlez0WoepzxzsVNYsH3QasDcZiwHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=R7+pbktWkKiuo4Hu8MGqAeWrWim0PVxUH+SDW/CibqM=;
	b=U1O7XIoHofu2zrPjwNB/dKPMinEte7r28P40TjwUGSfYayrj0fxYnrBVoNV5fOf1V75D
	QnsAiEsF4wE0GjijQd1QWHZthCsBE/z4SpGQ7HAxPmoa7D79Q5hqfgfriyX9HdnEEivrrE
	nOxjaYLhvZvmBAA3pNnYhSnLwO95BxH3Q=
Received: by recvd-69cbc48b94-n2vpp with SMTP id recvd-69cbc48b94-n2vpp-1-67BA09E6-23
	2025-02-22 17:31:18.953510472 +0000 UTC m=+8626044.657677292
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-14 (SG) with HTTP
	id QBLvphE4T0eSteBQF3suoA
	Sat, 22 Feb 2025 17:31:18.863 +0000 (UTC)
Content-Type: multipart/alternative; boundary=dba3eb5350bfcfa74723df59b26f2ba4835ac31403756a2e766b77fc3599
Date: Sat, 22 Feb 2025 17:31:18 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <QBLvphE4T0eSteBQF3suoA@geopod-ismtpd-14>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n5fvGcNxv3z8pqpu?=
 =?us-ascii?Q?mmXdXzMXAIzdIKYWNDqn=2FoHVCc1GfWx2dsVyOc5?=
 =?us-ascii?Q?Pwu7o5AOFqWzH7qvCDb5P5Vjj3qMlCiaGqhxrwU?=
 =?us-ascii?Q?66mMEX4uiTiM5ymMhKVObdv0dz8a2fmJqNlVz7j?=
 =?us-ascii?Q?GBTFZ5hx72yky4vSvFjXkUWl=2FaxPdzW1Ink213=2F?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: sOv6Qf4pOAmU

--dba3eb5350bfcfa74723df59b26f2ba4835ac31403756a2e766b77fc3599
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest
Unfortunately, I was unable to retrieve the latest articles and comments fr=
om Hacker News due to technical issues. Please check the Hacker News websit=
e for the latest updates.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--dba3eb5350bfcfa74723df59b26f2ba4835ac31403756a2e766b77fc3599
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><p>Unfortunately, I was unable =
to retrieve the latest articles and comments from Hacker News due to techni=
cal issues. Please check the <a href=3D'http://url1228.toolhouseai.com/ls/c=
lick?upn=3Du001.duokMj2A9CmwqP6J5tp-2BOy85ZAQig46O0Rb-2BEW4GD5mcp-2Fdm5EoDf=
uYaMJTIpyB60aqM_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmAIiV5jkrM-2FFir=
Tv0W8drnVDq08E-2BhH4P7mdFWoXO9irRet-2FKwH9BOy9pxiQaxTAzbeRaKPXVn-2BlkQk0BaJ=
-2BnuHvXr6d0GTAWbcO15LFKaa9CBLZJOnVlWGH6FKyDbV7AILBYF0fjLh-2F4hlKXbCamPkOd7=
c-2BiH08-2BfsDuG1KYVKkA-3D-3D'>Hacker News</a> website for the latest updat=
es.</p><footer><p>This email has been sent by Toolhouse. You can change you=
r delivery preferences at <a href=3D'http://url1228.toolhouseai.com/ls/clic=
k?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-=
2BcmQdjMswUitG_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmAIiV5jkrM-2FFirT=
v0W8drnVDq08E-2BhH4P7mdFWoXO9irbQWR6McKwAQJw-2FzhCBqLt5oFtMOZZ0kjtT-2BVaRgz=
VEncChxA4unCAQHjnGaYRgPKd1JsMYTT6r3UNRLzJwDGJ7POJhevMF-2BNr2LfevJvledxQ-2FW=
HpOIZcaS3iW6jbt3Ww-3D-3D'>Toolhouse Settings</a>.</p></footer><img src=3D"h=
ttp://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513J=
hjX8oSKm62DliywF0GL-2Bg-2FoqyZrldiQQuRdlPzQ-2F6u2lihtZXl8sXpy5tVxI3P3HHl7sS=
kTgviPQFzD-2FwD1d4RWgiI593waZO5Mn1rs7Gmnv9-2Bp7QY-2BPBl5AXVVRW-2FbZudtjFwQj=
vHbVPqZfO0maitRniu-2FnYVDqziAEqu39UXlq3s7LpQ6DEsYOfJlIzDY4UdBhm0wtIYHEs7R-2=
FF78-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px=
 !important;width:1px !important;border-width:0 !important;margin-top:0 !im=
portant;margin-bottom:0 !important;margin-right:0 !important;margin-left:0 =
!important;padding-top:0 !important;padding-bottom:0 !important;padding-rig=
ht:0 !important;padding-left:0 !important;"/></body></html>
--dba3eb5350bfcfa74723df59b26f2ba4835ac31403756a2e766b77fc3599--
