# Nix Presentation

## Exhibited programming language integration

| Language | Build Tool | Runtime | Source Code
| :--- | :--- | :--- | --- |
| [Bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) | (none) | [Bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) | [open](say_hello/bash/default.nix) | 
| [Java](https://en.wikipedia.org/wiki/Java_(programming_language)) | [SBT](https://en.wikipedia.org/wiki/Sbt_(software)) | [JRE](https://en.wikipedia.org/wiki/Java_(software_platform)#Java_Runtime_Environment) | [open](say_hello/java_sbt/default.nix) |
| [JavaScript](https://en.wikipedia.org/wiki/JavaScript) | [NPM](https://en.wikipedia.org/wiki/Npm_(software)) | [Node.js](https://en.wikipedia.org/wiki/Node.js) | [open](say_hello/javascript_npm/default.nix) | 
| [PureScript](https://en.wikipedia.org/wiki/PureScript) | [Spago](https://github.com/purescript/spago) | [Node.js](https://en.wikipedia.org/wiki/Node.js) | [open](purescript_spago/default.nix) |
| [Scala](https://en.wikipedia.org/wiki/Scala_(programming_language)) | [SBT](https://en.wikipedia.org/wiki/Sbt_(software)) | [JRE](https://en.wikipedia.org/wiki/Java_(software_platform)#Java_Runtime_Environment) | [open](scala_sbt/default.nix) |

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
