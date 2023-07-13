{
  description = "Atomi Classic";
  inputs = {
    pkgs.url = "nixpkgs/554d2d8aa25b6e583575459c297ec23750adb6cb";
    pkgs_25_Jul_2021.url = "nixpkgs/537678cb1ead06fca831077c3b193566cbc3f406";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, pkgs, pkgs_25_Jul_2021, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let 
        nixpkgs = pkgs.legacyPackages.${system}; 
        nixpkgs_25_Jul_2021 = pkgs_25_Jul_2021.legacyPackages.${system};
      in
      rec {
        packages = import ./default.nix { 
          inherit nixpkgs nixpkgs_25_Jul_2021;
        };
      }
    );
}
