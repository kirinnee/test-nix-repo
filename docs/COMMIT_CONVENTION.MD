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
When this commit is applied, it will **fix** `<title>`
```

| Scope    | Description                                                        |  Bump   |
| -------- | ------------------------------------------------------------------ | :-----: |
| `drv`    | A bug within Nix derivations                                       | `patch` |
| `config` | A bug within configurations, such as scripts, rc files or ci files |  `nil`  |
