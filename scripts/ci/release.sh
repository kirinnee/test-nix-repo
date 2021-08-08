#! /bin/sh

sg release || true

echo "release"

pnpm exec -r semantic-release
