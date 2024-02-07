{ nixpkgs, trivialBuilders }:
with nixpkgs;
with (import ./pls/default.nix { inherit trivialBuilders nixpkgs; });
{
  inherit pls please;
  awsmfa = import ./awsmfa/default.nix { inherit nixpkgs trivialBuilders; };
  precommit-patch-nix = import ./precommit-patch-nix/default.nix { inherit nixpkgs trivialBuilders; };
}
