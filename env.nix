let nixpkgs = import <nixpkgs> { }; in
let pkgs = import ./packages.nix { inherit nixpkgs; }; in
with pkgs;
{
  dev = nixpkgs.buildEnv {
    name = "dev-env";
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
    ];
  };
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
