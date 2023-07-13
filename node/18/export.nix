{ nixpkgs, nodejs }:
let
  n = import ./composition.nix { pkgs = nixpkgs; inherit nodejs; };
in
with n;
({
  upstash = n."@upstash/cli";
  action_docs = n."action-docs";
})
