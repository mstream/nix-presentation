{ stdenv
, ...
}:
let
  name = "conf-runtime-local-bash";
in
stdenv.mkDerivation {
  inherit name;
  installPhase = ''
    mkdir -p $out/bin
    cp $src/loadConf.sh $out/bin/loadConf.sh
  '';
  src = ./.;
} 
