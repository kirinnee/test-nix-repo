#! /bin/sh

attr=$1
version=$2

if [ "$version" = '' ]; then
	version="${1}/default"
fi

original="vendorSha256 = $(nix eval -f default.nix "${attr}".vendorSha256)"

new=$(NIX_PATH="nixpkgs=https://github.com/NixOS/nixpkgs/archive/1f91fd1040667e9265a760b0347f8bc416249da7.tar.gz" \
	nix-prefetch \
	"{ sha256 }: let p=(import ./default.nix).${attr}; in p.go-modules.overrideAttrs (_: { vendorSha256 = sha256; })")

echo "Obtained new vendor SHA: " "${new}"

file="./golang/${version}.nix"

echo "Replacing ${original} with \"${new}\" in $file"

sd "$original" "vendorSha256 = \"${new}\"" "$file"
