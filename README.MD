# Atomi Nix Registry

AtomiCloud's NIX registry for binaries that don't exist on `nixpkgs`.

## Binaries

- `gitlint` - gitlint 0.15.1
- `cyanprint` - cyan 0.13.1
- `pls` - go task 3.4.2 alias
- `please` - pls alias
- `plz` - pls alias
- `narwhal` - narwhal 0.4.1
- `narwhal_0_3_11` - narwhal 0.3.11

### Unstable Channel

The unstable channel will always use the latest version of all packages. This means the builds might vary
based on the time of last channel update.

##### In nix-env

To add AtomiNIX Channel unstable

```bash
nix-channel --add https://github.com/kirinnee/test-nix-repo/archive/main.tar.gz atomi-u
nix-channel --update
```

and run

```
nix-channel --update
```

to retrieve the latest packages

Install packages with `nix-env -iA atomi-u.<package-name-here>`

For example, to install `gitlint`:

```bash
nix-env -iA atomi-u.gitlint
```

##### In `nix` files

```nix
let atomiPkgs = import (fetchTarball "https://github.com/kirinnee/test-nix-repo/archive/main.tar.gz") { }; in

# using gitlint
let gl = atomiPkgs.gitlint
```

### Channel Pinning

This allow for stable builds due to pinning your packages to 1 **Atomi's NIX repository's tag**.
In the release section of GitHub, you will be able to view the releases. For the instructions below,
replace 0.0.1 with the version of the **Atomi's NIX Repository**.

##### In nix-env

To add AtomiNIX Fixed Channel

```bash
nix-channel --add https://github.com/kirinnee/test-nix-repo/archive/v0.1.0.tar.gz atomi-0_1_0
nix-channel --update
```

Install packages with `nix-env -iA atomi-0_1_0.<package-name-here>`

For example, to install `gitlint`:

```bash
nix-env -iA atomi-0_1_0.gitlint
```

##### In `nix` files

```nix
let atomi-v0_1_0 = import (fetchTarball "https://github.com/kirinnee/test-nix-repo/archive/v0.1.0.tar.gz") { }; in

# using gitlint
let gl = atomi-v0_1_0.gitlint
```

# Change Log
