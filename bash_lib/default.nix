{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  installPhase = ''
    mkdir -p $out/bin
    cp $src/sayHello.sh $out/bin/sayHello.sh
  '';
  name = "bash-lib";
  src = ./src;
} 
