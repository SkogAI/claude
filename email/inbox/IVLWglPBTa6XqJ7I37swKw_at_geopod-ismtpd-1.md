Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a17:907:1594:b0:ab6:fa07:db4 with SMTP id cf20csp1154198ejc;
        Sat, 1 Feb 2025 09:32:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHAZwml+wSyA+jqeJSAMAACKErNmeK+FuRTIibIFsUP9XsoJyOPh+nZi9I3Ig4m6ysKyCi
X-Received: by 2002:a05:622a:1104:b0:467:672a:abb8 with SMTP id d75a77b69052e-46fd0a12357mr264580901cf.5.1738431145539;
        Sat, 01 Feb 2025 09:32:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738431145; cv=none;
        d=google.com; s=arc-20240605;
        b=fPpaWnknB2kdPnkbHmkhTF8cKPopvMBOHG/6mRI99UD25rGvMJgCidaRhrKGTKStZt
         M7w2QDDH41O/1P4hMkcpU+4LsfYPMEBN4yEbs12SI5ElY/SCgFZ0L3BfKGyCWo2a8BQ4
         cTwnpFsq8K3/nmqz8LH5C2lJsLacJH6d05fpz2APsEIuMpBuLGGrcsS48dc3EGRXXelf
         dicD32H26oD3J8/4UNyPvugGwKyA4GIl3VHusQFT6oLVIBoilosDMz6Npnzb5I8zvhXR
         vR0uOjiBJXMLHZ+/YkwMIPGV3tV8do7Pm3CKOXACT5VXfQ8M3AXOawjTFQpFGNfvnyKf
         T3xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:mime-version:from:date:dkim-signature
         :dkim-signature;
        bh=KcJppWR3E8IGPiPz/t1cJHE9kt7oe9IWJtdoJyJ34K4=;
        fh=VssCVVgL/4ZacfdnXE2cHciVAWrafcGti3a9tXBCMVE=;
        b=Iwjr0TJjPsuzJZcQiJopUUxrN7hArSbdFEPLSONmQxM2Y2ekkk+qaRwBC1JnSq5jXU
         XK+tr4k3c+5lR78YDGLZkk9KncojwlttDkmh6r2okzvbN3GLqCDaSTE/n1lmnESQk9CU
         lSZ79Yvpjplqe2N4jhH1cK0MsblyVy4wCQRhdhSEd21sOMB+bqRim3EVfM64RSCpLE/3
         EVn54WYWT8pYM+W47QvYzkS8Qlat6qIMeuP6qu++jeHXKi4eo6AFbIiL+Je/aYyVGiDg
         EMJHKk4kfHa/musTtsod8rYMXJteDkIt2BkiCKS8SJgFzFrL4oVbJPuEJNHxK+uOEXyA
         eVig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=DPS4swyO;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=ylFGFZoA;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.106 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
Return-Path: <bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com>
Received: from s.wfbtzhsx.outbound-mail.sendgrid.net (s.wfbtzhsx.outbound-mail.sendgrid.net. [159.183.224.106])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1b9f99si63210051cf.276.2025.02.01.09.32.24
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 09:32:25 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.106 as permitted sender) client-ip=159.183.224.106;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@toolhouseai.com header.s=s1 header.b=DPS4swyO;
       dkim=pass header.i=@sendgrid.info header.s=smtpapi header.b=ylFGFZoA;
       spf=pass (google.com: domain of bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com designates 159.183.224.106 as permitted sender) smtp.mailfrom="bounces+45329440-6cd3-emil.skogsund=gmail.com@em1847.toolhouseai.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toolhouseai.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toolhouseai.com;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=s1; bh=KcJppWR3E8IGPiPz/t1cJHE9kt7oe9IWJtdoJyJ34K4=;
	b=DPS4swyOBkkYhtHhpQSeftZ2FOHDrGwMoj4FI67k1frKLwgPJkPVMjQkAVQnKTcITFFY
	CPJxTT6mJF1VFIMTUenWZEjBVamaztOcCA9940Ae7JVKdXSW3+0o+RwjaqrtszWEl0Z4RT
	PRqwcfQMBVSUTlpWSWgdN/bMGcVOUe/mLUfC+QFSWDuePpC5/9iy2hX+NNgXBrnAJGjJff
	OtY4cWRVNsTf9mwVmG0vuLGZOn410zyJ/CyHnczFkpnVTzlDl32DieLAZmwttI5n8V935D
	HHQsZGm2ZwBucblE0zY4Y9Cr8/72hRmIGW77RVLIay7QP/Oz2Q1WVhb3fKka6V0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.info;
	h=content-type:from:mime-version:subject:x-feedback-id:to:cc:
	content-type:from:subject:to;
	s=smtpapi; bh=KcJppWR3E8IGPiPz/t1cJHE9kt7oe9IWJtdoJyJ34K4=;
	b=ylFGFZoAEyn3fx8G8IwZO925TteN0FAJ53NG9LNlM1QYUC1aP6p8uGGnm1KLYwEJFjiH
	zp8uuJ4uTR1ES9ieugAoLRP7YU1Q/SSY0r3zbx0onCfi3EYjjxn+Pa2yZQpn+BcrAfJHiK
	clKYtpWm1EPG1eeDECRufKoZKIx2/oA8c=
Received: by recvd-786d47b7ff-jbd2f with SMTP id recvd-786d47b7ff-jbd2f-1-679E5AA7-5
	2025-02-01 17:32:23.230034104 +0000 UTC m=+6811817.300643970
Received: from NDUzMjk0NDA (unknown)
	by geopod-ismtpd-1 (SG) with HTTP
	id IVLWglPBTa6XqJ7I37swKw
	Sat, 01 Feb 2025 17:32:23.179 +0000 (UTC)
Content-Type: multipart/alternative; boundary=6ad9e76f4ef748d44564ac090c322817d0f3a9c9ceef892309844b6b63ea
Date: Sat, 01 Feb 2025 17:32:23 +0000 (UTC)
From: ai@toolhouseai.com
Mime-Version: 1.0
Message-ID: <IVLWglPBTa6XqJ7I37swKw@geopod-ismtpd-1>
Subject: Your Hacker News Digest
X-Feedback-ID: 45329440:SG
X-SG-EID: 
 =?us-ascii?Q?u001=2EECZ3karMz0FA4WDCkQAd62UihykKJjDEgGCaFu7Z2n7lPU8okC4zOfySU?=
 =?us-ascii?Q?CjLa+SKyoo1Ya9YimxVQK61woob8J5kO6d0vBa0?=
 =?us-ascii?Q?fc71XpoODcyeB2HXE89aRc7kHBKjNFCkesIc8PM?=
 =?us-ascii?Q?pxqu9QirisBUb9plk9ChOVe5q41Ej8tSQFl7+d7?=
 =?us-ascii?Q?YHD1mrH2aV=2FPxfWhl9FV3V4044mCoT7ymq21GQC?=
 =?us-ascii?Q?g=3D=3D?=
To: emil.skogsund@gmail.com
X-Entity-ID: u001.gZSOtePb/IongYVtCPEsdQ==
X-TUID: j6DU1SwhVIOV

--6ad9e76f4ef748d44564ac090c322817d0f3a9c9ceef892309844b6b63ea
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0

Hacker News Digest
1. Eden Abhez: The Strangest Hit Songwriter
Summary: A fascinating article about Eden Abhez, the composer of the 1948 h=
it song "Nature Boy" performed by Nat King Cole. Abhez is described as poss=
ibly the first hippie, living an alternative lifestyle decades before the c=
ounterculture movement. He lived on $3 per week, slept outdoors (including =
under the Hollywood sign), and followed a strict vegetarian diet. His song =
"Nature Boy" became a million-seller despite initial skepticism from Capito=
l Records.
Community Discussion: The HN community was particularly interested in the m=
usical aspects of the song, with discussions about its unique chord progres=
sion and its potential inspiration from a Yiddish theater song. Many reader=
s were familiar with the song from its use in Baz Luhrmann's "Moulin Rouge!=
" Some technical discussion emerged about the difference between tempered a=
nd untempered notes in various recordings of the song.
2. Making my local LLM voice assistant faster and more scalable with RAG
Summary: A technical article about improving the performance of a local LLM=
-based voice assistant using RAG (Retrieval Augmented Generation). The auth=
or describes how they optimized their home assistant by reducing context le=
ngth and using embedding models to selectively include relevant information=
 in prompts. The implementation includes dual RTX 3090s and uses Llama 3 70=
B AWQ model.
Community Discussion: The discussion focused on technical aspects of the im=
plementation, with some debate about the Llama 3 model mentioned. There wer=
e interesting suggestions about pre-computing responses for common services=
 and using similarity search to skip LLM processing in some cases. Some use=
rs also commented on the AI assistant's somewhat sarcastic personality in t=
he demonstrations.
3. Face of ancient Australian 'giga-goose' revealed after fossil skull foun=
d
Summary: Scientists have discovered a well-preserved skull of Genyornis new=
toni, nicknamed the 'giga-goose', an extinct bird that lived in Australia o=
ver 45,000 years ago. Standing over two meters tall and weighing up to 240 =
kg, this massive bird was related to ducks and geese rather than ostriches =
as previously thought. The discovery provides new insights into the species=
' diet and behavior.
Community Discussion: The discussion largely centered around the causes of =
the species' extinction, with debate about the relative roles of climate ch=
ange versus human hunting. Many commenters were skeptical of the article's =
emphasis on climate change, pointing out that the species had survived prev=
ious climate shifts but disappeared shortly after human arrival. There was =
also interesting discussion about ancient human population sizes and their =
impact on megafauna.
This email has been sent by Toolhouse. To change your delivery preferences,=
 please visit https://app.toolhouse.ai/settings
--6ad9e76f4ef748d44564ac090c322817d0f3a9c9ceef892309844b6b63ea
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=us-ascii
Mime-Version: 1.0

<!DOCTYPE html>
<html>
<body style=3D"font-family: Arial, sans-serif; max-width: 800px; margin: 0 =
auto; padding: 20px;">

<h1 style=3D"color: #ff6600;">Hacker News Digest</h1>

<div style=3D"margin-bottom: 40px;">
    <h2>1. Eden Abhez: The Strangest Hit Songwriter</h2>
    <p><strong>Summary:</strong> A fascinating article about Eden Abhez, th=
e composer of the 1948 hit song "Nature Boy" performed by Nat King Cole. Ab=
hez is described as possibly the first hippie, living an alternative lifest=
yle decades before the counterculture movement. He lived on $3 per week, sl=
ept outdoors (including under the Hollywood sign), and followed a strict ve=
getarian diet. His song "Nature Boy" became a million-seller despite initia=
l skepticism from Capitol Records.</p>
   =20
    <p><strong>Community Discussion:</strong> The HN community was particul=
arly interested in the musical aspects of the song, with discussions about =
its unique chord progression and its potential inspiration from a Yiddish t=
heater song. Many readers were familiar with the song from its use in Baz L=
uhrmann's "Moulin Rouge!" Some technical discussion emerged about the diffe=
rence between tempered and untempered notes in various recordings of the so=
ng.</p>
</div>

<div style=3D"margin-bottom: 40px;">
    <h2>2. Making my local LLM voice assistant faster and more scalable wit=
h RAG</h2>
    <p><strong>Summary:</strong> A technical article about improving the pe=
rformance of a local LLM-based voice assistant using RAG (Retrieval Augment=
ed Generation). The author describes how they optimized their home assistan=
t by reducing context length and using embedding models to selectively incl=
ude relevant information in prompts. The implementation includes dual RTX 3=
090s and uses Llama 3 70B AWQ model.</p>
   =20
    <p><strong>Community Discussion:</strong> The discussion focused on tec=
hnical aspects of the implementation, with some debate about the Llama 3 mo=
del mentioned. There were interesting suggestions about pre-computing respo=
nses for common services and using similarity search to skip LLM processing=
 in some cases. Some users also commented on the AI assistant's somewhat sa=
rcastic personality in the demonstrations.</p>
</div>

<div style=3D"margin-bottom: 40px;">
    <h2>3. Face of ancient Australian 'giga-goose' revealed after fossil sk=
ull found</h2>
    <p><strong>Summary:</strong> Scientists have discovered a well-preserve=
d skull of Genyornis newtoni, nicknamed the 'giga-goose', an extinct bird t=
hat lived in Australia over 45,000 years ago. Standing over two meters tall=
 and weighing up to 240 kg, this massive bird was related to ducks and gees=
e rather than ostriches as previously thought. The discovery provides new i=
nsights into the species' diet and behavior.</p>
   =20
    <p><strong>Community Discussion:</strong> The discussion largely center=
ed around the causes of the species' extinction, with debate about the rela=
tive roles of climate change versus human hunting. Many commenters were ske=
ptical of the article's emphasis on climate change, pointing out that the s=
pecies had survived previous climate shifts but disappeared shortly after h=
uman arrival. There was also interesting discussion about ancient human pop=
ulation sizes and their impact on megafauna.</p>
</div>

<hr style=3D"margin: 40px 0;">

<footer style=3D"font-size: 12px; color: #666;">
    <p>This email has been sent by Toolhouse. To change your delivery prefe=
rences, please visit <a href=3D"http://url1228.toolhouseai.com/ls/click?upn=
=3Du001.duokMj2A9CmwqP6J5tp-2BO1sJ1I-2Fq16oZZnnFlAYjazfEAqUm0-2FD2kMX-2BcmQ=
djMsw6MUK_zKD9qStml-2FkjU46ulTqeWVsrM3061nr98hteMD12SmCZfx461o-2FdJvVJ7Jpfu=
NqakpgeomEdXSDfjvvtQjr5SOPVqoyGB2WSfYQQFHFG2rrIqSbfZ6-2F3AzwWBZnSWhTtaKXjZ5=
lW4-2Bv74rFVUX-2BOl7-2BOqAgXZ7eMAz4nVXXpOJkgi35dS-2Bt2KYPt6d0hPG-2FJxlI5raz=
fFt6o62FwIzjFiw-3D-3D">https://app.toolhouse.ai/settings</a></p>
</footer>

<img src=3D"http://url1228.toolhouseai.com/wf/open?upn=3Du001.0-2F6ozNgxxDt=
aqhc9sx2P513JhjX8oSKm62DliywF0GJ7XAoGRnN75Sy2J-2BFuDe-2FWn8g4nyFoHIVwSwyQy6=
9wbq-2F-2BzWBL507QPfAGuZ80LUEqfJR-2FGXgiQNADB1ysgze4dE8czaxafggkIheGZCSBLID=
m9b-2FWDxXcbDoJmO3mWgcRJsk2OMYqjgihvRWtliIoonyBaezlIkQvNaCUpuaI50UfQfKUzLTP=
rAZ-2BIkB0Plc-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"h=
eight:1px !important;width:1px !important;border-width:0 !important;margin-=
top:0 !important;margin-bottom:0 !important;margin-right:0 !important;margi=
n-left:0 !important;padding-top:0 !important;padding-bottom:0 !important;pa=
dding-right:0 !important;padding-left:0 !important;"/></body>
</html>
--6ad9e76f4ef748d44564ac090c322817d0f3a9c9ceef892309844b6b63ea--
