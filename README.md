# Nix Presentation

## Executing the demo application

### Building the default package and running its executable directly from a Nix store

```bash
$(nix build --no-link --print-out-paths)/bin/hello.sh
```

### By leveraging the fact that it is declared as a flake default app

```bash
nix run
```
