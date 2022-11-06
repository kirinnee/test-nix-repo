{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs;
buildGoModule rec {
  name = "nix-share";
  version = "v0.1.0";

  meta = {
    owner = "kirinnee";
    repo = "nix-share";
  };

  src = fetchurl {
    url = "https://github.com/${meta.owner}/${meta.repo}/archive/refs/tags/${version}.tar.gz";
    sha256 = "sha256-aBycWTWMMH8RBRJIv2ozceWn91NBHWbD+BXuhOyknfc=";
  };

  vendorSha256 = "dpBqw+QbfOh4wg4Sz/qevfTpNlYcMHlg9c7XCfeK1e0=";

  doCheck = false;

  ldflags = [ "-w" "-s" "-a" ];
}
