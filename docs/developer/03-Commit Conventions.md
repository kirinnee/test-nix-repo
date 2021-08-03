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

| Type                | Description                                               |
| ------------------- | --------------------------------------------------------- |
| [fix](#fix)         | Fixed a bug within the repository                         |
| [new](#new)         | Release a new package                                     |
| [update](#update)   | Update a package's version                                |
| [remove](#remove)   | Remove package from the repository                        |
| [docs](#docs)       | Add documentation                                         |
| [ci](#ci)           | Changed the CI pipeline                                   |
| [release](#release) | Initiate a release (machine initiated)                    |
| [config](#config)   | Update configuration of the repository                    |
| [chore](#chore)     | Any chores, uncategorized, or small mistakes (like typos) |

## fix

Fixed a bug within the repository

| **V.A.E**       | V.A.E values                                                       |
| --------------- | ------------------------------------------------------------------ |
| verb            | fix                                                                |
| application     | when this commit is applied, it will _fix_ `<title>`               |
| example         | fix: dropdown flickering                                           |
| example applied | when this commit is applied, it will _fix_ **dropdown flickering** |

| Scope    | Description                                | Bump    |
| -------- | ------------------------------------------ | ------- |
| default  | Generic fixes not under `drv` or `patch`   | `patch` |
| `drv`    | Fixes in nix derivations in the repository | `patch` |
| `config` | Fixes in configuration                     | `nil`   |

## new

Release a new package

| **V.A.E**       | V.A.E values                                                                            |
| --------------- | --------------------------------------------------------------------------------------- |
| verb            | add                                                                                     |
| application     | when this commit is applied, it will _add_ `<scope>, <title>`                           |
| example         | new(narwhal): a swiss army knife for docker                                             |
| example applied | when this commit is applied, it will _add_ `narwhal`, **a swiss army knife for docker** |

| Scope   | Description           | Bump    |
| ------- | --------------------- | ------- |
| default | Release a new package | `minor` |

## update

Update a package's version

| Scope   | Description                | Bump    |
| ------- | -------------------------- | ------- |
| default | Update a package's version | `major` |

## remove

Remove package from the repository

| Scope   | Description       | Bump    |
| ------- | ----------------- | ------- |
| default | Removed a package | `major` |

## docs

Add documentation

| Scope   | Description                                                        | Bump    |
| ------- | ------------------------------------------------------------------ | ------- |
| default | Adds a generic documentation not related to `dev`, `pkg` or `user` | `nil`   |
| `user`  | Adds a user-side documentation                                     | `nil`   |
| `dev`   | Adds a developer-side (contributing) documentation                 | `nil`   |
| `pkg`   | Updates a documentation on a package                               | `patch` |

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

Update configuration of the repository

| Scope    | Description                                                                  | Bump  |
| -------- | ---------------------------------------------------------------------------- | ----- |
| default  | Updates the configuration of the repository, not related to the other scopes | `nil` |
| `lint`   | Add, update or remove linters                                                | `nil` |
| `fmt`    | Add, updatge or remove formatters                                            | `nil` |
| `build`  | Add, update or change buyild pipelines and generators                        | `nil` |
| `nix`    | Add, update or change nix shell                                              | `nil` |
| `env`    | Add, update or change environment                                            | `nil` |
| `ignore` | Add, update or change ignore configurations                                  | `nil` |

## chore

Any chores, uncategorized, or small mistakes (like typos)

| Scope   | Description | Bump  |
| ------- | ----------- | ----- |
| default | chores      | `nil` |

# Special Scopes

| Scope        | Description                    | Bump  |
| ------------ | ------------------------------ | ----- |
| `no-release` | Prevent release from happening | `nil` |

