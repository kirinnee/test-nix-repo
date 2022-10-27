{ nixpkgs ? import <nixpkgs> }:
with nixpkgs;
let removePostInstall = installScript: builtins.replaceStrings [ "runHook postInstall" ] [ "" ] installScript; in
let removeRmJBR = postPatch: builtins.replaceStrings [ "rm -r jbr" ] [ "" ] postPatch; in
let escapeBackslashes = s: builtins.replaceStrings [ "/" ] [ "\\/" ] s; in

{ finalAttr, prevAttr, shortProduct, extraLdPath, extraWrapperArgs }:
let hiName = lib.toUpper shortProduct; in
{
  postPatch = removeRmJBR prevAttr.postPatch;
  installPhase = (removePostInstall prevAttr.installPhase) + ''
    ${gnused}/bin/sed -i '/# Patch JBR to make self-contained JVM (requires nothing from host system except glibc)/,/# Display project trust warning/d' "$out/$pname/plugins/remote-dev-server/bin/launcher.sh"
    ${gnused}/bin/sed -i 's/echo "-Djava.home=$TEMP_JBR" >>"$TEMP_VM_OPTIONS"/echo "-Djava.home=${escapeBackslashes jetbrains.jdk.home}" >>"$TEMP_VM_OPTIONS"/g' "$out/$pname/plugins/remote-dev-server/bin/launcher.sh"
    ${gnused}/bin/sed -i 's/mv/mv -f/g' "$out/$pname/plugins/remote-dev-server/bin/launcher.sh"

    makeWrapper "$out/$pname/bin/remote-dev-server.sh" "$out/bin/${prevAttr.pname}-remote" \
      --prefix PATH : "$out/libexec/${prevAttr.pname}:${lib.makeBinPath [ jdk coreutils gnugrep which git ]}" \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath ([
        # Some internals want libstdc++.so.6
        stdenv.cc.cc.lib libsecret e2fsprogs
        xorg.libXrender xorg.libXtst xorg.libXi
        libnotify
      ] ++ extraLdPath)}" \
      ${lib.concatStringsSep " " extraWrapperArgs} \
      --set-default JDK_HOME "$jdk" \
      --set-default ANDROID_JAVA_HOME "$jdk" \
      --set-default JAVA_HOME "$jdk" \
      --set ${hiName}_JDK "$jdk" \
      --set ${hiName}_VM_OPTIONS ${prevAttr.vmoptsFile}

    runHook postInstall
  '';

}
