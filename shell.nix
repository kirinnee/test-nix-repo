let nixpkgs = import <nixpkgs> { }; in
let shells = import ./env/shells.nix { inherit nixpkgs; }; in
shells.dev
