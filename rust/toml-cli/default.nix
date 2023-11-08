{ nixpkgs, rust }:
with nixpkgs;
(nixpkgs.makeRustPlatform {
  cargo = rust;
  rustc = rust;
}).buildRustPackage rec {
  pname = "toml-cli";
  version = "0.2.3";

  src = fetchFromGitHub {
    owner = "gnprice";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-/JDgUAjSBCPFUs8E10eD4ZQtWGgV3Bwioiy1jT91E84=";
  };

  buildInputs = ([
    pkgconfig
    openssl
  ] ++ lib.optionals stdenv.isDarwin [ darwin.Security ]);

  cargoHash = "sha256-v+GBn9mmiWcWnxmpH6JRPVz1fOSrsjWoY+l+bdzKtT4=";

  doCheck = false;
  checkPhase = "";

  meta = with lib; {
    description = "Simple CLI for editing and querying TOML files";
    longDescription = ''
      Simple CLI for editing and querying TOML files
    '';
    mainProgram = "toml";
    homepage = "https://github.com/gnprice/toml-cli";
    downloadPage = "https://github.com/gnprice/toml-cli/releases";
    license = licenses.mit;
    platforms = [ "x86_64-linux" "x86_64-darwin" "aarch64-darwin" "aarch64-linux" ];
  };

}
