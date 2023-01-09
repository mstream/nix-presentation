{ jdk
, jre_minimal
, makeWrapper
, mkSbtDerivation
, ...
}:
let
  /*
    Because pname, scalaVersion and version are used for artifact lookup, 
    they must equal to the name and version scalaVersion in build.sbt.
  */
  pname = "say-hello-scala-sbt";
  scalaVersion = "2.13";
  version = "1.0.0";
  srcJarName = "${pname}-assembly-${version}.jar";
  targetJarName = "${pname}.jar";
in
mkSbtDerivation {
  inherit pname version;
  buildInputs = [ jre_minimal ];
  buildPhase = ''
    sbt assembly
  '';
  depsSha256 = "sha256-67LCk0q101DfN3XIUxRwMsfe3R71YCMGJ9if9U4gtOY=";
  installPhase = ''
    mkdir -p $out
    cp \
      target/scala-${scalaVersion}/${srcJarName} \
      $out/${targetJarName}
  '';
  nativeBuildInputs = [ jdk makeWrapper ];
  postFixup = ''
    makeWrapper \
      ${jre_minimal}/bin/java \
      $out/bin/${pname} \
      --add-flags "-jar $out/${targetJarName}"
  '';
  src = ./.;
}

