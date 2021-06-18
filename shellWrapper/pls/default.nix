{ nixpkgs ? import <nixpkgs> { } }:

with nixpkgs;
let task = go-task; in

{
  pls = pkgs.writeShellScriptBin "pls" ''
    ${go-task}/bin/go-task $@
  '';
  please = pkgs.writeShellScriptBin "please" ''
    ${go-task}/bin/go-task $@
  '';
  plz = pkgs.writeShellScriptBin "plz" ''
    ${go-task}/bin/go-task $@
  '';
}
