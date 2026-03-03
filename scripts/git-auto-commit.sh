#!/usr/bin/env bash

gitwatch watch /home/skogix/claude \
  --commit-message-script=/home/skogix/claude/scripts/generate-git-commit-message.sh \
  --commit-on-start=true \
  --debounce-seconds=1 \
  --remote=origin \
  --watch=true
# >/tmp/skogai-git-notify.claude.service.log 2>&1 &
