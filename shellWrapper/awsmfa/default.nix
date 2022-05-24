# Generate MFA when needed

{ trivialBuilders, nixpkgs ? import <nixpkgs> { } }:
let name = "awsmfa"; in
let version = "1.0.0"; in
let script = builtins.readFile ./awsmfa.sh; in
trivialBuilders.writeShellApplication {
  name = "awsmfa";
  version = "1.0.0";
  runtimeShell = "${nixpkgs.bash}/bin/bash";
  runtimeInputs = [ nixpkgs.coreutils nixpkgs.awscli2 nixpkgs.jq ];
  text = script;
}
