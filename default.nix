{ args ? { } }:
let
  nixpkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/d4f8e53720b554b6dac71c7ec62b3b51158905f9.tar.gz") args;
  # Node
  node14 = import ./node/14/export.nix { inherit nixpkgs; nodejs = nixpkgs.nodejs-14_x; };
  node16 = import ./node/16/export.nix { inherit nixpkgs; nodejs = nixpkgs.nodejs-16_x; };

  # Shell
  shell = (import ./shellWrapper/default.nix { inherit nixpkgs args; });

  # Python
  python = {
    # gitlint = import ./python/gitlint/default.nix { inherit nixpkgs; };
    aws-export-credentials = import ./python/aws-export-credentials/default.nix { inherit nixpkgs; };
  };

  # Go
  golang = {
    narwhal = import ./golang/narwhal/default.nix { nixpkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/7e72265b08d4c60f414a0f3ab162e24648e84342.tar.gz") args; };
    spacectl = import ./golang/spacectl/default.nix { inherit nixpkgs; };
    gattai = import ./golang/gattai/default.nix { inherit nixpkgs; };
    nix-share = import ./golang/nix-share/default.nix { inherit nixpkgs; };
    kubefwd = import ./golang/kubefwd/default.nix { inherit nixpkgs; };
  };

  # JetBrains IDE
  jetbrains = import ./jetbrains/default.nix { nixpkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/a5f661b80e4c163510a5013b585a040a5c7ef55e.tar.gz") args; };

  # dotnet
  dotnet = import ./nuget/default.nix { inherit nixpkgs; };

  # ruby
  ruby = import ./ruby/default.nix { inherit nixpkgs; };
in

# merge
node14 // node16 // shell // python // golang // jetbrains // ruby
