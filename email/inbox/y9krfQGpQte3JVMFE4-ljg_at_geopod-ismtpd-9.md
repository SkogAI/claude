Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:6193:b0:abb:bb71:f9f7 with SMTP id mt19csp1178990ejc;
        Wed, 19 Feb 2025 09:31:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkEMk52N7ltPfrXK6KqvQGKkcRLgG1sHMvWBRyFhJSAU30eGl2MyKfYx7oybvVokXjT2ba
X-Received: by 2002:a05:6a21:7002:b0:1ee:e24d:8fdf with SMTP id adf61e73a8af0-1eee24d92f1mr539462637.21.1739986303640;
        Wed, 19 Feb 2025 09:31:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739986303; cv=none;
        d=google.com; s=arc-20240605;
        b=kx7HE9XAp5OZPsvxo6JCDPgCoZu2O/aBomQVxMVGN7ssD6d7wNBMbngHZHn4EZfJM/
         ikWC3KQnSqT5fvrZRUQQB1LwZqs3MfTlqYT+PplOcEQYaZ/B077NKHafBCsLyMuUM8jk
         ymLp1mP0eMvPDPJ5PVCZM60mFi/XbUZotLrQDrjdZmTsq5znf8I92ZrohAhTb+arHRXw
         iaQCbSK84lEoVti7fx96j81ScF5jKXZl3jTnWrcdIteYtbEcxfOxhd+hVH1DntuQg8w/
         W4KH+XJFmi/lOSu3d1PXdLMECRE//EJK6uGgAsKj6U2UZK1x8vSJNKv+tQDTewbpZHlN
         VjZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=DljV0+paAotBxQ+2qiWuvcd9nO4dYcep3ZTydAJdJFk=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=XPFL4ZNBhKGp/W6rSWkVfObsDVJtyGmRSC5S1qFUev8RuIcyURicL7IQVMjudLyHwU
         qnhBZaadGnffVSCAEggNIVZUmGDVJljSVy3SntiOKKVo9EoQQMbcUhFjjsci6Q5j7+WD
         5OyYvPwRbW4nGg3fzX9Hp0mXdSHpVopf51+lOp8bRFjeJ1wiLpy/gi+pgsvw+9cO+t0a
         fvrn4uNdpQumO/23oali5plhSa7taWVIexFNwz8WgHuWMQfOj+bHBzaFl0SfKo9We9VT
         gR/bKavLlHSMcxTPN9eiqVLFgvI1+2p+h5UPqP0df3oO8fFUyDCvZ9lk9gvzp3Rpa77i
         5J+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=TWMYni6d;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=iTMbIxyr;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.xtrwkqxb.outbound-mail.sendgrid.net (s.xtrwkqxb.outbound-mail.sendgrid.net. [167.89.20.171])
        by mx.google.com with ESMTPS id 41be03b00d2f7-ae07fec1eb3si8978711a12.727.2025.02.19.09.31.42
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 09:31:43 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) client-ip=167.89.20.171;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=TWMYni6d;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=iTMbIxyr;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 167.89.20.171 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=DljV0+paAotBxQ+2qiWuvcd9nO4dYcep3ZTydAJdJFk=;
	b=TWMYni6d1L67osmlnUIEwSpKnSQ60FNgD4odXfSAzoFSEMjN8H0+qFzOZK9/5KbE8A7c
	InFC3SW0izTyiM+ZAh3dRdqvi/s52wmixFvFcD6VltfLu2iwjXtYTum7nlCTGuhFXkeH/3
	jXxAbhgek98jNNsHDSYKWR6w7js6bDKRapLKyI56+L6Js7vJZtFrPpHE13LQHq9+3PR18h
	Lf33pe+rctKq6MW6zFhijBgxZJngxtqQ6nvVhg+G/OLEQm2S/oFrAh/Us591jok7QZWuVu
	r/QaCUjEAC73fUhXYjbZrtfJi/n3cZLLjB7zYIjaToWaRgmvEzptPSq3fB6QqbpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=DljV0+paAotBxQ+2qiWuvcd9nO4dYcep3ZTydAJdJFk=;
	b=iTMbIxyrAVLgG+nJE6N/+vIW9/YQZ1qe0TKHM7EKQCX5rrNOYulXZrz5V2LOYYOYa6zN
	XU1JLbdgkn9E4IoSknZyt/bROzmsxAGWlZ4RFNS4KsCG5llZkWFjcNcAmSntatggfa/QBv
	Bam6eCvwPANdhhmOFEQPPXw76EzSIpoxE=
Received: by recvd-84b546689d-k6ss9 with SMTP id recvd-84b546689d-k6ss9-1-67B6157C-4D
	2025-02-19 17:31:40.868559017 +0000 UTC m=+8366906.148750918
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-9 (SG) with HTTP
	id y9krfQGpQte3JVMFE4-ljg
	Wed, 19 Feb 2025 17:31:40.605 +0000 (UTC)
Content-Type: multipart/alternative; boundary=a53205c49b58139455752c4805c32048cdb9c2a57fdd45a535a763affe8b
Date: Wed, 19 Feb 2025 17:31:40 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <y9krfQGpQte3JVMFE4-ljg@geopod-ismtpd-9>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n46NgiXo1AZtWm2e?=
 =?us-ascii?Q?R0y4VTFJprl5WW8ITI=2Fv3RVDEsaCLGsoGDnwgQq?=
 =?us-ascii?Q?8=2FSsERdaSD1zIaNb8sFDTRZUu4N0XQj=2F7hQ9ozN?=
 =?us-ascii?Q?O9GtWTLKorzYC8p50Jfffh1+S5G2hbGZYvqKv7A?=
 =?us-ascii?Q?rDZVVho+x6AxCWZUyt9eUvN4SoLg=2Fnppcpmsvnq?=
 =?us-ascii?Q?Q=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: nZEgWZ+rDjoo

--a53205c49b58139455752c4805c32048cdb9c2a57fdd45a535a763affe8b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Your Hacker News Digest1. Eden Abhez: The strangest hit songwriter
This article explores the life of Eden Ahbez, the composer of the iconic so=
ng "Nature Boy". It details how Ahbez, a true nature boy, lived a life of s=
implicity and eccentricity, ultimately leading to the creation of a song th=
at transformed Nat King Cole's career. Despite the song's success, Ahbez st=
ruggled with fame and remained an enigmatic figure in the music world.Top C=
omments:Many readers were surprised to learn about Ahbez's influence on the=
 hippie movement.Some noted the unique musical qualities of "Nature Boy" an=
d its lasting impact.Discussion about the song's origins and its philosophi=
cal lyrics sparked interest.2. Making my local LLM voice assistant faster a=
nd more scalable with RAG
This article discusses the author's journey to optimize a local voice assis=
tant using Retrieval Augmented Generation (RAG). The author shares insights=
 on improving performance by reducing context length and enhancing the assi=
stant's capabilities through innovative techniques.Top Comments:Readers app=
reciated the technical depth and practical solutions presented.There was a =
lively discussion about the challenges of local LLMs and potential improvem=
ents.Some users shared their own experiences with voice assistants and opti=
mization techniques.3. Face of ancient Australian 'giga-goose' revealed aft=
er fossil skull found
This article reveals the discovery of a skull belonging to the ancient bird=
 *Genyornis newtoni*, nicknamed the 'giga-goose'. The findings provide insi=
ghts into the bird's size, diet, and extinction, highlighting the impact of=
 climate change and human arrival in Australia.Top Comments:Many readers ex=
pressed fascination with the prehistoric bird and its ecological context.De=
bates arose regarding the causes of extinction and the role of early humans=
.Some comments reflected on the broader implications of climate change on m=
egafauna.
This email has been sent by Toolhouse. You can change your delivery prefere=
nces at here.
--a53205c49b58139455752c4805c32048cdb9c2a57fdd45a535a763affe8b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<html><body><h1>Your Hacker News Digest</h1><h2>1. Eden Abhez: The stranges=
t hit songwriter</h2><p>This article explores the life of Eden Ahbez, the c=
omposer of the iconic song "Nature Boy". It details how Ahbez, a true natur=
e boy, lived a life of simplicity and eccentricity, ultimately leading to t=
he creation of a song that transformed Nat King Cole's career. Despite the =
song's success, Ahbez struggled with fame and remained an enigmatic figure =
in the music world.</p><h3>Top Comments:</h3><ul><li>Many readers were surp=
rised to learn about Ahbez's influence on the hippie movement.</li><li>Some=
 noted the unique musical qualities of "Nature Boy" and its lasting impact.=
</li><li>Discussion about the song's origins and its philosophical lyrics s=
parked interest.</li></ul><h2>2. Making my local LLM voice assistant faster=
 and more scalable with RAG</h2><p>This article discusses the author's jour=
ney to optimize a local voice assistant using Retrieval Augmented Generatio=
n (RAG). The author shares insights on improving performance by reducing co=
ntext length and enhancing the assistant's capabilities through innovative =
techniques.</p><h3>Top Comments:</h3><ul><li>Readers appreciated the techni=
cal depth and practical solutions presented.</li><li>There was a lively dis=
cussion about the challenges of local LLMs and potential improvements.</li>=
<li>Some users shared their own experiences with voice assistants and optim=
ization techniques.</li></ul><h2>3. Face of ancient Australian 'giga-goose'=
 revealed after fossil skull found</h2><p>This article reveals the discover=
y of a skull belonging to the ancient bird *Genyornis newtoni*, nicknamed t=
he 'giga-goose'. The findings provide insights into the bird's size, diet, =
and extinction, highlighting the impact of climate change and human arrival=
 in Australia.</p><h3>Top Comments:</h3><ul><li>Many readers expressed fasc=
ination with the prehistoric bird and its ecological context.</li><li>Debat=
es arose regarding the causes of extinction and the role of early humans.</=
li><li>Some comments reflected on the broader implications of climate chang=
e on megafauna.</li></ul><footer><p>This email has been sent by Toolhouse. =
You can change your delivery preferences at <a href=3D'http://url1228.toolh=
ouseai.com/ls/click?upn=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYj=
azfEAqUm0-2FD2kMX-2BcmQdjMswRcoY_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12=
SmCiZ5IuZTA45H3asbq2uUPQRgPi-2BCoI-2BSdOdyANerMNXI2PaFczs-2FdG7-2BeacYGfUUo=
hzNS-2B0fmYT6ht0gcdHwIMBwY-2FJS4MXif1tmlNnZNA4GiYkzMDVcKBY-2BKCKeL-2F8KkmtI=
LSxpLzOIlYyvhEaxvarB6MEW7Jgr6gqaiBkZL0Fg-3D-3D'>here</a>.</p></footer><img =
src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDtaqhc9=
sx2P513JhjX8oSKm62DliywF0GIdNEhZ76IVH-2B2ulNZxJZsi240DuWa7kj7QjOXC9BKEx8Qdj=
7BqZ0jsTR1B3mbsu0bRwOUNXSyddrFs35mdMKgO5q7YBaeiar2bTc0wtelOX5RgN9Ao7HD3oFKY=
h9aeMa2WfeZamnzHobu7lPmZMkspNc3dT8-2BcpDUG9jgGB2uZRDQiDRnUhuncH3lSV59QuHU-3=
D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !impo=
rtant;width:1px !important;border-width:0 !important;margin-top:0 !importan=
t;margin-bottom:0 !important;margin-right:0 !important;margin-left:0 !impor=
tant;padding-top:0 !important;padding-bottom:0 !important;padding-right:0 !=
important;padding-left:0 !important;"/></body></html>
--a53205c49b58139455752c4805c32048cdb9c2a57fdd45a535a763affe8b--
