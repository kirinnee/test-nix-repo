{ nixpkgs }:
with nixpkgs;
let
  inherit (stdenv.hostPlatform) system;
  throwSystem = throw "Unsupported system: ${system}";

  plat = {
    x86_64-linux = "https://downloads.strongdm.com/builds/sdm-cli/42.87.0/linux-amd64/4D8BBAB8B45762B1AB8062A1B702F25DA35149F1/sdmcli_42.87.0_linux_amd64.zip";
    x86_64-darwin = "https://downloads.strongdm.com/builds/sdm-cli/42.87.0/darwin-amd64/43CA94FC1F837A9416B85FE1FA2CB6B2A13D52EE/sdmcli_42.87.0_darwin_amd64.zip";
    aarch64-linux = "https://downloads.strongdm.com/builds/sdm-cli/42.87.0/linux-arm64/2E6CAFDEFDD8AE6BA4D1F39EFB4AD17282FE2FC5/sdmcli_42.87.0_linux_arm64.zip";
    aarch64-darwin = "https://downloads.strongdm.com/builds/sdm-cli/42.87.0/darwin-arm64/9A25F4D4997A48087768C73FDF80200A8F25CB1D/sdmcli_42.87.0_darwin_arm64.zip";
  }.${system} or throwSystem;

  archive_fmt = "zip";

  sha256 = {
    x86_64-linux = "sha256-QI4NOpbKudYDqfsrLGQDRLPmIM+7ucJNX23DFPlOfkA=";
    x86_64-darwin = "sha256-gdjD/O6Jda5vKy42C6YkOaCJNWx07z9K3Q+7uPsohJ0=";
    aarch64-linux = "sha256-z1eW1d70x4Xq93LsT4Wze2IeQmDKvmwm9nB6RZQK5H0=";
    aarch64-darwin = "sha256-klMwTj5JKB3AH0vJDiStzWu6h0Ddi1EoNwRaTjPvoxU=";
  }.${system} or throwSystem;
in
let version = "42.87.0"; in
let
  binary = fetchzip {
    url = plat;
    inherit sha256;
  };
in
stdenv.mkDerivation (finalAttrs: {
  pname = "sdm";
  inherit version;

  installPhase = ''
    mkdir -p $out/bin
    cp ${binary}/sdm $out/bin/sdm
    chmod +x $out/bin/sdm
  '';

  postInstall = ''
    chmod +x $out/bin/sdm
  '';
  src = fetchzip {
    url = plat;
    inherit sha256;
  };
  unpackPhase = ":";

  meta = with lib; {
    description = "StrongDM CLI";
    longDescription = ''
      CLI that helps with infrastructure access (tunnelling)
    '';
    mainProgram = "sdm";
    homepage = "https://strongdm.com/";
    downloadPage = "https://app.strongdm.com/app/downloads";
    license = licenses.mit;
    platforms = [ "x86_64-linux" "x86_64-darwin" "aarch64-darwin" "aarch64-linux" ];
  };
})
