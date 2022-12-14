{ nixpkgs ? import <nixpkgs> { } }:
let
  pkgs = {
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
    "nix Unstable 5th Oct 2022" = (
      with import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/de80d1d04ee691279e1302a1128c082bbda3ab01.tar.gz") { };
      {
        npm = nodePackages.npm;
        pnpm = nodePackages.pnpm;
        node2nix = nodePackages.node2nix;
        prettier = nodePackages.prettier;
        node = nodejs-16_x;
        inherit bash gitlint pre-commit git shfmt shellcheck nixpkgs-fmt nix-prefetch sd coreutils;
      }
    );

    "nix Unstable 11th Dec 2022" = (
      with import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/f82f0ec1b70b2879c3f3d9a1015a05c73a90a17c.tar.gz") { };
      {
        inherit bundix;
      }
    );
  };
in
with pkgs;

pkgs.latest //
pkgs.self //
pkgs."nix Unstable 5th Oct 2022" //
pkgs."nix Unstable 11th Dec 2022"
