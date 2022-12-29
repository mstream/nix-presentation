{ esbuild
, nix-gitignore
, purs
, spago
, spago-pkgs
, stdenv
, ...
}:

stdenv.mkDerivation {
  buildInputs = [
    spago-pkgs.installSpagoStyle
    spago-pkgs.buildSpagoStyle
  ];
  buildPhase = ''
    build-spago-style "./src/**/*.purs"
    esbuild output/Main/index.js --bundle --outfile=index.js --platform=node
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp index.js $out/
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
    cp -r $src/src .
    install-spago-style
  '';
}

