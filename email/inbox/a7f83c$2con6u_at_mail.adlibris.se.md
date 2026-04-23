Delivered-To: emil.skogsund@gmail.com
Received: by 10.12.216.65 with SMTP id i1csp1080052qvj;
        Fri, 12 Jan 2018 07:15:20 -0800 (PST)
X-Google-Smtp-Source: ACJfBouJjhI36UxG4bANOadqrkly/dxe5cGujp8GHNlNwJ7iJm7UZkKkbvkVvdF2RFX7uVggKg72
X-Received: by 10.84.218.194 with SMTP id g2mr11826430plm.147.1515770120906;
        Fri, 12 Jan 2018 07:15:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515770120; cv=none;
        d=google.com; s=arc-20160816;
        b=BQZuJ7dy/KlLwBLR2/v5S7oogqJPeGiSnQwwLVzI050knus4fcjd2+bxzx77hB+RyP
         sgzEeTniLq2Zi1cGemCZHHHzQo1etFuzNGa3MY5eRdkWjD5qcba9T1YsO+jCjGim567+
         yWE2LIt6paxejFBGjo4+QZl1i48zANpJy/kiIjOrLUgvjh3gqgTB46XvF+NiG8vO2hqQ
         pXzooYBMJA0ej3pq39TVtJhAxj9hmdV28xiZB1wr9OVcmxyzIP386m0aRI7HvgLOowbn
         b+8W/GmqyJexHNbNhrOP8KAM6+hN5mmHD+KxCYs9b2CegUAdFOSzyoVWj116xV2V3xL4
         owBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=spamdiagnosticmetadata:spamdiagnosticoutput
         :content-transfer-encoding:subject:date:to:from:mime-version
         :message-id:dkim-signature:arc-authentication-results;
        bh=8c/lKmxkWVm9MqURfpSouNHccZal7LaWrlT20cPkkKo=;
        b=w5V13zVTgLsFdCl+uC+pxQ7QvYqc5OfYQsY1SeNkr04++wdOPE9VtHQ8H0/SlhZ5cV
         y0jbrbF7ZjDpuHZogirROWTP3gIPdfA1oOR3iU65L35z6Czj/b4Y/ClsxyjSlhovcl9C
         jrbtyTMjzAlAWVALRH0mWOvTzyDfE6bPQwjpd5vFiKawGyVzLLu054JllrAwKKdro3Sd
         wOh4M9P6aNOoRbwi+6XXIZzgfYAuUKAiANNIl9vkpm5xglI0fwnH6X5WyPi/u8PsFZCp
         7UwofriS7H6cGMF4HXbThe/tbKHUmlngFiq2T+yh+yOHY/JLtDvtzKwzWEJMzW3g7eeP
         WZsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@adlibris.onmicrosoft.com header.s=selector1-adlibris-com header.b=ctcCrcYR;
       spf=pass (google.com: domain of info@adlibris.com designates 104.47.0.72 as permitted sender) smtp.mailfrom=info@adlibris.com
Return-Path: <info@adlibris.com>
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on0072.outbound.protection.outlook.com. [104.47.0.72])
        by mx.google.com with ESMTPS id r10si3432125plj.355.2018.01.12.07.15.19
        for <emil.skogsund@gmail.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 07:15:20 -0800 (PST)
Received-SPF: pass (google.com: domain of info@adlibris.com designates 104.47.0.72 as permitted sender) client-ip=104.47.0.72;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@adlibris.onmicrosoft.com header.s=selector1-adlibris-com header.b=ctcCrcYR;
       spf=pass (google.com: domain of info@adlibris.com designates 104.47.0.72 as permitted sender) smtp.mailfrom=info@adlibris.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adlibris.onmicrosoft.com; s=selector1-adlibris-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=8c/lKmxkWVm9MqURfpSouNHccZal7LaWrlT20cPkkKo=;
 b=ctcCrcYRXAVZyByODFwFAumq88QmX8N/mEOBM9a5FhMbqAgEtl6SdTSlPTw4II0ZXAtfDPpno4V3WDoExUG1oabv94nzcqFoNPIDbd0707zn7nJWY2K/CsVzlSmGwVvoXAvK1bfhoqWWYptWgMjOCyzuuLwXOSoEBv0Mw+/ov8Y=
Received: from HE1PR0202CA0027.eurprd02.prod.outlook.com (2603:10a6:3:e4::13)
 by DB5PR0201MB1846.eurprd02.prod.outlook.com (2603:10a6:0:32::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.386.5; Fri, 12
 Jan 2018 15:15:16 +0000
Received: from DB5EUR01FT020.eop-EUR01.prod.protection.outlook.com
 (2a01:111:f400:7e02::205) by HE1PR0202CA0027.outlook.office365.com
 (2603:10a6:3:e4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.407.7 via Frontend
 Transport; Fri, 12 Jan 2018 15:15:16 +0000
Received-SPF: Pass (protection.outlook.com: domain of adlibris.com designates
 195.178.161.86 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.178.161.86; helo=mail.adlibris.se;
Received: from mail.adlibris.se (195.178.161.86) by
 DB5EUR01FT020.mail.protection.outlook.com (10.152.4.247) with Microsoft SMTP
 Server id 15.20.345.12 via Frontend Transport; Fri, 12 Jan 2018 15:15:15
 +0000
Message-ID: <a7f83c$2con6u@mail.adlibris.se>
Received: from service-19.adnet.adlibris.se (HELO SERVICE-19) ([172.16.0.143])
  by mail.adlibris.se with ESMTP; 12 Jan 2018 16:15:17 +0100
MIME-Version: 1.0
From: Adlibris <info@adlibris.com>
To: <emil.skogsund@gmail.com>
Date: Fri, 12 Jan 2018 16:15:15 +0100
Subject: =?utf-8?B?VsOkbGtvbW1lbiB0aWxsIEFkbGlicmlzIOKAkyBEaW5hIGt1?=
 =?utf-8?B?bmR1cHBnaWZ0ZXI=?=
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64
Return-Path: info@adlibris.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report:
	CIP:195.178.161.86;IPV:CAL;CTRY:SE;EFV:NLI;SFV:NSPM;SFS:(10009020)(39860400002)(39380400002)(346002)(396003)(376002)(2980300002)(438002)(199004)(189003)(9686003)(236005)(6306002)(15188155005)(86362001)(1680700002)(104016004)(606006)(2906002)(733005)(19273905006)(6346003)(19615525001)(77096006)(63266004)(16799955002)(50466002)(106002)(316002)(106466001)(7596002)(53376002)(356003)(23846002)(8936002)(224313004)(224303003)(2351001)(39060400002)(15974865002)(6916009)(246002)(7066003)(7636002)(23676004)(5660300001)(26826003)(2486003)(53386004)(478600001)(35302002)(87552003)(57052003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB5PR0201MB1846;H:mail.adlibris.se;FPR:;SPF:Pass;PTR:mail.adlibris.se;A:1;MX:1;LANG:sv;
X-Microsoft-Exchange-Diagnostics: 1;DB5EUR01FT020;1:NINFyGEV4gkDcbYdHa8N6OcbyJyGZ24NF/ijHAXXJYZdu1LRQgycGdH22Ils6xd77jUHygDH25TfQATxcmtaKKmsL3cMzPY+sv5Icfb8FM0+Ph3FwsKqf+Unx5/kZDtZ
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec4c5d62-df01-4650-94b0-08d559cf48dc
X-Microsoft-Antispam:
	UriScan:;BCL:0;PCL:0;RULEID:(7020083)(4652020)(5600026)(4604075)(4608076)(2017052603307)(7153060);SRVR:DB5PR0201MB1846;
X-Microsoft-Exchange-Diagnostics:
	1;DB5PR0201MB1846;3:wbTa65kX1sSCPspWbMJaP5B7iHW8WnryT6h8IxiPnxUmLAa6kMioFbYMbzVVo9Mt3ChsX+QiSNslw/K9WjUAlosCjl/I6lt9FALC4dW/CjFHmnrcnf7A/DrROhVIeI/uxSyDXl1/0DZPRsFViXk98JSg4YIoVRW9X/dF0JnNumAC62ENudcN9DoQnlWM2zyL8pCAMrONwCAO4ycwjZNLa2NLn6Hb9gRixR9Lpk76gnNZ6HaPov1FG9JLQMVLtZ8dqc4lw5WkrQA9UOWrjlgiUueUJXglJwUwBd1r9cz1joqjq4iYCphjOVK3cYFZNEdoTmgYimycPDNP41UwUqsUhrqRI9MPOG1CI4RneJzM2lw=;25:+rWfyJIVWhaESOP4mo9fkxG67+Cq3xYuRkVUA4AKOkXbB+ZzvIau1KgCbh6Frz+40L1qYa1FsRkA2BB3OxaS07lgsEU6U2IjKog5D1RPxl9e0SA0YHRJNBWtmTk3E5vfJSfcnRy4kY04hENU6XWAVhLA5lE8trQkSuEcW9V9/kNFemuMAM17RHDlE8rrml3eNaHybBxhumtTorr4MldZoOL+IQ8sYQKO/mWh6BUZj9pmnR3s+nNg7bBUWBPND367zFLrVTVRBrq7ONkerH/dJ1g5PYpNJ+whnk6rro37Qcvu/4xaC5nU/kAgD5moUv0HbKY8Dpt5jTH7PjoqQ7s0EQ==
X-MS-TrafficTypeDiagnostic: DB5PR0201MB1846:
X-Microsoft-Exchange-Diagnostics:
	1;DB5PR0201MB1846;31:5Uk4AwV2+yk3AhJUMylSQl0BMnwwW0IvUW43q8NJfJSkQp6gqgFWDObiFFB+0+xLyLJi9GZffuo5s3D3FPNVAmxV+BaVU1tO70cv3iuP6sDBXuLYJAK18tj7X7Yyt8t0leEUHGageZN7gBzkrE7ozqQK+WQIz6C7eboaRPN6RI7436gj3F/lx+mHzv2chuBjNV+jyl2LIeqadqJpkM+iUWR4Pgg4CLCyDisMBhw2JIk=;4:Nnb9MtG3G6+7BadftQBSyoWmjFCSLyxGQWVuPUsUqP9GV7T43ObwWMMUJdR0cSp0D3X8BcqbtGzduB1z3sR5ff3dSFMXrRQUZ9ILk5DAj5podPp5Z7jOHvSIwmQ3szHcytEXDwesckItRWk4uOlAe9hYKdrMJ8wLbVjyzjGWq1QiNGs3QmoHHjFB6SEYIZ4HajteVgHlUXJxQNvxfNjUztYl0mBeiH9r5qnKuNGnEmQU/u5Ngfd3C9q+IPVc9VerAWkat2IX3jscZbZYweezjSiZFU4rhYOimef8klAnH9yv+c7kuCFdsuIvcQv0/c+aPVOTQnAvAlixL+TvKbfPDCvx227yCQKyf7M4qKUpV5GOypNCwhjxyMsP1q145VcQTW47JCccTgGG/2WIykCAOMzMGQGI6kR0s/uGwIuyTYj6Pr+ZBvrZ02nV3JZd9wowcjp9i9axXDUPcgH+ADK7pGHtoAM6fReEpE04eaht9IaW7cqPmNpfYB7U7r1YgJy/PcVkjffZiuz1eqrchgheamLkXacHU+bSwIZNwdAa0Io=
X-Microsoft-Antispam-PRVS:
	<DB5PR0201MB18468FCA13C1D23246B31430B1170@DB5PR0201MB1846.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test:
	UriScan:(148322886591682)(36152072134362)(31418570063057)(85827821059158)(86561027422486)(81227570615382)(64217206974132)(162078923652245);
X-Exchange-Antispam-Report-CFA-Test:
	BCL:0;PCL:0;RULEID:(6040470)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231023)(944501144)(93006095)(93004095)(6041268)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(6072148)(201708071742011);SRVR:DB5PR0201MB1846;BCL:0;PCL:0;RULEID:(100000803101)(100110400095);SRVR:DB5PR0201MB1846;
X-Forefront-PRVS: 0550778858
X-Microsoft-Exchange-Diagnostics:
	=?utf-8?B?MTtEQjVQUjAyMDFNQjE4NDY7MjM6eXFrTFhNUlZkUGN1ZXA4UHVFcFQ0L2Q4?=
 =?utf-8?B?eC80QmFoYU43RnJVeWwybDlxdjlLd2UzZFJtWFExMERNQVFsa2h2SWEvV2N1?=
 =?utf-8?B?ZDBzZXU3WW5FTEw3RFcxMHlRZldFQWlGcFZNTEhEaTlTOG4ybnpMNnc3amdY?=
 =?utf-8?B?NzdYQ2N0cnZDL3lGck1jWnEySTVUbU9scTZhS0M1cDR3S2FlSXlCNmtuWlVY?=
 =?utf-8?B?ZkJvVXlDQ1N2Y01mTlVwYkRTNzdpM0lPTktSdnVrQ29MRElqb21aNW0yOS9v?=
 =?utf-8?B?V1NSSWl2Yk5yU0xSc1VrWm5rNGVUQ0R1eUx3TGcrNWJLQVpIT1BrVURzQVRG?=
 =?utf-8?B?blB0dWUycCt2RWl4Ni9BWjI2cVh6ZHE1Z3VnOHRZM2lBZHBEenJ5QytWVURu?=
 =?utf-8?B?NUt0YWF3bVZFczFydmRBc2UxTzFZQ0ZTUUdRaUFjRm9lVXJSclFWRDFlRXg0?=
 =?utf-8?B?eUdUT3NVRVhYM3RGODVHeUF4Tmpnd3JkUkRHSUNkUmJoMW0wTzQ5YWhYMGxa?=
 =?utf-8?B?OHJ6V2xneTc1Ti96Tnp6dm5ZN1JybGk0MGg5Z3JzcGNpc0MwNEprcDArL3E0?=
 =?utf-8?B?ZDNONkZFa0w0NTlOT0x2Z21uSUFMQkxJNGN4NjRIK0dadTVnVlkzRUp3QUw3?=
 =?utf-8?B?Z2FUVzNkNXZXVnp5Mk1EYUxod0RCcnVpZFNpakVlUVFBeFFCd3hEZStnalVs?=
 =?utf-8?B?TUJ5bnk5ampxT0ppVWs1dWFncHpxUWllSUp0cFNmSWtDcGZFSC9JS1M3dW9x?=
 =?utf-8?B?NzZFQ2RrZjErdlBzUENqaVR3K0UzUkZwRnlmSWIrcTEwbWp4cCs1VFJ3azJr?=
 =?utf-8?B?SWZLQlBvWlAraFpqQ00rRVdOTVJLTUtlUEgyQXExUU4zb0htQ1l2SGFSM1Z1?=
 =?utf-8?B?MjN0Qnc5R2RHN3Zkd2h2TDZKaEMwTkxxN0V4LzhySVhHMzduYTg4WUdJWkxT?=
 =?utf-8?B?eUZFTldmZUJPRTVGWXhhc0NiclZNL3dqRzhIWktUSklvOXd2eTcyN3lLa2or?=
 =?utf-8?B?Y2ZDaysrWURaWVVldUcrWC96ZG1XZTMzcVNMcFZQMlFxNXlNZjFTclhuSE9m?=
 =?utf-8?B?Q0RFS25JVzRlcG5ETm9oRnNwZmlvUlRGdTUxb0xLaWQwK3FKUE5oQnpDc2hD?=
 =?utf-8?B?ZXBzYVNOZk5lMVVzdzdEMTA4TW1OS1lIRk9DZ293SStFU2lITC9Wcy9jOVBw?=
 =?utf-8?B?NktVMUZaT2t3S1R2UUpaOVBZSVhMWXdPWTg2dnVuNVhLRGdKSkVnSEVmYy9q?=
 =?utf-8?B?eVpGWmRZNjFXejg0ajY0M3kyWVpzTUJndGJ0eTRzamN0T0dKV1AzVXBHazNo?=
 =?utf-8?B?b1FpdTExK3JJdTV5ZWM3K24vbmxpU0ZadGMxUjNrZHI0dmo3WGdmWEt5RCtQ?=
 =?utf-8?B?c3NEdzduc3lIYVRTZjVmWXdzQ1dscHBRN2NXNFB4aHZHMHhvaEROY1dBQms2?=
 =?utf-8?B?K1B2WThMUlE5MHdHcHd2UVZOODVRYlk4Z3BVYmhUc2U5MFhiYjh2UCtaeWxS?=
 =?utf-8?B?RVNTTCtJM2YwbzBOK25kQzFmQk1YdlNIRG1jK2tBa0I0K0ZoMzFlbDV0amhi?=
 =?utf-8?B?dzc2L2hrOXlRZStoSTdsOXhFNUtZVGhjNXYxVmtXU2V5Q0pyeTM4aHJCNFFG?=
 =?utf-8?Q?2l+UQ/cVeDUeJ/zFBGOCxp?=
X-Microsoft-Exchange-Diagnostics:
	1;DB5PR0201MB1846;6:8mKLZkBl96gWWDopqFv/9MYKYYFQ30ANFdVccFTWI9CfuZhTBNUOzWhwE5FYUUiN9AD7Wd4hmPiaOvOhud4V0XR85VUO44MF3ssDhh9ac6aR3zKVtjy5G9o1LK0UPet2GOr/SaDJ6LMKCA8j56keVyT5L0Y9LB38FIFAGjr+/q8mbZjt2JSrelEP4HsEtYSOFWGef8QRB2ghc5Nsj6+iQGRuT1JH37+yxeIf8ET56su/+T1khuIe9bE+bu2xUyv/pt7HXQZqvHWoCPT/OhxYwWZCeCcIux0eImAQUnU0dGbtCPs0nz1Vz49AFccUAnXp+AWzgJzTZy/XUVfNbQK+HwRG7Zx3pvzsRBchRV/5RXI=;5:AZ/ax1CRp+S+eD/8HaIhuN7n4sWDaT+zq2c9Rb3Quz60kxvobbdnnu82eXglfpLUbsnoYc6KBMrbmE5V4X6J9tsCaQ7BcWLpWpjfgA6B6Cv0sVXrE0si/fsNxLOgkdn+Ubqy8TRArY3mNrg8Apq7PhHv8qUxrbBDXl+Giaohl5g=;24:bFSLWedEav27OBDUPiyy01lO0/ksmZjWM+WhcdfUbUZP4rfgBp6xOpazAsv6mQwCK1uNwflfe6hAmV6dVtGoSzUCT4fZ6j0R1EWzUcgmwyc=;7:ucR0ZPkVzI/uCVvEA6tqRuudvAuP79scsyCqpbB26qKB+Nfr+hgHnTsHCsGJW9yyAC09qGLrlbnrfUcViepY//qG9bap+zMwl2tqxXHqvPlHPm35jDsDpifRT+y3wdnCDE6bOfB2a3IsnWBNTygqpzKTmH+xjVFapO84OtE+iYg58T8JwETJPtim1pGARojHeYlUsOcIFJSaOfmRDtUxTEuoz+Ei6eDWC1ag4moWFGbO3wIGJpWGR7l/1gTduQ1m
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: adlibris.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2018 15:15:15.7061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4c5d62-df01-4650-94b0-08d559cf48dc
X-MS-Exchange-CrossTenant-Id: 05c619ab-a468-4caa-8de3-e2bc9ee50f9e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=05c619ab-a468-4caa-8de3-e2bc9ee50f9e;Ip=[195.178.161.86];Helo=[mail.adlibris.se]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR0201MB1846
X-TUID: tV+yXPXAkSUp

PGh0bWw+PGhlYWQ+PC9oZWFkPgogICAgPHN0eWxlIHR5cGU9InRleHQvY3NzIj4KICAg
ICAgcCB7IGZvbnQtZmFtaWx5OkNhbGlicmksQXJpYWw7IGZvbnQtc2l6ZTogMTFwdDsg
bWFyZ2luLXRvcDogMWVtOyBtYXJnaW4tYm90dG9tOiAwZW07IH0KICAgICAgYTpsaW5r
IHsgY29sb3I6IzAwMDsgdGV4dC1kZWNvcmF0aW9uOiB1bmRlcmxpbmU7IH0KICAgICAg
YTp2aXNpdGVkIHsgY29sb3I6IzAwMDsgdGV4dC1kZWNvcmF0aW9uOiB1bmRlcmxpbmU7
IH0KICAgICAgYTpob3ZlciB7IGNvbG9yOiMwMDA7IHRleHQtZGVjb3JhdGlvbjogdW5k
ZXJsaW5lOyB9CiAgICAgIAogICAgICBwLm5vVGV4dERlY29yYXRpb24gYQogICAgICB7
CiAgICAgICAgdGV4dC1kZWNvcmF0aW9uOm5vbmU7CiAgICAgIH0KICAgIDwvc3R5bGU+
CiAgICA8Ym9keT4KICAgIDxwIGNsYXNzPSJub1RleHREZWNvcmF0aW9uIj4KICAgICAg
PGEgaWQ9ImVjeGxpbmtBZGxpYnJpcyIgaHJlZj0iaHR0cDovL3d3dy5hZGxpYnJpcy5j
b20iIHRhcmdldD0iX2JsYW5rIj4KICAgICAgICA8aW1nIHNyYz0iaHR0cDovL3d3dy5h
ZGxpYnJpcy5jb20vc3RhdGljaW1hZ2VzL2ltZ0VtYWlsc3ZzZUxvZ28ucG5nIiBib3Jk
ZXI9IjAiLz4KICAgICAgPC9hPgogICAgPC9wPgogICAgPHA+CiAgICAgIFbDpGxrb21t
ZW4gc29tIGt1bmQgaG9zIEFkbGlicmlzIQogICAgPC9wPgogICAgPHA+CiAgICAgIERp
dHQga3VuZG51bW1lcjogPGI+MTA1MTM2NzEwPC9iPjxici8+CiAgICAgIERpdHQgYW52
w6RuZGFybmFtbjogPGEgaHJlZj0iIyIgc3R5bGU9InRleHQtZGVjb3JhdGlvbjpub25l
Ij48Yj5lbWlsLnNrb2dzdW5kPHNwYW4+QDwvc3Bhbj5nbWFpbC5jb208L2I+PC9hPgog
ICAgPC9wPgogICAgPHA+CiAgICAgIEJlc8O2ayBvc3MgcMOlIDxhIGhyZWY9Imh0dHA6
Ly93d3cuYWRsaWJyaXMuY29tIj5hZGxpYnJpcy5jb208L2E+CiAgICA8L3A+CiAgICA8
cD4KICAgICAgPGEgaHJlZj0iaHR0cDovL3d3dy5hZGxpYnJpcy5jb20vc2Uva3VuZHRq
YW5zdCI+S3VuZHNlcnZpY2U8L2E+CiAgICA8L3A+CiAgICA8cCBjbGFzcz0ibm9UZXh0
RGVjb3JhdGlvbiI+CiAgICAgIDxhIGhyZWY9Imh0dHA6Ly93d3cuZmFjZWJvb2suY29t
L3BsdWdpbnMvbGlrZS5waHA/aHJlZj1odHRwOi8vd3d3LmZhY2Vib29rLmNvbS9hZGxp
YnJpcy5jb20iIHN0eWxlPSJ0ZXh0LWRlY29yYXRpb246bm9uZTsiIHRhcmdldD0iX2Js
YW5rIj4KICAgICAgICA8aW1nIHRpdGxlPSJGYWNlYm9vayBsaWtlIiBzcmM9Imh0dHA6
Ly9hZGxpYnJpcy5jb20vc2UvaW1hZ2VzL2xheW91dC9mYWNlYm9vay5wbmciIGFsdD0i
RmFjZWJvb2sgbGlrZSIgLz4KICAgICAgPC9hPiZuYnNwOwogICAgICA8YSBocmVmPSJo
dHRwOi8vd3d3LnR3aXR0ZXIuY29tL2FkbGlicmlzX2NvbSIgc3R5bGU9InRleHQtZGVj
b3JhdGlvbjpub25lOyIgdGFyZ2V0PSJfYmxhbmsiPgogICAgICAgIDxpbWcgc3JjPSJo
dHRwOi8vYWRsaWJyaXMuY29tL3NlL2ltYWdlcy9sYXlvdXQvdHdpdHRlci5wbmciIGFs
dD0iRsO2bGogYWRsaWJyaXMgcMOlIFR3aXR0ZXIiLz4KICAgICAgPC9hPgogICAgPC9w
PgogICAgPHA+CiAgICAgIEFkbGlicmlzIEFCIMOkciBjZXJ0aWZpZXJhZCBhdiBUcnln
ZyBlLWhhbmRlbCwgZGV0IGJldHlkZXIgYXR0IGR1IGthbiBrw6RubmEgZGlnIHRyeWdn
ICYgc8Oka2VyIG7DpHIgZHUgaGFuZGxhciBhdiBvc3MuIFRyeWdnIGUtaGFuZGVscyB1
cHBnaWZ0IMOkciBhdHQgc2t5ZGRhIGRpZyBzb20ga29uc3VtZW50IG9jaCBlbmRhc3Qg
c3RhYmlsYSBvY2ggc2VyacO2c2EgZS1idXRpa2VyIGthbiBibGkgY2VydGlmaWVyYWRl
LiBGw7ZyIGF0dCBsw6RzYSBtZXIgb20gVHJ5Z2cgRS1oYW5kZWwgb2NoIGRpbmEgcsOk
dHRpZ2hldGVyIHNvbSBrb25zdW1lbnQga2FuIGR1IGJlc8O2a2EgPGEgaHJlZj0iaHR0
cDovL3d3dy50cnlnZ2VoYW5kZWwuc2UvIj4gd3d3LnRyeWdnZWhhbmRlbC5zZTwvYT4K
ICAgIDwvcD4KICAgIDwvYm9keT4KICAgIDwvaHRtbD4=

