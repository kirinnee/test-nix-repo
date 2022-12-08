{ nixpkgs ? import <nixpkgs> { }, nodejs }:
let
  n = import ./composition.nix { pkgs = nixpkgs; inherit nodejs; };
  npkgs = {
    "20th May 2020 Unstable" = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/48037fd90426e44e4bf03e6479e88a11453b9b66.tar.gz") { };
  };
in
with n;
{
  sg = n."@atomi-user-first/semantic-generator".override {
    buildInputs = [
      npkgs."20th May 2020 Unstable".vips
      npkgs."20th May 2020 Unstable".nodePackages.pnpm
    ];
    nativeBuildInputs = [ npkgs."20th May 2020 Unstable".pkg-config nixpkgs.makeWrapper ];
    postInstall = ''
      makeWrapper "$out/bin/sg" --prefix PATH : ${nixpkgs.lib.makeBinPath [ nixpkgs.nodePackages.pnpm ]}"
    '';
  };
  inherit cyanprint semantic-release-cli vercel;
}
