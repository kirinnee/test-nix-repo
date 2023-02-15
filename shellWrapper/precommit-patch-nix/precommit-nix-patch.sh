#!/bin/bash

set -eo pipefail

mode="$1"

# shellcheck disable=SC2154
USAGE=$(
	cat <<-END
		    Patches Pre-commit with Nix shell

			Version ${version}

		    precommit-patch-nix version          : Version for pre-commit-patch-nix
		    precommit-patch-nix patch <dir>      : Patches the directory
	END
)

[ "$mode" != "version" ] && [ "$mode" != "patch" ] && echo "$USAGE" && exit 1

if [ "$mode" = "version" ]; then
	echo "$version"
	exit 0
fi

dir="$2"
[ "${dir}" = '' ] && dir="$(pwd)"

find "${dir}"/.git/hooks/* ! -name "*.sample" | while read -r line; do
	echo "🧩 Replacing '$line'..."
	p="export PATH=\"${PATH}:\$PATH\""
	sed -i "4 i $p" "$line"
done
echo "✅ Pre-commit patched!"
