# Nix Presentation

## Exhibited programming language integration

| Language | Build Tool | Runtime | 
| :--- | :--- | :--- | 
| Bash | (none) | Bash | 
| Java | SBT | JRE | 
| Scala |  SBT | JRE | 
| JavaScript | NPM | Node.js | 
| PureScript | Spago | Node.js | 

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

## Direnv integration

Instruction [here](https://github.com/nix-community/nix-direnv).
