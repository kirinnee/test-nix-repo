{ nixpkgs ? import <nixpkgs> { } }:
let
  n = import ./composition.nix { pkgs = nixpkgs; };
  npkgs = {
    "25th July 2021 21.05" = import (fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/537678cb1ead06fca831077c3b193566cbc3f406.tar.gz";
      sha256 = "sha256:01yfqslnkyrfb5yjfablhvw830iw0za3mab4n03a0ldyq5ac6wh1";
    }) { };
  };
in
with n;
{
  sg = n."@atomi-user-first/semantic-generator".override {
    buildInputs = [
      npkgs."25th July 2021 21.05".vips
      npkgs."25th July 2021 21.05".nodePackages.pnpm
    ];
    nativeBuildInputs = [ npkgs."25th July 2021 21.05".pkg-config ];
  };
  inherit cyanprint semantic-release-cli markdown-table-prettify vercel;
}
