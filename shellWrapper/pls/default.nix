{ trivialBuilders, nixpkgs ? import <nixpkgs> { } }:

with nixpkgs;
let version = go-task.version; in
let task = go-task; in
{
  pls = trivialBuilders.writeShellScriptBin {
    name = "pls";
    inherit version;
    text = ''
      for i in "$@"; do
        if [[ $i == -t* || $i == --taskfile=* ]]; then
          ${go-task}/bin/go-task $@
          exit $?
        fi
      done
      DIR=$(pwd)
      while true; do
        if [[ $DIR == '/' ]]; then
          ${go-task}/bin/go-task "$@"
          exit $?
        fi

        if [[ -f $DIR/Taskfile.yml ]]; then
          ${go-task}/bin/go-task --taskfile="$DIR"/Taskfile.yml "$@"
          exit $?
        fi


        DIR=$(dirname "$DIR")
        echo "Looking at $DIR"
      done

    '';
  };
  please = trivialBuilders.writeShellScriptBin {
    name = "please";
    inherit version;
    text = ''
      for i in "$@"; do
        if [[ $i == -t* || $i == --taskfile=* ]]; then
          ${go-task}/bin/go-task $@
          exit $?
        fi
      done
      DIR=$(pwd)
      while true; do
        if [[ $DIR == '/' ]]; then
          ${go-task}/bin/go-task "$@"
          exit $?
        fi

        if [[ -f $DIR/Taskfile.yml ]]; then
          ${go-task}/bin/go-task --taskfile="$DIR"/Taskfile.yml "$@"
          exit $?
        fi

        DIR=$(dirname "$DIR")
      done
    '';
  };
  plz = trivialBuilders.writeShellScriptBin {
    name = "plz";
    inherit version;
    text = ''
      for i in "$@"; do
        if [[ $i == -t* || $i == --taskfile=* ]]; then
          ${go-task}/bin/go-task $@
          exit $?
        fi
      done
      DIR=$(pwd)
      while true; do
        if [[ $DIR == '/' ]]; then
          ${go-task}/bin/go-task "$@"
          exit $?
        fi

        if [[ -f $DIR/Taskfile.yml ]]; then
          ${go-task}/bin/go-task --taskfile="$DIR"/Taskfile.yml "$@"
          exit $?
        fi

        DIR=$(dirname "$DIR")
      done
    '';
  };
}
