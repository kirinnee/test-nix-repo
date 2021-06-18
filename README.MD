# Atomi NIX Channel


## Binaries
- `gitlint` - gitlint 0.15.1
- `cyanprint` - cyan 0.13.1
- `pls` - go task 3.4.2 alias
- `please` - pls alias
- `plz` - pls alias
- `narwhal` - narwhal 0.4.1
- `narwhal_0_3_11` - narwhal 0.3.11

## Using

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
let atomiPkgs = import (fetchTarball "https://github.com/kirinnee/test-nix-repo/archive/main.tar.gz") { };

```


### Channel Pinning
