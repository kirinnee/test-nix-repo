{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs;
buildGoModule rec {
  pname = "gattai";
  version = "v0.1.0";

  meta = {
    owner = "tr8team";
    repo = "gattai";
    rev = version;
    sha256 = "02ph8c97cxcs97ppz1r2j94bjjmjx6akzwdqb1176hhfma0f5c18";
  };

  src = fetchFromGitHub meta;

  vendorSha256 = "sha256-il2i6hy0ijfwN1+2DJC75yOaevuMzatnGgF1X/7V4Uo=";

  doCheck = false;

  buildFlagsArray = [ "-ldflags=-w -s -a -installsuffix cgo" ];
}
