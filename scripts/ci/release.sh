#! /bin/sh

sg release || true
pnpm exec -r semantic-release
