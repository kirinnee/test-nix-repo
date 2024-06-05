{ nixpkgs, nixpkgs-unstable, dev-nixpkgs-unstable-07-Feb-2024, dev-nixpkgs-unstable-05-Jun-2024, fenix }:
let trivialBuilders = import ./trivial.nix { inherit nixpkgs; }; in
let

  node18 = import ./node/18/export.nix { inherit nixpkgs; nodejs = dev-nixpkgs-unstable-07-Feb-2024.nodejs_18; };
  node20 = import ./node/20/export.nix { inherit nixpkgs trivialBuilders; nodejs = dev-nixpkgs-unstable-07-Feb-2024.nodejs_20; };
  node22 = import ./node/22/export.nix { inherit nixpkgs trivialBuilders; nodejs = dev-nixpkgs-unstable-05-Jun-2024.nodejs_22; };
  # Shell
  shell = (import ./shellWrapper/default.nix { inherit nixpkgs trivialBuilders; });

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
shell // python // golang // ruby // node18 // node20
// node22
// bin // rust
