{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs;
let buildNuget = import ./common.nix; in
{
  dotnet-ef = buildNuget {
    inherit nixpkgs;
    runtime = dotnet-sdk;
    name = "dotnet-ef";
    version = "6.0.2";
    sha256 = "sha256-Qw4Z54Sh4JauWtHY2lV15CHgGTS/pUKTYjPY7EmDkCk=";
    meta = { };
  };
  dotnetsay = buildNuget {
    inherit nixpkgs;
    runtime = dotnet-runtime;
    name = "dotnetsay";
    version = "2.1.7";
    sha256 = "sha256-wZ/w1d4STZrOeeQQJH1EXF7LUhNLCodXmghEFUYhN4g=";
    meta = { };
  };
}
