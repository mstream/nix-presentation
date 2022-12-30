{ stdenv, ... }:

stdenv.mkDerivation {
  installPhase = ''
    mkdir -p $out/bin
    cp $src/loadConf.sh $out/bin/loadConf.sh
  '';
  name = "local-runtime-conf";
  src = ./.;
} 
