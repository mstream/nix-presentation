{ conf
, bash
, lib
, makeWrapper
, sayHelloPackages
, stdenv
, ...
}:
let
  name = "demo";
in
stdenv.mkDerivation {
  inherit name;
  /* 
    Run integration tests.
  */
  checkPhase = ''
    bash test/hello.sh
  '';
  /* 
    Make the check phase execute.
  */
  doCheck = true;
  installPhase = ''
    mkdir -p $out/bin
    cp src/hello.sh $out/bin/${name}
  '';
  nativeBuildInputs = [ makeWrapper ];
  buildInputs = sayHelloPackages;
  postFixup = ''
    wrapProgram $out/bin/${name} \
      --prefix PATH : ${lib.makeBinPath sayHelloPackages} \
      --set NAME_1 ${conf.build.name1} \
      --set NAME_2 ${conf.build.name2} \
      --set LOCAL_LOAD_CONF_PATH ${conf.runtimeLocal}/bin/loadConf.sh \
      --set REMOTE_LOAD_CONF_PATH ${conf.runtimeRemote}/bin/loadConf.sh 
  '';
  src = ./.;
  unpackPhase = ''
    cp -r $src/src .
    cp -r $src/test .
  '';
}

