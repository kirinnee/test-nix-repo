#! /bin/sh

sg release || true
pnpm exec semantic-release
