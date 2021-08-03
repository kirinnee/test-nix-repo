---
id: commit-conventions
title: Commit Conventions
---

This project uses [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) loosely as the specification
for our commits.

Commit message will be in the format:

```
type(scope): title

body
```

This page will document the types and scopes used.

# Types

| Type                | Description                                                                |
| ------------------- | -------------------------------------------------------------------------- |
| [fix](#fix)         | Fixed a bug within the repository                                          |
| [new](#new)         | Releases a new package in the repository                                   |
| [update](#update)   | Update a package's version                                                 |
| [remove](#remove)   | Removes an existing package                                                |
| [docs](#docs)       | Add documentation                                                          |
| [ci](#ci)           | Changed the CI pipeline                                                    |
| [release](#release) | Initiate a release (machine initiated)                                     |
| [config](#config)   | Configuration changes, such as build scripts, rc files or Taskfile.dev etc |
| [chore](#chore)     | Any chores, uncategorized, or small mistakes (like typos)                  |

## fix

Fixed a bug within the repository

| **V.A.E**       | V.A.E values                                                           |
| --------------- | ---------------------------------------------------------------------- |
| verb            | fix                                                                    |
| application     | when this commit is applied, it will _fix_ `<title>`                   |
| example         | fix: dropdown flickering bug                                           |
| example applied | when this commit is applied, it will _fix_ **dropdown flickering bug** |

| Scope    | Description                                                                     | Bump    |
| -------- | ------------------------------------------------------------------------------- | ------- |
| default  | Generic fixes not under `drv` or `patch`                                        | `patch` |
| `drv`    | Fixes a bug in Nix derivations in the repository                                | `patch` |
| `config` | Fixes a bug in repository configurations, such as scripts, rc files or ci files | `nil`   |

## new

Releases a new package in the repository

| **V.A.E**       | V.A.E values                                                                             |
| --------------- | ---------------------------------------------------------------------------------------- |
| verb            | add                                                                                      |
| application     | when this commit is applied, it will _add_ `<scope> - <title>`                           |
| example         | new(narwhal): a swiss army knife for docker                                              |
| example applied | when this commit is applied, it will _add_ `narwhal` - **a swiss army knife for docker** |

| Scope   | Description           | Bump    |
| ------- | --------------------- | ------- |
| default | Release a new package | `minor` |

## update

Update a package's version

| **V.A.E**       | V.A.E values                                                                        |
| --------------- | ----------------------------------------------------------------------------------- |
| verb            | update                                                                              |
| application     | when this commit is applied, it will _update_ `<scope> <title>`                     |
| example         | update(narwhal): from v0.13.1 to v0.14.0                                            |
| example applied | when this commit is applied, it will _update_ `narwhal` **from v0.13.1 to v0.14.0** |

| Scope   | Description                | Bump    |
| ------- | -------------------------- | ------- |
| default | Update a package's version | `major` |

## remove

Removes an existing package

| Scope   | Description                 | Bump    |
| ------- | --------------------------- | ------- |
| default | Removes an existing package | `major` |

## docs

Add documentation

| **V.A.E**       | V.A.E values                                                                              |
| --------------- | ----------------------------------------------------------------------------------------- |
| verb            | document                                                                                  |
| application     | when this commit is applied, it will _document_ `<title>`                                 |
| example         | docs(pkg): new features added in narwhal v0.14.0                                          |
| example applied | when this commit is applied, it will _document_ **new features added in narwhal v0.14.0** |

| Scope   | Description                                                        | Bump  |
| ------- | ------------------------------------------------------------------ | ----- |
| default | Adds a generic documentation not related to `dev`, `pkg` or `user` | `nil` |
| `user`  | User-side documentation                                            | `nil` |
| `dev`   | Documentation for contributing processes                           | `nil` |
| `pkg`   | Documentation for packages                                         | `nil` |

## ci

Changed the CI pipeline

| Scope   | Description             | Bump  |
| ------- | ----------------------- | ----- |
| default | Update CI configuration | `nil` |

## release

Initiate a release (machine initiated)

| Scope   | Description               | Bump  |
| ------- | ------------------------- | ----- |
| default | Machine initiated release | `nil` |

## config

Configuration changes, such as build scripts, rc files or Taskfile.dev etc

| Scope    | Description                                                                  | Bump  |
| -------- | ---------------------------------------------------------------------------- | ----- |
| default  | Updates the configuration of the repository, not related to the other scopes | `nil` |
| `lint`   | Add, update or remove linters                                                | `nil` |
| `fmt`    | Add, update or remove formatters                                             | `nil` |
| `build`  | Add, update or change build pipelines and generators                         | `nil` |
| `nix`    | Add, update or change nix shell                                              | `nil` |
| `env`    | Add, update or change environment                                            | `nil` |
| `ignore` | Add, update or change ignore configurations                                  | `nil` |

## chore

Any chores, uncategorized, or small mistakes (like typos)

| Scope   | Description | Bump  |
| ------- | ----------- | ----- |
| default | chores      | `nil` |

# Special Scopes

| Scope        | Description     | Bump  |
| ------------ | --------------- | ----- |
| `no-release` | Prevent release | `nil` |
