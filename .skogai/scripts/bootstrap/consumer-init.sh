#!/usr/bin/env bash

echo "i am a consumer init script"
rm -rf /tmp/skogai-project
mkdir /tmp/skogai-project
cd /tmp/skogai-project
git init
git submodule add git@github.com:SkogAI/.skogai .skogai
git add .gitmodules
git commit -m "added .skogai submodule"
echo "i have added and created /tmp/skogai-project"
git submodule update --init ./.skogai
echo "i have updated the submodule"
echo "running the bootstrap script now"
(cd .skogai && ./scripts/bootstrap/bootstrap.sh)
(cd .skogai && source ./scripts/skogai-helper-functions.sh && _get_project_name)
