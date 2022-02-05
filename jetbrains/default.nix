{ nixpkgs }:
with nixpkgs;
rec {
  jetbrains = (recurseIntoAttrs
    (callPackages ./ide.nix {
      vmopts = config.jetbrains.vmopts or null;
      jdk = nixpkgs.jetbrains.jdk;
    }));
}
