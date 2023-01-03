{ buildPythonApplication
, pkgs
, ...
}:
let
  compositionPackage = buildPythonApplication {
    src = ./.;
  };
  pythonVersion = "3.10";
  libDir = "${compositionPackage}/lib/python${pythonVersion}/site-packages";
  name = "say-hello-python";
in
pkgs.stdenv.mkDerivation {
  inherit name;
  buildInputs = with pkgs; [ python3Minimal ];
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
    python310Full
    python310Packages.pytest
  ];
  postFixup = ''
    makeWrapper \
      ${pkgs.python39}/bin/python \
      $out/bin/${name} \
      --add-flags "$out/app.py"
  '';
  src = ./.;
  unpackPhase = ''
    echo "***"
    ls -al ${compositionPackage}/lib
    cp -r ${libDir}/*.py .
  '';
}

