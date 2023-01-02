{ stdenv
, ...
}:
let
  name = "say-hello-bash";
in
stdenv.mkDerivation {
  inherit name;
  /* 
    Run unit tests.
  */
  checkPhase = ''
    ./test/sayHello.sh
  '';
  /* 
    Make the check phase execute.
  */
  doCheck = true;
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
    cp src/sayHello.sh $out/bin/${name}
  '';
  /*
    Source files directory. Files inside it are treated as inputs to 
    the derivation and influence its hash. This directory can be referred
    in phase hooks via 'src' environmental variable.
  */
  src = ./.;
  unpackPhase = ''
    cp -r $src/src .
    cp -r $src/test .
  '';
} 
