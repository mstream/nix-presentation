{ esbuild
, nix-gitignore
, nodejs
, purs
, spago
, spago-pkgs
, stdenv
, ...
}:

stdenv.mkDerivation {
  buildInputs = [
    nodejs
    spago-pkgs.installSpagoStyle
    spago-pkgs.buildSpagoStyle
  ];
  /* 
    Produce application and test bundle.
  */
  buildPhase = ''
    build-spago-style "./**/*.purs"
    esbuild output/Main/index.js --bundle --outfile=app.js --platform=node
    esbuild output/Test.Main/index.js --bundle --outfile=test.js --platform=node
  '';
  /* 
    Run unit tests.
  */
  checkPhase = ''
    ./bin/test.mjs
  '';
  /* 
    Make the check phase execute.
  */
  doCheck = true;
  installPhase = ''
    mkdir -p $out/bin
    cp app.js $out/
    cp $src/bin/cli.mjs $out/bin/
  '';
  name = "purescript-lib";
  nativeBuildInputs = [
    purs
    spago
    esbuild
  ];
  src = ./.;
  unpackPhase = ''
    cp $src/spago.dhall .
    cp $src/packages.dhall .
    cp -r $src/bin .
    cp -r $src/src .
    cp -r $src/test .
    install-spago-style
  '';
}

