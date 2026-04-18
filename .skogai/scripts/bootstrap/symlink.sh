#!/usr/bin/env bash
# symlink.sh - Link ./<path> to ../<path> and add to ../.gitignore

set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <path>" >&2
  exit 1
fi

path="$1"

# Ensure path exists locally
if [[ ! -e "$path" ]]; then
  echo "Error: '$path' does not exist" >&2
  exit 1
fi

# Create symlink in parent directory
target="../$path"
if [[ -L "$target" ]]; then
  rm "$target"
elif [[ -e "$target" ]]; then
  echo "Error: '$target' already exists and is not a symlink" >&2
  exit 1
fi

ln -s ".skogai/$path" "$target"
echo "Linked ../$path -> .skogai/$path"

# Add to parent .gitignore if not already there
gitignore="../.gitignore"
if [[ ! -f "$gitignore" ]]; then
  echo "$path" > "$gitignore"
  echo "Created ../.gitignore with '$path'"
elif ! grep -qxF "$path" "$gitignore"; then
  echo "$path" >> "$gitignore"
  echo "Added '$path' to ../.gitignore"
else
  echo "'$path' already in ../.gitignore"
fi
