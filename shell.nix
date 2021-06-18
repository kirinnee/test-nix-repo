let
  nixpkgs = import <nixpkgs> { }; in
let
  pkgs = {
    latest = (
      with nixpkgs;
      [
        cachix
      ]
    );
    self = (
      let self = import ./default.nix; in
      with self;
      [
        gitlint
        pls
        please
        plz
      ]
    );
    "nix 21.05 16th June 2021" = (
      let n = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/1f91fd1040667e9265a760b0347f8bc416249da7.tar.gz") { }; in
      with n;
      [
        nodePackages.node2nix
        pre-commit
        git
        shfmt
        shellcheck
        nixpkgs-fmt
        makeWrapper
        nix-prefetch
        sd
        coreutils
      ]
    );
  };
in
nixpkgs.mkShell {
  buildInputs =
    pkgs.latest ++
    pkgs.self ++
    pkgs."nix 21.05 16th June 2021";
}
