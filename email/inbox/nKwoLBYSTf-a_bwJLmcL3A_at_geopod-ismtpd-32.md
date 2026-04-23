Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:94cc:b0:ac7:e5d6:90a7 with SMTP id dn12csp2305880ejc;
        Tue, 8 Apr 2025 10:30:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGizMZnUJVCVzlTxuDSvkrdVK8qOyFVDZ+iJl/K0f9HUPXH7/y41Yk2CkLy0aMgK8q+xt+p
X-Received: by 2002:a17:90b:5747:b0:2ff:7c2d:6ff3 with SMTP id 98e67ed59e1d1-306dbc3bd0emr58873a91.35.1744133448062;
        Tue, 08 Apr 2025 10:30:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744133448; cv=none;
        d=google.com; s=arc-20240605;
        b=IQ9FsYFca2HT8p9YiarKyzhkGc21gZOfML8NN6b5aUG5ZXue8AdmzhCJaomiHWN2kB
         Zo9ZO6nr4IVW+HpajHZjKTYwYVFdVd1KVC7pcSK4Ub11t9kmpn0IGC3DV6k680VjAYMI
         gTErU97PYkLkyMUSEqoWvByyimTxwYfP4ACYB3/sN3ZpgzJ7Kout/vhe2rzQLuJybTMR
         uY1G2MFehZCAeJnMXBwXVvdA8+IbbAU2d4fPWsGCJ+HOOfQ+vH9/zChX0wmmCeuaRWto
         grJ7n/28zMUhbxwbV3gDMVoV2fmj9XcfaOjymN+lbRZTdzlwslhMerPZJ0UVw0GfQPug
         DFQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=56cuFdLjXqrOojKiwAFRY+yL6SlLXBAve2nwtKQeN4s=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=Zweu1nkxTwpi9lLPbqKyyiMEmtRv4UmxZhmBgNHCnj1zZYSQfIzatkZg1GKmyKF0cD
         Dfq/wO2EY9hmBwlu4mDlTU0PDurNz16I+mrGUxPenSqALVz3Ly4eup4VndLRG26rVoz7
         0ALYH2y4dvXJXiXvJGgBlaS5bLdfAtfHDAMY9PQpqyjluBy9BwxTKGeTRiM1nP4YlSzD
         QQy2wpqfW9z1o3UsnHvu8mzSgbk3MVqV69W5BKq3NH/DUunmLFiztWTo5WbE1ncFD+uL
         My7pzuSaDuXy8I0UL+38YrG3l9dz6xR18ac3yhi8KAppI1GJMB8MU+2AoLZvbCiYLci5
         DbUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=atjWxiZ9;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=sLQdaLsf;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwknhz.outbound-mail.sendgrid.net (s.xtrwknhz.outbound-mail.sendgrid.net. [167.89.18.14])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-3056f83b6e2si16698165a91.45.2025.04.08.10.30.47
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 10:30:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) client-ip=167.89.18.14;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=atjWxiZ9;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=sLQdaLsf;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=56cuFdLjXqrOojKiwAFRY+yL6SlLXBAve2nwtKQeN4s=;
	b=atjWxiZ9rccGe6sOIUXsBjABPK29nfQ+2Dt6r0FO0x4Jxn0IdCQuVaB4SRelKskpFK0K
	5f2SgHstlywGyjybWo7UXJjCoaGPeDFurICLzcaN0mhtIHxxtBk8jUn6PA6dAu3Cn/nh68
	Juas0119VnAVQvkPt0d7fN8IifWXdfhEwjYumqpSI5aLqw1XWO5R1W/tlnRQ7kb3jlpCVu
	PE7hNBreJxajs0M5XcyFNXiwBqLz3r8/U3C5Sk9v48a8ZggqKzg1fMTZJrYGwF1ffF5MVZ
	RxqsNaPU+vPpzxXzcyFsGQ5KcF39LsrAascYL+5ja6raJoMz30orhIfL7r/F411Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=56cuFdLjXqrOojKiwAFRY+yL6SlLXBAve2nwtKQeN4s=;
	b=sLQdaLsfIpFdNP1IsrywcoPLlUPMHEBpmtdqxvuPVQ3L2IyEouz1T69MfCw11O+h7azZ
	UT99j68+SV0DiyJFy+Yia866IpK+tquUm+33FtG9ax/aWPvuxrXiNJzO78ci6pbOjQePvA
	Rcw6uE+Jn8OJIc/nn5rPSSWxGVjzQKYg4=
Received: by recvd-8856c7f54-gt5rm with SMTP id recvd-8856c7f54-gt5rm-1-67F55D46-38
	2025-04-08 17:30:46.898178953 +0000 UTC m=+1220322.463791669
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-32 (SG) with HTTP
	id nKwoLBYSTf-a_bwJLmcL3A
	Tue, 08 Apr 2025 17:30:46.867 +0000 (UTC)
Content-Type: multipart/alternative; boundary=21eb42ad056ed375e9c6cfd7f1f6994b351d66a86f90cc970f7b20dafbe4
Date: Tue, 08 Apr 2025 17:30:46 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <nKwoLBYSTf-a_bwJLmcL3A@geopod-ismtpd-32>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n5=2FAsT98YJkJY+3N?=
 =?us-ascii?Q?Z2ninhb=2FeXUc6VB419gJ34QoXOSe4P1tlu7ZK22?=
 =?us-ascii?Q?hSU=2FwOtVHr2au7+yGKygxS=2F=2FtfAiWsWeOQLwwWV?=
 =?us-ascii?Q?4AylUiIllz5pb6neWbNTgFDLlfRyEY2s366qSU1?=
 =?us-ascii?Q?CARCM5gnV75XPgVEUgKmMMTUI6lS9WaAjOsggMp?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: 1vL40DhWKi4U

--21eb42ad056ed375e9c6cfd7f1f6994b351d66a86f90cc970f7b20dafbe4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Hacker News Digest
1. Connecting an IBM 3151 terminal to a mainframe
This video discusses the IBM 3151 ASCII terminal from 1987, highlighting it=
s unique features such as block mode, which allows for autonomous user inpu=
t handling. The creator has developed a C program to connect the 3151 to an=
 IBM mainframe, enabling its use as a 3270 terminal.
Comments Summary: Viewers expressed appreciation for the nostalgia and tech=
nical insights, with many sharing their experiences with vintage computing.
2. Middle-aged man trading cards go viral in rural Japan
A trading card game featuring local middle-aged men has gained popularity a=
mong children in Kawara, Japan. The game aims to strengthen community ties =
by showcasing local heroes, encouraging kids to engage with their elders an=
d participate in community activities.
Comments Summary: Many commenters praised the initiative for fostering inte=
rgenerational connections and community spirit. Some expressed concerns abo=
ut gender representation, while others celebrated the positive impact on lo=
cal youth.
3. HNSW index for vector embeddings in approx 500 LOC
This project presents a C++ implementation of the HNSW (Hierarchical Naviga=
ble Small Worlds) algorithm for nearest neighbor search in vector embedding=
s. The code is concise and efficient, utilizing modern C++ features.
Comments Summary: The technical community appreciated the clarity of the ex=
planation and the practical application of the algorithm, with discussions =
on its efficiency and potential use cases.
This email has been sent by Toolhouse.
Change your delivery preferences at Toolhouse Settings.
--21eb42ad056ed375e9c6cfd7f1f6994b351d66a86f90cc970f7b20dafbe4
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
    <h3>1. Connecting an IBM 3151 terminal to a mainframe</h3>
    <p>This video discusses the IBM 3151 ASCII terminal from 1987, highligh=
ting its unique features such as block mode, which allows for autonomous us=
er input handling. The creator has developed a C program to connect the 315=
1 to an IBM mainframe, enabling its use as a 3270 terminal.</p>
    <p><strong>Comments Summary:</strong> Viewers expressed appreciation fo=
r the nostalgia and technical insights, with many sharing their experiences=
 with vintage computing.</p>

    <h3>2. Middle-aged man trading cards go viral in rural Japan</h3>
    <p>A trading card game featuring local middle-aged men has gained popul=
arity among children in Kawara, Japan. The game aims to strengthen communit=
y ties by showcasing local heroes, encouraging kids to engage with their el=
ders and participate in community activities.</p>
    <p><strong>Comments Summary:</strong> Many commenters praised the initi=
ative for fostering intergenerational connections and community spirit. Som=
e expressed concerns about gender representation, while others celebrated t=
he positive impact on local youth.</p>

    <h3>3. HNSW index for vector embeddings in approx 500 LOC</h3>
    <p>This project presents a C++ implementation of the HNSW (Hierarchical=
 Navigable Small Worlds) algorithm for nearest neighbor search in vector em=
beddings. The code is concise and efficient, utilizing modern C++ features.=
</p>
    <p><strong>Comments Summary:</strong> The technical community appreciat=
ed the clarity of the explanation and the practical application of the algo=
rithm, with discussions on its efficiency and potential use cases.</p>

    <footer>
        <p>This email has been sent by Toolhouse.</p>
        <p>Change your delivery preferences at <a href=3D"http://url1228.to=
olhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFl=
AYjazfEAqUm0-2FD2kMX-2BcmQdjMswnkW8_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteM=
D12SmAma5ygsehqCpLXwQGH08jS6BHKKtFcbJkpTEpENVUMtSNRKiLbE117N6r7y9wXEXnLh953=
GMp4E-2F4eqpvKE-2FuVSo7R-2Bvp4xuvzWTf9kuY-2BdIazGiypUlSHGFYzWyNJNCpdbbUuLv8=
jxrdrkbVtXpTXqOZWKd7eBnl2ikhWxtQp3w-3D-3D">Toolhouse Settings</a>.</p>
    </footer>
<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GLYyrWiwB7Zj86zTIbbF-2BUcCCz79UhW-2BOHQteoUPM=
DlTkginUw10CTc5q2-2Fm-2Fodb8oXWQ9h7-2F-2BWQDaIzqL5DmVNCkRkB-2FC5fAaVqd4Dl0D=
Pd47bP9VBewa2Tw9oxjnR0VY0uqwWSQJGzm-2BsYhRD-2Bnw4sjfqDX9DxanNPw4SQIdhu2MLKO=
7MVaduifj1sfym75s-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=
=3D"height:1px !important;width:1px !important;border-width:0 !important;ma=
rgin-top:0 !important;margin-bottom:0 !important;margin-right:0 !important;=
margin-left:0 !important;padding-top:0 !important;padding-bottom:0 !importa=
nt;padding-right:0 !important;padding-left:0 !important;"/></body>
</html>
--21eb42ad056ed375e9c6cfd7f1f6994b351d66a86f90cc970f7b20dafbe4--
