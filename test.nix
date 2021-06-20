let
  pkgs = import (fetchTarball "https://github.com/kirinnee/test-nix-repo/archive/v0.3.0.tar.gz");
  n = import <nixpkgs> { };
in
with n;
n.mkShell {
  buildInputs = [
    pkgs.speed-test
    pkgs.gitlint
  ];
}
