Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:94cc:b0:ac7:e5d6:90a7 with SMTP id dn12csp1104315ejc;
        Sun, 6 Apr 2025 10:31:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpOFjW9M2L31AHDN84B1WzTvyZPvIPfQ4a+oHBzhoHrtZXjod+i7niNwP7wlXUby4iFFZt
X-Received: by 2002:a05:6214:1256:b0:6ef:cc6:953a with SMTP id 6a1803df08f44-6f00deedb18mr175080626d6.12.1743960687869;
        Sun, 06 Apr 2025 10:31:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743960687; cv=none;
        d=google.com; s=arc-20240605;
        b=Ikxyd4nWp1osE+Q3ixKIXNzW/Bcwg4DrX+cu36gQP0s6h/cuyBskk66rQAlYp2I+VU
         hXJwst/MnTZnfa8RWSsbc4R+3YVzBKe9OJqUoUhED9AozMPS9lhBSUqrSitf+7pFQdry
         k2z8P63mi/JliY1UYmY23Z6SeuCZp+mzJ7DGaUlBysoIN/0whYgLkUbHvSX8MC2HODzQ
         t27vmhio7UN8D0mChL7bS7glKtVT8BpWKPp/oa92daQCb8As0nrvnh6cjtostCKnwPvt
         0eJ50NYXw6NGRwdUNqvern4cfzNpi364iu36tyniiV081k+7pJABrhaD2nJvhwUgPtSw
         KVLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=ZpWdDkdtO4Vna9m0QOc2oMdU4GHn9zl3nj01/CqxrN4=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=QrajXyGxC7gQ3UkxnseTSpVT2w/gnrDq3CAGIMhelUQCI2TjpdX+r2/zqAz35aap3v
         gmhTjY540GluF/cjVHhjaczaEjSln33kZ1QW2Mv1xWK/40npcwtHLYffpzAhHEUD7Mzb
         SkQz6T5LMesVgxRZGXcWwHMwVEMprnssLJIzwIUzqxResrUZAiEZbaZI86JM/8qgQUsV
         /wx40HNZvUhmtL9V2Z5KnzYi+UAF0zdyxYQOvTdAQsOCiGS6V7jABh/Aw7WZQkE7caYi
         dJ6DNiP23ejyCgxd7Ka0HjB+eiE9QlgIKMSBbRdilPKcqrAMLQePvi12hdQX3Gr4b8Vv
         6hxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=JQq7709o;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=fKaMuzvv;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwkqxb.outbound-mail.sendgrid.net (s.xtrwkqxb.outbound-mail.sendgrid.net. [167.89.20.171])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ef0f12916esi73297336d6.311.2025.04.06.10.31.27
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 10:31:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) client-ip=167.89.20.171;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=JQq7709o;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=fKaMuzvv;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=s1; bh=ZpWdDkdtO4Vna9m0QOc2oMdU4GHn9zl3nj01/CqxrN4=;
	b=JQq7709oKKy+VvmcaiYFA+BZ7Sr9xPFxGQG/g2DlmMXL4PnDW1jCM0sksukKEwRl3sWE
	tLNHj16jyiKcVubfAZMvkXl3r8/kgkVubvS3hWpfSlRL3ozq037lQ7eNOiTrU9hITGfzMV
	VrZ1uxIPnwT8F9dEjocWUFP3YpR8TRqvc587XKqXrv8Ll3BqOnITayfHIQVmEI9GzC8eLA
	KFZUufl05MZmJwH2FxQE3N5S5misDWANaU59HgxfmRWh0r/kJshi/645FL4Ily9CdQd2YH
	rzKomE0jOc7SDB2TYxiZCKODcbcFy3D6jbpAPlkqX4Euciw+1m7SBC6Ly/Rnsx3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:to:cc:content-type:feedback-id:
	from:subject:to;
	s=smtpapi; bh=ZpWdDkdtO4Vna9m0QOc2oMdU4GHn9zl3nj01/CqxrN4=;
	b=fKaMuzvv6V0g/Jm4FjIlAYO0IaW7DszFR7mMdLHJKJ8QZ/MkKNjrx23u2/hJJP27siPg
	ZParb2x3LVvjHVrKsWc3k6dplphwAUFRhubk50/bcTmkp1HOwCjt+sO7yHlXzmkYe4Nrms
	bHPdxHwNXiczyG9vZZIUuv1l8sm0f3CR4=
Received: by recvd-canary-5bd654bb59-wcc8b with SMTP id recvd-canary-5bd654bb59-wcc8b-1-67F2BA6F-1C
	2025-04-06 17:31:27.279600807 +0000 UTC m=+530422.710396755
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-35 (SG) with HTTP
	id 15fQ_R2kQLi9t6gwumjFvQ
	Sun, 06 Apr 2025 17:31:27.253 +0000 (UTC)
Content-Type: multipart/alternative; boundary=2332e66ba0c758c826b9887b5b754605711d0d771631f432bb9de2ac0ddd
Date: Sun, 06 Apr 2025 17:31:27 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <15fQ_R2kQLi9t6gwumjFvQ@geopod-ismtpd-35>
Subject: Your Hacker News Digest
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n4DkuAYQIdUhuFvV?=
 =?us-ascii?Q?4Aw67PvbNrj0JQhpSBY0pwRGOj4JHfBpPxymjfw?=
 =?us-ascii?Q?tr9x2U8ylhtxDNiEuZyfMaPPdfZVRVDYv9SqhGG?=
 =?us-ascii?Q?31N6fCAC+bLTefcH5bwGf=2FpMATYFhq+XRPWtAz6?=
 =?us-ascii?Q?ezP4cJQdaH814RtSwWxSsloM7wyPvtF7KdN026k?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: K5yx1ogt0jFR

--2332e66ba0c758c826b9887b5b754605711d0d771631f432bb9de2ac0ddd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Standard Ebooks: liberated ebooks, carefully prod=
uced for the true book lover
Standard Ebooks is a volunteer-driven project that produces new editions of=
 public domain ebooks that are lovingly formatted, open source, free of U.S=
. copyright restrictions, and free of cost. They focus on modern typography=
, full proofing, and rich metadata to enhance the reading experience.Top Co=
mments:Users appreciate the project but suggest implementing filters for pu=
blic domain books only.Some users express concerns about editorial changes =
made to the texts.There are discussions about the importance of preserving =
original texts versus modernizing them for readability.2. The "S" in MCP St=
ands for Security
This article discusses the security vulnerabilities associated with the Mod=
el Context Protocol (MCP) used in AI agents. It highlights issues like comm=
and injection vulnerabilities and tool poisoning attacks, emphasizing the n=
eed for better security measures in MCP implementations.Top Comments:Many c=
ommenters agree on the critical flaws in MCP security and the need for a cl=
ear distinction between user input and external instructions.There are sugg=
estions for improving security protocols and the importance of observabilit=
y in MCP systems.Some users express skepticism about the feasibility of ach=
ieving secure MCP implementations without compromising functionality.3. Hid=
ing elements that require JavaScript without JavaScript
This article provides a solution for hiding elements that depend on JavaScr=
ipt using simple HTML and CSS techniques. It discusses the use of the  tag =
and CSS classes to manage visibility based on JavaScript availability.Top C=
omments:Commenters appreciate the practical solutions offered for progressi=
ve enhancement.There are discussions about the limitations of current metho=
ds and suggestions for future improvements.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at Toolhouse Settings.
--2332e66ba0c758c826b9887b5b754605711d0d771631f432bb9de2ac0ddd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Standard Ebooks: liberat=
ed ebooks, carefully produced for the true book lover</h2><p>Standard Ebook=
s is a volunteer-driven project that produces new editions of public domain=
 ebooks that are lovingly formatted, open source, free of U.S. copyright re=
strictions, and free of cost. They focus on modern typography, full proofin=
g, and rich metadata to enhance the reading experience.</p><h3>Top Comments=
:</h3><ul><li>Users appreciate the project but suggest implementing filters=
 for public domain books only.</li><li>Some users express concerns about ed=
itorial changes made to the texts.</li><li>There are discussions about the =
importance of preserving original texts versus modernizing them for readabi=
lity.</li></ul><h2>2. The "S" in MCP Stands for Security</h2><p>This articl=
e discusses the security vulnerabilities associated with the Model Context =
Protocol (MCP) used in AI agents. It highlights issues like command injecti=
on vulnerabilities and tool poisoning attacks, emphasizing the need for bet=
ter security measures in MCP implementations.</p><h3>Top Comments:</h3><ul>=
<li>Many commenters agree on the critical flaws in MCP security and the nee=
d for a clear distinction between user input and external instructions.</li=
><li>There are suggestions for improving security protocols and the importa=
nce of observability in MCP systems.</li><li>Some users express skepticism =
about the feasibility of achieving secure MCP implementations without compr=
omising functionality.</li></ul><h2>3. Hiding elements that require JavaScr=
ipt without JavaScript</h2><p>This article provides a solution for hiding e=
lements that depend on JavaScript using simple HTML and CSS techniques. It =
discusses the use of the <noscript> tag and CSS classes to manage visibilit=
y based on JavaScript availability.</p><h3>Top Comments:</h3><ul><li>Commen=
ters appreciate the practical solutions offered for progressive enhancement=
.</li><li>There are discussions about the limitations of current methods an=
d suggestions for future improvements.</li></ul><footer><p>This email has b=
een sent by Toolhouse. You can change your delivery preferences at <a href=
=3D'http://url1228.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-=
2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswgZiQ_zKD9qStml-2FkjU46u=
lTqeWVsrM3061nr98hteMD12SmBpxbnD9C50vD2mVrpUF9WcXZtqGvHUcBxZEVVUGbBCLryJWLE=
EaxL0kJYu65s97ixNKJ8L17xrQJBtnNDHSYoP0xep6Bp9WBZkDOaMFiuKqLS7Kl4UR-2BfF3dit=
xBWWur5bnDDDYhoh-2BoToGu8wADfWBYArTZmCANNbjDdD3MDf8mp4AsyR149xNFndnqDrvVE-3=
D'>Toolhouse Settings</a>.</p></footer><img src=3D"http://url1228.toolhouse=
ai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF0GJk-2B=
kZ1PDTH08KwD4JvVsi1hQ80s4ZKOmmsKfWZPzXT24KPubuXRckq3vFHuFPLiDxxEdDpR3uOFlLi=
2iAigQM-2B8-2B6bbyTva-2B9q-2FpBtQPaxWyUmp-2FL4n9eIZ657wmS8BMDsbZ0E2WtJNdCO-=
2FfebYPwLG4lKirNMNseFqkPTe-2BEcA4HOEFS04B2YqhevrYgGTWI-3D" alt=3D"" width=
=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !important;width:1px !=
important;border-width:0 !important;margin-top:0 !important;margin-bottom:0=
 !important;margin-right:0 !important;margin-left:0 !important;padding-top:=
0 !important;padding-bottom:0 !important;padding-right:0 !important;padding=
-left:0 !important;"/></body></html>
--2332e66ba0c758c826b9887b5b754605711d0d771631f432bb9de2ac0ddd--
