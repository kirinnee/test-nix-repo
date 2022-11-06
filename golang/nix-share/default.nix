{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs;
buildGoModule rec {
  name = "nix-share";
  version = "v0.1.2";

  meta = {
    owner = "kirinnee";
    repo = "nix-share";
  };

  src = fetchurl {
    url = "https://github.com/${meta.owner}/${meta.repo}/archive/refs/tags/${version}.tar.gz";
    sha256 = "sha256-eNQqwp6/vT6xDE8UuNz5NQuNOPPpHS7uKSlhQ2wNIO4=";
  };

  vendorSha256 = "dpBqw+QbfOh4wg4Sz/qevfTpNlYcMHlg9c7XCfeK1e0=";

  doCheck = false;

  ldflags = [ "-w" "-s" "-a" ];
}
