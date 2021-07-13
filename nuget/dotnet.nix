{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs;
{
  dotnetsay = fetchNuGet {
    baseName = "dotnetsay";
    version = "2.1.7";
    sha256 = "121p4531ai08k9bqf2jb2d9cnpjw8iyj8474g779lk8jvvaz17y1";
    outputFiles = [ "*" ];
  };

}
