# Commit Convention

Atomi Nix Registry uses [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) loosely as the specification
for our commits.

Commit message will be in the format:
```
type(scope): title

body
```

Here, will document the types and scope.


## Types

### Fix

Fixed a bug within the repository.

Natural language:
```
When this commit is applied, it will `fix` `<title>`
```

| Scope | Scope Translation | Description | Bump |
| :----:  | :----: | ---- |  ---- | :---: |
| `drv` | `Nix Derivation` | A bug within Nix derivations | `patch` |
