{ trivialBuilders, nixpkgs, nodejs }:
let
  n = import ./composition.nix { pkgs = nixpkgs; inherit nodejs; };
in
with n;
(rec {
  sg_raw = n."@kirinnee/semantic-generator".override {
    buildInputs = [
      nixpkgs.vips
      nixpkgs.nodePackages.npm
    ];
    nativeBuildInputs = [ nixpkgs.pkg-config ];
  };
  sg = trivialBuilders.writeShellScriptBin {
    name = "sg";
    version = sg_raw.version;
    text = ''
      export PATH="${nodejs}/bin:$PATH"
      ${sg_raw}/bin/sg "$@"
    '';
  };

})
