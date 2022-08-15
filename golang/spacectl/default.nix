{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs;
buildGoModule rec {
  pname = "spacectl";
  version = "v0.10.0";

  meta = {
    owner = "spacelift-io";
    repo = "spacectl";
    rev = version;
    sha256 = "1lgwrpw3jhjysp7nk54iaxbi8v13l8zgb1slv5chq90mix5brdii";
  };

  src = fetchFromGitHub meta;

  vendorSha256 = "sha256-87uMH7w8XA4WB485nnkEQ6sJDXy8NRECPEUGv80dAhg=";

  doCheck = false;

  buildFlagsArray = [ "-ldflags=-w -s -a -installsuffix cgo" ];
}
