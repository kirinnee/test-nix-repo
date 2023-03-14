{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs;
buildGoModule rec {
  name = "kubefwd";
  version = "1.22.4";

  meta = {
    owner = "txn2";
    repo = "kubefwd";
  };

  src = fetchurl {
    url = "https://github.com/${meta.owner}/${meta.repo}/archive/refs/tags/${version}.tar.gz";
    sha256 = "sha256-+pic2OMffIC5z1KrHQwD441KPPGSK7PHQLlhgZDyf/U=";
  };

  vendorSha256 = "sha256-oeRShx5lYwJ9xFPg5Ch0AzdQXwX/5OA3EyuumgH9gXU=";

  doCheck = false;

  ldflags = [ "-w" "-s" "-a" ];
}
