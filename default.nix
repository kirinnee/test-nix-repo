let
  nixpkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/d4f8e53720b554b6dac71c7ec62b3b51158905f9.tar.gz") { };
  # Node
  npm = import ./node/export.nix { inherit nixpkgs; nodejs = nixpkgs.nodejs-14_x; };

  # Shell
  shell = (import ./shellWrapper/default.nix { inherit nixpkgs; });

  # Python
  python = {
    # gitlint = import ./python/gitlint/default.nix { inherit nixpkgs; };
  };

  # Go
  golang = {
    narwhal = import ./golang/narwhal/default.nix { nixpkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/7e72265b08d4c60f414a0f3ab162e24648e84342.tar.gz") { }; };
    spacectl = import ./golang/spacectl/default.nix { inherit nixpkgs; };
    gattai = import ./golang/gattai/default.nix { inherit nixpkgs; };
    nix-share = import ./golang/nix-share/default.nix { inherit nixpkgs; };
  };

  # JetBrains IDE
  jetbrains = import ./jetbrains/default.nix { nixpkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/a5f661b80e4c163510a5013b585a040a5c7ef55e.tar.gz") { }; };

  # dotnet
  dotnet = import ./nuget/default.nix { inherit nixpkgs; };
in

# merge
npm // shell // python // golang // jetbrains
