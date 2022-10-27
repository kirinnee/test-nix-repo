let
  nixpkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/d4f8e53720b554b6dac71c7ec62b3b51158905f9.tar.gz") { };
  # Node
  npm = (
    let n = import ./node/export.nix { inherit nixpkgs; nodejs = nixpkgs.nodejs-14_x; }; in
    with n; {
      inherit cyanprint semantic-release-cli sg vercel;
    }
  );

  # Shell
  shell = (import ./shellWrapper/default.nix { inherit nixpkgs; });

  # Python
  python = {
    # gitlint = import ./python/gitlint/default.nix { inherit nixpkgs; };
  };

  # Go
  golang = {
    narwhal = import ./golang/narwhal/default.nix { inherit nixpkgs; };
    narwhal_0_3_11 = import ./golang/narwhal/0.3.11.nix { inherit nixpkgs; };
    spacectl = import ./golang/spacectl/default.nix { inherit nixpkgs; };
    gattai = import ./golang/gattai/default.nix { inherit nixpkgs; };
  };

  # JetBrains IDE
  jetbrains = import ./jetbrains/default.nix { inherit nixpkgs; };

  # dotnet
  dotnet = import ./nuget/default.nix { inherit nixpkgs; };
in

# merge
npm // shell // python // golang // jetbrains
