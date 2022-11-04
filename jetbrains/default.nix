{ nixpkgs ? import <nixpkgs> }:
with nixpkgs;
let patchJetBrains = import ./editor.nix { inherit nixpkgs; }; in
{
  # Tested
  goland = jetbrains.goland.overrideAttrs (finalAttr: prevAttr:
    patchJetBrains {
      inherit finalAttr prevAttr;
      shortProduct = "Goland";
      extraLdPath = [ ];
      extraWrapperArgs = [ ];
    }
  );

  # Tested
  clion = jetbrains.clion.overrideAttrs (finalAttr: prevAttr:
    patchJetBrains {
      inherit finalAttr prevAttr;
      shortProduct = "CLion";
      extraLdPath = [ ];
      extraWrapperArgs = [ ];
    }
  );

  # Tested
  phpstorm = jetbrains.phpstorm.overrideAttrs (finalAttr: prevAttr:
    patchJetBrains {
      inherit finalAttr prevAttr;
      shortProduct = "PhpStorm";
      extraLdPath = [ ];
      extraWrapperArgs = [ ];
    }
  );

  # Tested
  pycharm = jetbrains.pycharm-professional.overrideAttrs (finalAttr: prevAttr:
    patchJetBrains {
      inherit finalAttr prevAttr;
      shortProduct = "PyCharm";
      extraLdPath = [ ];
      extraWrapperArgs = [ ];
    }
  );

  # Tested
  rider = jetbrains.rider.overrideAttrs (finalAttr: prevAttr:
    patchJetBrains {
      inherit finalAttr prevAttr;
      shortProduct = "Rider";
      extraLdPath = [ icu ];
      extraWrapperArgs = [ ];
    }
  );

  # Tested
  ruby-mine = jetbrains.ruby-mine.overrideAttrs (finalAttr: prevAttr:
    patchJetBrains {
      inherit finalAttr prevAttr;
      shortProduct = "RubyMine";
      extraLdPath = [ ];
      extraWrapperArgs = [ ];
    }
  );

  # Tested
  webstorm = jetbrains.webstorm.overrideAttrs (finalAttr: prevAttr:
    patchJetBrains {
      inherit finalAttr prevAttr;
      shortProduct = "WebStorm";
      extraLdPath = [ ];
      extraWrapperArgs = [ ];
    }
  );

  idea-u = jetbrains.idea-ultimate.overrideAttrs (finalAttr: prevAttr:
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
