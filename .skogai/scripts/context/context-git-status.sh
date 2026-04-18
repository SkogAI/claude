#!/usr/bin/env bash
printf "# Git Flow Status\n"
printf "Current branch: %s\n" "$(git branch --show-current)"
printf "Features:\n"
git flow feature | while read line; do
  printf "  %s\n" "$line"
done
printf "Releases:\n"
git flow release | while read line; do
  printf "  %s\n" "$line"
done