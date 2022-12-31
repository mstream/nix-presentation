{ jdk
, jre_minimal
, makeWrapper
, mkSbtDerivation
, ...
}:

mkSbtDerivation {
  buildInputs = [ jre_minimal ];
  buildPhase = ''
    sbt assembly
  '';
  depsSha256 = "sha256-qFBCK/u1HEAbkBfluSId/A5Ui6lNePvZ9T95LKwXziY=";
  installPhase = ''
    mkdir -p $out
    cp target/scala-2.13/scala-lib-assembly-1.0.jar $out/scala-lib.jar
  '';
  nativeBuildInputs = [ jdk makeWrapper ];
  pname = "scala-lib";
  postFixup = ''
    makeWrapper ${jre_minimal}/bin/java $out/bin/scalaSayHello \
      --add-flags "-jar $out/scala-lib.jar"
  '';
  src = ./.;
  version = "1.0.0";
}

