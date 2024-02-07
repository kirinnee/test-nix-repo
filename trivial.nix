{ nixpkgs }:
with nixpkgs;
import ./shellWrapper/trivialBuilders.nix { inherit lib stdenv stdenvNoCC lndir runtimeShell shellcheck; }
