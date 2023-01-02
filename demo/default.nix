{ conf
, makeWrapper
, pkgs
, sayHello
, stdenv
, ...
}:
let
  name = "demo";
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
      --prefix PATH : ${pkgs.lib.makeBinPath (builtins.attrValues sayHello)} \
      --set NAME_1 ${conf.build.name1} \
      --set NAME_2 ${conf.build.name2} \
      --set LOCAL_LOAD_CONF_PATH ${conf.runtimeLocal}/bin/loadConf.sh \
      --set REMOTE_LOAD_CONF_PATH ${conf.runtimeRemote}/bin/loadConf.sh 
  '';
  src = ./src;
}

