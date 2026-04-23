MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: Skogix/MyDotNetNg <MyDotNetNg@noreply.github.com>
Date: Sat, 25 Oct 2025 22:18:01 -0700
Subject: Re: [Skogix/MyDotNetNg] [WIP] Merge upstream changes from commit c40f49e (PR #2)
Message-ID: <Skogix/MyDotNetNg/pull/2/review/3380425478@github.com>
In-Reply-To: <Skogix/MyDotNetNg/pull/2@github.com>
References: <Skogix/MyDotNetNg/pull/2@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_68fdaf092472_31be71100663dc"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull Request Overview

This PR merges upstream changes from commit c40f49e, implementing the Angular Tour of Heroes tutorial application with routing, services, and multiple components for hero management.

**Key Changes:**
- Introduces Angular routing with dashboard, heroes list, and hero detail views
- Implements hero service with mock data for hero management
- Adds styling for navigation and component-specific UI elements

### Reviewed Changes

Copilot reviewed 18 out of 18 changed files in this pull request and generated 5 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| app-routing.module.ts | Configures routing for dashboard, heroes list, and hero detail pages |
| app.module.ts | Registers new components, routing module, and hero service |
| app.component.ts | Simplifies to basic navigation shell using routing |
| app.component.css | Adds navigation link styles |
| dashboard.component.* | Implements dashboard showing top 4 heroes |
| hero-detail.component.* | Implements hero detail view with edit capability |
| heroes.component.* | Implements heroes list with selection and navigation |
| hero.ts | Defines hero model interface |
| hero.service.ts | Provides hero data access with promise-based API |
| mock-heroes.ts | Provides static hero data |
| index.html | Updates to use SystemJS module loader and legacy Angular setup |
| styles.css | Adds global application styles |
</details>






---

💡 <a href="/Skogix/MyDotNetNg/new/master/.github?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> -@Component({
-  selector: 'app-root',
-  templateUrl: './app.component.html',
-  styleUrls: ['./app.component.css']
-})
+
+@
+  Component({
+    selector: 'my-app',
+    template: `
+      <h1>{{title}}</h1>
+      <nav>
+      <a routerLink="/dashboard">Dashboard</a>
+      <a routerLink="/heroes">Heroes</a>
+      </nav>
+      <router-outlet></router-outlet>,

Remove the trailing comma after `</router-outlet>` as it creates invalid template syntax.
```suggestion
      <router-outlet></router-outlet>
```

> +h3 {
+  text-align: center;
+  margin-bottom: 0;
+}

The `h3` style is duplicated on lines 56-59 and lines 81-84 with identical properties. Remove the duplicate definition.

> @@ -0,0 +1,37 @@
+import { Component, OnInit } from '@angular/core';
+import { Hero } from './hero';
+import { Router } from '@angular/router';
+import { HeroService} from './hero.service';

Remove extra space before closing brace in import statement.
```suggestion
import { HeroService } from './hero.service';
```

> +  color: #369;
+  font-family: Arial, Helvetica, sans-serif;
+  font-size: 250%;
+}
+
+h2, h3 {
+  color: #444;
+  font-family: Arial, Helvetica, sans-serif;
+  font-weight: lighter;
+}
+
+body {
+  margin: 2em;
+}
+
+body, input[text], button {

The selector `input[text]` is incorrect. Use `input[type='text']` to properly target text input elements.
```suggestion
body, input[type='text'], button {
```

> +  font-family: Arial, Helvetica, sans-serif;
+  font-weight: lighter;
+}
+
+body {
+  margin: 2em;
+}
+
+body, input[text], button {
+  color: #888;
+  font-family: Cambria, Georgia;
+}
+
+a {
+  cursor: pointer;
+  cursor: hand;

The `cursor: hand` property is obsolete and non-standard. Remove line 25 as `cursor: pointer` (line 24) is the correct modern syntax.
```suggestion

```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/Skogix/MyDotNetNg/pull/2#pullrequestreview-3380425478
You are receiving this because you were assigned.

Message ID: <Skogix/MyDotNetNg/pull/2/review/3380425478@github.com>