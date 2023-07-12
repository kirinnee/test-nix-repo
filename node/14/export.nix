{ nixpkgs, nixpkgs_20_May_2020, nodejs }:
let
  n = import ./composition.nix { pkgs = nixpkgs; inherit nodejs; };
in
with n;
({
  inherit cyanprint semantic-release-cli vercel;
} //
(if nixpkgs.stdenv.isDarwin then { } else
{
  sg = n."@atomi-user-first/semantic-generator".override {
    buildInputs = [
      nixpkgs_20_May_2020.vips
      nixpkgs_20_May_2020.nodePackages.pnpm
    ];
    nativeBuildInputs = [ nixpkgs_20_May_2020.pkg-config nixpkgs.makeWrapper ];
    postFixup = ''
      wrapProgram $out/bin/sg --prefix PATH : ${nixpkgs.lib.makeBinPath [ nixpkgs.nodePackages.pnpm ]}
    '';
  };
}))
