Delivered-To: emil.skogsund@gmail.com
Received: by 2002:a05:6e04:120c:b0:3b7:c845:c55a with SMTP id bf12csp3749906imb;
        Thu, 23 Apr 2026 06:07:14 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AFNElJ9WzscIexV9etQRkh5RLJajT7Y6PZY6cHIYvvOBHkNrKtR+03I2hDMGGs7c+daz/bex5uIb/HPFjdlg7MY1@gmail.com
X-Received: by 2002:a05:620a:269b:b0:8ee:7878:af3e with SMTP id af79cd13be357-8ee7878b2admr1594519685a.45.1776949633566;
        Thu, 23 Apr 2026 06:07:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1776949633; cv=pass;
        d=google.com; s=arc-20240605;
        b=NXmIXuptd5WlYegnt5kBX8xcj68yHHGG/KjQ33Tf/AwsXsGAhDYwFJFs9IkIc7uXE5
         +qX2lzncFG+0vh1CAklZvyl8+O9JjBSJCwAJImSHqefPhUHEr5YV5CwgaTkVXQGmrg++
         1Ep66FKhyT2zPJ3ybA43lUaQvkR644zMb7rg6yQVAa8KR6xFT0XftYXubT8nopMlISaI
         Qb7qA2eq9aBObwe7knylAvLfQlmJHYrhnocbUcixoV0YUAqoJZmNNk7l/Q2HmsE0Q5uk
         LUwXAxskCJz5gUPMZwJMkaBdYM5r4vifRl4UDVS3GU23sK3RQKYXUvh7J/DXzuZ+S2Wx
         ueMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:from:to:cc:subject:list-post:reply-to:list-id:date
         :message-id:list-archive:precedence:dkim-signature:feedback-id
         :dkim-signature:dkim-signature;
        bh=UmPLCNYP4UP0p7Ot6eGmgqmaZ9iiyPzwQQe/1WOrpmg=;
        fh=CGQhsgAaAc/KMjMOyGGZbLI9M1fWVJjcCM2OtIhTI/I=;
        b=jdhdWexFvHT26kYMvtrx+TUw0zCCOPqV1pKN4h8lsKoykO+h4te/RMs+87E2MQRs7x
         nRjCELm8udon9MPCq3Jp1JHOvRamA48N1lfYNW/fEjZJBILnYWHMaUlbwTteFKANmqJn
         bCDUZwiM+2+WzXTFmHybTmg+jiU1emwTb8FLEEWefaPQlRNo8XHs1wAmGAXUtcKnA4bn
         qPl6GXGHeQJJ0qbIOrrtwhH5oPcKOZKV20WfQGdNd/w/2LExMjxOzr9aA2RolFGD3M9i
         nU0t4O9CTSD+SU0jfLWsbVWVSTdOsnbHRkhtbQzOMiRQNGPjbfGlTA8lxOacP/roCRjN
         nI5g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@cloudflare-email.net header.s=cf2024-1 header.b=ZE+7m96G;
       dkim=pass header.i=@skogsund.se header.s=cf2024-1 header.b=fkB8WvBX;
       dkim=pass header.i=@github.com header.s=pf2023 header.b=alfVaq0w;
       arc=pass (i=1 spf=pass spfdomain=github.com dkim=pass dkdomain=github.com dmarc=pass fromdomain=github.com);
       spf=pass (google.com: domain of srs0=xnmi=wc=github.com=notifications@skogsund.se designates 104.30.8.38 as permitted sender) smtp.mailfrom="SRS0=xnMI=wc=github.com=notifications@skogsund.se";
       dmarc=pass (p=QUARANTINE sp=REJECT dis=NONE) header.from=github.com
Return-Path: <SRS0=xnMI=wc=github.com=notifications@skogsund.se>
Received: from i-di.cloudflare-email.net (i-di.cloudflare-email.net. [104.30.8.38])
        by mx.google.com with ESMTPS id af79cd13be357-8e7d61dde7asi2069903285a.111.2026.04.23.06.07.12
        for <emil.skogsund@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 06:07:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=xnmi=wc=github.com=notifications@skogsund.se designates 104.30.8.38 as permitted sender) client-ip=104.30.8.38;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@cloudflare-email.net header.s=cf2024-1 header.b=ZE+7m96G;
       dkim=pass header.i=@skogsund.se header.s=cf2024-1 header.b=fkB8WvBX;
       dkim=pass header.i=@github.com header.s=pf2023 header.b=alfVaq0w;
       arc=pass (i=1 spf=pass spfdomain=github.com dkim=pass dkdomain=github.com dmarc=pass fromdomain=github.com);
       spf=pass (google.com: domain of srs0=xnmi=wc=github.com=notifications@skogsund.se designates 104.30.8.38 as permitted sender) smtp.mailfrom="SRS0=xnMI=wc=github.com=notifications@skogsund.se";
       dmarc=pass (p=QUARANTINE sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-email.net; c=relaxed/relaxed;
	h=From:To:Cc:Subject:List-Post:Reply-To:List-Id:Date:List-Archive
	:Feedback-ID:resent-date:resent-from:resent-to:resent-cc:in-reply-to
	:references:list-help:list-unsubscribe:list-unsubscribe-post
	:list-subscribe:list-owner; t=1776949633; x=1777554433; bh=UmPLCNYP4UP0p7Ot
	6eGmgqmaZ9iiyPzwQQe/1WOrpmg=; b=ZE+7m96GVXpkDq/+5ew1jP0HVFYrmVKRIeXIALEqQev
	8xd+kYA9cTrelgPtR45hX06HTXSXbtnOM/Q/Qiwutq0VbSdbU3LPWUtjKbMjVlwrV8Tr13Aqp+W
	4FlvD/UO78U2zpNFjbjLeLPAljciP/Ak69UBB1iOFtU5xOtW7Llbe2AO5y1+BNUn6nY111NNCuf
	+j2FhHz4eeG9y1R1QH9fJqnpy+OOQg0rz9UR45ppEU+NqoUBatCNa4JRUEjQVkRMPgZwpet11nW
	zblRxg1fTcKZPYrSYnLMq0P1EpUu85VlAMIOJqoUWodWtp1q/HZmldE6WSmwOClvTxrX6DpgXw=
	=;
DKIM-Signature: v=1; a=rsa-sha256; s=cf2024-1; d=skogsund.se; c=relaxed/relaxed;
	h=From:To:Cc:Subject:List-Post:Reply-To:List-Id:Date:List-Archive
	:Feedback-ID:resent-date:resent-from:resent-to:resent-cc:in-reply-to
	:references:list-help:list-unsubscribe:list-unsubscribe-post
	:list-subscribe:list-owner; t=1776949633; x=1777554433; bh=UmPLCNYP4UP0p7Ot
	6eGmgqmaZ9iiyPzwQQe/1WOrpmg=; b=fkB8WvBXcYE6KQ9u86NN9v1lbxEgt57sA47Pe71qd7U
	djDVR27Hu1uCsXSj/aHBuH8xSfEKBNoEXnF1ksWZ/vtaS6ic6UrmHiww7f6EwbutyJrIZ96lqU7
	WW5iyEKJSVbVosa4R7dkIa+Lw4cvHz6NEuQg2pG0ZUiMEpQ2Wk8YmNM9c66mA4t0DqrYspJtykr
	xD18+g8ZysU+z2/j6fq3vXkVm5bHE/4lkvwVHFkE1Mz4Aig5XWx0K7fghsAFSJUG1GpnLiIpUcS
	wRTBF5E+Ht50juwOr6MxdxL73j2UamGTqWlOpAvxv11hgx5EPiWY2TxSbf/+d7fmRYx331JayA=
	=;
X-Forwarded-To: emil.skogsund@gmail.com
X-Forwarded-For: emil@skogsund.se emil.skogsund@gmail.com
Feedback-ID: skogsund.se:1:1:Cloudflare
Received: from out-39.smtp.github.com (192.30.252.138)
        by cloudflare-email.net (cloudflare) id X3lxaAB17rsc
        for <emil@skogsund.se>; Thu, 23 Apr 2026 13:07:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-email.net; cv=none;
	b=abHRJLS6/j7YgqSF+0Ng00KPbvpRw0owv6IB5XfRmFfYQo0lwV9wqbMy6+YXoKxehw/6QbgUg
	Qr+XRV05GanODEL1UwUhmIokTjKyDuFh7TGyuuE8BBSalV34N60xYInKQodcGCfajGKQ9mxdEP1
	EbTOLix0AoSs51ELEp6HO2n577LobnQOP3XISUbOeOpm/H+xu8Ly9YjLPA7Hvj4EgiZC7rrZkNX
	sZojhbiG+KMEDWcmbS0v6qQjjkmf6um/ig8CZmVLlMXv9yQsONsYCNcwkesiz/ZhjOtoEY2dDZM
	1hkS6irZZgKHPjvVQ+keTvyZPCO/4KTICjpfcFFhnniQ==;
ARC-Message-Signature: i=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-email.net; c=relaxed/relaxed;
	h=From:To:Cc:Subject:List-Post:Reply-To:List-Id:Date:List-Archive
	:resent-date:resent-from:resent-to:resent-cc:in-reply-to:references
	:list-help:list-subscribe:list-owner; t=1776949631; x=1777554431; bh=UmPLCN
	YP4UP0p7Ot6eGmgqmaZ9iiyPzwQQe/1WOrpmg=; b=QkIwZtiyojHvjwz7BaKqWr7CVNKFkxalD
	WgSvlr1fwnpC7uWhlHkSkRUYTh/WFZii8uWLAq9PhOwH3QS72lGQqUNgHXd5qrpMZjM9VgOPJSG
	MaH1b3q+KpFCLJyv0dMtKYGwYiPWtzoKQaXqrjMpb4dMZOOoFg8qvN9U1n6TbE+DfF+tC5jWkgG
	0TfmfPnc6fLTQLon6oX6Ab+r276snMDt3GpuKAjJ/C+CKf3m8h165S5wnRAjqne+kEDZKxFOIRF
	bKfOra2R57ixusw8h9vxC/c64F8PUgHkFnovm+YJG5p7z9Dd4Ftb2Qifc9Cu+cBIDa1kHLwntkA
	ZuVDF6Opw==;
ARC-Authentication-Results: i=1; mx.cloudflare.net;
	dkim=pass header.d=github.com header.s=pf2023 header.b=alfVaq0w;
	dmarc=pass header.from=github.com policy.dmarc=quarantine;
	spf=none (mx.cloudflare.net: no SPF records found for postmaster@out-39.smtp.github.com) smtp.helo=out-39.smtp.github.com;
	spf=pass (mx.cloudflare.net: domain of notifications@github.com designates 192.30.252.138 as permitted sender) smtp.mailfrom=notifications@github.com;
	arc=none smtp.remote-ip=192.30.252.138
Received-SPF: pass (mx.cloudflare.net: domain of notifications@github.com designates 192.30.252.138 as permitted sender)
	receiver=mx.cloudflare.net; client-ip=192.30.252.138; envelope-from="notifications@github.com"; helo=out-39.smtp.github.com;
Authentication-Results: mx.cloudflare.net;
	dkim=pass header.d=github.com header.s=pf2023 header.b=alfVaq0w;
	dmarc=pass header.from=github.com policy.dmarc=quarantine;
	spf=none (mx.cloudflare.net: no SPF records found for postmaster@out-39.smtp.github.com) smtp.helo=out-39.smtp.github.com;
	spf=pass (mx.cloudflare.net: domain of notifications@github.com designates 192.30.252.138 as permitted sender) smtp.mailfrom=notifications@github.com;
	arc=none smtp.remote-ip=192.30.252.138
X-CF-SpamH-Score: 0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1776949630;
	bh=UmPLCNYP4UP0p7Ot6eGmgqmaZ9iiyPzwQQe/1WOrpmg=;
	h=List-Archive:Date:List-Id:Reply-To:List-Post:Subject:Cc:To:From:
	 From;
	b=alfVaq0w8w259sv+j/lgepT0w+jWbzfyqrTc2WPcyz54rb6sEjKiY2rjiGBvgTxJu
	 ucVrrUA5rzL/qW0eOjmzdcvei43pQQcxvQpTvHS4MgbisyNwescYRnZ3KMd+re+YiW
	 zox/jW5FJdWF1TuWZ/6Lqqc16VJl5Xz7NBMJWtXw=
Received: from localhost (hubbernetes-node-d9016d8.ash1-iad.github.net [10.56.104.50])
	by smtp.github.com (Postfix) with UTF8SMTPSA id C16E1921211
	for <emil@skogsund.se>; Thu, 23 Apr 2026 06:07:10 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="part_5fc4004a871d3703e63f90c9a562aad4aa053d0af2de30f18522f72e7ac401dd"; charset=UTF-8
Precedence: list
X-Github-Sender: Skogix
List-Archive: https://github.com/SkogAI/gptme
Message-Id: <SkogAI/gptme/check-suites/CS_kwDOPXuF2c8AAAAPVsTo1g/1776949609@github.com>
Date: Thu, 23 Apr 2026 06:07:09 -0700
List-Id: SkogAI/gptme <gptme.SkogAI.github.com>
Reply-To: SkogAI/gptme <gptme@noreply.github.com>
List-Post: noreply@github.com
X-Github-Recipient: Skogix
X-Github-Reason: ci_activity
X-Github-Notify-Platform: notifyd
Subject: [SkogAI/gptme] Run failed: Release - master (b006a4c)
Cc: "Ci activity" <ci_activity@noreply.github.com>
To: "SkogAI/gptme" <gptme@noreply.github.com>
From: "Skogix" <notifications@github.com>
Mime-Version: 1.0
X-TUID: Q27O1HuW3QK8

--part_5fc4004a871d3703e63f90c9a562aad4aa053d0af2de30f18522f72e7ac401dd
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

[SkogAI/gptme] Release workflow run

Repository: SkogAI/gptme
Workflow: Release
Duration: 2 minutes and 11.0 seconds
Finished: 2026-04-23 13:06:49 UTC

View results: https://github.com/SkogAI/gptme/actions/runs/24836852505

Jobs:
  * Pre-flight checks succeeded (0 annotations)
  * Create release succeeded (0 annotations)
  * Publish release failed (1 annotation)

-- 
You are receiving this because you are subscribed to this thread.
Manage your GitHub Actions notifications: https://github.com/settings/notifications?email_source=notifications&email_token=AAFIQZZFJDCFQOCVNXPBUBL4XIIP5A5CNFSNUACCM5UWIORPF5TWS5BNNB2WEL2DNBSWG22TOVUXIZKFOZSW45CON52GSZTJMNQXI2LPNYXTMNJYHAYDENJUGY3TQJJTIIYTONZWHE2DSNRQHGTHEZLBONXW5IFFMV3GK3TUWFRXGX3TMV2HI2LOM5ZV6Y3MNFRWW

--part_5fc4004a871d3703e63f90c9a562aad4aa053d0af2de30f18522f72e7ac401dd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://ww=
w.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns=3D"http://www.w3.org/1=
999/xhtml" lang=3D"en" xml:lang=3D"en" style=3D"-webkit-text-size-adjust:=
 100%; -ms-text-size-adjust: 100%; font-family: sans-serif; box-sizing: b=
order-box;" xml:lang=3D"en">
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf=
-8" />
    <meta name=3D"viewport" content=3D"width=3Ddevice-width" />
    <title>[SkogAI/gptme] Run failed: Release - master (b006a4c)</title>
    =

  </head>
  <body style=3D"box-sizing: border-box; color: #24292e; background-color=
: #fff; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,=
Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji; font-size: 14px; line-=
height: 1.5; margin: 0;" bgcolor=3D"#fff">
    <table align=3D"center" class=3D"container-sm width-full" width=3D"10=
0%" style=3D"box-sizing: border-box; border-spacing: 0; border-collapse: =
collapse; max-width: 544px; margin-left: auto; margin-right: auto; width:=
 100% !important; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,=
Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important;">=

      <tr style=3D"box-sizing: border-box; font-family: -apple-system,Bli=
nkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Seg=
oe UI Emoji !important;">
        <td class=3D"center tmp-p-3" align=3D"center" valign=3D"top" styl=
e=3D"box-sizing: border-box; font-family: -apple-system,BlinkMacSystemFon=
t,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !i=
mportant; padding: 16px;">
          <center style=3D"box-sizing: border-box; font-family: -apple-sy=
stem,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color E=
moji,Segoe UI Emoji !important;">
            <table role=3D"presentation" border=3D"0" cellspacing=3D"0" c=
ellpadding=3D"0" align=3D"center" class=3D"width-full container-md" width=
=3D"100%" style=3D"box-sizing: border-box; border-spacing: 0; border-coll=
apse: collapse; max-width: 768px; margin-left: auto; margin-right: auto; =
width: 100% !important; font-family: -apple-system,BlinkMacSystemFont,Seg=
oe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !import=
ant;">
  <tr style=3D"box-sizing: border-box; font-family: -apple-system,BlinkMa=
cSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe U=
I Emoji !important;">
    <td align=3D"center" style=3D"box-sizing: border-box; font-family: -a=
pple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple =
Color Emoji,Segoe UI Emoji !important; padding: 0;">
              <table role=3D"presentation" style=3D"box-sizing: border-bo=
x; border-spacing: 0; border-collapse: collapse; font-family: -apple-syst=
em,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emo=
ji,Segoe UI Emoji !important;">
  <tbody style=3D"box-sizing: border-box; font-family: -apple-system,Blin=
kMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Sego=
e UI Emoji !important;">
    <tr style=3D"box-sizing: border-box; font-family: -apple-system,Blink=
MacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe=
 UI Emoji !important;">
      <td height=3D"16" style=3D"font-size: 16px; line-height: 16px; box-=
sizing: border-box; font-family: -apple-system,BlinkMacSystemFont,Segoe U=
I,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important;=
 padding: 0;">&#160;</td>
    </tr>
  </tbody>
</table>

              <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" ali=
gn=3D"left" width=3D"100%" style=3D"box-sizing: border-box; border-spacin=
g: 0; border-collapse: collapse; font-family: -apple-system,BlinkMacSyste=
mFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoj=
i !important;">
                <tr style=3D"box-sizing: border-box; font-family: -apple-=
system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color=
 Emoji,Segoe UI Emoji !important;">
                  <td class=3D"text-left" style=3D"box-sizing: border-box=
; text-align: left !important; font-family: -apple-system,BlinkMacSystemF=
ont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji =
!important; padding: 0;" align=3D"left">
                    <img src=3D"https://github.githubassets.com/assets/oc=
tocat-logo-805b5c3e249f.png" alt=3D"GitHub" width=3D"32" style=3D"box-siz=
ing: border-box; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,H=
elvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important; bo=
rder-style: none;" />
                    <h2 class=3D"lh-condensed mt-2 text-normal" style=3D"=
box-sizing: border-box; margin-top: 8px !important; margin-bottom: 0; fon=
t-size: 24px; font-weight: 400 !important; line-height: 1.25 !important; =
font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sa=
ns-serif,Apple Color Emoji,Segoe UI Emoji !important;">
                        [SkogAI/gptme] Release workflow run

                    </h2>
                  </td>
                </tr>
              </table>
              <table role=3D"presentation" style=3D"box-sizing: border-bo=
x; border-spacing: 0; border-collapse: collapse; font-family: -apple-syst=
em,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emo=
ji,Segoe UI Emoji !important;">
  <tbody style=3D"box-sizing: border-box; font-family: -apple-system,Blin=
kMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Sego=
e UI Emoji !important;">
    <tr style=3D"box-sizing: border-box; font-family: -apple-system,Blink=
MacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe=
 UI Emoji !important;">
      <td height=3D"16" style=3D"font-size: 16px; line-height: 16px; box-=
sizing: border-box; font-family: -apple-system,BlinkMacSystemFont,Segoe U=
I,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important;=
 padding: 0;">&#160;</td>
    </tr>
  </tbody>
</table>

</td>
  </tr>
</table>
            <table width=3D"100%" class=3D"width-full" style=3D"box-sizin=
g: border-box; border-spacing: 0; border-collapse: collapse; width: 100% =
!important; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvet=
ica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important;">
              <tr style=3D"box-sizing: border-box; font-family: -apple-sy=
stem,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color E=
moji,Segoe UI Emoji !important;">
                <td class=3D"border rounded-2 d-block" style=3D"box-sizin=
g: border-box; border-radius: 6px !important; display: block !important; =
font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sa=
ns-serif,Apple Color Emoji,Segoe UI Emoji !important; padding: 0; border:=
 1px solid #e1e4e8;">
                  <table align=3D"center" class=3D"width-full text-center=
" style=3D"box-sizing: border-box; border-spacing: 0; border-collapse: co=
llapse; width: 100% !important; text-align: center !important; font-famil=
y: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,A=
pple Color Emoji,Segoe UI Emoji !important;">
                    <tr style=3D"box-sizing: border-box; font-family: -ap=
ple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple C=
olor Emoji,Segoe UI Emoji !important;">
                      <td style=3D"box-sizing: border-box; font-family: -=
apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple=
 Color Emoji,Segoe UI Emoji !important; padding: 0;">
                        <table role=3D"presentation" border=3D"0" cellspa=
cing=3D"0" cellpadding=3D"0" align=3D"center" class=3D"width-full" width=3D=
"100%" style=3D"box-sizing: border-box; border-spacing: 0; border-collaps=
e: collapse; width: 100% !important; font-family: -apple-system,BlinkMacS=
ystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI =
Emoji !important;">
  <tr style=3D"box-sizing: border-box; font-family: -apple-system,BlinkMa=
cSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe U=
I Emoji !important;">
    <td align=3D"center" style=3D"box-sizing: border-box; font-family: -a=
pple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple =
Color Emoji,Segoe UI Emoji !important; padding: 0;">
                          =

<table role=3D"presentation" align=3D"center" class=3D"border-bottom widt=
h-full text-center" style=3D"box-sizing: border-box; border-spacing: 0; b=
order-collapse: collapse; border-bottom-width: 1px !important; border-bot=
tom-color: #e1e4e8 !important; border-bottom-style: solid !important; wid=
th: 100% !important; text-align: center !important; font-family: -apple-s=
ystem,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color =
Emoji,Segoe UI Emoji !important;">
  <tr style=3D"box-sizing: border-box; font-family: -apple-system,BlinkMa=
cSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe U=
I Emoji !important;">
    <td class=3D"d-block tmp-px-3 tmp-pt-3 tmp-p-sm-4" style=3D"box-sizin=
g: border-box; display: block !important; font-family: -apple-system,Blin=
kMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Sego=
e UI Emoji !important; padding: 16px 16px 0;">
      <table role=3D"presentation" border=3D"0" cellspacing=3D"0" cellpad=
ding=3D"0" align=3D"center" class=3D"width-full" width=3D"100%" style=3D"=
box-sizing: border-box; border-spacing: 0; border-collapse: collapse; wid=
th: 100% !important; font-family: -apple-system,BlinkMacSystemFont,Segoe =
UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important=
;">
  <tr style=3D"box-sizing: border-box; font-family: -apple-system,BlinkMa=
cSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe U=
I Emoji !important;">
    <td align=3D"center" style=3D"box-sizing: border-box; font-family: -a=
pple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple =
Color Emoji,Segoe UI Emoji !important; padding: 0;">
        =

    <img src=3D"https://github.githubassets.com/assets/actions-1cc0c3ccfe=
18.png" width=3D"56" height=3D"56" alt=3D"" style=3D"box-sizing: border-b=
ox; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Aria=
l,sans-serif,Apple Color Emoji,Segoe UI Emoji !important; border-style: n=
one;" />
  <table role=3D"presentation" style=3D"box-sizing: border-box; border-sp=
acing: 0; border-collapse: collapse; font-family: -apple-system,BlinkMacS=
ystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI =
Emoji !important;">
  <tbody style=3D"box-sizing: border-box; font-family: -apple-system,Blin=
kMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Sego=
e UI Emoji !important;">
    <tr style=3D"box-sizing: border-box; font-family: -apple-system,Blink=
MacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe=
 UI Emoji !important;">
      <td height=3D"12" style=3D"font-size: 12px; line-height: 12px; box-=
sizing: border-box; font-family: -apple-system,BlinkMacSystemFont,Segoe U=
I,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important;=
 padding: 0;">&#160;</td>
    </tr>
  </tbody>
</table>

<h3 class=3D"lh-condensed" style=3D"box-sizing: border-box; margin-top: 0=
; margin-bottom: 0; font-size: 20px; font-weight: 600; line-height: 1.25 =
!important; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvet=
ica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important;">Releas=
e: Some jobs were not successful</h3>
<table role=3D"presentation" style=3D"box-sizing: border-box; border-spac=
ing: 0; border-collapse: collapse; font-family: -apple-system,BlinkMacSys=
temFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Em=
oji !important;">
  <tbody style=3D"box-sizing: border-box; font-family: -apple-system,Blin=
kMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Sego=
e UI Emoji !important;">
    <tr style=3D"box-sizing: border-box; font-family: -apple-system,Blink=
MacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe=
 UI Emoji !important;">
      <td height=3D"16" style=3D"font-size: 16px; line-height: 16px; box-=
sizing: border-box; font-family: -apple-system,BlinkMacSystemFont,Segoe U=
I,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important;=
 padding: 0;">&#160;</td>
    </tr>
  </tbody>
</table>



  <table role=3D"presentation" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" align=3D"center" class=3D"width-full" width=3D"100%" style=3D"box-=
sizing: border-box; border-spacing: 0; border-collapse: collapse; width: =
100% !important; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,H=
elvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important;">
  <tr style=3D"box-sizing: border-box; font-family: -apple-system,BlinkMa=
cSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe U=
I Emoji !important;">
    <td align=3D"center" style=3D"box-sizing: border-box; font-family: -a=
pple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple =
Color Emoji,Segoe UI Emoji !important; padding: 0;">
    <table role=3D"presentation" width=3D"100%" border=3D"0" cellspacing=3D=
"0" cellpadding=3D"0" style=3D"box-sizing: border-box; border-spacing: 0;=
 border-collapse: collapse; font-family: -apple-system,BlinkMacSystemFont=
,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !im=
portant;">
  <tr style=3D"box-sizing: border-box; font-family: -apple-system,BlinkMa=
cSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe U=
I Emoji !important;">
    <td style=3D"box-sizing: border-box; font-family: -apple-system,Blink=
MacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe=
 UI Emoji !important; padding: 0;">
      <table role=3D"presentation" border=3D"0" cellspacing=3D"0" cellpad=
ding=3D"0" width=3D"100%" style=3D"box-sizing: border-box; border-spacing=
: 0; border-collapse: collapse; font-family: -apple-system,BlinkMacSystem=
Font,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji=
 !important;">
        <tr style=3D"box-sizing: border-box; font-family: -apple-system,B=
linkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,S=
egoe UI Emoji !important;">
          <td align=3D"center" style=3D"box-sizing: border-box; font-fami=
ly: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,=
Apple Color Emoji,Segoe UI Emoji !important; padding: 0;">
              <!--[if mso]> <table><tr><td align=3D"center" bgcolor=3D"#2=
8a745"> <![endif]-->
                <a href=3D"https://github.com/SkogAI/gptme/actions/runs/2=
4836852505?email_source=3Dnotifications&amp;email_token=3DAAFIQZ5ZPAWD5Y4=
IC25SK5D4XIIP5A5CNFSNUACCM5UWIORPF5TWS5BNNB2WEL2DNBSWG22TOVUXIZKFOZSW45CO=
N52GSZTJMNQXI2LPNYXTMNJYHAYDENJUGY3TQJJTIIYTONZWHE2DSNRQHGTHEZLBONXW5IFFM=
V3GK3TUWVRXGX3XN5ZGWZTMN53V64TVNZPWG3DJMNVQ" target=3D"_blank" rel=3D"noo=
pener noreferrer" class=3D"btn btn-large btn-primary" style=3D"background=
-color: #1f883d !important; box-sizing: border-box; color: #fff; text-dec=
oration: none; white-space: nowrap; vertical-align: middle; cursor: point=
er; -webkit-user-select: none; user-select: none; appearance: none; borde=
r-radius: .5em; font-size: inherit; font-weight: 500; line-height: 1.5; d=
isplay: inline-block; position: relative; transition: background-color .2=
s cubic-bezier(.3,0,.5,1); box-shadow: 0 1px #1b1f231a,inset 0 1px #fffff=
f08; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Ari=
al,sans-serif,Apple Color Emoji,Segoe UI Emoji !important; padding: .75em=
 1.5em; border: 1px solid #1f883d;">View workflow run</a>
              <!--[if mso]> </td></tr></table> <![endif]-->
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>

</td>
  </tr>
</table>
  <table role=3D"presentation" style=3D"box-sizing: border-box; border-sp=
acing: 0; border-collapse: collapse; font-family: -apple-system,BlinkMacS=
ystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI =
Emoji !important;">
  <tbody style=3D"box-sizing: border-box; font-family: -apple-system,Blin=
kMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Sego=
e UI Emoji !important;">
    <tr style=3D"box-sizing: border-box; font-family: -apple-system,Blink=
MacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe=
 UI Emoji !important;">
      <td height=3D"32" style=3D"font-size: 32px; line-height: 32px; box-=
sizing: border-box; font-family: -apple-system,BlinkMacSystemFont,Segoe U=
I,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important;=
 padding: 0;">&#160;</td>
    </tr>
  </tbody>
</table>


</td>
  </tr>
</table>
    </td>
  </tr>
</table>

  <table role=3D"presentation" align=3D"center" class=3D"width-full text-=
center" style=3D"box-sizing: border-box; border-spacing: 0; border-collap=
se: collapse; width: 100% !important; text-align: center !important; font=
-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-s=
erif,Apple Color Emoji,Segoe UI Emoji !important;">
  <tr style=3D"box-sizing: border-box; font-family: -apple-system,BlinkMa=
cSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe U=
I Emoji !important;">
    <td class=3D"d-block" style=3D"box-sizing: border-box; display: block=
 !important; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helve=
tica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important; paddin=
g: 0;">
      <table role=3D"presentation" border=3D"0" cellspacing=3D"0" cellpad=
ding=3D"0" align=3D"center" class=3D"width-full" width=3D"100%" style=3D"=
box-sizing: border-box; border-spacing: 0; border-collapse: collapse; wid=
th: 100% !important; font-family: -apple-system,BlinkMacSystemFont,Segoe =
UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important=
;">
  <tr style=3D"box-sizing: border-box; font-family: -apple-system,BlinkMa=
cSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe U=
I Emoji !important;">
    <td align=3D"center" style=3D"box-sizing: border-box; font-family: -a=
pple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple =
Color Emoji,Segoe UI Emoji !important; padding: 0;">
        =

    <table class=3D"width-full text-left" style=3D"box-sizing: border-box=
; border-spacing: 0; border-collapse: collapse; width: 100% !important; t=
ext-align: left !important; font-family: -apple-system,BlinkMacSystemFont=
,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !im=
portant;">
      <thead style=3D"box-sizing: border-box; font-family: -apple-system,=
BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,=
Segoe UI Emoji !important;">
        <tr style=3D"box-sizing: border-box; font-family: -apple-system,B=
linkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,S=
egoe UI Emoji !important;">
          <th scope=3D"col" class=3D"tmp-pl-3 tmp-py-3 tmp-p-sm-4" style=3D=
"width: 24px; box-sizing: border-box; font-family: -apple-system,BlinkMac=
SystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI=
 Emoji !important; padding: 16px 0 16px 16px;">Status</th>
          <th scope=3D"col" class=3D"tmp-p-3" style=3D"width: 100%; box-s=
izing: border-box; font-family: -apple-system,BlinkMacSystemFont,Segoe UI=
,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important; =
padding: 16px;">Job</th>
          <th scope=3D"col" class=3D"tmp-pr-3 tmp-py-3" style=3D"white-sp=
ace: nowrap; box-sizing: border-box; font-family: -apple-system,BlinkMacS=
ystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI =
Emoji !important; padding: 16px 16px 16px 0;">Annotations</th>
        </tr>
      </thead>
      <tbody style=3D"box-sizing: border-box; font-family: -apple-system,=
BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,=
Segoe UI Emoji !important;">
          <tr style=3D"box-sizing: border-box; font-family: -apple-system=
,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji=
,Segoe UI Emoji !important;">
            <td class=3D"tmp-pl-3 tmp-py-3 tmp-p-sm-4" style=3D"box-sizin=
g: border-box; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Hel=
vetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important; padd=
ing: 16px 0 16px 16px;">
              <img src=3D"https://github.githubassets.com/assets/check-ci=
rcle-fill-green-beec9eb7b823.png" alt=3D"Pre-flight checks" height=3D"24"=
 width=3D"24" style=3D"box-sizing: border-box; font-family: -apple-system=
,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji=
,Segoe UI Emoji !important; border-style: none;" />
            </td>
            <td class=3D"tmp-p-3" style=3D"width: 100%; box-sizing: borde=
r-box; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,A=
rial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important; padding: 16p=
x;">
              <p class=3D"mb-0" style=3D"box-sizing: border-box; margin-t=
op: 0; margin-bottom: 0 !important; font-family: -apple-system,BlinkMacSy=
stemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI E=
moji !important;">
                <b style=3D"font-weight: 600; box-sizing: border-box; fon=
t-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-=
serif,Apple Color Emoji,Segoe UI Emoji !important;">Release</b> / Pre-fli=
ght checks
                <br style=3D"box-sizing: border-box; font-family: -apple-=
system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color=
 Emoji,Segoe UI Emoji !important;" />
                Succeeded in 6 seconds
              </p>
            </td>
            <td class=3D"tmp-pr-3 tmp-py-3" style=3D"white-space: nowrap;=
 box-sizing: border-box; font-family: -apple-system,BlinkMacSystemFont,Se=
goe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !impor=
tant; padding: 16px 16px 16px 0;">
            </td>
          </tr>
          <tr style=3D"box-sizing: border-box; font-family: -apple-system=
,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji=
,Segoe UI Emoji !important;">
            <td class=3D"tmp-pl-3 tmp-py-3 tmp-p-sm-4" style=3D"box-sizin=
g: border-box; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Hel=
vetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important; padd=
ing: 16px 0 16px 16px;">
              <img src=3D"https://github.githubassets.com/assets/check-ci=
rcle-fill-green-beec9eb7b823.png" alt=3D"Create release" height=3D"24" wi=
dth=3D"24" style=3D"box-sizing: border-box; font-family: -apple-system,Bl=
inkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Se=
goe UI Emoji !important; border-style: none;" />
            </td>
            <td class=3D"tmp-p-3" style=3D"width: 100%; box-sizing: borde=
r-box; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,A=
rial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important; padding: 16p=
x;">
              <p class=3D"mb-0" style=3D"box-sizing: border-box; margin-t=
op: 0; margin-bottom: 0 !important; font-family: -apple-system,BlinkMacSy=
stemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI E=
moji !important;">
                <b style=3D"font-weight: 600; box-sizing: border-box; fon=
t-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-=
serif,Apple Color Emoji,Segoe UI Emoji !important;">Release</b> / Create =
release
                <br style=3D"box-sizing: border-box; font-family: -apple-=
system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color=
 Emoji,Segoe UI Emoji !important;" />
                Succeeded in 1 minute and 25 seconds
              </p>
            </td>
            <td class=3D"tmp-pr-3 tmp-py-3" style=3D"white-space: nowrap;=
 box-sizing: border-box; font-family: -apple-system,BlinkMacSystemFont,Se=
goe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !impor=
tant; padding: 16px 16px 16px 0;">
            </td>
          </tr>
          <tr style=3D"box-sizing: border-box; font-family: -apple-system=
,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji=
,Segoe UI Emoji !important;">
            <td class=3D"tmp-pl-3 tmp-py-3 tmp-p-sm-4" style=3D"box-sizin=
g: border-box; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Hel=
vetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important; padd=
ing: 16px 0 16px 16px;">
              <img src=3D"https://github.githubassets.com/assets/x-circle=
-fill-red-153d16960fc8.png" alt=3D"Publish release" height=3D"24" width=3D=
"24" style=3D"box-sizing: border-box; font-family: -apple-system,BlinkMac=
SystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI=
 Emoji !important; border-style: none;" />
            </td>
            <td class=3D"tmp-p-3" style=3D"width: 100%; box-sizing: borde=
r-box; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,A=
rial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important; padding: 16p=
x;">
              <p class=3D"mb-0" style=3D"box-sizing: border-box; margin-t=
op: 0; margin-bottom: 0 !important; font-family: -apple-system,BlinkMacSy=
stemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI E=
moji !important;">
                <b style=3D"font-weight: 600; box-sizing: border-box; fon=
t-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-=
serif,Apple Color Emoji,Segoe UI Emoji !important;">Release</b> / Publish=
 release
                <br style=3D"box-sizing: border-box; font-family: -apple-=
system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color=
 Emoji,Segoe UI Emoji !important;" />
                Failed in 29 seconds
              </p>
            </td>
            <td class=3D"tmp-pr-3 tmp-py-3" style=3D"white-space: nowrap;=
 box-sizing: border-box; font-family: -apple-system,BlinkMacSystemFont,Se=
goe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !impor=
tant; padding: 16px 16px 16px 0;">
                <a href=3D"https://github.com/SkogAI/gptme/actions/runs/2=
4836852505?email_source=3Dnotifications&amp;email_token=3DAAFIQZ7SKHXNP5E=
WABPOM2L4XIIP5A5CNFSNUACCM5UWIORPF5TWS5BNNB2WEL2DNBSWG22TOVUXIZKFOZSW45CO=
N52GSZTJMNQXI2LPNYXTMNJYHAYDENJUGY3TQJJTIIYTONZWHE2DSNRQHGTHEZLBONXW5IFFM=
V3GK3TUWRRXGX3BNZXG65DBORUW63TTL5RWY2LDNM" style=3D"background-color: #00=
00; box-sizing: border-box; color: #0366d6; text-decoration: none; font-f=
amily: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-ser=
if,Apple Color Emoji,Segoe UI Emoji !important;">
                  <img src=3D"https://github.githubassets.com/assets/repo=
rt-gray-d5f2721544ee.png" alt=3D"annotations for Release / Publish releas=
e" width=3D"16" height=3D"16" style=3D"box-sizing: border-box; font-famil=
y: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,A=
pple Color Emoji,Segoe UI Emoji !important; border-style: none;" />
                  <span class=3D"d-table-cell v-align-middle text-gray-li=
ght" style=3D"box-sizing: border-box; color: #6a737d !important; vertical=
-align: middle !important; display: table-cell !important; font-family: -=
apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple=
 Color Emoji,Segoe UI Emoji !important;"> 1 </span>
                </a>
            </td>
          </tr>
      </tbody>
    </table>

</td>
  </tr>
</table>
    </td>
  </tr>
</table>



</td>
  </tr>
</table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <table role=3D"presentation" border=3D"0" cellspacing=3D"0" c=
ellpadding=3D"0" align=3D"center" class=3D"width-full text-center" width=3D=
"100%" style=3D"box-sizing: border-box; border-spacing: 0; border-collaps=
e: collapse; width: 100% !important; text-align: center !important; font-=
family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-se=
rif,Apple Color Emoji,Segoe UI Emoji !important;">
  <tr style=3D"box-sizing: border-box; font-family: -apple-system,BlinkMa=
cSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe U=
I Emoji !important;">
    <td align=3D"center" style=3D"box-sizing: border-box; font-family: -a=
pple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple =
Color Emoji,Segoe UI Emoji !important; padding: 0;">
              <table role=3D"presentation" style=3D"box-sizing: border-bo=
x; border-spacing: 0; border-collapse: collapse; font-family: -apple-syst=
em,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emo=
ji,Segoe UI Emoji !important;">
  <tbody style=3D"box-sizing: border-box; font-family: -apple-system,Blin=
kMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Sego=
e UI Emoji !important;">
    <tr style=3D"box-sizing: border-box; font-family: -apple-system,Blink=
MacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe=
 UI Emoji !important;">
      <td height=3D"16" style=3D"font-size: 16px; line-height: 16px; box-=
sizing: border-box; font-family: -apple-system,BlinkMacSystemFont,Segoe U=
I,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important;=
 padding: 0;">&#160;</td>
    </tr>
  </tbody>
</table>

              <table role=3D"presentation" style=3D"box-sizing: border-bo=
x; border-spacing: 0; border-collapse: collapse; font-family: -apple-syst=
em,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emo=
ji,Segoe UI Emoji !important;">
  <tbody style=3D"box-sizing: border-box; font-family: -apple-system,Blin=
kMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Sego=
e UI Emoji !important;">
    <tr style=3D"box-sizing: border-box; font-family: -apple-system,Blink=
MacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe=
 UI Emoji !important;">
      <td height=3D"16" style=3D"font-size: 16px; line-height: 16px; box-=
sizing: border-box; font-family: -apple-system,BlinkMacSystemFont,Segoe U=
I,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important;=
 padding: 0;">&#160;</td>
    </tr>
  </tbody>
</table>

              <p class=3D"f5 text-gray-light" style=3D"box-sizing: border=
-box; margin-top: 0; margin-bottom: 10px; color: #6a737d !important; font=
-size: 14px !important; font-family: -apple-system,BlinkMacSystemFont,Seg=
oe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !import=
ant;">  </p><p style=3D"font-size: small; -webkit-text-size-adjust: none;=
 color: #666; box-sizing: border-box; margin-top: 0; margin-bottom: 10px;=
 font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,s=
ans-serif,Apple Color Emoji,Segoe UI Emoji !important;">&#8212;<br style=3D=
"box-sizing: border-box; font-family: -apple-system,BlinkMacSystemFont,Se=
goe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !impor=
tant;" />You are receiving this because you are subscribed to this thread=
.<br style=3D"box-sizing: border-box; font-family: -apple-system,BlinkMac=
SystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI=
 Emoji !important;" /><a href=3D"https://github.com/settings/notification=
s?email_source=3Dnotifications&amp;email_token=3DAAFIQZZFJDCFQOCVNXPBUBL4=
XIIP5A5CNFSNUACCM5UWIORPF5TWS5BNNB2WEL2DNBSWG22TOVUXIZKFOZSW45CON52GSZTJM=
NQXI2LPNYXTMNJYHAYDENJUGY3TQJJTIIYTONZWHE2DSNRQHGTHEZLBONXW5IFFMV3GK3TUWF=
RXGX3TMV2HI2LOM5ZV6Y3MNFRWW" style=3D"background-color: #0000; box-sizing=
: border-box; color: #0366d6; text-decoration: none; font-family: -apple-=
system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color=
 Emoji,Segoe UI Emoji !important;">Manage your GitHub Actions notificatio=
ns</a></p>

</td>
  </tr>
</table>
            <table role=3D"presentation" border=3D"0" cellspacing=3D"0" c=
ellpadding=3D"0" align=3D"center" class=3D"width-full text-center" width=3D=
"100%" style=3D"box-sizing: border-box; border-spacing: 0; border-collaps=
e: collapse; width: 100% !important; text-align: center !important; font-=
family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-se=
rif,Apple Color Emoji,Segoe UI Emoji !important;">
  <tr style=3D"box-sizing: border-box; font-family: -apple-system,BlinkMa=
cSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe U=
I Emoji !important;">
    <td align=3D"center" style=3D"box-sizing: border-box; font-family: -a=
pple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple =
Color Emoji,Segoe UI Emoji !important; padding: 0;">
  <table role=3D"presentation" style=3D"box-sizing: border-box; border-sp=
acing: 0; border-collapse: collapse; font-family: -apple-system,BlinkMacS=
ystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI =
Emoji !important;">
  <tbody style=3D"box-sizing: border-box; font-family: -apple-system,Blin=
kMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Sego=
e UI Emoji !important;">
    <tr style=3D"box-sizing: border-box; font-family: -apple-system,Blink=
MacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe=
 UI Emoji !important;">
      <td height=3D"16" style=3D"font-size: 16px; line-height: 16px; box-=
sizing: border-box; font-family: -apple-system,BlinkMacSystemFont,Segoe U=
I,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important;=
 padding: 0;">&#160;</td>
    </tr>
  </tbody>
</table>

  <p class=3D"f6 text-gray-light" style=3D"box-sizing: border-box; margin=
-top: 0; margin-bottom: 10px; color: #6a737d !important; font-size: 12px =
!important; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvet=
ica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji !important;">GitHub=
, Inc. &#12539;88 Colin P Kelly Jr Street &#12539;San Francisco, CA 94107=
</p>
</td>
  </tr>
</table>

          </center>
        </td>
      </tr>
    </table>
    <!-- prevent Gmail on iOS font size manipulation -->
   <div style=3D"display: none; white-space: nowrap; box-sizing: border-b=
ox; font: 15px/0 apple-system, BlinkMacSystemFont, Segoe, UI, Helvetica, =
Arial, sans-serif, Apple, Color, Emoji, Segoe, UI, Emoji;"> &#160; &#160;=
 &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#=
160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160=
; &#160; &#160; &#160; &#160; &#160; &#160; &#160; </div>
  </body>
</html>

--part_5fc4004a871d3703e63f90c9a562aad4aa053d0af2de30f18522f72e7ac401dd--

