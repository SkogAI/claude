Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:940e:b0:ac7:e5d6:90a7 with SMTP id dk14csp3220190ejc;
        Wed, 23 Apr 2025 10:31:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJKI2kfqNPMCu5ZMjY9/C+ymtSpywmyBzIBxwaRjyJGT4Ln15Un2m342JkSqkcBG2sCOZf
X-Received: by 2002:a17:902:d589:b0:224:1157:6d26 with SMTP id d9443c01a7336-22c53573b4amr342843975ad.4.1745429466038;
        Wed, 23 Apr 2025 10:31:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745429466; cv=none;
        d=google.com; s=arc-20240605;
        b=GD1zULlFExGjBJdLIUOGx6U+tn5xGk4JQ9n5KDLLtPSQbIlSUeOOI5tZN2O0TKRey7
         z6dL9gJ47R5IF3H4u0PWHV/YkV8qMr5iNT4owEmembgLEK66eUnjkCQNXesMWRID61Sm
         rzcZ81j1Z2nWs3IKOqUp7aMwRBG/UrJ+ARINifYLkHvLyJMUWxkx/Prc+gtNvA+KOteC
         CjTlfxOyub82sjzrBdkp5EtJ56MamLrPkuGDKx7jxwIALzWnBWnOI/un9nYGc0x+05w/
         o0EMFgFAp96f0vWl+yPfJ9s3dGOGxtq4cjBt1CbOKGwJZ5O0N3sYnzpcydht9Rr06eIO
         0kIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=kdaUxp5BDgaHRNyiNs85eg+KU9c7lpMX1iU+C3n0PLI=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=ZGBDUuMTMAkAR7YvE/9pVi1cnz62lj/5QRAD4H2HEyRH7LWkS/rUqmB6pgPTl0FiJr
         25+2M78uj48JMn2E+Vl7PoTA9qD1hUEwSiknVWwPiCdlcpPIx2HokB3JW/jrdauFCPoh
         VYfDkfRJyYftE5NzB+NyXQoHhsFqLjYAueF9Qq5uDYg7te+n7qcj6JWX0jTDkQqjUCeo
         7qXCphWskCTiJLJKcipunalVShxsl7S3g7Y5NlmrSG56X7eVYuf5IAcgFvqxCQjaFtbl
         6FrGaCz3nskGaeC1PSJxfsoFn/Ck1ymWemVSaiznru7E2OGqezoDBY+RDPGyBKuakg3E
         JNKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=UjDEmwuw;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=lNbiTkz2;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhss.outbound-mail.sendgrid.net (s.wfbtzhss.outbound-mail.sendgrid.net. [159.183.224.102])
        by mx.google.com with ESMTPS id d9443c01a7336-22c50bd7cdcsi188879655ad.147.2025.04.23.10.31.04
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 10:31:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) client-ip=159.183.224.102;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=UjDEmwuw;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=lNbiTkz2;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=kdaUxp5BDgaHRNyiNs85eg+KU9c7lpMX1iU+C3n0PLI=;
	b=UjDEmwuw2xiEYtARaWmmm+IAhTWiMfaWcNFoPcQskzWSfGEujABQQgWJGt1EOAN7928J
	PXtMVDQ85BWU+IxI8hp+KmdzpxDgf4td6R/DM0Yo3K6mIxOLQV59RblW+mdtXW3wXt+X0P
	A6uPPTyifmJ/XZ/u/Iq6CzPTC4kBX6NF7Sny96su9lTYCo/SNFHbcUxXrqVx12lh0epzV7
	UlA++LKwLqw3QQQnn9+tvc58U+6E2deaObxfeZ1AGIzLZQM5FAGId+S+2jVdjV1ckRBpTG
	Gn1998ScPIbZCuQ16GY4uHHVCC/POsWP5qtXx4y7j8g+bAMcXgt9qhHFrh6fe7zA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=kdaUxp5BDgaHRNyiNs85eg+KU9c7lpMX1iU+C3n0PLI=;
	b=lNbiTkz25fkuThwzzADOkXLlYLF/GIixmhXKmiSK0AvEt2aOF7m5eSIx/GzHBsIhMCWp
	67pB1N4kLGvxodhOz/gOWDk3o62UYBH1jhOtRHJBM3aoBbaOw5Iov0kl3Xhjk2E2ld5H9I
	lFzNthMIRJg4aBzrhRA5MGZHYB+NlbwAo=
Received: by recvd-6884bf9dd7-62656 with SMTP id recvd-6884bf9dd7-62656-1-680923D6-5E
	2025-04-23 17:31:02.783138478 +0000 UTC m=+1279337.861448243
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-7 (SG) with HTTP
	id DOQG12urTnSFs2uRNf8Eqw
	Wed, 23 Apr 2025 17:31:02.712 +0000 (UTC)
Content-Type: multipart/alternative; boundary=aa6c3dcdfdf500c3db5caf2f06976205ecd286006d04405beb5b1d79602a
Date: Wed, 23 Apr 2025 17:31:02 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <DOQG12urTnSFs2uRNf8Eqw@geopod-ismtpd-7>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n5y=2FBH5JSRbtiI2s?=
 =?us-ascii?Q?=2F3ayPHKIGmEAu9vt3yNEXhqesYATP84zJU2r2BA?=
 =?us-ascii?Q?9pWc7D8zpDCoacN8x3EYxr134GmZeoNwem3KK84?=
 =?us-ascii?Q?Md7Io0rSggWVMZTThuckVmr3dDlcRxTzYdtpPAJ?=
 =?us-ascii?Q?FQ1W8CNbnCkDSIK+vmEW4w6BWQLQMFD6nPryd65?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: 1i20rbmaVCY5

--aa6c3dcdfdf500c3db5caf2f06976205ecd286006d04405beb5b1d79602a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0

Your Hacker News Digest
1. How a 20 year old bug in GTA San Andreas surfaced in Windows 11 24H2
This article discusses a bug in the game GTA San Andreas that was triggered=
 by an update to Windows 11. The bug caused a specific plane, the Skimmer, =
to not spawn in the game. The author investigates the root cause, which inv=
olves uninitialized variables and changes in the Windows operating system t=
hat exposed this long-standing issue.
Top Comments:
Many users praised the technical depth of the article.
Some expressed curiosity about the changes in Windows that led to the bug.
Others discussed the implications of undefined behavior in programming.
2. AI Horseless Carriages
The author reflects on the current state of AI applications, comparing them=
 to early motor cars that mimicked horse-drawn carriages. The article criti=
ques how many AI tools fail to leverage the full potential of AI, often res=
ulting in subpar user experiences.
Top Comments:
Readers shared their frustrations with AI applications that feel tacked-on.
Some suggested that AI should be used to enhance user experience rather tha=
n replicate old methods.
3. Launch HN: Cua (YC X25) =E2=80=93 Open-Source Docker Container for Compu=
ter-Use Agents
This article introduces Cua, a framework that allows AI agents to control o=
perating systems within lightweight virtual containers. It emphasizes secur=
ity and performance, particularly on Apple Silicon, and invites feedback fr=
om the community.
Top Comments:
Users expressed excitement about the potential applications of Cua.
Some discussed the importance of security in AI automation.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--aa6c3dcdfdf500c3db5caf2f06976205ecd286006d04405beb5b1d79602a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8
Mime-Version: 1.0

<html>
<head>
    <style>
        body { font-family: Arial, sans-serif; }
        h2 { color: #333; }
        p { line-height: 1.6; }
        footer { font-size: 0.8em; color: #777; }
    </style>
</head>
<body>
    <h2>Your Hacker News Digest</h2>
    <h3>1. How a 20 year old bug in GTA San Andreas surfaced in Windows 11 =
24H2</h3>
    <p>This article discusses a bug in the game GTA San Andreas that was tr=
iggered by an update to Windows 11. The bug caused a specific plane, the Sk=
immer, to not spawn in the game. The author investigates the root cause, wh=
ich involves uninitialized variables and changes in the Windows operating s=
ystem that exposed this long-standing issue.</p>
    <h4>Top Comments:</h4>
    <ul>
        <li>Many users praised the technical depth of the article.</li>
        <li>Some expressed curiosity about the changes in Windows that led =
to the bug.</li>
        <li>Others discussed the implications of undefined behavior in prog=
ramming.</li>
    </ul>

    <h3>2. AI Horseless Carriages</h3>
    <p>The author reflects on the current state of AI applications, compari=
ng them to early motor cars that mimicked horse-drawn carriages. The articl=
e critiques how many AI tools fail to leverage the full potential of AI, of=
ten resulting in subpar user experiences.</p>
    <h4>Top Comments:</h4>
    <ul>
        <li>Readers shared their frustrations with AI applications that fee=
l tacked-on.</li>
        <li>Some suggested that AI should be used to enhance user experienc=
e rather than replicate old methods.</li>
    </ul>

    <h3>3. Launch HN: Cua (YC X25) =E2=80=93 Open-Source Docker Container f=
or Computer-Use Agents</h3>
    <p>This article introduces Cua, a framework that allows AI agents to co=
ntrol operating systems within lightweight virtual containers. It emphasize=
s security and performance, particularly on Apple Silicon, and invites feed=
back from the community.</p>
    <h4>Top Comments:</h4>
    <ul>
        <li>Users expressed excitement about the potential applications of =
Cua.</li>
        <li>Some discussed the importance of security in AI automation.</li=
>
    </ul>

    <footer>
        <p>This email has been sent by Toolhouse. You can change your deliv=
ery preferences at <a href=3D'http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMswgf9r_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmAf72wtQvXipPXAD6EuRNs=
rEjwATt8Y8-2BRX5SrZrzj-2BE9jNwI1kk7LO2AP0VNkec2M7BRRhRBMuTVPq2nnBRNjY-2Fhs4=
Cng1rqWyJ-2FKZiS-2BzBrltVhGzXRdeL9xYDWmODSO1kZK94Vpyv-2BR3kWo3-2BMp-2FaSXdf=
D12g5Nj9eJcu3kwzg-3D-3D'>Toolhouse Settings</a>.</p>
    </footer>
<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GJ7EujClB80URYTcAQWVdbIuU02mzhyQS6TcmNMwPHe9T=
VW5-2BAj2RltwyYLWPNzzCbry3pIejTAgu-2FdKGY3KoTkyHH1ySmtati8IH37MzZWK-2B0LBQ4=
reL8rmwrBaFDmQXzjVvkshGc6VyOD7RF-2F0lH3n8-2FLsbH7iCaWdSWnvA0oTBXKQkaLDTiiva=
2CDNaBKks-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"heigh=
t:1px !important;width:1px !important;border-width:0 !important;margin-top:=
0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-le=
ft:0 !important;padding-top:0 !important;padding-bottom:0 !important;paddin=
g-right:0 !important;padding-left:0 !important;"/></body>
</html>
--aa6c3dcdfdf500c3db5caf2f06976205ecd286006d04405beb5b1d79602a--
