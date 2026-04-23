Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:906:9fcc:b0:ac7:e5d6:90a7 with SMTP id hj12csp445478ejc;
        Tue, 29 Apr 2025 10:43:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxdAOgMCqS54WJEzemL7n4PvXWfm/zE8um/mnXWDwc4H16xyyhxmxvxr+YcwI1Pekhjio8
X-Received: by 2002:a05:622a:124f:b0:477:6e8d:6081 with SMTP id d75a77b69052e-4886b144534mr65398001cf.3.1745948599598;
        Tue, 29 Apr 2025 10:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745948599; cv=none;
        d=google.com; s=arc-20240605;
        b=Tfdpxuk7r3UJ4QiNcB9ChFa3t3iIdIWsRd09WNBfg7TG98OnpNKBvsn8clhT6M+YdN
         Pawz9H9K0SgIvaqb35vVd5qqw9+AZ7cKSCGa5sXXHa5s4O4i0xFIOhnf6iYwhpkS6tHB
         ul52YSLE2m4Jgm7vdHCfmiVSQcoHJSAXLL7ajhMt76HxoADakO4ODAapQTJ9eY9a+eVt
         4gMB7fp7pMKMS87BewrNsBMTtNdxPweqwe8XL0aw/VENAKkzzq8BDp7TuXVo6xEVUe0s
         y0NxHJ8FLOzeW9u6HC3REwXVrqO8jLRS2GrmFaBf/XUX2xsUWq/Dt2Aj2aZAhiPLoxtA
         U07Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=+SWWmIhn7cfW+i6WldEVJCpCmhe7MpDTtUvvesX8fmA=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=Kh29t5Yhha334o3OSf9Z44WiP8Tz1v0VPjgc3nR9pEgJfP1ukbtdKhScIw/HpvRr0w
         AjAllGfYRrL+0cu6AffEwyS21h37+Cp70+xiW61UH2VQ28GI+BoIhwz0UOVm5fkR1UBd
         Vzm9OT2PXHx0WLsl/IIu1NFT6RSelRNuUFssds9px7mxsQmJ9NXV/rjrTryg+Cj6QxxU
         5P6cuPG22UWu+0fHZjUTMofjHNzAafSDZw8OG9sC7SIa4fN5KfqSg8iGxd1tBRWNe3vh
         xvHJ5VX37VjjGK5K08DByvDF5lwinppKuMk21C1dh1zJbgKUO/H09yLZhRnvhRYenBgq
         2lDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=iRn3GSNA;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=kqGo8h8K;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwkqxb.outbound-mail.sendgrid.net (s.xtrwkqxb.outbound-mail.sendgrid.net. [167.89.20.171])
        by mx.google.com with ESMTPS id d75a77b69052e-47ea1f8a17esi137627141cf.357.2025.04.29.10.43.19
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 10:43:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) client-ip=167.89.20.171;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=iRn3GSNA;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=kqGo8h8K;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=+SWWmIhn7cfW+i6WldEVJCpCmhe7MpDTtUvvesX8fmA=;
	b=iRn3GSNAgMt3j6gfUoFA+oeg17fguN1SRMfkWnnS4VrVqYiv69Gg+hn3Clnqo578EMBy
	7il5SvEmllW1/sOD3hwmRl2OxNExm0spdggFiI3H/gMIBonrP3Kmpb3PEDbE99hlV7akRe
	Yy8Qg7CyC02uDqGkB8DV3oAalpfff78h7lYVCuShH1VKF8a+ScBdGdj7RW/AkRdTBMJruW
	YAuSM0yv/khse76rt+Ii85Ica8qK3G7TRZ3D6RChQiIJANSbZuEjjvySqCHcudZ3G0fG0S
	COHy5uMOyuS9lYMrveA+5vro+ylJ2lkR7t7oLDt2rEMnAFrBO/lmsdi+zgKmh1CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=+SWWmIhn7cfW+i6WldEVJCpCmhe7MpDTtUvvesX8fmA=;
	b=kqGo8h8KZQ3JrsCSsfLOuhYOMVAIXn6RVhQk9DTrAfd8T/7gsIZ7VRir2H8r0GQPIEow
	rpUROW5jBZxCPxjA5UnIug4naMW8sc3KQ5x9zQj68PEXMKdEJC7PAURIbTYe7mAj89boDL
	qsEt3W/RKl4kr1PnIOdEllgGCFf2yeAL4=
Received: by recvd-57d69887f8-c9vwr with SMTP id recvd-57d69887f8-c9vwr-1-68110FB6-85
	2025-04-29 17:43:18.908910351 +0000 UTC m=+1798496.324084543
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-31 (SG) with HTTP
	id UyEtWB_gQ7G8JTL5SfTcPw
	Tue, 29 Apr 2025 17:43:18.903 +0000 (UTC)
Content-Type: multipart/alternative; boundary=ddcde93df2691e0671dc12adda8f3186d3e7a416d740fe43f91fb07becd8
Date: Tue, 29 Apr 2025 17:43:18 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <UyEtWB_gQ7G8JTL5SfTcPw@geopod-ismtpd-31>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n73Zb1h+rkCL9XFd?=
 =?us-ascii?Q?4cefTdw4VFxiJ4rWOBYvx7pwBbe1CGszKNK70qW?=
 =?us-ascii?Q?B0tk7jLh+A9OtrGC9KnDLh4HIEC=2FTWVeXOZcImG?=
 =?us-ascii?Q?iXy2NLvWUZ6cqKN4vkqAiv9oOzVBrv4x8j2A5RR?=
 =?us-ascii?Q?04jwV8BJDnxJyD5PRMbP1O3iVHIu87rLlDCQ1s+?=
 =?us-ascii?Q?A=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: jjPzUrAtgJmc

--ddcde93df2691e0671dc12adda8f3186d3e7a416d740fe43f91fb07becd8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Hacker News Digest
1. O3 beats a master-level GeoGuessr player, even with fake EXIF data
The article discusses how the O3 model managed to outperform a master-level=
 player in GeoGuessr, despite using web searches, which some consider cheat=
ing. The comments reflect a mix of admiration for the AI's capabilities and=
 skepticism about its methods, with many debating the implications of AI in=
 gaming and reasoning.
2. Bamba: An open-source LLM that crosses a transformer with an SSM
This piece introduces Bamba, a new model that combines transformer architec=
ture with state-space models (SSMs) to improve efficiency and performance. =
The comments highlight the potential of Bamba in various applications, with=
 some users sharing their experiences and thoughts on the future of AI mode=
ls.
3. ArkFlow: High-performance Rust stream processing engine
ArkFlow is presented as a powerful stream processing engine built in Rust, =
offering various features for data handling. The comments discuss the pract=
icality of stream processing versus batch processing, with some users shari=
ng their experiences in the industry and debating the necessity of complex =
architectures.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--ddcde93df2691e0671dc12adda8f3186d3e7a416d740fe43f91fb07becd8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html>
<head>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; }
        h2 { color: #333; }
        p { margin: 0.5em 0; }
        footer { margin-top: 2em; font-size: 0.8em; color: #777; }
    </style>
</head>
<body>
    <h2>Hacker News Digest</h2>
    <h3>1. O3 beats a master-level GeoGuessr player, even with fake EXIF da=
ta</h3>
    <p>The article discusses how the O3 model managed to outperform a maste=
r-level player in GeoGuessr, despite using web searches, which some conside=
r cheating. The comments reflect a mix of admiration for the AI's capabilit=
ies and skepticism about its methods, with many debating the implications o=
f AI in gaming and reasoning.</p>
    <h3>2. Bamba: An open-source LLM that crosses a transformer with an SSM=
</h3>
    <p>This piece introduces Bamba, a new model that combines transformer a=
rchitecture with state-space models (SSMs) to improve efficiency and perfor=
mance. The comments highlight the potential of Bamba in various application=
s, with some users sharing their experiences and thoughts on the future of =
AI models.</p>
    <h3>3. ArkFlow: High-performance Rust stream processing engine</h3>
    <p>ArkFlow is presented as a powerful stream processing engine built in=
 Rust, offering various features for data handling. The comments discuss th=
e practicality of stream processing versus batch processing, with some user=
s sharing their experiences in the industry and debating the necessity of c=
omplex architectures.</p>
    <footer>
        <p>This email has been sent by Toolhouse. You can change your deliv=
ery preferences at <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMswBIYS_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmAar-2BQw17Ur3e5npG-2B=
1wPr-2FN3pVeTINfqmOKmIbn1EzRgA3G62b77RQrAv7N5pQgt24vUOUWmsD7G4Dzjnc4kDXnPsY=
lkVa-2BFmcCwaccMsWE49yUZm3DymEQoHnX1fWSbv7KUIuko2bkUwUX0udfvcHRAYPJ8ubHuyiv=
jYFFPyetA-3D-3D">Toolhouse Settings</a>.</p>
    </footer>
<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GL6dvH9XDj45P5D6vZQLL6TuHDs-2BVgvBqy059dDA0v3=
H4sWUgtDefKgSMVLrxIUzfeQh4FxgFY-2FZRzma-2F4h9JJdrZIwh9VjdQLsdhubZWNmi0Bky6M=
6Xj5dFkxn7lBBe7b2EL1z7kfYlm3nvZzTz9hE9PEnfFftiaffVdVRAg2NINVDvNA-2BSeQwCN9r=
f2eLdbU-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:=
1px !important;width:1px !important;border-width:0 !important;margin-top:0 =
!important;margin-bottom:0 !important;margin-right:0 !important;margin-left=
:0 !important;padding-top:0 !important;padding-bottom:0 !important;padding-=
right:0 !important;padding-left:0 !important;"/></body>
</html>
--ddcde93df2691e0671dc12adda8f3186d3e7a416d740fe43f91fb07becd8--
