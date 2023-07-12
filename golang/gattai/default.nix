{ nixpkgs }:
with nixpkgs;
buildGoModule rec {
  name = "gattai";
  version = "v0.1.1";

  meta = {
    owner = "tr8team";
    repo = "gattai";
  };

  src = fetchurl {
    url = "https://github.com/${meta.owner}/${meta.repo}/archive/refs/tags/${version}.tar.gz";
    sha256 = "sha256-Q6ZT/vPtUJvzQvbjVbIREEoLgweK2ulF0QD7m+xdWqo=";
  };

  vendorSha256 = "MYgCOOQJ7Ge0LbTxOkQWhxzqTxAgrxYmBs+WIkFxBz4=";

  doCheck = false;

  ldflags = [ "-w" "-s" "-a" ];
}
