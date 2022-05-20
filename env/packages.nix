{ nixpkgs ? import <nixpkgs> { } }:
let pkgs = {
  latest = (
    with nixpkgs;
    { }
  );
  self = (
    let self = import (fetchTarball "https://github.com/kirinnee/test-nix-repo/archive/refs/tags/v8.1.0.tar.gz"); in
    with self;
    {
      inherit pls please plz narwhal sg vercel;
    }
  );
  "nix Unstable 20th May 2022" = (
    with import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/48037fd90426e44e4bf03e6479e88a11453b9b66.tar.gz") { };
    {
      npm = nodePackages.npm;
      pnpm = nodePackages.pnpm;
      node2nix = nodePackages.node2nix;
      prettier = nodePackages.prettier;
      node = nodejs-16_x;
      inherit bash gitlint pre-commit git shfmt shellcheck nixpkgs-fmt nix-prefetch sd coreutils;
    }
  );
}; in
with pkgs;

pkgs.latest //
pkgs.self //
pkgs."nix Unstable 20th May 2022"
