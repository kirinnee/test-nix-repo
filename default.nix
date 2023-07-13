{ nixpkgs, nixpkgs_25_Jul_2021 }:
let n = import ./node/export.nix { inherit nixpkgs nixpkgs_25_Jul_2021; }; in
with n; {
  inherit sg;
}