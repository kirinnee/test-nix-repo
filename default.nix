let
  nixpkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/1f91fd1040667e9265a760b0347f8bc416249da7.tar.gz") { };

  # Node
  npm = (with import ./node/default.nix { inherit nixpkgs; }; {
    inherit cyanprint semantic-release-cli markdown-table-prettify;
  });

  # Shell
  shell = (
    with (import ./shellWrapper/pls/default.nix { inherit nixpkgs; });
    {
      inherit pls please plz;
    }
  );

  # Python
  python = {
    gitlint = import ./python/gitlint/default.nix { inherit nixpkgs; };
  };

  # Go
  golang = {
    narwhal = import ./golang/narwhal/default.nix { inherit nixpkgs; };
    narwhal_0_3_11 = import ./golang/narwhal/0.3.11.nix { inherit nixpkgs; };
  };

  # dotnet
  dotnet = (with import ./nuget/dotnet.nix { inherit nixpkgs; }; {
    inherit dotnetsay;
  });
in

# merge
npm // shell // python // golang // dotnet
