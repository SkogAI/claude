Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:906:d554:b0:ac7:e5d6:90a7 with SMTP id cr20csp565688ejc;
        Thu, 17 Apr 2025 10:31:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhe0MLAtoPPH1uCe016IxPl/+dv9c/SJQ3FpVMy3DYIv6Ty0VKhTbFcjNnww3RPsDUZvtM
X-Received: by 2002:a05:6000:4313:b0:391:3d97:bd33 with SMTP id ffacd0b85a97d-39ee5b16677mr6570470f8f.13.1744911069808;
        Thu, 17 Apr 2025 10:31:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744911069; cv=none;
        d=google.com; s=arc-20240605;
        b=gWaAD5zoc0oUqC3cSwtszoBRNgLIJYQbWqRZG+GxLrSeT9meg3e+XM2Aj9dURUWCXh
         M0GJcw4Jis1RQmPP9/YZvQPk2aHsKFfHdXHx1QxDB4KVE8YkNhsF+Per9jM7N+qMNDA3
         u+e29ZWTjDpBnZgo+OsC+F/pF2i9gB7S83MIjKiKbiw0nZgVKsCk1HrCc/o9AH94eX3h
         OO+DMQ4pWblJ5e2M1sf2sO1io+hmHfWlOSy8FvUiz7bYsSr3lJcfC4XWf5HIqJ+vJu5g
         YvFmrCX4WPza2XpRbElDRkdgmtktrdtJyVRTFY+WbM7gFVpQH5n6Ooxqhjpf53rfOlI9
         8BJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=LxD78ACBAPvF4bmZ81uizAag5g2j/tyuxpS7/yFKs08=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=i3XQ824BbEHKCf5yqIoJ7uF5TmQ6ojWcq2wXwYM/V5B7k0z/HGYpkPJqNanlKcb2Zk
         WhJLVF/Q3Ab/vXPJyM0vWjPKPa5S31AhYPc6LMmg8Dl7YdMXALg1dOWfjJMOoGkGXN75
         EpiJCyLWH0UorSInLOtAmVOkAxObRukOR452LLC0veCs2+v3a6iitQH3BvL8Z/eR7jGm
         SOxLHq7WDXlfCmjc2wevzQAlb9DrOEN5zt5gxKKoCh0bMOPVmIybc2xJF6EVMBHqIK6D
         Y9DidMj+U2nWXBoDIabVUYSy9M9yoIvq+YLlpf5ie9xqLBPyLQi+y/oIzlSMSGKILa3m
         N3WA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=ygDoIMo0;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=QbnZ7Laj;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwknhz.outbound-mail.sendgrid.net (s.xtrwknhz.outbound-mail.sendgrid.net. [167.89.18.14])
        by mx.google.com with ESMTPS id ffacd0b85a97d-39efa4293a7si112985f8f.4.2025.04.17.10.31.09
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 10:31:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) client-ip=167.89.18.14;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=ygDoIMo0;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=QbnZ7Laj;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.18.14 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=LxD78ACBAPvF4bmZ81uizAag5g2j/tyuxpS7/yFKs08=;
	b=ygDoIMo0fwplWPfhA20BgL3oG27uR0YoJYKl/sVPZVl0hqF51MkOOMktyy6jkLFke2eb
	AGRF/omEoAVVKaKYO/bL9+MwWGc8HpmocnoAHNZIq1E00uU/y6y16SlRKTvWQCmAAUMyTP
	Go67CwIhRfkqKPxvLiJ9qUmI/Cf8FvJW0qbagyBBp2A2Yjiq6mdvjhPk1x2YOhihv2lzJ3
	qh/YJ3MdnVZ/YbQK6OdnI54eoqYvMu44/HICAuDpLLdw6DMEbrf9UiMBaRrezzGxtN2NMx
	fsovVKnGPPVmf+KCFTdYSzknG6jLZasldQ8hKFiBhuX04Zi1xo01idUcp1VeigPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=LxD78ACBAPvF4bmZ81uizAag5g2j/tyuxpS7/yFKs08=;
	b=QbnZ7Laj4W9dl01yPk7XqtCCxidNKy8HqPOOfM6QJBm/EDpEe6C7GQ5w6O/JCdF8sWuQ
	IVhvbYHQkV07zxwRWK+X7jyZiFnLD8Gjo41olVOBDB+9eDL24bzyE6vflKNxR5RjJIrogN
	uEanYzUmjQsID8Y4QO0KU1MR4znsHE0OU=
Received: by recvd-545d4d4647-vzpdq with SMTP id recvd-545d4d4647-vzpdq-1-68013ADC-33
	2025-04-17 17:31:08.620811747 +0000 UTC m=+760988.050955244
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-35 (SG) with HTTP
	id 5c_Qg-8FSGu4K6of0LGMJw
	Thu, 17 Apr 2025 17:31:08.619 +0000 (UTC)
Content-Type: multipart/alternative; boundary=5738466130d14d7f720f12b48d650e9050682457ecce1979b41adddffe88
Date: Thu, 17 Apr 2025 17:31:08 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <5c_Qg-8FSGu4K6of0LGMJw@geopod-ismtpd-35>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n6C9cWeURd+ijKXI?=
 =?us-ascii?Q?chgmnkBHjSM1W8XWK8Gy0XL5WtavdwRwfSWPeon?=
 =?us-ascii?Q?xGpfEUIthIliX2jNsMQjM0vascJUtyPK6rQnwgr?=
 =?us-ascii?Q?wubpOvbQUAeF6gkhBiokq5hUdfkong9p4flY1nE?=
 =?us-ascii?Q?mcHm+7OKNdIcjk9uB=2FuQMFrLKLXqsY426AkeATE?=
 =?us-ascii?Q?w=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: C2adgF33Gbh/

--5738466130d14d7f720f12b48d650e9050682457ecce1979b41adddffe88
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0

Your Hacker News Digest1. An Intro to DeepSeek's Distributed File System
This article discusses 3FS, a distributed filesystem by DeepSeek, which abs=
tracts the complexities of distributed storage, allowing users to interact =
with it as if it were a local filesystem. It highlights the advantages of d=
istributed filesystems, such as fault tolerance and high throughput, and pr=
ovides a deep dive into the architecture and components of 3FS.Top Comments=
:Architecturally, it is a scale-out metadata filesystem.3FS isn't particula=
rly fast in mdbench, though.JuiceFS is very good and supports lots of DBs.2=
. Top OpenAI Catastrophic Risk Official Steps Down Abruptly
Joaquin Qui=C3=B1onero Candela, the former head of OpenAI's Preparedness te=
am, has stepped down to return to coding. His departure comes amid a restru=
cturing of OpenAI's safety organization, raising concerns about the company=
's commitment to safety amidst a series of leadership changes.Top Comments:=
Companies self-regulating around safety is even worse than banks self-regul=
ating before 2008.People should stop quitting as a moral protest when compa=
nies go against their principles.Click bait. This wasn't abrupt, and it has=
 nothing to do with a safety crisis at OpenAI.3. Show HN: AgentAPI =E2=80=
=93 HTTP API for Claude Code, Goose, Aider, and Codex
AgentAPI is a tool that allows users to control various coding agents throu=
gh an HTTP API. It provides a quickstart guide for installation and usage, =
enabling users to build a unified chat interface for coding agents.Top Comm=
ents:It's a very different architecture.AgentAPI solves the problem of how =
to programmatically control coding agents.There are lots of open source sol=
utions available.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--5738466130d14d7f720f12b48d650e9050682457ecce1979b41adddffe88
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. An Intro to DeepSeek's D=
istributed File System</h2><p>This article discusses 3FS, a distributed fil=
esystem by DeepSeek, which abstracts the complexities of distributed storag=
e, allowing users to interact with it as if it were a local filesystem. It =
highlights the advantages of distributed filesystems, such as fault toleran=
ce and high throughput, and provides a deep dive into the architecture and =
components of 3FS.</p><h3>Top Comments:</h3><ul><li>Architecturally, it is =
a scale-out metadata filesystem.</li><li>3FS isn't particularly fast in mdb=
ench, though.</li><li>JuiceFS is very good and supports lots of DBs.</li></=
ul><h2>2. Top OpenAI Catastrophic Risk Official Steps Down Abruptly</h2><p>=
Joaquin Qui=C3=B1onero Candela, the former head of OpenAI's Preparedness te=
am, has stepped down to return to coding. His departure comes amid a restru=
cturing of OpenAI's safety organization, raising concerns about the company=
's commitment to safety amidst a series of leadership changes.</p><h3>Top C=
omments:</h3><ul><li>Companies self-regulating around safety is even worse =
than banks self-regulating before 2008.</li><li>People should stop quitting=
 as a moral protest when companies go against their principles.</li><li>Cli=
ck bait. This wasn't abrupt, and it has nothing to do with a safety crisis =
at OpenAI.</li></ul><h2>3. Show HN: AgentAPI =E2=80=93 HTTP API for Claude =
Code, Goose, Aider, and Codex</h2><p>AgentAPI is a tool that allows users t=
o control various coding agents through an HTTP API. It provides a quicksta=
rt guide for installation and usage, enabling users to build a unified chat=
 interface for coding agents.</p><h3>Top Comments:</h3><ul><li>It's a very =
different architecture.</li><li>AgentAPI solves the problem of how to progr=
ammatically control coding agents.</li><li>There are lots of open source so=
lutions available.</li></ul><footer><p>This email has been sent by Toolhous=
e. You can change your delivery preferences at <a href=3D'http://url1228.to=
olhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFl=
AYjazfEAqUm0-2FD2kMX-2BcmQdjMswwK-L_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteM=
D12SmBrucaaZFzTr33Mmt4kMrUWpEi5MY-2B1BCM53o4uByT7TbqAE5vtSbQgvKMFgSxxJsYLEx=
am30wQyCgZG-2BBjbbKSicNPYE7q7sRkEVDl5U1tVdStd-2FC-2BASwRtx0mTcHkbeAn1hQmaAb=
tygozVJfsrnB14TmtpPXMjZgZpfXe9Yz1Dg-3D-3D'>here</a>.</p></footer><img src=
=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2=
P513JhjX8oSKm62DliywF0GKFnSdus6ViEr57wYSpcf3X8-2FBys6KREpexhCF5h1sEHCxgq-2B=
Dp-2FSGRd7qxn-2Fn9FlsBrlTh-2FmwzXiNa0SaZo3qr72oSQqr0b3L9RFk8VBQqjRNU8Ey165-=
2BB-2BfKlYl5bVvcLMIaMDLB1-2B-2BswJLwMQ2OnW1ESfcDfFe9iaSy8Dx5JH7J7835g0goJS3=
pHkipuW9o-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"heigh=
t:1px !important;width:1px !important;border-width:0 !important;margin-top:=
0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-le=
ft:0 !important;padding-top:0 !important;padding-bottom:0 !important;paddin=
g-right:0 !important;padding-left:0 !important;"/></body></html>
--5738466130d14d7f720f12b48d650e9050682457ecce1979b41adddffe88--
