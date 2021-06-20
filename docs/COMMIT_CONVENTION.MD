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

| Type              | Description                                                  |
| ----------------- | ------------------------------------------------------------ |
| [fix](#fix)       | Fixed a bug within the repository                            |
| [new](#new)       | Added new package to the repository                          |
| [update](#update) | Update a package in the repository                           |
| [docs](#docs)     | Add documentation                                            |
| [ci](#ci)         | Changes to CI                                                |
| [chore](#chore)   | Tedious things, such as fixing typo or changing line endings |

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

Natrual language

```
When this commit is applied, it will add a **new** package, <title>
```

where `<title>` is in the format `<binary name> - <short description>`

Example:

```
new(go): narwhal - a CLI to manage docker

Narwhal is a docker swiss army knife that allows users
to manage large docker systems quickly
```

Natural Language Translation:

```
When this commit is applied, it will add a new package, narwhal - a CLI to manage docker
```

| Scope  | Description    | Bump    |
| ------ | -------------- | ------- |
| `node` | A NPM package  | `minor` |
| `go`   | A Go package   | `minor` |
| `sh`   | A shell binary | `minor` |
| `py`   | A pip package  | `minor` |

### update

Update a package in the repository

Natural language

```
When this commit is applied, it will **update** `<scope>` `<title>`
```

where `<title>` will be in the format `from <prev version> to <current version>`

Example:

```
update(narwhal): from v0.13.1 to v0.14.0
```

Natural Language Translation:

```
When this commit is applied, it will update narwhal from v0.13.1 to v0.14.0
```

**Bump:** `major`

### docs

Add documentation

Natural language

```
When this commit is applied, it will document `<title>`
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

### chore

As the name suggests, tedious things that need to be done, such as fixing typo or changing line endings

## Overall Scopes

### no-release

This will override all, and prevent bumping and releasing
