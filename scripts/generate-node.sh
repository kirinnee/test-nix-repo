#! /bin/sh
node2nix -i ./node/node-packages.json -e ./node/node-env.nix -o ./node/node-packages.nix -c ./node/composition.nix
nixpkgs-fmt . || true
