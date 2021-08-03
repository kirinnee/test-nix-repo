---
id: quickstart
title: Quick Start
---

Quick start will show you how to install Atomi's tools on Nix via Atomi's Nix Repository

!> The instructions on this page uses the **unstable** channel. This means that
packages installed with the same instruction can change over time due the channels
updating. To use reproducible binaries, please use a pinned version.

## nix-env

1. Add Atomi Nix's Channel unstable

```bash
nix-channel --add https://github.com/kirinnee/test-nix-repo/archive/main.tar.gz atomi-u
nix-channel --update
```

2. Install packages with `nix-env -iA atomi-u.<package-name-here>`

For example, to install `gitlint`:

```bash
nix-env -iA atomi-u.gitlint
```

## In `nix` files

```nix
let atomiPkgs = import (fetchTarball "https://github.com/kirinnee/test-nix-repo/archive/main.tar.gz") { }; in

# using gitlint
let gl = atomiPkgs.gitlint
```
