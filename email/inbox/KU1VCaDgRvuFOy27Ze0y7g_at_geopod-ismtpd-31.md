Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:940e:b0:ac7:e5d6:90a7 with SMTP id dk14csp4560549ejc;
        Fri, 25 Apr 2025 10:31:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHasCakf8TyCOHZIhGWtxTL91TBwtbU3k7oi2w6X5OHDaRq1Yy+62VphhTfFUGFi0bzc2DX
X-Received: by 2002:a05:6602:27c6:b0:861:d8ca:3587 with SMTP id ca18e2360f4ac-86467ad5258mr35647039f.4.1745602303168;
        Fri, 25 Apr 2025 10:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745602303; cv=none;
        d=google.com; s=arc-20240605;
        b=Ni/Wjxscv4xibbR2ieXr2GZ87jFs8wMag/xN/qONUKolLf5uxCDreACj+uv4wHFku2
         srrhauNXeo2B0forIwA+dC3INt3HMBT4Pjuro4VowK30boNgomMSbDvwbp/aqdJa1XsD
         5wILVcuNZn82Lx2puFbLA2u5GP7ABFfzuDe0fWaUnqkA5t8gSbxHZyyX4kdCpzLLIrYl
         BB0Kk3qZorwXwYHxJuK1kWFd6Gyz4LqEkYy3HABDuzqujNTGR2iKD1a5Iv6WpmsaI4bg
         NcbeFRc7d41u/hjgr1ioFGHAEfqHne9f0jqk6nTB0XgE11nGCQXrW53k9pwGOkKHSWkV
         U+RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=5UtH6FbZi5jebYgk/kDjrobSO2gFk3PqHH7CHXVc0hc=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=Vx144ZJfCgNSs9eFgVcrjsb+6I70+sbhhXgM6KJpiXEhaLCasH/oxoxWEVr/WdRITj
         atvou7v7f99eUJcBcKGZRAlXRRhiNsyA1BtLMtzIHF86zS3qr5wjme7Z3rwt17FljDhV
         BdDm9B+jUofeR7koyUiCX3BixM6Oisq5OZjxatdkTrpbJSqF77siNTYkJ2eoYiXqwjPX
         kGEJK8nbSMsksvSaDctwMYYSz5arrX56aHeycdPUplyu/a+s7bJwrNJTGA2VPpfbdfwH
         FXnlnNJh3+TXF1PKwE4t2K8ycC8eng6XBN5S2/UEdSTqS/GyLiiMaEeHn7CLQUNwsMkz
         Zxug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=Xj+Vyd38;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=sVbkXUeH;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.40.80 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwnvrh.outbound-mail.sendgrid.net (s.xtrwnvrh.outbound-mail.sendgrid.net. [167.89.40.80])
        by mx.google.com with ESMTPS id 8926c6da1cb9f-4f824bc07e6si4305464173.145.2025.04.25.10.31.42
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 10:31:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.40.80 as permitted sender) client-ip=167.89.40.80;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=Xj+Vyd38;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=sVbkXUeH;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.40.80 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=5UtH6FbZi5jebYgk/kDjrobSO2gFk3PqHH7CHXVc0hc=;
	b=Xj+Vyd38Ly8Fh1ZRWLyDMLnXUiqw73L67tgKd18jFGnftrATWN6XSImgrfwoClVrfCgB
	C20IDfvdNLjPKk5o7XXhMtBIP3fPGTOVLbasa54yng8zEJ0mVDmKa5KopKTlE3wnc18TbT
	CLzzDR82KHdz5DaEZ7y+nPFoZoLi9Jt0AAn9JZFm3jgGkaOAWbwvMG3BZ/A2jbpjwy5MbS
	b0Jed6wPVPqZqnbvbw2LBnAjdOMa64Db6tV9UXE8FGvGZx4Jw7AiGDWN1SP8SmX/4+XW92
	VSLDML8vrsUnjmrKN8Q/FG6nJ+Wx/tHmYpx8lghbnucqKv9bvJRf2+0/s92PpMWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=5UtH6FbZi5jebYgk/kDjrobSO2gFk3PqHH7CHXVc0hc=;
	b=sVbkXUeHSAwjZGjOkdh0E3GKOVRKjLp7SgfnmtzGeqz219X5suXKkWfcZ44XO62d8Kwt
	1Py5YJtRSmY3bixCi91udJVS1vFoxTWpoIgfgnzFTPfwm8AflnPzIjmz4X9w5O1TZmOH4W
	sXV6gaClQHccLLvB+lhS33TrcEPn0ADMI=
Received: by recvd-545d4d4647-vzpdq with SMTP id recvd-545d4d4647-vzpdq-1-680BC6FE-4C
	2025-04-25 17:31:42.425796512 +0000 UTC m=+1452221.855940009
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-31 (SG) with HTTP
	id KU1VCaDgRvuFOy27Ze0y7g
	Fri, 25 Apr 2025 17:31:42.411 +0000 (UTC)
Content-Type: multipart/alternative; boundary=59d79be1677f7e5e016317319cf4dca87b60294f4d8984270dbad0725189
Date: Fri, 25 Apr 2025 17:31:42 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <KU1VCaDgRvuFOy27Ze0y7g@geopod-ismtpd-31>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n6A2iYVmXDBS8D9M?=
 =?us-ascii?Q?v9iKQjWe0pyksM2qUqoLPixTAZCzGmRCZJr=2FDUS?=
 =?us-ascii?Q?5GQmCoBmlrkeLhacaF+DFxTumPCS4pAnVfhNqla?=
 =?us-ascii?Q?4A8oXLwq5oS=2FEY624gyk+aYgHPnYFid4mzTGbT4?=
 =?us-ascii?Q?0AjA7NLcg+j1aHOZ0mQlhfCyGgggm7fQJaKBo3L?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: C94Xz/UlEebC

--59d79be1677f7e5e016317319cf4dca87b60294f4d8984270dbad0725189
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest
Your Hacker News Digest
1. A Paean to Programming
This article discusses the beauty and intricacies of programming, emphasizi=
ng its artistic aspects. It highlights how programming can be both a scienc=
e and an art form, encouraging readers to appreciate the craft.
Comments Summary:
Comments were generally positive, with many users agreeing on the artistic =
nature of programming. Some expressed that the narrative oversimplifies the=
 challenges faced by programmers.
2. They Criticized Musk on X. Then Their Reach Collapsed
This article analyzes the New York Times' report on Elon Musk's alleged sup=
pression of conservative critics on X (formerly Twitter). It suggests that =
the decline in reach may be due to algorithmic actions rather than direct i=
ntervention.
Comments Summary:
Commenters had mixed opinions, with some supporting the article's claims wh=
ile others felt it lacked evidence. The overall sentiment was skeptical of =
Musk's direct involvement.
3. Abusing DuckDB-WASM To Create Doom In SQL
This article describes a project that implements a simplified version of th=
e game Doom using SQL queries within the DuckDB-WASM database. It showcases=
 the creative use of SQL for game development.
Comments Summary:
Comments were largely enthusiastic, with many users appreciating the innova=
tive approach. Some noted the educational value of the project, while other=
s questioned its practicality.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--59d79be1677f7e5e016317319cf4dca87b60294f4d8984270dbad0725189
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html>
<head>
    <title>Your Hacker News Digest</title>
</head>
<body>
    <h1>Your Hacker News Digest</h1>
    <h2>1. A Paean to Programming</h2>
    <p>This article discusses the beauty and intricacies of programming, em=
phasizing its artistic aspects. It highlights how programming can be both a=
 science and an art form, encouraging readers to appreciate the craft.</p>
    <h3>Comments Summary:</h3>
    <p>Comments were generally positive, with many users agreeing on the ar=
tistic nature of programming. Some expressed that the narrative oversimplif=
ies the challenges faced by programmers.</p>

    <h2>2. They Criticized Musk on X. Then Their Reach Collapsed</h2>
    <p>This article analyzes the New York Times' report on Elon Musk's alle=
ged suppression of conservative critics on X (formerly Twitter). It suggest=
s that the decline in reach may be due to algorithmic actions rather than d=
irect intervention.</p>
    <h3>Comments Summary:</h3>
    <p>Commenters had mixed opinions, with some supporting the article's cl=
aims while others felt it lacked evidence. The overall sentiment was skepti=
cal of Musk's direct involvement.</p>

    <h2>3. Abusing DuckDB-WASM To Create Doom In SQL</h2>
    <p>This article describes a project that implements a simplified versio=
n of the game Doom using SQL queries within the DuckDB-WASM database. It sh=
owcases the creative use of SQL for game development.</p>
    <h3>Comments Summary:</h3>
    <p>Comments were largely enthusiastic, with many users appreciating the=
 innovative approach. Some noted the educational value of the project, whil=
e others questioned its practicality.</p>

    <footer>
        <p>This email has been sent by Toolhouse. You can change your deliv=
ery preferences at <a href=3D'http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMswxe60_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmAA5uuZn-2FsdREa0BaPw6=
KshTtNkfOq2jA3UP8kwUSgPODJP-2BfTUM3D1JKoJib-2FTCdC8QwYkn2Z1sw3CqTNjUta6pbcE=
cBbhRMPKXYSYEgteC-2FM5ZJNf8ztguE-2Fdm-2B8QyNK1OxvMunak1k8exoPO6kw-2BDay7EV6=
jXSgAGbn35iNscw-3D-3D'>here</a>.</p>
    </footer>
<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GK-2F0-2FyC2Mc8j2cXRk0A86TwOUES5lJN3n5qy-2BMs=
tglCE2ID5kLBlhOaJICeD643eFbFth1iuK5ds5zKpEkelo-2FTl42flStx1cL-2BgkNP6hS3mj2=
V6lmPUQFVs5-2BBTvPQc8LnXqGcLhmQMax7Sew7A1IS59oPx733qbXC-2Bc3qIokZ4W8RG2YwF8=
mVmpIDW72LsIg-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"h=
eight:1px !important;width:1px !important;border-width:0 !important;margin-=
top:0 !important;margin-bottom:0 !important;margin-right:0 !important;margi=
n-left:0 !important;padding-top:0 !important;padding-bottom:0 !important;pa=
dding-right:0 !important;padding-left:0 !important;"/></body>
</html>
--59d79be1677f7e5e016317319cf4dca87b60294f4d8984270dbad0725189--
