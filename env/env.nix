{ nixpkgs ? import <nixpkgs> { } }:
let pkgs = import ./packages.nix { inherit nixpkgs; }; in
with pkgs;
{
  minimal = [
    node2nix
    pls
    please
    plz
    git
    nix-prefetch
    coreutils
    sd
    bash
  ];
  lint = [
    gitlint
    pre-commit
    shfmt
    shellcheck
    nixpkgs-fmt
    prettier
    sg # for linting gitlint file
  ];
  releaser = [
    pnpm
    sg
    prettier
  ];
}
