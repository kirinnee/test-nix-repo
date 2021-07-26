# Commit Convention

Atomi Nix Registry uses [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) loosely as the specification
for our commits.

Commit message will be in the format:

```
type(scope): title

body
```

This page will document the types and scopes used.

## Types

| Type                | Description                                                       |
| ------------------- | ----------------------------------------------------------------- |
| [fix](#fix)         | Fixed a bug within the repository                                 |
| [new](#new)         | Added new package to the repository                               |
| [update](#update)   | Update a package in the repository                                |
| [docs](#docs)       | Add documentation                                                 |
| [ci](#ci)           | Changes to CI                                                     |
| [chore](#chore)     | Tedious things, such as fixing typo or changing line endings      |
| [config](#config)   | Configuration changes, such as build scripts or Taskfile.dev etc  |
| [release](#release) | The commit that performs the release.                             |
| [remove](#remove)   | Removes a package (due to nixpkgs supporting it or other reasons) |

### fix

Fixed a bug within the repository.

Natural language:

```
When this commit is applied, it will **fix** `<title>`
```

| Scope    | Description                                                        |  Bump   |
| -------- | ------------------------------------------------------------------ | :-----: |
| `drv`    | A bug within Nix derivations                                       | `patch` |
| `config` | A bug within configurations, such as scripts, rc files or ci files |  `nil`  |

### new

Added new package to the repository

**V.A.E**

| key             | val                                                                                      |
| --------------- | ---------------------------------------------------------------------------------------- |
| verb            | add                                                                                      |
| apply           | `<scope> - <title>`                                                                      |
| example commit  | new(narwhal): a swiss army knife for docker                                              |
| example meaning | when this commit is applied, it will _add_ `narwhal` - **a swiss army knife for docker** |

Natrual language

```
When this commit is applied, it will add a **new** package, `<scope>`: `<title>`
```

where `<title>` is in the format `<short description>`

Example:

```
new(narwhal): a CLI to manage docker

Narwhal is a docker swiss army knife that allows users
to manage large docker systems quickly
```

Natural Language Translation:

```
When this commit is applied, it will add a new package, narwhal: a CLI to manage docker
```

### update

Update a package in the repository

Natural language

```
When this commit is applied, it will **update** `<scope>`: `<title>`
```

where `<title>` will be in the format `from <prev version> to <current version>`

Example:

```
update(narwhal): from v0.13.1 to v0.14.0
```

Natural Language Translation:

```
When this commit is applied, it will update narwhal: from v0.13.1 to v0.14.0
```

**Bump:** `major`

### docs

Add documentation

Natural language

```
When this commit is applied, it will add documention on `<title>`
```

Scopes:

| Scope | Description                              | Bump    |
| ----- | ---------------------------------------- | ------- |
| `dev` | documentation for contributing processes | `nil`   |
| `pkg` | documentation for packages and users     | `patch` |

### ci

Changes to CI

Scopes:

| Scope       | Description                        | Bump  |
| ----------- | ---------------------------------- | ----- |
| `precommit` | change to precommit configurations | `nil` |
| `build`     | change to Building during CI       | `nil` |

### config

Configuration changes, such as build scripts, rc files or Taskfile.dev etc

Scopes:

| Scope    | Description                                        | Bump  |
| -------- | -------------------------------------------------- | ----- |
| `lint`   | Add, update or remove linters                      | `nil` |
| `fmt`    | Add, update or change formatters                   | `nil` |
| `build`  | Add, update or change build pipelines (generators) | `nil` |
| `nix`    | Add, update or change nix shell                    | `nil` |
| `env`    | Add, update or change environment                  | `nil` |
| `ignore` | Add, update or change ignore configurations        | `nil` |

### chore

As the name suggests, tedious things that need to be done, such as fixing typo or changing line endings

### remove

Remove a package in the repository

Natural language

```
When this commit is applied, it will **remove** `<scope>` because `<title>`
```

where `<title>` will be the reason why it would be remove

Example:

```
remove(narwhal): nixpkgs supports it
```

Natural Language Translation:

```
When this commit is applied, it will remove narwhal because nixpkgs supports it
```

**Bump:** `major`

### release

The commit that performs the release. This is automatically performed by CI systems.

## Overall Scopes

### no-release

This will override all, and prevent bumping and releasing
