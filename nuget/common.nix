{ nixpkgs, runtime, name, version, sha256, meta }:
with nixpkgs;
let
  nuget = fetchNuGet {
    pname = name;
    baseName = name;
    version = version;
    sha256 = sha256;
    outputFiles = [ "*" ];
    postUnpack = ''
      chmod -R +r .
    '';
  };
in
let
  dlls = stdenv.mkDerivation {
    pname = name;
    src = nuget;
    installPhase = ''
      mkdir -p $out/
      dll="$(find $src -name '${name}.dll')"
      echo "$dll" > $out/path
    '';
    inherit name meta version;
  };
in
let
  bin = writeShellScriptBin name ''
    path_to_dll="$(${coreutils}/bin/cat ${dlls}/path)"
    ${runtime}/bin/dotnet "$path_to_dll" $@
  '';
in
stdenv.mkDerivation ({
  inherit version meta;
  name = "${name}-${version}";
  src = bin;
  installPhase = ''
    mkdir -p $out/
    cp -a $src/. $out/
  '';

})
