{ nixpkgs }:
with nixpkgs;
let trivialBuilders = import ./trivialBuilders.nix { inherit lib stdenv stdenvNoCC lndir runtimeShell shellcheck; }; in
let nixPin15Feb2023 = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/7a82bc335d648736102dfd5a040bb42289724699.tar.gz") { }; in
with (import ./pls/default.nix { inherit trivialBuilders; nixpkgs = nixPin15Feb2023; });
{
  inherit pls please;
  awsmfa = import ./awsmfa/default.nix { inherit nixpkgs trivialBuilders; };
  precommit-patch-nix = import ./precommit-patch-nix/default.nix { inherit nixpkgs trivialBuilders; };
}
