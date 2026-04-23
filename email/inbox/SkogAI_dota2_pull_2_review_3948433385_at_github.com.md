MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/dota2 <dota2@noreply.github.com>
Date: Sat, 14 Mar 2026 01:30:21 -0700
Subject: Re: [SkogAI/dota2] Add "Wall of Shame" page for worst Dota 2 match statistics (PR #2)
Message-ID: <SkogAI/dota2/pull/2/review/3948433385@github.com>
In-Reply-To: <SkogAI/dota2/pull/2@github.com>
References: <SkogAI/dota2/pull/2@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_69b51c9d94f42_bd111814341"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

Adds a new “Wall of Shame” page to the Dota 2 Hub and wires it into the existing navigation and Cloudflare Worker bundling flow.

**Changes:**
- Added `worst-matches.html` page with “worst performance” sections and Chart.js visualizations.
- Added “Wall of Shame” link to the main squad navigation.
- Updated `rebuild-bundle.js` to bundle/route the new page at `/worst`.

### Reviewed changes

Copilot reviewed 3 out of 4 changed files in this pull request and generated 3 comments.

| File | Description |
| ---- | ----------- |
| worst-matches.html | New standalone stats page rendering worst-match metrics, charts, and tables from embedded data |
| squad-stats.html | Adds nav link to the new `/worst` page |
| rebuild-bundle.js | Includes `worst-matches.html` in the worker bundle and routes it under `/worst` |





---

💡 <a href="/SkogAI/dota2/new/master?filename=.github/instructions/*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +  var avgDeaths = ((P[0].totals.deaths + P[1].totals.deaths + P[2].totals.deaths) / 3).toFixed(1);
+  var pillData = [
+    { val: totalL.toLocaleString(), lbl: 'Total Losses' },
+    { val: totalW.toLocaleString(), lbl: 'Total Wins' },
+    { val: avgDeaths, lbl: 'Avg Deaths/Game' },
+    { val: total.toLocaleString(), lbl: 'Games Played' }

`avgDeaths` is computed by directly indexing `P[0]..P[2]` and dividing by 3. This breaks if the squad size changes and also produces an unweighted average (players with vastly different game counts contribute equally). Consider computing this from `P` generically (use `P.length`) and weighting by each player's total games (`p.wl.win + p.wl.lose`).

> +  var recentLosses = allMatches.filter(function(m) { return m.result === 'Loss'; });
+  var deathsCtx = document.getElementById('deathsChart').getContext('2d');
+  new Chart(deathsCtx, {
+    type: 'bar',
+    data: {
+      labels: recentLosses.slice(0, 15).map(function(m) { return m.hero.substring(0, 8) + ' (' + m.player.substring(0, 4) + ')'; }),
+      datasets: [{
+        label: 'Deaths',
+        data: recentLosses.slice(0, 15).map(function(m) { return m.d; }),
+        backgroundColor: recentLosses.slice(0, 15).map(function(m) { return PCOLORS_A[m.pi]; }),

The "Deaths Per Match (Recent)" chart uses `recentLosses.slice(0, 15)` from `allMatches`, but `allMatches` is built by concatenating each player's recent list without sorting across players. This means the chart is not actually showing the 15 most recent losses overall. Consider including a sortable timestamp in the embedded match data (e.g., `start_time`) and sorting `recentLosses` by that before slicing.

> +          <th>K</th>
+          <th>D</th>
+          <th>A</th>
+          <th>KDA</th>
+          <th>GPM</th>
+          <th>Duration</th>
+          <th>Date</th>
+        </tr>
+      </thead>
+      <tbody id="lossesBody"></tbody>
+    </table>
+  </div>
+</div>
+
+<div class="footer">
+  Data from <a href="https://opendota.com" target="_blank">OpenDota</a> &mdash; Updated Feb 2026

Links opened with `target="_blank"` should include `rel="noopener noreferrer"` to prevent reverse-tabnabbing and avoid leaking `window.opener` to the destination site.


-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/dota2/pull/2#pullrequestreview-3948433385
You are receiving this because you modified the open/close state.

Message ID: <SkogAI/dota2/pull/2/review/3948433385@github.com>