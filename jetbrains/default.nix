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
}
