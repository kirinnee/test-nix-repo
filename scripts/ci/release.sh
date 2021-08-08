#! /bin/sh

sg release || true

echo "release"

ls

pnpm exec -r semantic-release
