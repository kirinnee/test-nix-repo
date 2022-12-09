{ nixpkgs ? import <nixpkgs> { }, pyPkgs ? nixpkgs.pkgs.python3Packages }:
with pyPkgs;
let
  bc = buildPythonPackage rec {
    pname = "botocore";
    version = "1.29.26";
    src = fetchPypi {
      inherit version pname;
      sha256 = "f71220fe5a5d393c391ed81a291c0d0985f147568c56da236453043f93727a34";
    };
    checkPhase = ''
      echo "no test!"
    '';
    propagatedBuildInputs = [ urllib3 jmespath python-dateutil docutils pytest ];
  };
in
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
  propagatedBuildInputs = [ click sh bc ];
}
