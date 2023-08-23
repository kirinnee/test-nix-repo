{ nixpkgs }:
with nixpkgs;
let
  inherit (stdenv.hostPlatform) system;
  throwSystem = throw "Unsupported system: ${system}";

  plat = {
    x86_64-linux = "linux_x86_64";
    x86_64-darwin = "mac_universal";
    aarch64-linux = "linux_aarch64";
    aarch64-darwin = "mac_universal";
  }.${system} or throwSystem;

  archive_fmt = "tar.gz";

  sha256 = {
    x86_64-linux = "sha256-Q4lioUsX4E4QqMA5RRO2HMnNQuOLCeYlwjcSkxANDhw=";
    x86_64-darwin = "sha256-CfJFAtL0iC2NPlPI5MRvhWnbo8d358TuTRIQZ3Llguk=";
    aarch64-linux = "sha256-oPIogrJ3mtXpx9pLF/NHaZf/Jz8bulE+NMrxzOUS6So=";
    aarch64-darwin = "sha256-CfJFAtL0iC2NPlPI5MRvhWnbo8d358TuTRIQZ3Llguk=";
  }.${system} or throwSystem;
in
let version = "3.61.0"; in
let
  binary = fetchurl {
    url = "https://github.com/metalbear-co/mirrord/releases/download/${version}/mirrord_${plat}";
    inherit sha256;
  };
in
stdenv.mkDerivation (finalAttrs: {
  pname = "mirrord";
  inherit version;

  installPhase = ''
    mkdir -p $out/bin
    cp ${binary} $out/bin/mirrord
  '';

  postInstall = ''
    chmod +x bin/mirrord
  '';
  src = fetchurl {
    url = "https://github.com/metalbear-co/mirrord/releases/download/${version}/mirrord_${plat}";
    inherit sha256;
  };
  unpackPhase = ":";

  meta = with lib; {
    description = "mirrord CLI for local kubernetes development";
    longDescription = ''
      Connect your local process and your cloud environment, and run local code in cloud conditions.
    '';
    mainProgram = "mirrord";
    homepage = "https://mirrord.dev/";
    downloadPage = "https://github.com/metalbear-co/mirrord/releases";
    license = licenses.mit;
    platforms = [ "x86_64-linux" "x86_64-darwin" "aarch64-darwin" "aarch64-linux" ];
  };
})
