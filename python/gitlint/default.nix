{ nixpkgs ? import <nixpkgs> { }, pyPkgs ? nixpkgs.pkgs.python3Packages }:
with pyPkgs;
buildPythonPackage rec {
  pname = "gitlint";
  version = "0.15.1";

  src = fetchPypi {
    inherit version pname;
    sha256 = "4b22916dcbdca381244aee6cb8d8743756cfd98f27e7d1f02e78733f07c3c21c";
  };
  propagatedBuildInputs = [ nixpkgs.git click sh arrow ];
  git = nixpkgs.git;
}
