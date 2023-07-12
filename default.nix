let
  nixpkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/554d2d8aa25b6e583575459c297ec23750adb6cb.tar.gz";
    sha256 = "sha256:01yfqslnkyrfb5yjfablhvw830iw0za3mab4n03a0ldyq5ac6wh1";
  }) { };

  # Node
  npm = (
    let n = import ./node/export.nix { inherit nixpkgs; }; in
    with n; {
      inherit sg;
    }
  );
in
# merge
npm
