# Nix Presentation

## Executing the demo application

### Without cloning the repository 

```bash
nix run github:mstream/nix-presentation
```

### After cloning

```bash
nix run
```

### After cloning, with a low-level command

```bash
$(nix build --no-link --print-out-paths)/bin/hello.sh
```

## Direnv integration

Instruction [here](https://github.com/nix-community/nix-direnv).
