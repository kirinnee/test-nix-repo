{ nixpkgs ? import <nixpkgs> { }, nodejs }:
let
  n = import ./composition.nix { pkgs = nixpkgs; inherit nodejs; };
  npkgs = {
    "20th May 2020 Unstable" = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/48037fd90426e44e4bf03e6479e88a11453b9b66.tar.gz") { };
  };
in
with n;
({
  upstash = n."@upstash/cli";
})
