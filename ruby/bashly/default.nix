{ bundlerApp }:

bundlerApp {
  pname = "bashly";
  gemdir = ./.;
  exes = [ "bashly" ];
}
