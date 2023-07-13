{ registry }:
let
  env = import ./env.nix { inherit registry; };
  nixpkgs = registry.dev-nixpkgs;
in
{
  dev = nixpkgs.mkShell {
    buildInputs = env.minimal ++ env.lint ++ [ ];
  };
  ci = nixpkgs.mkShell {
    buildInputs = env.minimal ++ env.lint ++ [ ];
  };
  releaser = nixpkgs.mkShell {
    buildInputs = env.releaser;
  };
}
