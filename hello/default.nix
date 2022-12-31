{ buildConf
, bashLib
, lib
, localRuntimeConf
, makeWrapper
, nodeLib
, purescriptLib
, remoteRuntimeConf
, scalaLib
, stdenv
, ...
}:
let libs = [
  bashLib
  nodeLib
  purescriptLib
  scalaLib
];
in
stdenv.mkDerivation {
  installPhase = ''
    mkdir -p $out/bin
    cp $src/hello.sh $out/bin/hello.sh
  '';
  name = "hello";
  nativeBuildInputs = [ makeWrapper ];
  postFixup = ''
    wrapProgram $out/bin/hello.sh \
      --prefix PATH : ${lib.makeBinPath libs} \
      --set NAME_1 ${buildConf.name1} \
      --set NAME_2 ${buildConf.name2} \
      --set LOCAL_LOAD_CONF_PATH ${localRuntimeConf}/bin/loadConf.sh \
      --set REMOTE_LOAD_CONF_PATH ${remoteRuntimeConf}/bin/loadConf.sh 
  '';
  src = ./src;
}


