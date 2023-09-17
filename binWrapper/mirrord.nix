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
    x86_64-linux = "sha256-K41XoktPmoMwc3Pt0X1UH1xCJm9jhZun3EkB/j2I/UE=";
    x86_64-darwin = "sha256-Sgn88ArxktUdvrRNzYA1ruttzaFu5JSbAJ32J7qScsA=";
    aarch64-linux = "sha256-6xNbr7awl7BaVOpbXJw6t76Gu2hqiAnH6RSmTXV0D3o=";
    aarch64-darwin = "sha256-Sgn88ArxktUdvrRNzYA1ruttzaFu5JSbAJ32J7qScsA=";
  }.${system} or throwSystem;
in
let version = "3.67.0"; in
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
