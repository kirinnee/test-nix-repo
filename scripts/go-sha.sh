#! /bin/sh

attr=$1
version=$2

if [ "$version" = '' ]; then
	version="${1}/default"
fi

original="sha256 = $(nix eval -f default.nix "${attr}".meta.sha256)"

owner="$(nix eval -f default.nix "${attr}".meta.owner)"
repo="$(nix eval -f default.nix "${attr}".meta.repo)"
rev="$(nix eval -f default.nix "${attr}".meta.rev)"

owner="$(eval echo "$owner")"
repo="$(eval echo "$repo")"
rev="$(eval echo "$rev")"

sha="$(nix-prefetch-url --unpack https://github.com/"${owner}"/"${repo}"/archive/"${rev}".tar.gz | tail -n 1)"

echo "Obtained SHA: ""${sha}"

file="./golang/${version}.nix"

echo "Replacing ${original} with \"${sha}\" in $file"

sd "$original" "sha256 = \"${sha}\"" "$file"
