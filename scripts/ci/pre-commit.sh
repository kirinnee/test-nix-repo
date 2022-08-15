#! /bin/sh

pre-commit install --install-hooks
SKIP=generate-npm-pkgs pre-commit run --all
