# Nix Presentation

## Exhibited programming language integration

| Language | Build Tool | Runtime | 
| :--- | :--- | :--- | 
| Bash | (none) | Bash | 
| Java | SBT | JRE | 
| JavaScript | NPM | Node.js | 
| PureScript | (none) | Node.js | 
| PureScript | Spago | Node.js | 
| Scala |  SBT | JRE | 

## Executing the demo application

### Remotely

```bash
nix run github:mstream/nix-presentation
```

or

```bash
$(nix build --no-link --print-out-paths github:mstream/nix-presentation)/bin/hello.sh
```

### Locally

```bash
nix run
```

or

```bash
$(nix build --no-link --print-out-paths)/bin/hello.sh
```
## Browsing dependencies graph

### Remotely

```bash
nix run github:utdemir/nix-tree -- --derivation github:mstream/nix-presentation 
```
### Locally

```bash
nix run github:utdemir/nix-tree -- --derivation . 
```

## Direnv integration

Instruction [here](https://github.com/nix-community/nix-direnv).
