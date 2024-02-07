{ registry }:
let
  pkgs = {
    self = (
      with registry.self;
      {
        inherit pls;
      }
    );
    ac = (
      with registry.atomi_classic;
      {
        inherit sg;
      }
    );
    "nix Unstable 5th Oct 2022" = (
      with registry.dev-nixpkgs-unstable-05-Oct-2022;
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
      with registry.dev-nixpkgs-unstable-11-Dec-2022;
      {
        inherit bundix;
      }
    );
    "nix Unstable 7th Feb 2024" = (
      with registry.dev-nixpkgs-unstable-07-Feb-2024;
      {
        node20 = nodejs_20;
      }
    );
  };
in
pkgs.self //
pkgs.ac //
pkgs."nix Unstable 5th Oct 2022" //
pkgs."nix Unstable 11th Dec 2022" //
pkgs."nix Unstable 7th Feb 2024"
