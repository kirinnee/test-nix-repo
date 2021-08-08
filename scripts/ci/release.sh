#! /bin/sh

pnpm --version

pnpm bin
echo ""
ls "$(pnpm bin)"

ls

sg release || true

pnpm semantic-release

"$(pnpm bin)/semantic-release"
