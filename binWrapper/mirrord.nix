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
    x86_64-linux = "sha256-S9aT5xXrxfAuUMi9pJjhgnndK77DJhR1ciHQ8ztKLDM=";
    x86_64-darwin = "sha256-Atcs+Q/JTV+iDwa0wfRR5TITYqzpsP6nNnjvmVdHH0Q=";
    aarch64-linux = "sha256-0hHx52fv08JIBfDGchbkVsx7FOSVbQo5etby2Bw6gRw=";
    aarch64-darwin = "sha256-Atcs+Q/JTV+iDwa0wfRR5TITYqzpsP6nNnjvmVdHH0Q=";
  }.${system} or throwSystem;
in
let version = "3.65.2"; in
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
