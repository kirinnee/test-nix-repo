let nixpkgs = import <nixpkgs> { }; in
let shells = import ./env/shells.nix { inherit nixpkgs; }; in
with (import ./default.nix);
nixpkgs.mkShell {
  buildInputs = [
    awsmfa
  ];
}
