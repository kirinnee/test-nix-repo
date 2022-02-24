#!/bin/sh

arg0="$1"
[ "$arg0" = "" ] && echo "Please have input arguments" && exit 1
shift
if [ "$arg0" = "run" ]; then
	# shellcheck disable=SC2068,2154
	RUNNER_ROOT="$(pwd)" $github_runner_run $@
elif [ "$arg0" = "config" ]; then
	# shellcheck disable=SC2068,2154
	RUNNER_ROOT="$(pwd)" $github_runner_config $@
else
	echo "Unknown instruction: $1"
fi
