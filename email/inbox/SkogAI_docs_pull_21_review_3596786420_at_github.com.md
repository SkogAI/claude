MIME-Version: 1.0
From: Copilot <notifications@github.com>
To: SkogAI/docs <docs@noreply.github.com>
Date: Thu, 18 Dec 2025 20:42:52 -0800
Subject: Re: [SkogAI/docs] feat: add queue-based batch processing for frontmatter generation (PR #21)
Message-ID: <SkogAI/docs/pull/21/review/3596786420@github.com>
In-Reply-To: <SkogAI/docs/pull/21@github.com>
References: <SkogAI/docs/pull/21@github.com>
Content-Type: multipart/alternative; boundary="--==_mimepart_6944d7ccdbf40_10210d0311378"; charset="UTF-8"

@Copilot commented on this pull request.

## Pull request overview

This PR implements a robust queue-based batch processing system for generating YAML frontmatter on markdown files using Ollama, designed for overnight processing of large documentation repositories.

**Key Changes:**
- SQLite-backed job queue with state management (pending/processing/completed/failed)
- Three new Python scripts for enqueueing files, processing the queue, and monitoring status
- Automatic retry logic with configurable retry limits and priority-based job ordering

### Reviewed changes

Copilot reviewed 7 out of 8 changed files in this pull request and generated 28 comments.

<details>
<summary>Show a summary per file</summary>

| File | Description |
| ---- | ----------- |
| `.docgen/scripts/queue_status.py` | New script to monitor queue status, show job details, and manage stuck/completed jobs |
| `.docgen/scripts/process_queue.py` | New worker script that processes queued jobs by calling Ollama and updating markdown files |
| `.docgen/scripts/enqueue_files.py` | New script to scan directories and add markdown files to the processing queue |
| `.docgen/schema.sql` | Adds processing_queue table with status tracking, retry counts, and timestamps |
| `.docgen/docs.db` | Binary SQLite database file with sample data (should not be in version control) |
| `.docgen/README.md` | Updated with batch processing quick start instructions and workflow examples |
| `.docgen/QUICKSTART.md` | New quick start guide with 3-step workflow and common usage patterns |
| `.docgen/QUEUE_SYSTEM.md` | New comprehensive documentation covering architecture, usage, and troubleshooting |
</details>



<details>
<summary>Comments suppressed due to low confidence (1)</summary>

**.docgen/scripts/queue_status.py:20**
* Except block directly handles BaseException.
```
    except:
```
</details>



---

💡 <a href="/SkogAI/docs/new/master/.github/instructions?filename=*.instructions.md" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Add Copilot custom instructions</a> for smarter, more guided reviews. <a href="https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot" class="Link--inTextBlock" target="_blank" rel="noopener noreferrer">Learn how to get started</a>.

> +    """)
+
+    cursor.execute("CREATE INDEX IF NOT EXISTS idx_queue_status ON processing_queue(status)")
+    cursor.execute("CREATE INDEX IF NOT EXISTS idx_queue_priority ON processing_queue(priority DESC, created_at ASC)")
+
+    conn.commit()
+    conn.close()
+
+
+def has_frontmatter(file_path):
+    """Check if file already has YAML frontmatter"""
+    try:
+        with open(file_path, 'r', encoding='utf-8') as f:
+            content = f.read()
+        return content.strip().startswith('---')
+    except Exception:

Bare except clause catches all exceptions indiscriminately, including system exits and keyboard interrupts. Replace with a specific exception type like 'except (IOError, OSError):' or 'except Exception:' at minimum.
```suggestion
    except (OSError, UnicodeDecodeError):
```

> +            if len(parts) >= 3:
+                body = '---'.join(parts[2:]).lstrip()

When splitting content containing frontmatter by '---', joining parts[2:] could inadvertently include '---' markers that appear in the body content. Consider using a more robust parsing approach that only removes the first frontmatter block.

> +    try:
+        rel_path = abs_path.relative_to(Path.cwd().resolve())
+    except ValueError:
+        # If not relative to cwd, just use the filename
+        rel_path = abs_path
+    categories = list(rel_path.parent.parts) if rel_path.parent.parts else []
+
+    # Load template
+    template = load_prompt_template(template_name)
+
+    # Build full prompt
+    prompt = f"""File path: {rel_path}
+Suggested categories: {', '.join(categories) if categories else 'none'}
+
+File content:
+{body[:1000]}...

Truncating file content to 1000 characters with hardcoded ellipsis may create incomplete context for Ollama. Consider making this configurable or using a more sophisticated truncation strategy that preserves complete sentences or paragraphs.

> +                SET status = 'failed', completed_at = ?, error_message = ?
+                WHERE id = ?
+            """, (datetime.utcnow().isoformat(), error_message, job_id))
+            print(f"  ✗ Permanently failed after {retries} retries")
+
+        conn.commit()
+        conn.close()
+
+    def call_ollama(self, prompt):
+        """Call Ollama with the prompt"""
+        try:
+            result = subprocess.run(
+                ['ollama', 'run', self.ollama_model, prompt],
+                capture_output=True,
+                text=True,
+                timeout=300,  # 5 minute timeout

The timeout of 300 seconds (5 minutes) for Ollama calls may be insufficient for large files or slower models. Consider making this configurable via command-line argument to accommodate different use cases and hardware capabilities.

> +    conn = sqlite3.connect(db_path)
+    cursor = conn.cursor()
+
+    cursor.execute("""
+        SELECT id, file_path, completed_at
+        FROM processing_queue
+        WHERE status = 'completed'
+        ORDER BY completed_at DESC
+        LIMIT ?
+    """, (limit,))
+
+    jobs = cursor.fetchall()
+
+    if not jobs:
+        conn.close()
+        return
+
+    print(f"\n=== Recently Completed (showing {limit}) ===")
+    for job_id, file_path, completed_at in jobs:
+        print(f"  [{job_id}] {file_path}")
+        print(f"        Completed: {format_timestamp(completed_at)}")
+
+    conn.close()

Database connection is not closed if an exception occurs between opening and the explicit close() call. Use context manager (with statement) to ensure the connection is properly closed even if an error occurs.

> +        conn = sqlite3.connect(self.db_path)
+        cursor = conn.cursor()
+
+        cursor.execute("""
+            SELECT id, file_path, prompt, retries, max_retries
+            FROM processing_queue
+            WHERE status = 'pending'
+            ORDER BY priority DESC, created_at ASC
+            LIMIT 1
+        """)
+
+        job = cursor.fetchone()
+        conn.close()
+
+        if job:
+            return {
+                'id': job[0],
+                'file_path': job[1],
+                'prompt': job[2],
+                'retries': job[3],
+                'max_retries': job[4]
+            }
+        return None

Database connection is not closed if an exception occurs between opening and the explicit close() call. Use context manager (with statement) to ensure the connection is properly closed even if an error occurs.

> +        conn = sqlite3.connect(self.db_path)
+        cursor = conn.cursor()
+
+        cursor.execute("""
+            UPDATE processing_queue
+            SET status = 'processing', started_at = ?
+            WHERE id = ?
+        """, (datetime.utcnow().isoformat(), job_id))
+
+        conn.commit()
+        conn.close()

Database connection is not closed if an exception occurs between opening and the explicit close() call. Use context manager (with statement) to ensure the connection is properly closed even if an error occurs.

> +        conn = sqlite3.connect(self.db_path)
+        cursor = conn.cursor()
+
+        # Get current retry count
+        cursor.execute("SELECT retries, max_retries FROM processing_queue WHERE id = ?", (job_id,))
+        retries, max_retries = cursor.fetchone()
+
+        if should_retry and retries < max_retries:
+            # Increment retry counter and reset to pending
+            cursor.execute("""
+                UPDATE processing_queue
+                SET status = 'pending', retries = retries + 1, error_message = ?
+                WHERE id = ?
+            """, (error_message, job_id))
+            print(f"  ⟳ Retry {retries + 1}/{max_retries} scheduled")
+        else:
+            # Mark as permanently failed
+            cursor.execute("""
+                UPDATE processing_queue
+                SET status = 'failed', completed_at = ?, error_message = ?
+                WHERE id = ?
+            """, (datetime.utcnow().isoformat(), error_message, job_id))
+            print(f"  ✗ Permanently failed after {retries} retries")
+
+        conn.commit()
+        conn.close()

Database connection is not closed if an exception occurs between opening and the explicit close() call. Use context manager (with statement) to ensure the connection is properly closed even if an error occurs.

> +            raise Exception("Ollama not found - is it installed?")
+
+    def extract_frontmatter_from_response(self, response):
+        """Extract YAML frontmatter block from Ollama response"""
+        # Look for content between --- markers
+        pattern = r'---\s*\n(.*?)\n---'
+        match = re.search(pattern, response, re.DOTALL)
+
+        if match:
+            return f"---\n{match.group(1)}\n---"
+
+        # If no markers, check if entire response looks like YAML
+        if response.strip().startswith('categories:') or response.strip().startswith('tags:'):
+            return f"---\n{response.strip()}\n---"
+
+        raise ValueError("Could not find valid frontmatter in response")

The error message doesn't provide guidance on what valid frontmatter should look like or what was actually received. Consider including a sample of the response or more specific details about what patterns were expected but not found.
```suggestion
        preview = response.strip().replace("\r", "")[:200]
        raise ValueError(
            "Could not find valid frontmatter in Ollama response. "
            "Expected either a YAML block delimited by '---' lines or YAML starting with "
            "'categories:' or 'tags:'. Sample of response:\n"
            f"{preview}"
        )
```

> +    def get_next_job(self):
+        """Get next pending job from queue (ordered by priority)"""
+        conn = sqlite3.connect(self.db_path)
+        cursor = conn.cursor()
+
+        cursor.execute("""
+            SELECT id, file_path, prompt, retries, max_retries
+            FROM processing_queue
+            WHERE status = 'pending'
+            ORDER BY priority DESC, created_at ASC
+            LIMIT 1
+        """)
+
+        job = cursor.fetchone()
+        conn.close()

The get_next_job and mark_processing operations are not atomic, creating a race condition if multiple workers run concurrently. Two workers could retrieve the same pending job before either marks it as processing. Consider using a transaction with SELECT FOR UPDATE or implementing row-level locking to ensure atomic job claiming.

> +        conn = sqlite3.connect(self.db_path)
+        cursor = conn.cursor()
+
+        cursor.execute("""
+            UPDATE processing_queue
+            SET status = 'completed', completed_at = ?, error_message = NULL
+            WHERE id = ?
+        """, (datetime.utcnow().isoformat(), job_id))
+
+        conn.commit()
+        conn.close()

Database connection is not closed if an exception occurs between opening and the explicit close() call. Use context manager (with statement) to ensure the connection is properly closed even if an error occurs.

> +        """Mark job as failed, optionally retry"""
+        conn = sqlite3.connect(self.db_path)
+        cursor = conn.cursor()
+
+        # Get current retry count
+        cursor.execute("SELECT retries, max_retries FROM processing_queue WHERE id = ?", (job_id,))
+        retries, max_retries = cursor.fetchone()
+
+        if should_retry and retries < max_retries:
+            # Increment retry counter and reset to pending
+            cursor.execute("""
+                UPDATE processing_queue
+                SET status = 'pending', retries = retries + 1, error_message = ?
+                WHERE id = ?
+            """, (error_message, job_id))
+            print(f"  ⟳ Retry {retries + 1}/{max_retries} scheduled")

The retry message displays the next retry count (retries + 1), but the variable 'retries' represents the current count before increment. This could be confusing. Consider using a variable name that clearly indicates it's the count before this retry attempt.

> +        INSERT INTO processing_queue (file_path, prompt, priority)
+        VALUES (?, ?, ?)
+    """, (normalized_path, prompt, priority))
+
+    queue_id = cursor.lastrowid
+    conn.commit()
+    conn.close()
+
+    return 'enqueued', f'Queue ID: {queue_id}'
+
+
+def enqueue_directory(db_path, directory, template='create-frontmatter', priority=0, force=False, exclude_patterns=None):
+    """Recursively enqueue all markdown files in directory"""
+
+    if exclude_patterns is None:
+        exclude_patterns = ['.git', 'node_modules', '.docgen', 'generated']

The default exclude patterns are hardcoded and may not suit all projects. Consider loading these from a configuration file or making them more easily customizable.

> +        # If no markers, check if entire response looks like YAML
+        if response.strip().startswith('categories:') or response.strip().startswith('tags:'):
+            return f"---\n{response.strip()}\n---"

The fallback check for YAML content only looks for lines starting with 'categories:' or 'tags:', but valid YAML frontmatter can start with other fields like 'title:', 'date:', 'description:', etc. This will cause valid frontmatter to be rejected if it doesn't happen to start with these specific fields.
```suggestion
        # If no markers, check if entire response looks like YAML frontmatter
        stripped = response.strip()
        if stripped:
            # Look at the first non-empty line and see if it looks like a YAML key
            first_line = next((line for line in stripped.splitlines() if line.strip()), "")
            if re.match(r'^[A-Za-z_][\w-]*\s*:', first_line):
                return f"---\n{stripped}\n---"
```

> +    conn = sqlite3.connect(db_path)
+    cursor = conn.cursor()
+
+    cursor.execute("""
+        SELECT id, file_path, retries, max_retries, error_message, completed_at
+        FROM processing_queue
+        WHERE status = 'failed'
+        ORDER BY completed_at DESC
+        LIMIT ?
+    """, (limit,))
+
+    jobs = cursor.fetchall()
+
+    if not jobs:
+        conn.close()
+        return
+
+    print(f"\n=== Failed Jobs (showing up to {limit}) ===")
+    for job_id, file_path, retries, max_retries, error_msg, failed_at in jobs:
+        print(f"  [{job_id}] {file_path}")
+        print(f"        Failed: {format_timestamp(failed_at)} (after {retries} retries)")
+        if error_msg:
+            print(f"        Error: {error_msg[:100]}")
+
+    conn.close()

Database connection is not closed if an exception occurs between opening and the explicit close() call. Use context manager (with statement) to ensure the connection is properly closed even if an error occurs.

> +    conn = sqlite3.connect(db_path)
+    cursor = conn.cursor()
+
+    cursor.execute("""
+        UPDATE processing_queue
+        SET status = 'pending', started_at = NULL
+        WHERE status = 'processing'
+    """)
+
+    count = cursor.rowcount
+    conn.commit()
+    conn.close()
+
+    if count > 0:
+        print(f"\n✓ Reset {count} stuck job(s) from 'processing' to 'pending'")
+    else:
+        print("\n✓ No stuck jobs found")

Database connection is not closed if an exception occurs between opening and the explicit close() call. Use context manager (with statement) to ensure the connection is properly closed even if an error occurs.

> +    conn = sqlite3.connect(db_path)
+    cursor = conn.cursor()
+
+    cursor.execute("DELETE FROM processing_queue WHERE status = 'completed'")
+
+    count = cursor.rowcount
+    conn.commit()
+    conn.close()
+
+    if count > 0:
+        print(f"\n✓ Cleared {count} completed job(s) from queue")
+    else:
+        print("\n✓ No completed jobs to clear")

Database connection is not closed if an exception occurs between opening and the explicit close() call. Use context manager (with statement) to ensure the connection is properly closed even if an error occurs.

> +        conn = sqlite3.connect(self.db_path)
+        cursor = conn.cursor()
+
+        cursor.execute("""
+            SELECT status, COUNT(*)
+            FROM processing_queue
+            GROUP BY status
+        """)
+
+        stats = dict(cursor.fetchall())
+        conn.close()
+
+        return {
+            'pending': stats.get('pending', 0),
+            'processing': stats.get('processing', 0),
+            'completed': stats.get('completed', 0),
+            'failed': stats.get('failed', 0)
+        }

Database connection is not closed if an exception occurs between opening and the explicit close() call. Use context manager (with statement) to ensure the connection is properly closed even if an error occurs.

> +"""
+
+import sqlite3
+import argparse
+from datetime import datetime
+from pathlib import Path
+
+
+def format_timestamp(ts_str):
+    """Format timestamp for display"""
+    if not ts_str:
+        return 'N/A'
+    try:
+        ts = datetime.fromisoformat(ts_str)
+        return ts.strftime('%Y-%m-%d %H:%M:%S')
+    except:

Bare except clause catches all exceptions indiscriminately, including system exits and keyboard interrupts. Replace with a specific exception type like 'except ValueError:' or 'except Exception:' at minimum.
```suggestion
    except (ValueError, TypeError):
```

> +        if len(parts) >= 3:
+            body = '---'.join(parts[2:]).strip()

When splitting content containing frontmatter by '---', joining parts[2:] could inadvertently include '---' markers that appear in the body content. Consider using a more robust parsing approach that only removes the first frontmatter block.

> +    conn = sqlite3.connect(db_path)
+    cursor = conn.cursor()
+
+    # Get counts by status
+    cursor.execute("""
+        SELECT status, COUNT(*)
+        FROM processing_queue
+        GROUP BY status
+    """)
+
+    stats = dict(cursor.fetchall())
+    total = sum(stats.values())
+
+    print("=== Queue Summary ===")
+    print(f"Total jobs: {total}")
+    print(f"  Pending:    {stats.get('pending', 0)}")
+    print(f"  Processing: {stats.get('processing', 0)}")
+    print(f"  Completed:  {stats.get('completed', 0)}")
+    print(f"  Failed:     {stats.get('failed', 0)}")
+
+    # Calculate progress
+    if total > 0:
+        completed = stats.get('completed', 0)
+        progress = (completed / total) * 100
+        print(f"\nProgress: {progress:.1f}% ({completed}/{total})")
+
+    conn.close()
+
+
+def show_pending(db_path, limit=10):
+    """Show pending jobs"""
+    conn = sqlite3.connect(db_path)
+    cursor = conn.cursor()
+
+    cursor.execute("""
+        SELECT id, file_path, priority, created_at
+        FROM processing_queue
+        WHERE status = 'pending'
+        ORDER BY priority DESC, created_at ASC
+        LIMIT ?
+    """, (limit,))
+
+    jobs = cursor.fetchall()
+
+    if not jobs:
+        print("\n✓ No pending jobs")
+        conn.close()
+        return
+
+    print(f"\n=== Pending Jobs (showing up to {limit}) ===")
+    for job_id, file_path, priority, created_at in jobs:
+        priority_str = f"[P{priority}]" if priority != 0 else ""
+        print(f"  [{job_id}] {priority_str} {file_path}")
+        print(f"        Queued: {format_timestamp(created_at)}")
+
+    # Show total pending
+    cursor.execute("SELECT COUNT(*) FROM processing_queue WHERE status = 'pending'")
+    total_pending = cursor.fetchone()[0]
+
+    if total_pending > limit:
+        print(f"\n  ... and {total_pending - limit} more")
+
+    conn.close()
+
+

Database connection is not closed if an exception occurs between opening and the explicit close() call. Use context manager (with statement) to ensure the connection is properly closed even if an error occurs.
```suggestion
    with sqlite3.connect(db_path) as conn:
        cursor = conn.cursor()

        # Get counts by status
        cursor.execute("""
            SELECT status, COUNT(*)
            FROM processing_queue
            GROUP BY status
        """)

        stats = dict(cursor.fetchall())
        total = sum(stats.values())

        print("=== Queue Summary ===")
        print(f"Total jobs: {total}")
        print(f"  Pending:    {stats.get('pending', 0)}")
        print(f"  Processing: {stats.get('processing', 0)}")
        print(f"  Completed:  {stats.get('completed', 0)}")
        print(f"  Failed:     {stats.get('failed', 0)}")

        # Calculate progress
        if total > 0:
            completed = stats.get('completed', 0)
            progress = (completed / total) * 100
            print(f"\nProgress: {progress:.1f}% ({completed}/{total})")


def show_pending(db_path, limit=10):
    """Show pending jobs"""
    with sqlite3.connect(db_path) as conn:
        cursor = conn.cursor()

        cursor.execute("""
            SELECT id, file_path, priority, created_at
            FROM processing_queue
            WHERE status = 'pending'
            ORDER BY priority DESC, created_at ASC
            LIMIT ?
        """, (limit,))

        jobs = cursor.fetchall()

        if not jobs:
            print("\n✓ No pending jobs")
            return

        print(f"\n=== Pending Jobs (showing up to {limit}) ===")
        for job_id, file_path, priority, created_at in jobs:
            priority_str = f"[P{priority}]" if priority != 0 else ""
            print(f"  [{job_id}] {priority_str} {file_path}")
            print(f"        Queued: {format_timestamp(created_at)}")

        # Show total pending
        cursor.execute("SELECT COUNT(*) FROM processing_queue WHERE status = 'pending'")
        total_pending = cursor.fetchone()[0]

        if total_pending > limit:
            print(f"\n  ... and {total_pending - limit} more")
```

> +    conn = sqlite3.connect(db_path)
+    cursor = conn.cursor()
+
+    cursor.execute("""
+        SELECT id, file_path, priority, created_at
+        FROM processing_queue
+        WHERE status = 'pending'
+        ORDER BY priority DESC, created_at ASC
+        LIMIT ?
+    """, (limit,))
+
+    jobs = cursor.fetchall()
+
+    if not jobs:
+        print("\n✓ No pending jobs")
+        conn.close()
+        return
+
+    print(f"\n=== Pending Jobs (showing up to {limit}) ===")
+    for job_id, file_path, priority, created_at in jobs:
+        priority_str = f"[P{priority}]" if priority != 0 else ""
+        print(f"  [{job_id}] {priority_str} {file_path}")
+        print(f"        Queued: {format_timestamp(created_at)}")
+
+    # Show total pending
+    cursor.execute("SELECT COUNT(*) FROM processing_queue WHERE status = 'pending'")
+    total_pending = cursor.fetchone()[0]
+
+    if total_pending > limit:
+        print(f"\n  ... and {total_pending - limit} more")
+
+    conn.close()

Database connection is not closed if an exception occurs between opening and the explicit close() call. Use context manager (with statement) to ensure the connection is properly closed even if an error occurs.

> +    conn = sqlite3.connect(db_path)
+    cursor = conn.cursor()
+
+    cursor.execute("""
+        SELECT id, file_path, started_at
+        FROM processing_queue
+        WHERE status = 'processing'
+        ORDER BY started_at ASC
+    """)
+
+    jobs = cursor.fetchall()
+
+    if not jobs:
+        conn.close()
+        return
+
+    print(f"\n=== Currently Processing ===")
+    for job_id, file_path, started_at in jobs:
+        print(f"  [{job_id}] {file_path}")
+        print(f"        Started: {format_timestamp(started_at)}")
+
+    conn.close()

Database connection is not closed if an exception occurs between opening and the explicit close() call. Use context manager (with statement) to ensure the connection is properly closed even if an error occurs.

> +    conn = sqlite3.connect(db_path)
+    cursor = conn.cursor()
+
+    cursor.execute("""
+    CREATE TABLE IF NOT EXISTS processing_queue (
+        id INTEGER PRIMARY KEY AUTOINCREMENT,
+        file_path TEXT NOT NULL,
+        prompt TEXT NOT NULL,
+        status TEXT DEFAULT 'pending' CHECK(status IN ('pending', 'processing', 'completed', 'failed')),
+        priority INTEGER DEFAULT 0,
+        retries INTEGER DEFAULT 0,
+        max_retries INTEGER DEFAULT 3,
+        error_message TEXT,
+        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
+        started_at TIMESTAMP,
+        completed_at TIMESTAMP
+    )
+    """)
+
+    cursor.execute("CREATE INDEX IF NOT EXISTS idx_queue_status ON processing_queue(status)")
+    cursor.execute("CREATE INDEX IF NOT EXISTS idx_queue_priority ON processing_queue(priority DESC, created_at ASC)")
+
+    conn.commit()
+    conn.close()
+
+

Database connection is not closed if an exception occurs between opening and the explicit close() call. Use context manager (with statement) to ensure the connection is properly closed even if an error occurs.
```suggestion
    with sqlite3.connect(db_path) as conn:
        cursor = conn.cursor()

        cursor.execute("""
        CREATE TABLE IF NOT EXISTS processing_queue (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            file_path TEXT NOT NULL,
            prompt TEXT NOT NULL,
            status TEXT DEFAULT 'pending' CHECK(status IN ('pending', 'processing', 'completed', 'failed')),
            priority INTEGER DEFAULT 0,
            retries INTEGER DEFAULT 0,
            max_retries INTEGER DEFAULT 3,
            error_message TEXT,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            started_at TIMESTAMP,
            completed_at TIMESTAMP
        )
        """)

        cursor.execute("CREATE INDEX IF NOT EXISTS idx_queue_status ON processing_queue(status)")
        cursor.execute("CREATE INDEX IF NOT EXISTS idx_queue_priority ON processing_queue(priority DESC, created_at ASC)")

        conn.commit()
```

> +    conn = sqlite3.connect(db_path)
+    cursor = conn.cursor()
+
+    cursor.execute("""
+        SELECT id, status FROM processing_queue
+        WHERE file_path = ? AND status IN ('pending', 'processing')
+    """, (normalized_path,))
+
+    existing = cursor.fetchone()
+    if existing and not force:
+        conn.close()
+        return 'skipped', f'Already in queue (ID: {existing[0]}, Status: {existing[1]})'
+
+    # Generate prompt
+    try:
+        prompt = generate_prompt_for_file(file_path, template)
+    except Exception as e:
+        conn.close()
+        return 'error', f'Failed to generate prompt: {e}'
+
+    # Insert into queue
+    cursor.execute("""
+        INSERT INTO processing_queue (file_path, prompt, priority)
+        VALUES (?, ?, ?)
+    """, (normalized_path, prompt, priority))
+
+    queue_id = cursor.lastrowid
+    conn.commit()
+    conn.close()

Database connection is not closed if an exception occurs between opening and the explicit close() call. Use context manager (with statement) to ensure the connection is properly closed even if an error occurs.

> @@ -0,0 +1,243 @@
+#!/usr/bin/env python3
+"""
+Enqueue markdown files for batch frontmatter generation.
+Scans directories and adds files to processing queue.
+"""
+
+import os
+import re

Import of 're' is not used.
```suggestion

```

> @@ -0,0 +1,243 @@
+#!/usr/bin/env python3
+"""
+Enqueue markdown files for batch frontmatter generation.
+Scans directories and adds files to processing queue.
+"""
+
+import os
+import re
+import sqlite3
+import argparse
+from pathlib import Path
+from datetime import datetime

Import of 'datetime' is not used.
```suggestion

```

> @@ -0,0 +1,315 @@
+#!/usr/bin/env python3
+"""
+Process the frontmatter generation queue.
+Pulls pending jobs, calls Ollama, updates files with frontmatter.
+"""
+
+import os

Import of 'os' is not used.
```suggestion

```

-- 
Reply to this email directly or view it on GitHub:
https://github.com/SkogAI/docs/pull/21#pullrequestreview-3596786420
You are receiving this because you authored the thread.

Message ID: <SkogAI/docs/pull/21/review/3596786420@github.com>