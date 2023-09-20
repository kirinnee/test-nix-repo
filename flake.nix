{
  description = "Atomi Flake Registry";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    # main
    npkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    npkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # dev
    dev-atomi_classic.url = "github:kirinnee/test-nix-repo/classic";
    dev-npkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    dev-npkgs-unstable-05-Oct-2022.url = "nixpkgs/de80d1d04ee691279e1302a1128c082bbda3ab01";
    dev-npkgs-unstable-11-Dec-2022.url = "nixpkgs/f82f0ec1b70b2879c3f3d9a1015a05c73a90a17c";
    dev-npkgs-unstable-20-Sep-2023.url = "nixpkgs/e480fdf4a388f413fd4b57e9ff159562e9cc5b2f";
  };

  outputs =
    { self
    , npkgs
    , npkgs-unstable
    , flake-utils
    , dev-npkgs
    , dev-npkgs-unstable-05-Oct-2022
    , dev-npkgs-unstable-11-Dec-2022
    , dev-npkgs-unstable-20-Sep-2023
    , dev-atomi_classic
    }@inputs:
    flake-utils.lib.eachDefaultSystem
      (
        system:
        let
          nixpkgs = npkgs.legacyPackages.${system};
          nixpkgs-unstable = npkgs-unstable.legacyPackages.${system};
          dev-nixpkgs = dev-npkgs.legacyPackages.${system};
          dev-nixpkgs-unstable-05-Oct-2022 = dev-npkgs-unstable-05-Oct-2022.legacyPackages.${system};
          dev-nixpkgs-unstable-11-Dec-2022 = dev-npkgs-unstable-11-Dec-2022.legacyPackages.${system};
          dev-nixpkgs-unstable-20-Sep-2023 = dev-npkgs-unstable-20-Sep-2023.legacyPackages.${system};
          atomi_classic = dev-atomi_classic.packages.${system};
        in
        rec {
          packages = import ./default.nix {
            inherit
              nixpkgs
              nixpkgs-unstable;
          };
          devShells =
            let
              shells = import ./nix/shells.nix {
                registry = {
                  inherit
                    atomi_classic
                    dev-nixpkgs
                    dev-nixpkgs-unstable-11-Dec-2022
                    dev-nixpkgs-unstable-05-Oct-2022
                    dev-nixpkgs-unstable-20-Sep-2023;
                  self = packages;
                };
              };
            in
            {
              default = shells.dev;
              ci = shells.ci;
              releaser = shells.releaser;
            };
          defaultPackage = nixpkgs.symlinkJoin
            {
              name = "all";
              paths = builtins.attrValues packages;
            };
        }
      );
}
