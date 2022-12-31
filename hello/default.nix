{ buildConf
, bashLib
, localRuntimeConf
, makeWrapper
, nodeLib
, purescriptLib
, remoteRuntimeConf
, scalaLib
, stdenv
, ...
}:

stdenv.mkDerivation {
  installPhase = ''
    mkdir -p $out/bin
    cp $src/hello.sh $out/bin/hello.sh
  '';
  name = "hello";
  nativeBuildInputs = [ makeWrapper ];
  postFixup = ''
    wrapProgram $out/bin/hello.sh \
      --set NAME_1 ${buildConf.name1} \
      --set NAME_2 ${buildConf.name2} \
      --set BASH_SAY_HELLO_PATH ${bashLib}/bin/sayHello.sh \
      --set NODE_SAY_HELLO_PATH ${nodeLib}/bin/sayHello.sh \
      --set PURESCRIPT_SAY_HELLO_PATH ${purescriptLib}/bin/cli.mjs \
      --set SCALA_SAY_HELLO_PATH ${scalaLib}/bin/sayHello.sh \
      --set LOCAL_LOAD_CONF_PATH ${localRuntimeConf}/bin/loadConf.sh \
      --set REMOTE_LOAD_CONF_PATH ${remoteRuntimeConf}/bin/loadConf.sh 
  '';
  src = ./src;
}


