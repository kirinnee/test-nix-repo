#! /bin/sh

pnpm add -D semantic-release

sg release || true

echo "release"

ls -al

pnpm exec -r semantic-release
