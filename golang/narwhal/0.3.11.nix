{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs;
buildGoModule rec {
  pname = "narwhal";
  version = "0.3.11";

  meta = {
    owner = "kirinnee";
    repo = "Narwhal-Go";
    rev = version;
    sha256 = "0hqxxd5vqv9mxahzmxfaj7xmp0ydbjs7w629dkgjzyc3j4cl5cjj";
  };

  src = fetchFromGitHub meta;

  vendorSha256 = "034nllajw7ln8gvz8ihy1lbzznnyy2rrar0k6jiiaij31bmja023";

  doCheck = false;

  ldflags = [ "-w" "-s" "-a" ];
}
