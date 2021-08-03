let nixpkgs = import <nixpkgs> { }; in
let pkgs = import ./packages.nix { inherit nixpkgs; }; in
with pkgs;

nixpkgs.mkShell {
  buildInputs = [
    gitlint
    pls
    please
    plz
    pre-commit
    git
    shfmt
    shellcheck
    nixpkgs-fmt
    nix-prefetch
    sd
    coreutils
    prettier
    bash
  ];
}
