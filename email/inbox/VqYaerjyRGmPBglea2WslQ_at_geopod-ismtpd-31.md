Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:7fa3:b0:ac6:bce4:fa68 with SMTP id qk35csp3090106ejc;
        Tue, 1 Apr 2025 10:31:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwE23Jwc/heFpTo5Vb/K8wxyKp+l7DBIkdEQysiCIyMvPmnCNoP6AaqYWKKX8LLhsDCHo1
X-Received: by 2002:a05:6e02:4401:20b0:3d6:cb9b:cbd6 with SMTP id e9e14a558f8ab-3d6cb9bcef2mr26134595ab.13.1743528668195;
        Tue, 01 Apr 2025 10:31:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743528668; cv=none;
        d=google.com; s=arc-20240605;
        b=XHYHS0xwf57iuLviylNDmyt0y6GOeMcRwkWkQe1x/pU91qT4FwKZ5JOoS4jGyjEF2Y
         oDwF6jq9bCrGs8MxA2sdRLAhR6+t1HLO4eQ2vLTpnw+kt+HpxAsCF5zWvER5lnLbmbDV
         mg3CFNHc2iZOYxsN89yfTP5RGP4ZLMuzW0240O/EdG8NEX9wNlcANWCeNfrJjt5mwiRC
         ohd+Ovo1bYow1QFaWrefIV79SJlLJu43ZzSU5nFPZh2/7zWinUgK4c9Cl6Gyx+gBmeKc
         ZbL7JV0Qft+Lks5nOhxMCZIsmsOvaUJdwDV2reguBV+4gK+K58WlDYtZj9olBL5gYluC
         /qJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=kdvLNirdNvnaR69U0ThAXgm8PqQ0tZU9XCKKODpGaPs=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=FUt3LALa0U+XW8+oqO2or1nYfKNEGoFGOHywT7oxiYYVgCbg4rX+d/NE/m3q+KXXmw
         cgdP0xNksUJe9NQ1Vy0NauT+/vuq0E2Z8SfQxHz+WPlnszM/goloPqxSGc9CobzBRb6U
         0v+FmDwV1YgUbkTUupRHtSWMYVO2ecoDnOR/9DeLv+pLWu9t815NiJ+TekN+QzahbQgr
         xCBAyae7BT5WUwm44eGnhPwlqK3Scx0FOYLcIzISVt2v3f3JlrO5eKhWoR0v1zhAOgUJ
         RaICqKiOlueAm6Hq+QRbLZxWQHiWEaZOuvun1+PcUth8IwOn2DhH3gy2w8NaWmhVmBQJ
         vLgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=Xq6YQbHZ;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b="P/0GCB+5";
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhss.outbound-mail.sendgrid.net (s.wfbtzhss.outbound-mail.sendgrid.net. [159.183.224.102])
        by mx.google.com with ESMTPS id e9e14a558f8ab-3d5d5b1d5fdsi96080235ab.155.2025.04.01.10.31.07
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 10:31:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) client-ip=159.183.224.102;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=Xq6YQbHZ;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b="P/0GCB+5";
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.102 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=kdvLNirdNvnaR69U0ThAXgm8PqQ0tZU9XCKKODpGaPs=;
	b=Xq6YQbHZ3aTgBHX8KnTav9DxYqKCpOFYCrbNqa7Jo6Jrvjke46iviFL9SuDpbaV5iTDy
	tW/24Mb/1prIlaMv+ml0TqQwtp5KJApZ1FtJ8+4ThwvLnZ0SPedEDhjNdyhw/TQGZyHehZ
	fX3OQWuTXslpGOVmlF3ztLFez/3X1KuQyWnKRph9fDOvWifH3iFKWRTDtJZGfu3H8KMNCn
	9F7bqA2e+GDRhJ96OOCUQKugbySAqAYt58dYcdUqfE9jcc5U3MrXjplK/tEYYImCKyuzem
	pEGas7dolAvI5fF0RvAkoYipMfrdiwqmRSBFdmo0vU5pdSHyzm/Qdmkdc3dRYElA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=kdvLNirdNvnaR69U0ThAXgm8PqQ0tZU9XCKKODpGaPs=;
	b=P/0GCB+5MLnjoGJupNowfJ1SPWuqvj3vWcVE5OlXApD6OZPC3ooYSX4M8v90Nwc2Ra9U
	CrXpafs4dUSKbDHQKABzAgxdZ+zF88c2vkcSy9UaGleHUrvEkOspaKBqMud3MmlbYpfIUU
	iAMqW1opYJL67ZzSqpFOD85jaLLFPXvUQ=
Received: by recvd-786d47b7ff-2w2cp with SMTP id recvd-786d47b7ff-2w2cp-1-67EC22D9-6A
	2025-04-01 17:31:05.913362743 +0000 UTC m=+11909386.899900188
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-31 (SG) with HTTP
	id VqYaerjyRGmPBglea2WslQ
	Tue, 01 Apr 2025 17:31:05.900 +0000 (UTC)
Content-Type: multipart/alternative; boundary=47301e15352684b4fa71a6093ce754ef7dc7c5ac13b3db8ab0668fccd0ba
Date: Tue, 01 Apr 2025 17:31:05 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <VqYaerjyRGmPBglea2WslQ@geopod-ismtpd-31>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n4TbZ0RsAheo2qMY?=
 =?us-ascii?Q?Cia34OPk2Irn5FE6gizFwHrBAUnjI0lZu2cK98T?=
 =?us-ascii?Q?vmRvqwxYo7wjR45qYLq+3Rk+zcR92GqPHQ42JoB?=
 =?us-ascii?Q?mtadRnKznp8TvNKo+VctpqrA+xbiwnkmzUm=2FxMm?=
 =?us-ascii?Q?AmRPJFuZjDxV41NCuA+WCMdyGqucUk58xBXW8KP?=
 =?us-ascii?Q?w=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: xPASx4PeU0Qo

--47301e15352684b4fa71a6093ce754ef7dc7c5ac13b3db8ab0668fccd0ba
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Electron band structure in germanium, my ass
This article humorously critiques the traditional understanding of the expo=
nential dependence of resistivity on temperature in germanium. The author s=
hares their frustrating experience with faulty equipment and the challenges=
 of conducting experiments in a university setting. They conclude that thei=
r efforts were largely a waste of time, highlighting the often absurd reali=
ties of scientific research.Top Comments:Many commenters shared similar exp=
eriences of frustration in lab settings, emphasizing the disconnect between=
 theoretical knowledge and practical application.Some highlighted the impor=
tance of creativity and critical thinking in scientific endeavors, despite =
the pressures of academic grading systems.2. Bletchley code breaker Betty W=
ebb dies aged 101
Betty Webb, a decorated World War II code breaker, passed away at the age o=
f 101. She was one of the last surviving members of the Bletchley Park team=
, known for her contributions to deciphering enemy messages. Tributes have =
poured in, celebrating her legacy and the impact she had on inspiring futur=
e generations.Top Comments:Commenters expressed their sadness at her passin=
g and shared personal anecdotes about meeting her at reunions.Many reflecte=
d on the importance of preserving the history of code breaking and the cont=
ributions of women in the military.3. A man powers home for eight years usi=
ng a thousand old laptop batteries
This article details the innovative project of an individual who has succes=
sfully powered his home for eight years using over 1,000 recycled laptop ba=
tteries. The system, which also incorporates solar panels, showcases a sust=
ainable approach to energy consumption and waste reduction.Top Comments:Com=
menters praised the ingenuity of the project while also raising concerns ab=
out safety and the potential hazards of using recycled batteries.Many expre=
ssed interest in DIY energy solutions and shared their own experiences with=
 renewable energy projects.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at this link.
--47301e15352684b4fa71a6093ce754ef7dc7c5ac13b3db8ab0668fccd0ba
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<h1>Your Hacker News Digest</h1><h2>1. Electron band structure in germanium=
, my ass</h2><p>This article humorously critiques the traditional understan=
ding of the exponential dependence of resistivity on temperature in germani=
um. The author shares their frustrating experience with faulty equipment an=
d the challenges of conducting experiments in a university setting. They co=
nclude that their efforts were largely a waste of time, highlighting the of=
ten absurd realities of scientific research.</p><h3>Top Comments:</h3><ul><=
li>Many commenters shared similar experiences of frustration in lab setting=
s, emphasizing the disconnect between theoretical knowledge and practical a=
pplication.</li><li>Some highlighted the importance of creativity and criti=
cal thinking in scientific endeavors, despite the pressures of academic gra=
ding systems.</li></ul><h2>2. Bletchley code breaker Betty Webb dies aged 1=
01</h2><p>Betty Webb, a decorated World War II code breaker, passed away at=
 the age of 101. She was one of the last surviving members of the Bletchley=
 Park team, known for her contributions to deciphering enemy messages. Trib=
utes have poured in, celebrating her legacy and the impact she had on inspi=
ring future generations.</p><h3>Top Comments:</h3><ul><li>Commenters expres=
sed their sadness at her passing and shared personal anecdotes about meetin=
g her at reunions.</li><li>Many reflected on the importance of preserving t=
he history of code breaking and the contributions of women in the military.=
</li></ul><h2>3. A man powers home for eight years using a thousand old lap=
top batteries</h2><p>This article details the innovative project of an indi=
vidual who has successfully powered his home for eight years using over 1,0=
00 recycled laptop batteries. The system, which also incorporates solar pan=
els, showcases a sustainable approach to energy consumption and waste reduc=
tion.</p><h3>Top Comments:</h3><ul><li>Commenters praised the ingenuity of =
the project while also raising concerns about safety and the potential haza=
rds of using recycled batteries.</li><li>Many expressed interest in DIY ene=
rgy solutions and shared their own experiences with renewable energy projec=
ts.</li></ul><footer><p>This email has been sent by Toolhouse. You can chan=
ge your delivery preferences at <a href=3D'http://url1228.toolhouseai.com/l=
s/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2F=
D2kMX-2BcmQdjMswaJRA_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmBLtpvvc8yI=
wqXd-2B6EkUf5bLQgqfPXcWUmULKH1mgv-2BB-2Bos8bHFe1A4Aak91i45jvSUYxwCDu5aG-2BK=
kNwDBFIAkow9AlJWsoYFRyPvFTYFiNPou7wy-2FQ-2BRbYLfiEUVnBYWRLGtS762qQtfkqLmTf4=
u0x0pz4xzBzjlCEkBDKHxpPg-3D-3D'>this link</a>.</p></footer><img src=3D"http=
://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX=
8oSKm62DliywF0GIbpec6n-2B1bG1S40f41c2RZZVdLVQZ2Bxs92lEqiTb9kS4VcbIEMsdVPrvr=
YUdKMeVYfuI-2Fz9oxTXNCLB6L9bj-2Bh2TZsJYGzTn4SsTR0SB-2BNp7GO7UkK-2FMVwILzGZe=
gF4E-2FhkxG-2Fk1u63dZbI41UIRlfEpzN4geeim37RU-2FcP9smLp3SJ-2FxD2wJY9WJi2iaJG=
s-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !i=
mportant;width:1px !important;border-width:0 !important;margin-top:0 !impor=
tant;margin-bottom:0 !important;margin-right:0 !important;margin-left:0 !im=
portant;padding-top:0 !important;padding-bottom:0 !important;padding-right:=
0 !important;padding-left:0 !important;"/>
--47301e15352684b4fa71a6093ce754ef7dc7c5ac13b3db8ab0668fccd0ba--
