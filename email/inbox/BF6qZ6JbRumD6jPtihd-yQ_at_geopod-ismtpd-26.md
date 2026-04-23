Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:d104:b0:abc:2b0f:5fd9 with SMTP id uy4csp645215ejc;
        Sun, 9 Mar 2025 10:31:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7gE2c9+Pkcs/HGh2wIERQBo9rjT3bYe7wC/Q6NT+hCbEyuEietKwvrUndzyk3WYlRFNei
X-Received: by 2002:a05:620a:6181:b0:7c5:5339:48dd with SMTP id af79cd13be357-7c55339508emr163484285a.22.1741541519252;
        Sun, 09 Mar 2025 10:31:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741541519; cv=none;
        d=google.com; s=arc-20240605;
        b=A2HUbWuft6DzKe0poH+1gy/YRe/uKu5hhT2nm2wfVNVhn6Y4RYktPo+uuTAV8RvObJ
         ilnadSP54Ah51+9UrbweOn5LoS4tLDdyLZUeIaYpesvotnkL2bNOaSAg5seYENTuv1We
         34GwxbSbgQljqmKL6L/+QDkUyQ4HfbZConn2/tAYZU+NOevsJttm0acNsjmMZI3X9VgO
         rHgqNJyjsisubkA31FS/TjmzWT+K8McTvqw7A8Ep0P35z9QEDLu8VYHCnwasx22jJaJV
         fe6pPbMpVwnd1VwzbXmN7xq6fJw3ycrfb6IWA3lN7E0oE58XIe6yza4wnqnXamdgkRAl
         4LuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=vkWX5wJB6rdLwlKXceFe89UfD3qdUqqaTyAdUcKieuM=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=A9pK735OOl5GMtVsz0Im4HGmYfdIDWg1xDjefdf65XXulDqL91I90RRQYrNr9rXXj9
         X9Z4bymf/TobI209DjDclDfqV1jmCpsMKF7UjCF2c86Z5tGvWB2/tlsPimbYL+f6lLn1
         fgrfi2eF4AnAGoSdzICNWzxS8G8jfSyZHVCBZ02t0mvtDrhpDJ3x0cDz5WbxOIH6lWNQ
         w1cxyzRYCLBeTM+P1ek0GfTUmZcPieeePrkWZmmvN5cu3GTr9vFzJI/JIeWz8ckgw6Ui
         ilWMfLRAuivVx6h90y5WxbBRlYSkPNLbG7nRitGckq0ChaElLiL3OB0e5kCcLrDjpsb4
         X04Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b="dzGKii/t";
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=Sd5fz4fp;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwkqxb.outbound-mail.sendgrid.net (s.xtrwkqxb.outbound-mail.sendgrid.net. [167.89.20.171])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e55433c4si747761685a.476.2025.03.09.10.31.58
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Mar 2025 10:31:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) client-ip=167.89.20.171;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b="dzGKii/t";
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=Sd5fz4fp;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=vkWX5wJB6rdLwlKXceFe89UfD3qdUqqaTyAdUcKieuM=;
	b=dzGKii/t37NsWADTeH6eWl826HcYiVX7cANwNOpm058k0P/iVN2WqEkImerwAWLTjtKU
	LOQLnjMZSqzrUWQfHTNx8s+apiDQOgZeopGA36dpjroKPcS6MDBj9D4MTWstpfd/ovOYc7
	YMNFqp1U8y1sk1g8YYujO/lsQY75Q60876PPfxknjiwVADuAUTi0b7WSbatsYnja55L4zw
	pzTn1sIgLPROilZFyPoSoGLdyciTmM2h3UYpAWHl0xUq57L7VB+sR4nklR3x9Q08ffHHhF
	hzaQClxSEvjazPislk+C5CCGQCo3m5Np/4KMzLO7mzFu2faRprenBiQ9SLMTEUYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=vkWX5wJB6rdLwlKXceFe89UfD3qdUqqaTyAdUcKieuM=;
	b=Sd5fz4fpz4ym7N+nBMMAErEysH9o/FCdVAmbcaVYuq+z4OLjeK+a1J6xVGjgPXyey504
	riteNE483+K0b8gDd4kBpfhIIca4e2gRWrDOX3ccQTsDUHlaASd6GQf5MxUOYio42g64VK
	r3k8uy2HUnE/ZYuZtOsvnmHgLYpzF6KOE=
Received: by recvd-786d47b7ff-4zzwv with SMTP id recvd-786d47b7ff-4zzwv-1-67CDD08E-9
	2025-03-09 17:31:58.789175776 +0000 UTC m=+9922156.482892108
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-26 (SG) with HTTP
	id BF6qZ6JbRumD6jPtihd-yQ
	Sun, 09 Mar 2025 17:31:58.717 +0000 (UTC)
Content-Type: multipart/alternative; boundary=2d5278b45fe66148d72fe236a1b7a6c48c7110669578ac4cbc39e84f283a
Date: Sun, 09 Mar 2025 17:31:58 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <BF6qZ6JbRumD6jPtihd-yQ@geopod-ismtpd-26>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n47gFfDf1Y=2FKjAyM?=
 =?us-ascii?Q?1CkYrFgbBA8PLuSVjM3xWc5AzTcMZ8MkzxQj0r=2F?=
 =?us-ascii?Q?1Dd1s93+pZz0Z42dEfxWZy0jxvZTEP=2FzinQPpjS?=
 =?us-ascii?Q?CUK+jnlj6aXq=2F1UyoxU566OXsXiIohJXhFInV16?=
 =?us-ascii?Q?lqFhkUFRv03i8x7NrwqL49v0AgzuqoUxQd603U8?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: rXx8n7Co8agL

--2d5278b45fe66148d72fe236a1b7a6c48c7110669578ac4cbc39e84f283a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. I am the healthiest person I know, and I got canc=
er
This article discusses a user's experience of being diagnosed with cancer d=
espite a healthy lifestyle. The author reflects on the inevitability of dea=
th and the limitations of controlling life's outcomes, contrasting the pers=
pective that focusing on "right choices" can be freeing with the paralyzing=
 effect it can have on others. The post also touches upon the concept of "o=
ptimistic nihilism" as a coping mechanism.Top Comments:Many contributors ha=
ve made good suggestions on how to reduce the risk of getting cancer, but m=
ost posts were quite technical.Some commenters expressed that the thought o=
f making the right choices can be freeing for some but paralyzing for other=
s.There was a discussion about the inevitability of death and how it shapes=
 our choices.2. Half of US adults exposed to harmful lead levels as kids
This article links to an AP News report stating that half of US adults were=
 exposed to harmful lead levels as children. The implications of this expos=
ure on health and development are significant.Top Comments:Commenters discu=
ssed the long-term effects of lead exposure and the need for better public =
health measures.There was a consensus on the importance of addressing envir=
onmental factors that contribute to health issues.3. White noise improves l=
earning by modulating activity in midbrain regions
This article discusses the effects of white noise on learning and hearing. =
Commenters shared anecdotal experiences, with some reporting increased tinn=
itus from white noise, while others suggested that naturally occurring soun=
ds like rainfall are less harmful.Top Comments:Some users reported that whi=
te noise helps them focus while working, while others found it jarring.Ther=
e was a discussion about the potential long-term effects of white noise exp=
osure on hearing.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--2d5278b45fe66148d72fe236a1b7a6c48c7110669578ac4cbc39e84f283a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<h1>Your Hacker News Digest</h1><h2>1. I am the healthiest person I know, a=
nd I got cancer</h2><p>This article discusses a user's experience of being =
diagnosed with cancer despite a healthy lifestyle. The author reflects on t=
he inevitability of death and the limitations of controlling life's outcome=
s, contrasting the perspective that focusing on "right choices" can be free=
ing with the paralyzing effect it can have on others. The post also touches=
 upon the concept of "optimistic nihilism" as a coping mechanism.</p><h3>To=
p Comments:</h3><ul><li>Many contributors have made good suggestions on how=
 to reduce the risk of getting cancer, but most posts were quite technical.=
</li><li>Some commenters expressed that the thought of making the right cho=
ices can be freeing for some but paralyzing for others.</li><li>There was a=
 discussion about the inevitability of death and how it shapes our choices.=
</li></ul><h2>2. Half of US adults exposed to harmful lead levels as kids</=
h2><p>This article links to an AP News report stating that half of US adult=
s were exposed to harmful lead levels as children. The implications of this=
 exposure on health and development are significant.</p><h3>Top Comments:</=
h3><ul><li>Commenters discussed the long-term effects of lead exposure and =
the need for better public health measures.</li><li>There was a consensus o=
n the importance of addressing environmental factors that contribute to hea=
lth issues.</li></ul><h2>3. White noise improves learning by modulating act=
ivity in midbrain regions</h2><p>This article discusses the effects of whit=
e noise on learning and hearing. Commenters shared anecdotal experiences, w=
ith some reporting increased tinnitus from white noise, while others sugges=
ted that naturally occurring sounds like rainfall are less harmful.</p><h3>=
Top Comments:</h3><ul><li>Some users reported that white noise helps them f=
ocus while working, while others found it jarring.</li><li>There was a disc=
ussion about the potential long-term effects of white noise exposure on hea=
ring.</li></ul><footer><p>This email has been sent by Toolhouse. You can ch=
ange your delivery preferences at <a href=3D'http://url1228.toolhouseai.com=
/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-=
2FD2kMX-2BcmQdjMswuOad_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmC2WixSHk=
z0c7XKDdGrZ8FbJHN4mfnSJRN0pmp-2F96QcWBupJRp8vmSECT3RcT2tMFFYsVerm2dwsVSNQBe=
I1lJanFs6d4IiR-2BmUdp6NxkcKvId8-2Bw8hkzSoHN0hTvyko4K0E8i6ZwgbqQ6H9T-2F4PFbD=
DTrnkjo5AgJCXkV1ZKw-2B9g-3D-3D'>here</a>.</p></footer><img src=3D"http://ur=
l1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm=
62DliywF0GI1ZbH68R3YPScIHbJUZa0DI3-2Bv6E29ZvdCUj7pdlQs1AdQ2TEeH02QERKlzNpPw=
vx57sKIRJ-2FYaHvVfjE0c0TlbkLLu-2F0P1899X-2FDCbc-2F-2BFZtd3Uh5XUM4CJRcZrbgd0=
crkoVWam6XEIWcvnwVcLGsu9-2FqkHs6Ez52IEdERfW-2Fce1FmwU1Xso4IssyP6IXkMk-3D" a=
lt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !importan=
t;width:1px !important;border-width:0 !important;margin-top:0 !important;ma=
rgin-bottom:0 !important;margin-right:0 !important;margin-left:0 !important=
;padding-top:0 !important;padding-bottom:0 !important;padding-right:0 !impo=
rtant;padding-left:0 !important;"/>
--2d5278b45fe66148d72fe236a1b7a6c48c7110669578ac4cbc39e84f283a--
