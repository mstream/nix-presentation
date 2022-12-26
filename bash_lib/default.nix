{ makeWrapper, stdenv, ... }:

stdenv.mkDerivation {
  installPhase = ''
    mkdir -p $out/bin
    cp $src/sayHello.sh $out/bin/sayHello.sh
  '';
  name = "bash-lib";
  nativeBuildInputs = [ makeWrapper ];
  postFixup = ''
    wrapProgram $out/bin/sayHello.sh
  '';
  src = ./src;
} 
