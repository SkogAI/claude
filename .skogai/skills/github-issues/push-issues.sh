#!/usr/bin/env bash
# Push all skill review issues to GitHub
# Usage: bash push-issues.sh [--dry-run]
#
# Creates the epic first, then creates subtask issues that reference it.
# Requires: gh cli authenticated

set -euo pipefail

DRY_RUN="${1:-}"
REPO="skogix/claude"  # adjust if different
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

extract_frontmatter() {
    local file="$1"
    local field="$2"
    sed -n '/^---$/,/^---$/p' "$file" | grep "^${field}:" | sed "s/^${field}: *//" | sed 's/^"//' | sed 's/"$//'
}

extract_body() {
    local file="$1"
    # Everything after the second ---
    awk 'BEGIN{c=0} /^---$/{c++; next} c>=2{print}' "$file"
}

create_issue() {
    local file="$1"
    local parent_issue="${2:-}"

    local title
    title=$(extract_frontmatter "$file" "title")
    local labels
    labels=$(extract_frontmatter "$file" "labels")
    local body
    body=$(extract_body "$file")

    # If parent issue provided, prepend reference
    if [[ -n "$parent_issue" ]]; then
        body="Parent epic: #${parent_issue}"$'\n\n'"${body}"
    fi

    if [[ "$DRY_RUN" == "--dry-run" ]]; then
        echo "[DRY RUN] Would create issue: $title"
        echo "  Labels: $labels"
        echo "  Body length: ${#body} chars"
        echo ""
        return
    fi

    local issue_url
    issue_url=$(gh issue create \
        --repo "$REPO" \
        --title "$title" \
        --label "$labels" \
        --body "$body" 2>&1)

    local issue_num
    issue_num=$(echo "$issue_url" | grep -oP '\d+$')
    echo "$issue_num"
}

echo "=== Skill Review Issue Push ==="
echo ""

# Step 1: Create epic
echo "Creating epic..."
EPIC_NUM=$(create_issue "$SCRIPT_DIR/00-epic.md")
if [[ "$DRY_RUN" != "--dry-run" ]]; then
    echo "  Epic created: #$EPIC_NUM"
fi

# Step 2: Create subtask issues referencing epic
SUBTASK_FILES=(
    "01-wo1-merge-git-worktree.md"
    "02-wo2-nelson-authority.md"
    "03-wo3-delete-duplicate-prompting.md"
    "04-wo4-consolidate-skill-creation.md"
    "05-wo5-docs-decouple-cora.md"
    "06-wo6-graduate-lore-creation.md"
    "07-wo7-git-worktrunk-boundary.md"
    "08-wo8-cross-references.md"
    "09-wo9-argc-navigation.md"
    "10-wo10-ecosystem-map.md"
)

for file in "${SUBTASK_FILES[@]}"; do
    echo "Creating: $file..."
    ISSUE_NUM=$(create_issue "$SCRIPT_DIR/$file" "$EPIC_NUM")
    if [[ "$DRY_RUN" != "--dry-run" ]]; then
        echo "  Created: #$ISSUE_NUM"
    fi
done

echo ""
echo "=== Done ==="
if [[ "$DRY_RUN" != "--dry-run" ]]; then
    echo "Epic: #$EPIC_NUM"
    echo "All 10 subtasks created and linked to epic."
fi
