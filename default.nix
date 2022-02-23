let
  nixpkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/554d2d8aa25b6e583575459c297ec23750adb6cb.tar.gz") { };

  # Node
  npm = (
    let n = import ./node/export.nix { inherit nixpkgs; }; in
    with n; {
      inherit cyanprint semantic-release-cli markdown-table-prettify sg vercel;
    }
  );

  # Shell
  shell = (
    with (import ./shellWrapper/pls/default.nix { inherit nixpkgs; });
    {
      inherit pls please plz;
    }
  );

  # Python
  python = {
    # gitlint = import ./python/gitlint/default.nix { inherit nixpkgs; };
  };

  # Go
  golang = {
    narwhal = import ./golang/narwhal/default.nix { inherit nixpkgs; };
    narwhal_0_3_11 = import ./golang/narwhal/0.3.11.nix { inherit nixpkgs; };
  };

  # JetBrains IDE
  jetbrains = import ./jetbrains/default.nix { inherit nixpkgs; };

  # dotnet
  # dotnet = (with import ./nuget/dotnet.nix { inherit nixpkgs; }; {
  #   inherit dotnetsay;
  # });
  dotnet = import ./nuget/default.nix { inherit nixpkgs; };
in

# merge
npm // shell // python // golang // dotnet // jetbrains // dotnet
