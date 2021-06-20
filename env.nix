let nixpkgs = import <nixpkgs> { }; in
let pkgs = import ./packages.nix { inherit nixpkgs; }; in
nixpkgs.buildEnv {
  name = "dev-env";
  paths = pkgs;
}
