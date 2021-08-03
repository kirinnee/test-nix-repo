let nixpkgs = import <nixpkgs> { }; in
let pkgs = import ./packages.nix { inherit nixpkgs; }; in
with pkgs;
{
  ci = nixpkgs.buildEnv {
    name = "ci-env";
    paths = [
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
      node2nix
      sg
    ];
  };

  cd = nixpkgs.buildEnv {
    name = "cd-env";
    paths = [
      sg
      pnpm
    ];
  };
}
