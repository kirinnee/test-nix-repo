{ trivialBuilders, nixpkgs, nodejs }:
let
  n = import ./composition.nix { pkgs = nixpkgs; inherit nodejs; };
in
with n;
(rec { })
