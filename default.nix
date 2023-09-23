{ nixpkgs ? import <nixpkgs>, nixpkgs-unstable ? import <nixpkgs>, fenix }:
let

  node18 = import ./node/18/export.nix { inherit nixpkgs; nodejs = nixpkgs.nodejs-18_x; };
  # Shell
  shell = (import ./shellWrapper/default.nix { inherit nixpkgs; });

  # Python
  python = {
    aws-export-credentials = import ./python/aws-export-credentials/default.nix { inherit nixpkgs; };
  };

  # Go
  golang = {
    spacectl = import ./golang/spacectl/default.nix { inherit nixpkgs; };
    gattai = import ./golang/gattai/default.nix { inherit nixpkgs; };
    nix-share = import ./golang/nix-share/default.nix { inherit nixpkgs; };
    kubefwd = import ./golang/kubefwd/default.nix { inherit nixpkgs; };
    flyctl = import ./golang/flyctl/default.nix { inherit nixpkgs; };
    telepresence = import ./golang/telepresence/default.nix { inherit nixpkgs; };
  };

  # dotnet
  dotnet = import ./nuget/default.nix { inherit nixpkgs; };

  # ruby
  ruby = import ./ruby/default.nix { inherit nixpkgs; };

  # bin wrapper
  bin = {
    infisical = import ./binWrapper/infisical.nix { inherit nixpkgs; };
    mirrord = import ./binWrapper/mirrord.nix { inherit nixpkgs; };
  };

  rust = import ./rust/default.nix { inherit nixpkgs fenix; };

in

# merge
shell // python // golang // ruby // node18 // bin // rust
