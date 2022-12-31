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
  depsSha256 = "sha256-Npclvgitm5WSL9aid+xertNoKqSHGivU9hLfd8tSVZk=";
  installPhase = ''
    mkdir -p $out
    cp target/scala-2.13/java-lib-assembly-1.0.jar $out/java-lib.jar
  '';
  nativeBuildInputs = [ jdk makeWrapper ];
  pname = "java-lib";
  postFixup = ''
    makeWrapper ${jre_minimal}/bin/java $out/bin/javaSayHello \
      --add-flags "-jar $out/java-lib.jar"
  '';
  src = ./.;
  version = "1.0.0";
}

