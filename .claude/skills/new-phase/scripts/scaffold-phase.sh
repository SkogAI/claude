#!/usr/bin/env bash
# scaffold-phase.sh — create a new phase directory with all standard artifacts
# Usage: bash .claude/skills/new-phase/scripts/scaffold-phase.sh <number> <slug> "<goal>"
# Example: bash .claude/skills/new-phase/scripts/scaffold-phase.sh 6 context-routing "Implement lazy context loading"

set -euo pipefail

[[ $# -lt 2 ]] && echo "Usage: scaffold-phase.sh <number> <slug> [\"<goal>\"]" && exit 1

num=$(printf "%02d" "$1")
slug="$2"
goal="${3:-TBD}"
root=$(git rev-parse --show-toplevel)
base="${root}/.planning/phases/${num}-${slug}"
templates="${root}/.claude/skills/new-phase/templates"

[[ -d "$base" ]] && echo "Already exists: $base" && exit 1

mkdir -p "$base"

substitute() {
  local src="$1" dst="$2" plan="${3:-01}"
  sed \
    -e "s/{{PHASE_NUM}}/${num}/g" \
    -e "s/{{PHASE_NAME}}/${slug}/g" \
    -e "s/{{PHASE_GOAL}}/${goal}/g" \
    -e "s/{{PLAN_NUM}}/${plan}/g" \
    "$src" > "$dst"
}

substitute "${templates}/CONTEXT.md"    "${base}/${num}-CONTEXT.md"
substitute "${templates}/RESEARCH.md"   "${base}/${num}-RESEARCH.md"
substitute "${templates}/VALIDATION.md" "${base}/${num}-VALIDATION.md"
substitute "${templates}/PLAN.md"       "${base}/${num}-01-PLAN.md"
substitute "${templates}/SUMMARY.md"    "${base}/${num}-01-SUMMARY.md"

echo "Created: ${base}"
echo ""
ls -1 "${base}"
