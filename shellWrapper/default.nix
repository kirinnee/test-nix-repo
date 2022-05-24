{ nixpkgs }:
with nixpkgs;
let trivialBuilders = import ./trivialBuilders.nix { inherit lib stdenv stdenvNoCC lndir runtimeShell shellcheck; }; in
with (import ./pls/default.nix { inherit nixpkgs trivialBuilders; });
{
  inherit pls please plz;
  awsmfa = import ./awsmfa/default.nix { inherit nixpkgs trivialBuilders; };
}
