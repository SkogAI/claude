#!/usr/bin/env bash
# source "skogai-helper-functions.sh"
source ".skogai/scripts/skogai-helper-functions.sh"

if [ -f .git ]; then
  project=$git_current_branch
  echo "project: $project"

  echo "symlinking '.envrc'"
  ./scripts/bootstrap/symlink.sh .envrc
  echo "symlinking 'bin'"
  ./scripts/bootstrap/symlink.sh bin
  echo "symlinking 'scripts'"
  ./scripts/bootstrap/symlink.sh scripts
  echo "symlinking 'dotfiles'"
  ./scripts/bootstrap/symlink.sh dotfiles
  echo "symlinking 'email'"
  ./scripts/bootstrap/symlink.sh email
  echo "symlinking 'tasks'"
  ./scripts/bootstrap/symlink.sh tasks

  git switch --create "$project"
  git push

  cd ..
  git submodule set-branch --branch "$project" .skogai
  git add .gitmodules .skogai
  git commit -m "Initialize .skogai on branch '$project'"

  echo "Bootstrapped '$project'"

fi
