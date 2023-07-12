{
  description = "Atomi Flake Registry";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { self
    , nixpkgs
    , nixpkgs-unstable
    }@inputs:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
    in
    rec {
      packages = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
        in
        import ./default.nix {
          nixpkgs = pkgs;
          nixpkgs-unstable = pkgs-unstable;
        }
      );
      defaultPackage = forAllSystems (system:
        nixpkgs.legacyPackages.${system}.symlinkJoin
          {
            name = "all";
            paths = builtins.attrValues packages.${system};
          }
      );
    };
}
