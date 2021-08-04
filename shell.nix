let nixpkgs = import <nixpkgs> { }; in
let shells = import ./shells.nix { inherit nixpkgs; }; in
shells.dev
