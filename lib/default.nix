{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  installPhase = ''
    mkdir -p $out/bin
    cp $src/index.js $out/index.js
    cp $src/sayHello.sh $out/bin/sayHello.sh
  '';
  name = "lib";
  buildInputs = [ pkgs.nodejs ];
  nativeBuildInputs = [ pkgs.makeWrapper ];
  postFixup = ''
    wrapProgram $out/bin/sayHello.sh \
      --set SCRIPT_PATH $out/index.js 
  '';
  src = ./src;
} 
