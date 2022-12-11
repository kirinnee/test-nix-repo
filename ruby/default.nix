{ nixpkgs ? import <nixpkgs> { } }:
{
  bashly = import ./bashly/default.nix { bundlerApp = nixpkgs.bundlerApp; };
}
