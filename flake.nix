{
  description = "Atomi Flake Registry";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    # main
    npkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    npkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    fenix.url = "github:nix-community/fenix";

    # dev
    dev-atomi_classic.url = "github:kirinnee/test-nix-repo/classic";
    dev-npkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    dev-npkgs-unstable-05-Oct-2022.url = "nixpkgs/de80d1d04ee691279e1302a1128c082bbda3ab01";
    dev-npkgs-unstable-11-Dec-2022.url = "nixpkgs/f82f0ec1b70b2879c3f3d9a1015a05c73a90a17c";
    dev-npkgs-unstable-07-Feb-2024.url = "nixpkgs/faf912b086576fd1a15fca610166c98d47bc667e";
  };

  outputs =
    { self
    , npkgs
    , npkgs-unstable
    , flake-utils
    , dev-npkgs
    , dev-npkgs-unstable-05-Oct-2022
    , dev-npkgs-unstable-11-Dec-2022
    , dev-npkgs-unstable-07-Feb-2024
    , dev-atomi_classic
    , fenix
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
          dev-nixpkgs-unstable-07-Feb-2024 = dev-npkgs-unstable-07-Feb-2024.legacyPackages.${system};
          atomi_classic = dev-atomi_classic.packages.${system};
          fenixpkgs = fenix.packages.${system};
        in
        rec {
          packages = import ./default.nix {
            inherit
              nixpkgs
              nixpkgs-unstable
              ;
            fenix = fenixpkgs;
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
                    dev-nixpkgs-unstable-07-Feb-2024;
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
