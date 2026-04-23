Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:3905:b0:abc:2b0f:5fd9 with SMTP id so5csp781747ejc;
        Fri, 7 Mar 2025 09:31:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoywsZ5xam15XLsMZx/nSh+yVrU1Vr2bhKYQsGcKSUtncGHIai24QH61wcrW3m0aXSONSS
X-Received: by 2002:a05:6102:41a5:b0:4c3:243:331a with SMTP id ada2fe7eead31-4c31b610c7emr455172137.6.1741368701947;
        Fri, 07 Mar 2025 09:31:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741368701; cv=none;
        d=google.com; s=arc-20240605;
        b=kDklVRjiQqBoNsDD8ozcy4Qu6667p8JT/7fc9yB4jWdAmlBUnJs2RdomxFXjF2xdLS
         3MKpDR7OgEA+x9Ic7Q+WI4QFAfWQEsQHdSw0D4RDLn50PmI8V7zm5xzZl0Im+TGIT99P
         K84wLnSU1g0cjvUQdKSOeHRye4otFuGdS1/jRuboz/UP1i/Qf/rKx5MkYycKDB37n2uy
         ofXJCBLwb0ezvjtSkzQySEAMPl++f7E+9OaEaCKjkcCti2ds2nJoBv4MqSFzsc2laWCF
         puhAli2DUOnOT77sr+eAdqwAUuNSpknpNCpYhH7aK7A4Fssp2DDc83UEZRO0HkOokmmY
         U5JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=H9phyEyflJLLH1fwh7NMOYKpqTGMhrSrt6Gkj292kYg=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=b2xHlIHa/koHMFI/ucvjvfzO1ZJuVrpNOJZ2XwIY5K6uEUN9G5PEj5EJEjYNoJnLyc
         YGZ/OlC1Bd6NSYRrCxf9f9NPuOszJPjpTus6cvgUCbJJ5OcZiNT7hEflUKAGlmMdvw8U
         udvE4LCSlrpyVIi2fXP65VapubMj6BNEQ/tFnMTAGV9U5hTy0B49lHLOCOQkpSwkb5RH
         JKp38yR7GB8Cjqye2/C3uzx+PpBLuU+O/NEfBoG/qEykkxyYkXm78IahPgbf5bNY0ly2
         F1zRBwBqDUssI0pVlxVVSQCAORJLoDTj6UEvmVQDgKSGgBJjuFc3cY/x/ddmjHbQztaz
         dCzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=UlMOd9oN;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=KKVn2qWv;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhsb.outbound-mail.sendgrid.net (s.wfbtzhsb.outbound-mail.sendgrid.net. [159.183.224.107])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c2fbcc3b9asi1027653137.415.2025.03.07.09.31.41
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 09:31:41 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) client-ip=159.183.224.107;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=UlMOd9oN;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=KKVn2qWv;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.107 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=H9phyEyflJLLH1fwh7NMOYKpqTGMhrSrt6Gkj292kYg=;
	b=UlMOd9oNwpWWURO613Z8lJXBsMJzAWIBT0b+Y3G11KjRCcvGC+CMXpj3tFyVnN+UxeOm
	1swz6b3VDkU7/UHZPd8VTVGCkPn2mspYO54+Yoq07Oyu0tgT4OIuyLI/At+PMHx+3CeyYN
	fVpEXBgA3zaA8vz5PxMJNzm7N/RkjJbgQ/7QA5X44RmPWtdSRN6+jbtQwXIjuXFP0+tIHS
	nB2PYiwEZQCXT3mWvVedPzBGfXtI/fZozWP73njhYcD2MbKSxUgDyebARzAVjHGWkznXUi
	ngj6cGjrTUxNSe184Ty5/2i5uSXqLgV0rE/ioa4mG4KxxvZzITab3eztINAxM0jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=H9phyEyflJLLH1fwh7NMOYKpqTGMhrSrt6Gkj292kYg=;
	b=KKVn2qWvkvhw4ZJJEyPO2BCpHPjyrUqe32cn6ZYeMk0U5ZxyG/yXs+lw+gMbgampARWR
	thmM5MxwSv2QX3ArATDp92V73IseBEDFQFqgBN4dqDFTsxfxFN7wKDtYeLrkrxB+CSMcUI
	dVYb9ZLO0G19Svqx+ny08SMl2gAsWljBU=
Received: by recvd-69cbc48b94-q9zxj with SMTP id recvd-69cbc48b94-q9zxj-1-67CB2D7B-27
	2025-03-07 17:31:39.665390154 +0000 UTC m=+9749343.874620941
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-35 (SG) with HTTP
	id nEMt_2h9Q9uw5_swSBbKew
	Fri, 07 Mar 2025 17:31:39.641 +0000 (UTC)
Content-Type: multipart/alternative; boundary=ffc31ffad7f54065658be7c7b741c8b992078aa514515801f4b24d579b48
Date: Fri, 07 Mar 2025 17:31:39 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <nEMt_2h9Q9uw5_swSBbKew@geopod-ismtpd-35>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n433vm2es5jfpHmS?=
 =?us-ascii?Q?sybRi0FBfKAJOLhOzIa4SCZpIdWhHVBF2rAglg=2F?=
 =?us-ascii?Q?20iMZI+nJZP3upGQV6IdT6GHB5kDdJYf6tDoHhm?=
 =?us-ascii?Q?V1YlRBPJ4IrkHwx6LeCOCV3FMffZn5us=2FdiAbC8?=
 =?us-ascii?Q?nE+P12A3Dr886hy5e1jSTkB0xnCeM=2F8oJQlwAnj?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: feb1nWcrJDYj

--ffc31ffad7f54065658be7c7b741c8b992078aa514515801f4b24d579b48
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Ask HN: What do hiring managers like to see in a =
resume?
This discussion revolves around the optimal resume length for data science =
roles. The author initially created a one-page resume but found more succes=
s after expanding it to two pages. The thread explores whether tailoring re=
sumes for each job application is necessary and what hiring managers typica=
lly look for.Comments Summary:
Many commenters shared their experiences, emphasizing the importance of ada=
pting resumes to specific roles. Some suggested that a two-page resume is o=
ften more acceptable in the tech industry, while others discussed the chall=
enges of getting feedback from recruiters.2. Ask HN: How to decide what's t=
he best career to pursue?
This thread discusses methodologies for choosing a career. Commenters sugge=
st listing interesting jobs, identifying necessary skills, and focusing on =
skill overlap to maintain flexibility. Others emphasize the importance of e=
arning potential and the daily realities of jobs over intellectual interest=
.Comments Summary:
Opinions varied, with some advocating for financial stability early in one'=
s career, while others stressed the importance of enjoying daily work. Many=
 shared personal anecdotes about their career paths and the need for adapta=
bility in a rapidly changing job market.3. Humanity's Last Exam
This post proposes a thought experiment for AI safety, suggesting a ten-par=
t exam that includes challenges like winning a Pulitzer Prize and proving t=
he Riemann Hypothesis. The author argues that no human could pass all parts=
, highlighting the need for confidence in AI alignment.Comments Summary:
Commenters debated the feasibility of the exam and its implications for AI =
safety. Many found the challenges humorous or overly ambitious, while other=
s discussed the broader implications of AI capabilities and the need for ri=
gorous evaluation.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--ffc31ffad7f54065658be7c7b741c8b992078aa514515801f4b24d579b48
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Ask HN: What do hiring m=
anagers like to see in a resume?</h2><p>This discussion revolves around the=
 optimal resume length for data science roles. The author initially created=
 a one-page resume but found more success after expanding it to two pages. =
The thread explores whether tailoring resumes for each job application is n=
ecessary and what hiring managers typically look for.</p><h3>Comments Summa=
ry:</h3><p>Many commenters shared their experiences, emphasizing the import=
ance of adapting resumes to specific roles. Some suggested that a two-page =
resume is often more acceptable in the tech industry, while others discusse=
d the challenges of getting feedback from recruiters.</p><h2>2. Ask HN: How=
 to decide what's the best career to pursue?</h2><p>This thread discusses m=
ethodologies for choosing a career. Commenters suggest listing interesting =
jobs, identifying necessary skills, and focusing on skill overlap to mainta=
in flexibility. Others emphasize the importance of earning potential and th=
e daily realities of jobs over intellectual interest.</p><h3>Comments Summa=
ry:</h3><p>Opinions varied, with some advocating for financial stability ea=
rly in one's career, while others stressed the importance of enjoying daily=
 work. Many shared personal anecdotes about their career paths and the need=
 for adaptability in a rapidly changing job market.</p><h2>3. Humanity's La=
st Exam</h2><p>This post proposes a thought experiment for AI safety, sugge=
sting a ten-part exam that includes challenges like winning a Pulitzer Priz=
e and proving the Riemann Hypothesis. The author argues that no human could=
 pass all parts, highlighting the need for confidence in AI alignment.</p><=
h3>Comments Summary:</h3><p>Commenters debated the feasibility of the exam =
and its implications for AI safety. Many found the challenges humorous or o=
verly ambitious, while others discussed the broader implications of AI capa=
bilities and the need for rigorous evaluation.</p><footer><p>This email has=
 been sent by Toolhouse. You can change your delivery preferences at <a hre=
f=3D'http://url1228.toolhouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp=
-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQdjMswB9SK_zKD9qStml-2FkjU46=
ulTqeWVsrM3061nr98hteMD12SmAdN-2BMTaVR1wMXOsJwPMal1OExmyd4EdMpZMlmZgINIl-2F=
ajxtimNAw2LudEanxcsc9WTdM-2BN1jnxjC46dwARaVdr48EyRlmFFFr-2FjY7kHVXsUAtJ1xat=
g1mGOx76-2BiRscM26Jhi-2B-2F4IIt8V6nwRxR9XtGAJEzpUxDrfEodm7F5HKw-3D-3D'>here=
</a>.</p></footer><img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3D=
u001.0-2F6ozNgxxDtaqhc9sx2P513JhjX8oSKm62DliywF0GK-2Bnx6rOsWwHhwK9zPvJKfckT=
7qNpAyd0zFQDifHSj3amvfvV18Po-2B-2BzNjIaqgSSH4DhbjUhd2xKMk9Ul8dNyBKxQnKyByyi=
BCQ91OT57P018BmKuYT44-2B24YBd-2BErV7xmNBm7AhLfEkmvtuLq1k9lNAycH580m0sFB52cJ=
gLEuR5dJINwKjUu0RJX2gErYiGY-3D" alt=3D"" width=3D"1" height=3D"1" border=3D=
"0" style=3D"height:1px !important;width:1px !important;border-width:0 !imp=
ortant;margin-top:0 !important;margin-bottom:0 !important;margin-right:0 !i=
mportant;margin-left:0 !important;padding-top:0 !important;padding-bottom:0=
 !important;padding-right:0 !important;padding-left:0 !important;"/></body>=
</html>
--ffc31ffad7f54065658be7c7b741c8b992078aa514515801f4b24d579b48--
