{ nixpkgs, nodejs }:
let
  n = import ./composition.nix { pkgs = nixpkgs; inherit nodejs; };
in
with n;
({
  upstash = n."@upstash/cli";
  action_docs = n."action-docs";
  typescript_json_schema = n."typescript-json-schema";
  swagger_typescript_api = n."swagger-typescript-api";
})
