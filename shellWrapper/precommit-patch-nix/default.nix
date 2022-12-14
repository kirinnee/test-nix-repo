# Generate MFA when needed

{ trivialBuilders, nixpkgs ? import <nixpkgs> { } }:
let name = "precommit-nix-patch"; in
let version = "1.0.0"; in
let script = builtins.readFile ./precommit-nix-patch.sh; in
trivialBuilders.writeShellApplication {
  inherit name version;
  runtimeShell = "${nixpkgs.bash}/bin/bash";

  runtimeInputs = [ nixpkgs.coreutils nixpkgs.gnused nixpkgs.findutils ];
  text = ''
    version=${version}
    ${script}
  '';
}
