{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs;
buildGoModule rec {
  pname = "narwhal";
  version = "0.4.1";

  meta = {
    owner = "kirinnee";
    repo = "Narwhal-Go";
    rev = version;
    sha256 = "14s4a3nz6n7718jhanfwainhzd309yd90imz2ia6bgmd29899iqb";
  };

  src = fetchFromGitHub meta;

  vendorSha256 = "0r1n61s8gp47zf385mh3qj80d2dgmxr1yg1ck4brbrv9ksbwm0da";

  doCheck = false;

  buildFlagsArray = [ "-ldflags=-w -s -a -installsuffix cgo" ];
}
