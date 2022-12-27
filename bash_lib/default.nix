{ stdenv, ... }:

stdenv.mkDerivation {
  /*
    Create the binary directory and copy the source script.
    The 'fixup' phase will make sure that the shebang is substituted
    for a Bash interpreter coming from the Nix store.
    The out variable refers to a path in Nix store where a package would
    live if derivation was to be realised (via 'nix-store --realise' or
    'nix build').
  */
  installPhase = ''
    mkdir -p $out/bin
    cp $src/sayHello.sh $out/bin/sayHello.sh
  '';
  name = "bash-lib";
  /*
    Source files directory. Files inside it are treated as inputs to 
    the derivation and influence its hash. This directory can be referred
    in phase hooks via 'src' environmental variable.
  */
  src = ./src;
} 
