#!/bin/bash

set -e

echo ${TRAVIS_EVENT_TYPE}

if [[ ${TRAVIS_EVENT_TYPE} != 'push' ]]
then
  echo 'exit' 
  exit
fi

git checkout master

git config user.name "serhii-londar"
git config user.email "serhii.londar@gmail.com"

echo add readme
git add README.md

echo commit
git commit -m "Generate README"

echo push
git push --quiet "https://${DANGER_GITHUB_API_TOKEN}@github.com/serhii-londar/open-source-mac-os-apps.git"  master:master > /dev/null 2>&1
