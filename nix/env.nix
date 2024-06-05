{ registry }:
let pkgs = import ./packages.nix { inherit registry; }; in
with pkgs;
{
  minimal = [
    node2nix
    pls
    git
    nix-prefetch
    coreutils
    sd
    bash
    bundix
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
    sg
    npm
    prettier
  ];
}
