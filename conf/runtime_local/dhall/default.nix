{ dhall
, dhall-bash
, stdenv
, ...
}:
let
  name = "conf-runtime-local-dhall";
  varName = "NAME_7";
in
stdenv.mkDerivation {
  inherit name;
  buildInputs = [ dhall dhall-bash ];
  buildPhase = ''
    dhall --file $src/arnie.dhall \
      | dhall-to-bash --declare ${varName} > loadConf.sh
    echo 'export ${varName}'
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp loadConf.sh $out/bin/
  '';
  src = ./src;
} 
