{ nixpkgs ? import <nixpkgs> }:
with nixpkgs;
let patchJetBrains = import ./editor.nix { inherit nixpkgs; }; in
{
  # Tested
  goland = if stdenv.isDarwin then jetbrains.goland else
  jetbrains.goland.overrideAttrs (finalAttr: prevAttr:
    patchJetBrains {
      inherit finalAttr prevAttr;
      shortProduct = "Goland";
      extraLdPath = [ ];
      extraWrapperArgs = [ ];
    }
  );

  # Tested
  clion = if stdenv.isDarwin then jetbrains.clion else
  jetbrains.clion.overrideAttrs (finalAttr: prevAttr:
    patchJetBrains {
      inherit finalAttr prevAttr;
      shortProduct = "CLion";
      extraLdPath = [ ];
      extraWrapperArgs = [ ];
    }
  );

  # Tested
  phpstorm = if stdenv.isDarwin then jetbrains.phpstorm else
  jetbrains.phpstorm.overrideAttrs (finalAttr: prevAttr:
    patchJetBrains {
      inherit finalAttr prevAttr;
      shortProduct = "PhpStorm";
      extraLdPath = [ ];
      extraWrapperArgs = [ ];
    }
  );

  # Tested
  pycharm = if stdenv.isDarwin then jetbrains.pycharm-professional else
  jetbrains.pycharm-professional.overrideAttrs (finalAttr: prevAttr:
    patchJetBrains {
      inherit finalAttr prevAttr;
      shortProduct = "PyCharm";
      extraLdPath = [ ];
      extraWrapperArgs = [ ];
    }
  );

  # Tested
  rider = if stdenv.isDarwin then jetbrains.rider else
  jetbrains.rider.overrideAttrs (finalAttr: prevAttr:
    patchJetBrains {
      inherit finalAttr prevAttr;
      shortProduct = "Rider";
      extraLdPath = [ icu ];
      extraWrapperArgs = [ ];
    }
  );

  # Tested
  ruby-mine = if stdenv.isDarwin then jetbrains.ruby-mine else
  jetbrains.ruby-mine.overrideAttrs (finalAttr: prevAttr:
    patchJetBrains {
      inherit finalAttr prevAttr;
      shortProduct = "RubyMine";
      extraLdPath = [ ];
      extraWrapperArgs = [ ];
    }
  );

  # Tested
  webstorm = if stdenv.isDarwin then jetbrains.webstorm else
  jetbrains.webstorm.overrideAttrs (finalAttr: prevAttr:
    patchJetBrains {
      inherit finalAttr prevAttr;
      shortProduct = "WebStorm";
      extraLdPath = [ ];
      extraWrapperArgs = [ ];
    }
  );

  idea-u = if stdenv.isDarwin then jetbrains.idea-ultimate else
  jetbrains.idea-ultimate.overrideAttrs (finalAttr: prevAttr:
    patchJetBrains
      {
        inherit finalAttr prevAttr;
        shortProduct = "IDEA";
        extraLdPath = [ zlib ];
        extraWrapperArgs = [
          ''--set M2_HOME "${maven}/maven"''
          ''--set M2 "${maven}/maven/bin"''
        ];
      } // (if stdenv.isLinux then {
      src = fetchurl {
        url = "https://download.jetbrains.com/idea/ideaIU-${finalAttr.version}.tar.gz";
        sha256 = "sha256-4fnegXPOyfcWaJTWa4K4ne5NqQIsBTZtGS9hEpVhhLM";
      };
    } else { })
  );
}
