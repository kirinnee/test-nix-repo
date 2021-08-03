#! /bin/sh

apk add git
git config --global user.email "local@localhost"
git config --global user.name "Automated CI tester"
rm -rf /data/.git
cd /data && git init -b main && git add . && git commit -m "test: for testing CI"
