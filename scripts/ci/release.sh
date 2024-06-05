#! /bin/sh
rm .git/hooks/*
npm i -D conventional-changelog-conventionalcommits@7.0.2 @semantic-release/release-notes-generator@12.0.0 @semantic-release/commit-analyzer@12.0.0
sg release -i npm || true
