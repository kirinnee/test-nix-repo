#! /bin/sh

pnpm bin

ls

sg release || true

pnpm semantic-release

"$(pnpm bin)/semantic-release"
