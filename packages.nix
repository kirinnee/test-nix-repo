{ nixpkgs ? import <nixpkgs> { } }:
let pkgs = {
  latest = (
    with nixpkgs;
    { }
  );
  self = (
    let self = import ./default.nix; in
    with self;
    {
      inherit gitlint pls please plz narwhal sg vercel;
    }
  );
  "nix 21.05 16th June 2021" = (
    let n = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/1f91fd1040667e9265a760b0347f8bc416249da7.tar.gz") { }; in
    with n;
    {
      node2nix = nodePackages.node2nix;
      inherit pre-commit git shfmt shellcheck nixpkgs-fmt nix-prefetch sd coreutils;
    }
  );
  "nix 21.05 18th June 2021" = (
    let n = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/bad3ccd099ebe9a8aa017bda8500ab02787d90aa.tar.gz") { }; in
    with n;
    {
      pnpm = nodePackages.pnpm;
      prettier = nodePackages.prettier;
      inherit bash;
    }
  );
}; in
with pkgs;

pkgs.latest //
pkgs.self //
pkgs."nix 21.05 16th June 2021" //
pkgs."nix 21.05 18th June 2021"
