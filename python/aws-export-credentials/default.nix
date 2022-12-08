{ nixpkgs ? import <nixpkgs> { }, pyPkgs ? nixpkgs.pkgs.python3Packages }:
with pyPkgs;
buildPythonPackage rec {
  pname = "aws-export-credentials";
  version = "0.13.0";
  src = fetchPypi {
    inherit version pname;
    sha256 = "2051da8b9c3ca9a00557c366f0fbfae2967b360d3d28439fc5b21bef4a20068f";
  };
  checkPhase = ''
    echo "no test!"
  '';
  propagatedBuildInputs = [ click sh botocore ];
}
