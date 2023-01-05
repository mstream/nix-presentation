# Nix Presentation

## Exhibited programming language integration

| Language                                                                | Build Tool                                                                                                               | Runtime                                                                                  | Source Code                                    |
| :---------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------- | ---------------------------------------------- |
| [Bash](<https://en.wikipedia.org/wiki/Bash_(Unix_shell)>)               | Nix                                                                                                                    | [Bash](<https://en.wikipedia.org/wiki/Bash_(Unix_shell)>)                                | [open](say_hello/bash/default.nix)             |
| [Java](<https://en.wikipedia.org/wiki/Java_(programming_language)>)     | Nix [IFD](https://nixos.wiki/wiki/Import_From_Derivation)/[SBT](<https://en.wikipedia.org/wiki/Sbt_(software)>)                                                          | [JRE](<https://en.wikipedia.org/wiki/Java_(software_platform)#Java_Runtime_Environment>) | [open](say_hello/java_sbt/default.nix)         |
| [JavaScript](https://en.wikipedia.org/wiki/JavaScript)                  | [NPM](<https://en.wikipedia.org/wiki/Npm_(software)>)                                                                    | [Node.js](https://en.wikipedia.org/wiki/Node.js)                                         | [open](say_hello/javascript_npm/default.nix)   |
| [PureScript](https://en.wikipedia.org/wiki/PureScript)                  | [Spago](https://github.com/purescript/spago)                                                                             | [Node.js](https://en.wikipedia.org/wiki/Node.js)                                         | [open](say_hello/purescript_spago/default.nix) |
| [Python](<https://en.wikipedia.org/wiki/Python_(programming_language)>) | Nix [IFD](https://nixos.wiki/wiki/Import_From_Derivation)/[Pip](<https://en.wikipedia.org/wiki/Pip_(package_manager)>) | [CPython](https://en.wikipedia.org/wiki/CPython)                                         | [open](say_hello/python/default.nix)           |
| [Scala](<https://en.wikipedia.org/wiki/Scala_(programming_language)>)   | Nix [IFD](https://nixos.wiki/wiki/Import_From_Derivation)/[SBT](<https://en.wikipedia.org/wiki/Sbt_(software)>)        | [JRE](<https://en.wikipedia.org/wiki/Java_(software_platform)#Java_Runtime_Environment>) | [open](say_hello/scala_sbt/default.nix)        |

## Executing Nix commands

Each of following commands can be executed against a locally cloned flake
by replacing its `github:mstream/nix-presentation` part with `.`. 

### Running the demo application

```bash
nix run github:mstream/nix-presentation
```

or

```bash
$(nix build --no-link --print-out-paths github:mstream/nix-presentation)/bin/hello.sh
```

### Displaying flake outputs

```bash
nix flake show github:mstream/nix-presentation
```

### Browsing dependencies graph

```bash
nix run github:utdemir/nix-tree -- --derivation github:mstream/nix-presentation
```

## Direnv integration

Instruction [here](https://github.com/nix-community/nix-direnv).
