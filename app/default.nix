{ buildConf, bashLib, nodeLib, pkgs, runtimeConf, ... }:

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
      --set BASH_SAY_HELLO_PATH ${bashLib}/bin/sayHello.sh \
      --set NODE_SAY_HELLO_PATH ${nodeLib.package}/lib/node_modules/node-lib/bin/cli.js \
      --set LOAD_CONF_PATH ${runtimeConf}/bin/loadConf.sh 
  '';
  src = ./src;
}


