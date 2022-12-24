{ buildConf, lib, pkgs, runtimeConf, ... }:

pkgs.stdenv.mkDerivation {
  installPhase = ''
    mkdir -p $out/bin
    cp $src/hello.sh $out/bin/hello.sh
  '';
  name = "app";
  nativeBuildInputs = [ pkgs.makeWrapper ];
  postFixup = ''
    wrapProgram $out/bin/hello.sh \
      --set NAME_1 ${buildConf.name1} \
      --set NAME_2 ${buildConf.name2} \
      --set SAY_HELLO_PATH ${lib}/bin/sayHello.sh \
      --set LOAD_CONF_PATH ${runtimeConf}/bin/loadConf.sh 
  '';
  src = ./src;
}


