{ nixpkgs ? import <nixpkgs> { }, pyPkgs ? nixpkgs.pkgs.python310Packages }:
with pyPkgs;
buildPythonPackage rec {
  pname = "shell_gpt";
  version = "0.8.1";
  src = fetchPypi {
    inherit version pname;
    sha256 = "sha256-v9jsqCJIPqno2Hx9EgtraG/ImYRa8K5bICWAiG0fHvE=";
  };
  checkPhase = ''
    echo "no test!"
  '';
  propagatedBuildInputs = [
    distro
    typer
    rich
    requests
  ];
}
