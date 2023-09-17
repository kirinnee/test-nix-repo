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
    x86_64-linux = "sha256-6d7jLKf3h3EiPiEw2tYAdwDe7EmaXh1ykaF4kQJZeog=";
    x86_64-darwin = "sha256-xqXFOfQ7s4guCG8eK96w937RrL3WFiujWG7PwK50e9U=";
    aarch64-linux = "sha256-wNCeLGQ1Zp0/O2wxcPTpy0LtTeoP/Znn5o/qFL686n8=";
    aarch64-darwin = "sha256-9JKgeb5ymIs5MlMRBvjGlBKOjCtf+TecYbGjkHOIuxU=";
  }.${system} or throwSystem;
in
stdenv.mkDerivation (finalAttrs: {
  pname = "infisical";
  version = "0.12.2";

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
