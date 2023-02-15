{ trivialBuilders, nixpkgs ? import <nixpkgs> { } }:

with nixpkgs;
let version = go-task.version; in
let task = go-task; in
{
  pls = trivialBuilders.writeShellScriptBin {
    name = "pls";
    inherit version;
    text = ''
      ${go-task}/bin/go-task "$@"
    '';
  };
  please = trivialBuilders.writeShellScriptBin {
    name = "please";
    inherit version;
    text = ''
      ${go-task}/bin/go-task "$@"
    '';
  };
}
