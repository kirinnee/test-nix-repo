{ nixpkgs, nixpkgs_25_Jul_2021 }:
let
  n = import ./composition.nix { pkgs = nixpkgs; };
  npkgs = nixpkgs_25_Jul_2021;
in
with n;
{
  sg = n."@atomi-user-first/semantic-generator".override {
    buildInputs = [
      npkgs.vips
      npkgs.nodePackages.pnpm
    ];
    nativeBuildInputs = [ npkgs.pkg-config ];
  };
}
