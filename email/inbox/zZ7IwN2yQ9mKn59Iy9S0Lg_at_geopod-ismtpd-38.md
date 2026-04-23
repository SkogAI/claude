Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:94cc:b0:ac7:e5d6:90a7 with SMTP id dn12csp656518ejc;
        Sat, 5 Apr 2025 10:31:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjssysqEBBOmhxSz6w/5fB1WAHxjlISXXM4EdQwvBrMHSokcov+uDdsAsXQB1OjcizJTch
X-Received: by 2002:a17:902:f547:b0:215:ba2b:cd55 with SMTP id d9443c01a7336-22a89a24248mr81829715ad.2.1743874264639;
        Sat, 05 Apr 2025 10:31:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743874264; cv=none;
        d=google.com; s=arc-20240605;
        b=f6wEIahW0TV378qkufI3W18c/zBWwkBe+hIGMRTpOrihPesnD+UNxKVhqUkpcA4Hnt
         mIJXa6kIG08/lDXTZvJi3EAvQFiVPiDFVSZyGWrDKM1VO8YQIwBs+EKZ+8gOFTmck4jM
         eEzdWnJnK1nV9n6QrL9DybbXbJhdP+WkbU53jODYRoREG5THTA9B4vOKw4wXSGEVHqgg
         cPOE03WcdOLNJOlCEVHRTfbOkMR9z5rxLQKFHVv16knDONDyimtxhI5Ex/fUBgWZ/jWY
         J6fr5o+X58g+bJY/dH8uiuYxYcS0R4wgI0LuhwKvsm2W8fw05IpLq9PU096ufQT0ZNd3
         08fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=S0VpTZovGNElvDzbwFVZTbFYnjfGVBXKmFoRAzv7kdM=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=P8gYWJJpptONyWjzc6AnuhfZbsYGTKtkiDRlBzhgFw/4kqccyuNlYlHjvNZwnuq9Dw
         L9PpaIm8zkF4dyiouIKzucT0RiZZLnKvLrGO4FWHzg3UM800ifvCId87M8r0pbdRR+0p
         MHbKFFdDVWt/F3uUV5Cgz6iuuKQzrkEwpperkdIIOELgLDg59kF1vsw00azIN92c0/G4
         TaT8QSd1fcAWeDQkpnq9d14Imj1jXFVnhrsk/O8lm0V5Nsglncd9gokuAAcuRDUTDzaL
         lx2Ow9OuMZKQF+fV15fLezgDmOdM47EFXDBzqZG4wF0ifXf45jbfAINSCmOiqX1ZGDlN
         BJmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=GAFa823m;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=EZBJBfkv;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwknhz.outbound-mail.sendgrid.net (s.xtrwknhz.outbound-mail.sendgrid.net. [167.89.18.14])
        by mx.google.com with ESMTPS id d9443c01a7336-2297894db10si71429665ad.87.2025.04.05.10.31.04
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Apr 2025 10:31:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) client-ip=167.89.18.14;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=GAFa823m;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=EZBJBfkv;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=S0VpTZovGNElvDzbwFVZTbFYnjfGVBXKmFoRAzv7kdM=;
	b=GAFa823mgaW6rq5n4Mf1PFv7vMjEBwmIi1Izt3cwq59J8c/uQG5rbi76xBbAZN1nnLMQ
	nuAzaAAa/akMPOjXeJGej6uTJdmml5Vhmgqp7+0uBIb3wwxvRlCsMJPY7wyX6WPI8LPu7a
	zpRWsC2L+dTsdLF+4vNsCmZzjxB+dsZ2hUnHthxHAYpTwIO4XBg5Oq3oLqxQFMZ0IosB01
	nMAFH0dl25b7lCh04yFAbotgUf5bgxsAbn8agbwQpGRf2KmVLRdtzINSQbhbS05Fen/zZ9
	j7lxwxLOxeVhmNH6yyvQ69FYs+mJxxU2Nu9zVIXCvjhzpJSmaGQ1n+rNofT4eglQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=S0VpTZovGNElvDzbwFVZTbFYnjfGVBXKmFoRAzv7kdM=;
	b=EZBJBfkvH+AuEAg2IcP8CcQ67YZE+IyD0G4IEBCKeLPm/po2h85FAA+7QAR7z655RdoU
	9UwWMjiO4PdJ/MTLOR8NHsazxkZdnnZvqM9U94zzcmaa+AfydMCjJdJpR/5x5TWnhP4KbH
	68/PoJ5zLrkzkjpbtzp2ExSoA6aEBqUQc=
Received: by recvd-75dd47d6d-88m5v with SMTP id recvd-75dd47d6d-88m5v-1-67F168D7-33
	2025-04-05 17:31:03.469859455 +0000 UTC m=+1031027.545679318
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-38 (SG) with HTTP
	id zZ7IwN2yQ9mKn59Iy9S0Lg
	Sat, 05 Apr 2025 17:31:03.442 +0000 (UTC)
Content-Type: multipart/alternative; boundary=7307adbf7481747ba7d2765077cfbc96bad6d20aeaaa0f97c56144759d12
Date: Sat, 05 Apr 2025 17:31:03 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <zZ7IwN2yQ9mKn59Iy9S0Lg@geopod-ismtpd-38>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n5sOAh1q8bs1r5lk?=
 =?us-ascii?Q?t=2FcKsggj6Jcn31dsCgSQA+=2FHQ3jtSfQJhs6f91H?=
 =?us-ascii?Q?AuYDuf=2F9Jv7v+mIzkwjmSKSN9=2FNQBU6UqUlz2RF?=
 =?us-ascii?Q?9Ik70S2uhW878d+dY3ld7Wgq6nFNCwzx+Z6=2FZwh?=
 =?us-ascii?Q?ba+vt2eYEAukR95umfzEnq+KRtBNYcvHvjy0Yt2?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: aLyStQL4nD0L

--7307adbf7481747ba7d2765077cfbc96bad6d20aeaaa0f97c56144759d12
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest
1. A Vision for WebAssembly Support in Swift
This article discusses a proposal for enhancing WebAssembly support in Swif=
t, aiming to improve cross-compilation and broaden the language's appeal in=
 various environments. The proposal highlights the importance of security a=
nd performance in WebAssembly, and outlines a roadmap for future developmen=
t.
Top Comments:
Some users expressed skepticism about the feasibility of the proposal, citi=
ng current issues with Swift tools.
Others highlighted the potential benefits of first-class WebAssembly suppor=
t for development outside the Apple ecosystem.
Concerns were raised about the influence of Apple on the future of Swift.
2. Show HN: I built a word game. My mom thinks it's great. What do you thin=
k?
This article introduces a new word game that challenges players to unscramb=
le words based on various themes. While the game has received positive feed=
back, some users noted that the sports-themed puzzles may not resonate with=
 an international audience.
Top Comments:
Players appreciated the concept but suggested making the game more internat=
ionally friendly.
Feedback included suggestions for improving the user interface and gameplay=
 mechanics.
Some users shared their experiences with similar games and expressed intere=
st in future updates.
3. Loader's Number
This article delves into Loader's number, a concept generated by a C progra=
m that aims to produce the largest possible output on a theoretical machine=
 with infinite memory. The discussion includes the challenges of defining s=
uch large numbers and the implications for computational theory.
Top Comments:
Users engaged in a technical discussion about the implications of Graham's =
number and the challenges of writing a program that meets specific criteria=
.
Some found the concept intriguing and shared their thoughts on the nature o=
f large numbers in computational theory.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--7307adbf7481747ba7d2765077cfbc96bad6d20aeaaa0f97c56144759d12
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html>
<body>
<h1>Your Hacker News Digest</h1>
<h2>1. A Vision for WebAssembly Support in Swift</h2>
<p>This article discusses a proposal for enhancing WebAssembly support in S=
wift, aiming to improve cross-compilation and broaden the language's appeal=
 in various environments. The proposal highlights the importance of securit=
y and performance in WebAssembly, and outlines a roadmap for future develop=
ment.</p>
<h3>Top Comments:</h3>
<ul>
<li>Some users expressed skepticism about the feasibility of the proposal, =
citing current issues with Swift tools.</li>
<li>Others highlighted the potential benefits of first-class WebAssembly su=
pport for development outside the Apple ecosystem.</li>
<li>Concerns were raised about the influence of Apple on the future of Swif=
t.</li>
</ul>

<h2>2. Show HN: I built a word game. My mom thinks it's great. What do you =
think?</h2>
<p>This article introduces a new word game that challenges players to unscr=
amble words based on various themes. While the game has received positive f=
eedback, some users noted that the sports-themed puzzles may not resonate w=
ith an international audience.</p>
<h3>Top Comments:</h3>
<ul>
<li>Players appreciated the concept but suggested making the game more inte=
rnationally friendly.</li>
<li>Feedback included suggestions for improving the user interface and game=
play mechanics.</li>
<li>Some users shared their experiences with similar games and expressed in=
terest in future updates.</li>
</ul>

<h2>3. Loader's Number</h2>
<p>This article delves into Loader's number, a concept generated by a C pro=
gram that aims to produce the largest possible output on a theoretical mach=
ine with infinite memory. The discussion includes the challenges of definin=
g such large numbers and the implications for computational theory.</p>
<h3>Top Comments:</h3>
<ul>
<li>Users engaged in a technical discussion about the implications of Graha=
m's number and the challenges of writing a program that meets specific crit=
eria.</li>
<li>Some found the concept intriguing and shared their thoughts on the natu=
re of large numbers in computational theory.</li>
</ul>

<footer>
<p>This email has been sent by Toolhouse. You can change your delivery pref=
erences at <a href=3D'http://url1228.toolhouseai.com/ls/click?upn=3Du001.du=
okMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswUDYJ_=
zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmCDJopnlIEBgnDvCGoj4L2N8ijKlcsZ6=
ylalfB6J6dGwUfyaiKd-2BuPhzdVYnBRDQ5MU6yOZGaE6anJW-2FXVvJwSEN0UNjFgr6yjCgU6z=
EuDwA4-2BnvWbQWyUPqHQvTX8tt02feQyjGqiAEZAKL3LAH7XDqnyIHDZf61kttDPaKSRIbg-3D=
-3D'>here</a>.</p>
</footer>
<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GIS5HODdcHD9qHse4QsRfoJRA88jI-2BpBUxctx93ooKG=
0uCaZTUFP-2F3gnFoPWnxTWORiqWs6omL2jRwQZHZOkUnEob7-2BmKMUW-2F6B2k5wwHBwAmcjc=
2PiQjC2ckAWdOGiyM7qXNuCn8x0yV3jY96MkQaHNyXOAVwqEQtVp1zg00PpTZxq-2FEIfoV1e5-=
2BCvY130LGk-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"hei=
ght:1px !important;width:1px !important;border-width:0 !important;margin-to=
p:0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-=
left:0 !important;padding-top:0 !important;padding-bottom:0 !important;padd=
ing-right:0 !important;padding-left:0 !important;"/></body>
</html>
--7307adbf7481747ba7d2765077cfbc96bad6d20aeaaa0f97c56144759d12--
