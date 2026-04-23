MIME-Version: 1.0
From: กวี ประดา <notifications@github.com>
To: actions/starter-workflows <starter-workflows@noreply.github.com>
Date: Thu, 30 Oct 2025 03:04:04 -0700
Subject: Re: [actions/starter-workflows] Create npm-grunt.yml (PR #3079)
Message-ID: <actions/starter-workflows/pull/3079/c3467099350@github.com>
In-Reply-To: <actions/starter-workflows/pull/3079@github.com>
References: <actions/starter-workflows/pull/3079@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_690338148c9be_5ae4110076527"; charset="UTF-8"

NIRVANA55051849k left a comment (actions/starter-workflows#3079)

> <!--
> IMPORTANT:
> 
> This repository contains configuration for what users see when they click on the `Actions` tab and the setup page for Code Scanning.
> 
> It is not:
> * A playground to try out scripts
> * A place for you to create a workflow for your repository
> -->
> 
> ## Pre-requisites
> 
> - [x] Prior to submitting a new workflow, please apply to join the GitHub Technology Partner Program: [partner.github.com/apply](https://partner.github.com/apply?partnershipType=Technology+Partner).
> 
> ---
> 
> ### **Please note that at this time we are only accepting new starter workflows for Code Scanning. Updates to existing starter workflows are fine.**
> 
> ---
> 
> ## Tasks
> 
> **For _all_ workflows, the workflow:**
> 
> - [x] Should be contained in a `.yml` file with the language or platform as its filename, in lower, [_kebab-cased_](https://en.wikipedia.org/wiki/Kebab_case) format (for example, [`docker-image.yml`](https://github.com/actions/starter-workflows/blob/main/ci/docker-image.yml)).  Special characters should be removed or replaced with words as appropriate (for example, "dotnet" instead of ".NET").
> - [x] Should use sentence case for the names of workflows and steps (for example, "Run tests").
> - [x] Should be named _only_ by the name of the language or platform (for example, "Go", not "Go CI" or "Go Build").
> - [x] Should include comments in the workflow for any parts that are not obvious or could use clarification.
> - [x] Should specify least privileged [permissions](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#modifying-the-permissions-for-the-github_token) for `GITHUB_TOKEN` so that the workflow runs successfully.
> 
> **For _CI_ workflows, the workflow:**
> 
> - [x] Should be preserved under [the `ci` directory](https://github.com/actions/starter-workflows/tree/main/ci).
> - [x] Should include a matching `ci/properties/*.properties.json` file (for example, [`ci/properties/docker-publish.properties.json`](https://github.com/actions/starter-workflows/blob/main/ci/properties/docker-publish.properties.json)).
> - [x] Should run on `push` to `branches: [ $default-branch ]` and `pull_request` to `branches: [ $default-branch ]`.
> - [x] Packaging workflows should run on `release` with `types: [ created ]`.
> - [x] Publishing workflows should have a filename that is the name of the language or platform, in lower case, followed by "-publish" (for example, [`docker-publish.yml`](https://github.com/actions/starter-workflows/blob/main/ci/docker-publish.yml)).
> 
> **For _Code Scanning_ workflows, the workflow:**
> 
> - [x] Should be preserved under [the `code-scanning` directory](https://github.com/actions/starter-workflows/tree/main/code-scanning).
> - [x] Should include a matching `code-scanning/properties/*.properties.json` file (for example, [`code-scanning/properties/codeql.properties.json`](https://github.com/actions/starter-workflows/blob/main/code-scanning/properties/codeql.properties.json)), with properties set as follows:
>   - [x] `name`: Name of the Code Scanning integration.
>   - [x] `creator`: Name of the organization/user producing the Code Scanning integration.
>   - [x] `description`: Short description of the Code Scanning integration.
>   - [x] `categories`: Array of languages supported by the Code Scanning integration.
>   - [x] `iconName`: Name of the SVG logo representing the Code Scanning integration. This SVG logo must be present in [the `icons` directory](https://github.com/actions/starter-workflows/tree/main/icons).
> - [x] Should run on `push` to `branches: [ $default-branch, $protected-branches ]` and `pull_request` to `branches: [ $default-branch ]`. We also recommend a `schedule` trigger of `cron: $cron-weekly` (for example, [`codeql.yml`](https://github.com/actions/starter-workflows/blob/c59b62dee0eae1f9f368b7011cf05c2fc42cf084/code-scanning/codeql.yml#L14-L21)).
> 
> **Some general notes:**
> 
> - [x] This workflow must _only_ use actions that are produced by GitHub, [in the `actions` organization](https://github.com/actions), **or**
> - [x] This workflow must _only_ use actions that are produced by the language or ecosystem that the workflow supports.  These actions must be [published to the GitHub Marketplace](https://github.com/marketplace?type=actions).  We require that these actions be referenced using the full 40 character hash of the action's commit instead of a tag.  Additionally, workflows must include the following comment at the top of the workflow file:
>     ```
>     # This workflow uses actions that are not certified by GitHub.
>     # They are provided by a third-party and are governed by
>     # separate terms of service, privacy policy, and support
>     # documentation.
>     ```
> - [x] Automation and CI workflows should not send data to any 3rd party service except for the purposes of installing dependencies.
> - [x] Automation and CI workflows cannot be dependent on a paid service or product.
> 



-- 
Reply to this email directly or view it on GitHub:
https://github.com/actions/starter-workflows/pull/3079#issuecomment-3467099350
You are receiving this because you are subscribed to this thread.

Message ID: <actions/starter-workflows/pull/3079/c3467099350@github.com>