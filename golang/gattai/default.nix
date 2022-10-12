{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs;
buildGoModule rec {
  pname = "gattai";
  version = "v0.1.1";

  meta = {
    owner = "tr8team";
    repo = "gattai";
    rev = version;
    sha256 = "03za0mr0hk7yyksinjpxrnvn90dihdwvijzx33rzpa786jcmjrn9";
  };

  src = fetchFromGitHub meta;

  vendorSha256 = "sha256-MYgCOOQJ7Ge0LbTxOkQWhxzqTxAgrxYmBs+WIkFxBz4=";

  doCheck = false;

  buildFlagsArray = [ "-ldflags=-w -s -a -installsuffix cgo" ];
}
