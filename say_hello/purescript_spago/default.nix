{ esbuild
, nix-gitignore
, nodejs
, pkgs
, purs
, spago
, stdenv
, ...
}:
let
  name = "say-hello-purescript-spago";
  platform = "node";
  spago-pkgs = import
    ./spago-packages.nix
    { inherit pkgs; };
in
stdenv.mkDerivation {
  inherit name;
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
    esbuild \
      output/Main/index.js \
      --bundle \
      --outfile=app.js \
      --platform=${platform}
    esbuild \
      output/Test.Main/index.js \
      --bundle \
      --outfile=test.js \
      --platform=${platform}
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
    cp $src/bin/cli.mjs $out/bin/${name}
  '';
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

