{ buildPythonApplication
, pkgs
, ...
}:
let
  pythonMajorVer = "3";
  pythonMinorVer = "9";
  pythonPackage = pkgs."python${pythonMajorVer}${pythonMinorVer}";
  compositionPackage = buildPythonApplication {
    python = "python${pythonMajorVer}${pythonMinorVer}";
    src = ./.;
  };
  libDir = "${compositionPackage}/lib/python${pythonMajorVer}.${pythonMinorVer}/site-packages";
  name = "say-hello-python";
in
pkgs.stdenv.mkDerivation {
  inherit name;
  buildInputs = [ pythonPackage ];
  checkPhase = ''
    pytest 
  '';
  /* 
    Make the check phase execute.
  */
  doCheck = true;
  installPhase = ''
    mkdir -p $out/bin
    cp app.py $out/
    cp hello.py $out/
  '';
  nativeBuildInputs = with pkgs; [
    makeWrapper
    pythonPackage
    pkgs."python${pythonMajorVer}${pythonMinorVer}Packages".pytest
  ];
  postFixup = ''
    makeWrapper \
      ${pythonPackage}/bin/python \
      $out/bin/${name} \
      --add-flags "$out/app.py"
  '';
  src = ./.;
  unpackPhase = ''
    cp -r ${libDir}/*.py .
  '';
}

