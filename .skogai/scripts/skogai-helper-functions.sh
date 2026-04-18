#!/usr/bin/env bash
# skogai-helper-functions.sh - Sourceable helper functions for .skogai scripts

# Returns the name of the project that contains .skogai as a submodule
# Example: if .skogai is at /home/user/foo/.skogai, returns "foo"
_get_project_name() {
  local skogai_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
  local parent_dir
  parent_dir="$(dirname "$skogai_dir")"
  basename "$parent_dir"
}
