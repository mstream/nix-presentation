{ buildPythonApplication
, pkgs
, ...
}:
let
  name = "say-hello-python";
  pythonMajorVer = "3";
  pythonMinorVer = "9";
  pythonPackage = pkgs."python${pythonMajorVer}${pythonMinorVer}";
  pythonApp = buildPythonApplication {
    python = "python${pythonMajorVer}${pythonMinorVer}";
    src = ./.;
  };
  pythonAppPackagesDir = "${pythonApp}/lib/python${pythonMajorVer}.${pythonMinorVer}/site-packages";
in
pkgs.stdenv.mkDerivation {
  inherit name;
  buildInputs = [ pythonApp ];
  checkPhase = ''
    pytest ${pythonAppPackagesDir}
  '';
  doCheck = true;
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
      --add-flags "${pythonAppPackagesDir}/app.py"
  '';
  src = ./.;
}
