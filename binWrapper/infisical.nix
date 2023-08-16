{ nixpkgs }:
with nixpkgs;
let
  inherit (stdenv.hostPlatform) system;
  throwSystem = throw "Unsupported system: ${system}";

  plat = {
    x86_64-linux = "linux_amd64";
    x86_64-darwin = "darwin_amd64";
    aarch64-linux = "linux_arm64";
    aarch64-darwin = "darwin_arm64";
  }.${system} or throwSystem;

  archive_fmt = "tar.gz";

  sha256 = {
    x86_64-linux = "sha256-/TfxC7knKZ+YZwzUiKnRgoSPXIBOY2IarL1sn7vMrGs=";
    x86_64-darwin = "sha256-fTp+2JZ7X3dqTPnbgU+b8AKXsZxQOaWIEqyZTUnSwzc=";
    aarch64-linux = "sha256-V1ZmLElzRn//em2wY4BxF3yYXZvaugQbkCYw6rvEfnc=";
    aarch64-darwin = "sha256-CS1X8FGAEkhbHpUZO9QKli5ymH7Vhco8mtsasX9Fxuw=";
  }.${system} or throwSystem;
in
stdenv.mkDerivation (finalAttrs: {
  pname = "infisical";
  version = "0.11.1";

  src = fetchurl {
    url = "https://github.com/Infisical/infisical/releases/download/infisical-cli%2Fv${finalAttrs.version}/infisical_${finalAttrs.version}_${plat}.tar.gz";
    inherit sha256;
  };

  sourceRoot = ".";
  installPhase = ''
    mkdir -p $out/bin/ $out/share/completions/ $out/share/man/
    cp completions/* $out/share/completions/
    cp manpages/* $out/share/man/
    cp infisical $out/bin
  '';

  postInstall = ''
    installManPage share/man/infisical.1.gz
    installShellCompletion share/completions/infisical.{bash,fish,zsh}
    chmod +x bin/infisical
  '';

  meta = with lib; {
    description = "The official Infisical CLI";
    longDescription = ''
      Infisical is an Open Source, End-to-End encrypted platform that lets you
      securely sync secrets and configs across your team, devices, and infrastructure
    '';
    mainProgram = "infisical";
    homepage = "https://infisical.com/";
    downloadPage = "https://github.com/Infisical/infisical/releases/";
    license = licenses.mit;
    maintainers = [ maintainers.ivanmoreau ];
    platforms = [ "x86_64-linux" "x86_64-darwin" "aarch64-darwin" "aarch64-linux" ];
  };
})
