{ nixpkgs ? import <nixpkgs> { } }:

with nixpkgs;
let script = builtins.readFile ./github-runner.sh; in
writeShellScriptBin "github-runner" ''
  #!/bin/sh

  PATH="${coreutils}/bin:$PATH"
  github_runner_run="${github-runner}/bin/run.sh"
  github_runner_config="${github-runner}/bin/config.sh"

  ${script}
''
