{ nixpkgs, fenix }:
let rust = (import ./lib.nix { inherit nixpkgs fenix; }).rust; in
{
  cargo2junit = import ./cargo2junit/default.nix { inherit nixpkgs rust; };
  toml-cli = import ./toml-cli/default.nix { inherit nixpkgs rust; };
}
