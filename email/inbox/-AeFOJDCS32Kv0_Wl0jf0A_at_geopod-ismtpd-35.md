Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:94cc:b0:ac7:e5d6:90a7 with SMTP id dn12csp127307ejc;
        Fri, 4 Apr 2025 10:31:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4BsYO9gbKZVgrcGQDJOmqJa4fcwpbJb4Fvb8NVGJ6AsQ8blUm/xbKH75NJ9X/3IE/M39C
X-Received: by 2002:a05:6a21:6d8f:b0:1f5:7f56:a649 with SMTP id adf61e73a8af0-20107eefec1mr5276020637.13.1743787888816;
        Fri, 04 Apr 2025 10:31:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743787888; cv=none;
        d=google.com; s=arc-20240605;
        b=gD1vLU+D8OPAtg/Dl9X7jyORVPo1lYdHXQQEm727/naNhnoR4ExKoGqzwnI94pgAtt
         HK/+XupaoP3LEERlDdCUmzqwa5OP2PNcZZBUOiON54DoiAgCwqI/DgbNfMCzq9pxUvBZ
         kLTIhX4VENMO+uWfONnDBHbME1ZGIy0X5OOD/z4O47CvCuKYnvZBZ/6bIh5ozZRlhkda
         Wj3WML9WShcEob4eFbecTIUML6JHItVp4Gi3MpmJ7zu4+a+YsUKCc90GtZrnV+fvr2z+
         odqZ6lR2EhnrGeaUXTEeTeF4RKE6r54ab7BB8BxZZ7MNDB/lZhBGh3hchDD1e4YhYBbc
         M4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=E+PLj3GD04zAKwgXDHP+DF2993+6AXBcSD32dUwjc5E=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=czQrxXPCXulF7uVljsDjUj28YbbIaM6S3GPUum6uTrmpeBAqi0Qvm+Ej09u+6ZAhyh
         YLwtkqUY5LgryxmB0ZL/rztsQFcR7vUti2t0Z4uH3GmmWUAKzIl5gYEt5KV2vcQHsuyw
         aj4iB8rnwM5E9reJiA0ZfpDFmSKTUymkWEYwkFrFCfCqYmGRN38P3TfR42P4LXhIR0vx
         SXt0Pn5cHGFQuhJbE/x528GQANQlTfgUsRAHuN2FS+p4Qz/Xb03vkg0NYrAUEmuLG6H3
         6iItVUH07qzsHj9BkKUzE9D/PebnpsTWKnqDrJA/pTf66zrQE1lI2/ba21CGR2Lo/tBu
         2Ebg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=IRKGk0Ro;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=QuJpN2fq;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhss.outbound-mail.sendgrid.net (s.wfbtzhss.outbound-mail.sendgrid.net. [159.183.224.102])
        by mx.google.com with ESMTPS id 41be03b00d2f7-af9bc3f6fa3si4754123a12.272.2025.04.04.10.31.27
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 10:31:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) client-ip=159.183.224.102;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=IRKGk0Ro;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=QuJpN2fq;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=E+PLj3GD04zAKwgXDHP+DF2993+6AXBcSD32dUwjc5E=;
	b=IRKGk0RoNpV/YJeFfZJGD+8xT5788DvqEDOmRZyjqDyCGo2wIa36wUiimz1hhN1uOVMO
	jlxTtj9vY5ibiqBrc7gTICf+Q+bdDlTh8uSP6oZt4eZW3pAzIyfOv70AhnavayGvOlEy+r
	3kTgJCuijgIZVwqGmeIISy/2SCaOm7cI6sDqdfDZV6v3rLYNEQpIxZQ5xLEvBCZ9HHsDpU
	znjs597weFmfTvnD1GFNkqI2cQI8H2vp1Lfn3BWy2NoXVE+xrfTi1lzpB9bBJ3s6cVGiM3
	xlZCwN6s6v8x6V8xQUKSQYsGBq9w/RTOltdp0Wptl80jsT4e0zOjahXHBMRRSMyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=E+PLj3GD04zAKwgXDHP+DF2993+6AXBcSD32dUwjc5E=;
	b=QuJpN2fqOvvsAFV+pwcpYCCtJfplfhvFFsEbBzhQzCWWck6AAPGLZwiEGBNxlP0Th4W3
	tW27UqHYpfGjwG/bCHcU0xTpFpxxgHxDp1LNeyaw1fHP53sLMDHxZYgOjG/T5NlEvWG0oU
	dw/YbNS9o0slLyKiy8UgHiGfHbLmMJs+0=
Received: by recvd-8856c7f54-kcb8s with SMTP id recvd-8856c7f54-kcb8s-1-67F0176D-57
	2025-04-04 17:31:25.427397406 +0000 UTC m=+874756.403816479
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-35 (SG) with HTTP
	id -AeFOJDCS32Kv0_Wl0jf0A
	Fri, 04 Apr 2025 17:31:25.401 +0000 (UTC)
Content-Type: multipart/alternative; boundary=b76ff59df2694d9ce2bcc85b0e37a50d8ece18e5ed90e94cac20534b9062
Date: Fri, 04 Apr 2025 17:31:25 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <-AeFOJDCS32Kv0_Wl0jf0A@geopod-ismtpd-35>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n5z4z2CF2uGhr7vZ?=
 =?us-ascii?Q?7Ie1JPiy1vpJOBpg2HXAevNq1mVQCijC24p2oXU?=
 =?us-ascii?Q?0G8scida4OBjTqOocK0ve3w3Y9LGeLWy2WJxn5T?=
 =?us-ascii?Q?CynIhxSN99M3ioDEhALYT3BVrpdOMD4UxsBPddJ?=
 =?us-ascii?Q?H4M1eEJMll31wXPI+uTg=2Fanw=2FdVCRm3CzWBUxl+?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: w2RYr5IOwvF4

--b76ff59df2694d9ce2bcc85b0e37a50d8ece18e5ed90e94cac20534b9062
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest
1. Kerosene did not save the sperm whale
This article discusses the fascinating biology of sperm whales and the hist=
orical context of their hunting. It argues against the common belief that k=
erosene saved sperm whales from extinction, highlighting that the demand fo=
r whale oil continued to rise even after kerosene became popular. The autho=
r emphasizes the need for government intervention to protect these magnific=
ent creatures.
Top Comments:
Many commenters agreed with the author's perspective, noting that the narra=
tive around kerosene saving whales is misleading. They discussed the broade=
r implications of technology and conservation, emphasizing the importance o=
f government action in protecting endangered species.
2. An image of an archeologist adventurer who wears a hat and uses a bullwh=
ip
This article explores the cultural phenomenon of AI-generated images, parti=
cularly those mimicking the style of Studio Ghibli. It critiques the lack o=
f originality in AI outputs, which often default to well-known characters l=
ike Indiana Jones. The author raises concerns about the implications of AI =
on creativity and the potential for homogenization of artistic expression.
Top Comments:
Commenters expressed mixed feelings about AI art, with some arguing that it=
 democratizes creativity while others lamented the loss of unique artistic =
voices. Many noted that the AI's tendency to reproduce popular characters r=
eflects a deeper issue in the creative industry.
3. The Curse of Ayn Rand's Heir
This article delves into the life of Leonard Peikoff, Ayn Rand's intellectu=
al heir, and the contradictions within Objectivism. It discusses the person=
al and philosophical struggles Peikoff faces, particularly in relation to h=
is family's dynamics and the legacy of Rand's teachings.
Top Comments:
Readers reflected on the irony of Objectivism's principles clashing with Pe=
ikoff's life choices. Many highlighted the tension between individualism an=
d the need for community support, questioning the practicality of Rand's ph=
ilosophy in real-world scenarios.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--b76ff59df2694d9ce2bcc85b0e37a50d8ece18e5ed90e94cac20534b9062
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html>
<head>
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; }
        h1 { color: #333; }
        h2 { color: #555; }
        p { margin: 0.5em 0; }
        footer { margin-top: 2em; font-size: 0.8em; color: #777; }
    </style>
</head>
<body>
    <h1>Your Hacker News Digest</h1>
    <h2>1. Kerosene did not save the sperm whale</h2>
    <p>This article discusses the fascinating biology of sperm whales and t=
he historical context of their hunting. It argues against the common belief=
 that kerosene saved sperm whales from extinction, highlighting that the de=
mand for whale oil continued to rise even after kerosene became popular. Th=
e author emphasizes the need for government intervention to protect these m=
agnificent creatures.</p>
    <h3>Top Comments:</h3>
    <p>Many commenters agreed with the author's perspective, noting that th=
e narrative around kerosene saving whales is misleading. They discussed the=
 broader implications of technology and conservation, emphasizing the impor=
tance of government action in protecting endangered species.</p>

    <h2>2. An image of an archeologist adventurer who wears a hat and uses =
a bullwhip</h2>
    <p>This article explores the cultural phenomenon of AI-generated images=
, particularly those mimicking the style of Studio Ghibli. It critiques the=
 lack of originality in AI outputs, which often default to well-known chara=
cters like Indiana Jones. The author raises concerns about the implications=
 of AI on creativity and the potential for homogenization of artistic expre=
ssion.</p>
    <h3>Top Comments:</h3>
    <p>Commenters expressed mixed feelings about AI art, with some arguing =
that it democratizes creativity while others lamented the loss of unique ar=
tistic voices. Many noted that the AI's tendency to reproduce popular chara=
cters reflects a deeper issue in the creative industry.</p>

    <h2>3. The Curse of Ayn Rand's Heir</h2>
    <p>This article delves into the life of Leonard Peikoff, Ayn Rand's int=
ellectual heir, and the contradictions within Objectivism. It discusses the=
 personal and philosophical struggles Peikoff faces, particularly in relati=
on to his family's dynamics and the legacy of Rand's teachings.</p>
    <h3>Top Comments:</h3>
    <p>Readers reflected on the irony of Objectivism's principles clashing =
with Peikoff's life choices. Many highlighted the tension between individua=
lism and the need for community support, questioning the practicality of Ra=
nd's philosophy in real-world scenarios.</p>

    <footer>
        <p>This email has been sent by Toolhouse. You can change your deliv=
ery preferences at <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMsw9ArV_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmDH-2FcJZ8Ix7AgbPJDFt5=
KpCWptKeCMq-2B4SW8ROW-2FjfLUdVWzNNneGQ-2BGtnlq5I2O46gg2iq1cvQKy98uWzKv0T1s1=
sSOboUjqUb0KWWDr0WLtgaijdqzKKIhpChOFWDo00oRvFrunfrFpj0zdWTvSb8FeskIKRS1FrZD=
R6a67TU8w-3D-3D">Toolhouse Settings</a>.</p>
    </footer>
<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GKm42-2FAsiqpzqMscy-2FGLDahPc88hg1MPr6iJrLvEv=
koPK75qn3ORzijTcq2QtQHIBM1dMB6HUJCbujqmw-2F-2BnL-2FQyhEDnu-2FdSZQRbLeV0O-2F=
xe12PehTA9UGqFrsVekLNpaiLC4MKpbgY7xhIt-2Betkbm40NDDXG2krE1-2FYz91-2FHDKvkBq=
3FKuD3LE00-2BIePGcJLQ-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" st=
yle=3D"height:1px !important;width:1px !important;border-width:0 !important=
;margin-top:0 !important;margin-bottom:0 !important;margin-right:0 !importa=
nt;margin-left:0 !important;padding-top:0 !important;padding-bottom:0 !impo=
rtant;padding-right:0 !important;padding-left:0 !important;"/></body>
</html>
--b76ff59df2694d9ce2bcc85b0e37a50d8ece18e5ed90e94cac20534b9062--
