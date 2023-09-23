{ nixpkgs, rust }:
with nixpkgs;
(nixpkgs.makeRustPlatform {
  cargo = rust;
  rustc = rust;
}).buildRustPackage rec {
  pname = "cargo2junit";
  version = "0.1.13";

  src = fetchFromGitHub {
    owner = "johnterickson";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-9nN9RQgqeXaIR/UdOEEthobjb7YMmTYfDz1BT052FKw=";
  };

  buildInputs = ([
    pkgconfig
    openssl
  ] ++ lib.optionals stdenv.isDarwin [ darwin.Security ]);

  cargoHash = "sha256-u5Pd967qxjqFl9fV/KkClLDBwKql7p66WqbIVBvWKuM=";

  meta = with lib; {
    description = "Takes cargo test JSON and transform to JUnit XML";
    longDescription = ''
      Takes cargo test JSON and transform to JUnit XML
    '';
    mainProgram = "junitify";
    homepage = "https://gitlab.com/Kores/junitify";
    downloadPage = "https://gitlab.com/Kores/junitify/-/releases";
    license = licenses.mit;
    platforms = [ "x86_64-linux" "x86_64-darwin" "aarch64-darwin" "aarch64-linux" ];
  };

}
