{ nixpkgs, nodejs }:
import ./composition.nix { pkgs = nixpkgs; inherit nodejs; }
