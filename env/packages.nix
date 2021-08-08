{ nixpkgs ? import <nixpkgs> { } }:
let pkgs = {
  latest = (
    with nixpkgs;
    { }
  );
  self = (
    let self = import ../default.nix; in
    with self;
    {
      inherit gitlint pls please plz narwhal sg vercel;
    }
  );
  "nix 21.05 8th August 2021" = (
    with import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/5b252d8e07edf3434e713420299e51b330bfd562.tar.gz") { };
    {
      node2nix = nodePackages.node2nix;
      inherit pre-commit git shfmt shellcheck nixpkgs-fmt nix-prefetch sd coreutils;
    }
  );
  "nix Unstable 8th August 2021" = (
    with import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/e087f5def9adc76ff649fd8f007cc06eb0ad607e.tar.gz") { };
    {
      npm = nodePackages.npm;
      pnpm = nodePackages.pnpm;
      prettier = nodePackages.prettier;
      node = nodejs-16_x;
      inherit bash;
    }
  );
}; in
with pkgs;

pkgs.latest //
pkgs.self //
pkgs."nix 21.05 8th August 2021" //
pkgs."nix Unstable 8th August 2021"
