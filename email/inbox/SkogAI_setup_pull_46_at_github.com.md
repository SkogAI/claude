MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/setup <setup@noreply.github.com>
Date: Wed, 26 Nov 2025 14:30:42 -0800
Subject: [SkogAI/setup] [WIP] Add ansible tasks to deploy i3 config (PR #46)
Message-ID: <SkogAI/setup/pull/46@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69277f92c608b_d21100106253"; charset="UTF-8"

Thanks for assigning this issue to me. I&#39;m starting to work on it and will keep this PR&#39;s description up to date as I form a plan and make progress.

&lt;!-- START COPILOT CODING AGENT SUFFIX --&gt;



&lt;details&gt;

&lt;summary&gt;Original prompt&lt;/summary&gt;

&gt; 
&gt; ----
&gt; 
&gt; *This section details on the original issue you should resolve*
&gt; 
&gt; &lt;issue_title&gt;dotfiles: deploy i3 config&lt;/issue_title&gt;
&gt; &lt;issue_description&gt;Sub-issue of SkogAI/setup#12
&gt; 
&gt; Add ansible tasks to deploy i3 window manager config.
&gt; 
&gt; **Files:** `roles/03-dotfiles/files/.config/i3/`
&gt; - config
&gt; - scripts/blur-lock
&gt; - scripts/exit_menu
&gt; - scripts/empty_workspace
&gt; - wallpaper.jpg
&gt; 
&gt; **Tasks:**
&gt; - [ ] Ensure i3 config directory exists
&gt; - [ ] Symlink i3 config files
&gt; - [ ] Make scripts executable if needed
&gt; - [ ] Test deployment with `./run.sh`&lt;/issue_description&gt;
&gt; 
&gt; ## Comments on the Issue (you are @copilot in this section)
&gt; 
&gt; &lt;comments&gt;
&gt; &lt;comment_new&gt;&lt;author&gt;@Skogix&lt;/author&gt;&lt;body&gt;
&gt; This should check it is i3 or sway which is the current de since they share 90% config setting. A jinja template would be good for this? @Claude @copilot&lt;/body&gt;&lt;/comment_new&gt;
&gt; &lt;/comments&gt;
&gt; 


&lt;/details&gt;

- Fixes SkogAI/setup#30

&lt;!-- START COPILOT CODING AGENT TIPS --&gt;
---

✨ Let Copilot coding agent [set things up for you](https://github.com/SkogAI/setup/issues/new?title=✨+Set+up+Copilot+instructions&amp;body=Configure%20instructions%20for%20this%20repository%20as%20documented%20in%20%5BBest%20practices%20for%20Copilot%20coding%20agent%20in%20your%20repository%5D%28https://gh.io/copilot-coding-agent-tips%29%2E%0A%0A%3COnboard%20this%20repo%3E&amp;assignees=copilot) — coding agent works faster and does higher quality work when set up for your repo.

You can view, comment on, or merge this pull request online at:

  https://github.com/SkogAI/setup/pull/46

-- Commit Summary --

  * Initial plan

-- File Changes --


-- Patch Links --

https://github.com/SkogAI/setup/pull/46.patch
https://github.com/SkogAI/setup/pull/46.diff

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/setup/pull/46
You are receiving this because you were mentioned.

Message ID: &lt;SkogAI/setup/pull/46@github.com&gt;
