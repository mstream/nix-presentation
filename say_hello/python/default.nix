{ buildPythonApplication
, pkgs
, ...
}:
let
  pythonMajorVer = "3";
  pythonMinorVer = "9";
  pythonPackage = pkgs."python${pythonMajorVer}${pythonMinorVer}";
  pythonApp = buildPythonApplication {
    python = "python${pythonMajorVer}${pythonMinorVer}";
    src = ./.;
  };
  name = "say-hello-python";
in
pkgs.stdenv.mkDerivation {
  inherit name;
  unpackPhase = "true";
  buildInputs = [ pythonApp ];
  checkPhase = ''
    pytest 
  '';
  doCheck = false;
  installPhase = ''
    mkdir -p $out/bin
  '';
  nativeBuildInputs = with pkgs; [
    makeWrapper
    pkgs."python${pythonMajorVer}${pythonMinorVer}Packages".pytest
  ];
  postFixup = ''
    makeWrapper \
      ${pythonPackage}/bin/python \
      $out/bin/${name} \
      --add-flags "${pythonApp}/lib/python${pythonMajorVer}.${pythonMinorVer}/site-packages/app.py"
  '';
  src = ./.;
}
