{ buildConf
, bashLib
, javaSbtLib
, javascriptNpmLib
, lib
, localRuntimeConf
, makeWrapper
, purescriptSpagoLib
, remoteRuntimeConf
, scalaSbtLib
, stdenv
, ...
}:
let
  libs = [
    bashLib
    javaSbtLib
    javascriptNpmLib
    purescriptSpagoLib
    scalaSbtLib
  ];
  name = "hello";
in
stdenv.mkDerivation {
  inherit name;
  installPhase = ''
    mkdir -p $out/bin
    cp $src/hello.sh $out/bin/${name}
  '';
  nativeBuildInputs = [ makeWrapper ];
  postFixup = ''
    wrapProgram $out/bin/${name} \
      --prefix PATH : ${lib.makeBinPath libs} \
      --set NAME_1 ${buildConf.name1} \
      --set NAME_2 ${buildConf.name2} \
      --set LOCAL_LOAD_CONF_PATH ${localRuntimeConf}/bin/loadConf.sh \
      --set REMOTE_LOAD_CONF_PATH ${remoteRuntimeConf}/bin/loadConf.sh 
  '';
  src = ./src;
}

