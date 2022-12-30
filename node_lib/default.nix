{ pkgs
, system
, ...
}:

let compositionPackage = (import ./composition.nix
  { inherit pkgs system; }).package;
in
pkgs.stdenv.mkDerivation {
  /* 
    Produce application and test bundle.
  */
  buildPhase = ''
    esbuild src/index.js --bundle --outfile=app.js --platform=node
    esbuild test/index.js --bundle --outfile=test.js --platform=node
  '';
  /* 
    Run unit tests.
  */
  checkPhase = ''
    node test.js
  '';
  /* 
    Make the check phase execute.
  */
  doCheck = true;
  installPhase = ''
    mkdir -p $out/bin
    cp app.js $out/
    cp $src/bin/cli.js $out/bin/
  '';
  name = "node-lib";
  nativeBuildInputs = [
    pkgs.nodejs
    pkgs.esbuild
  ];
  src = ./.;
  unpackPhase = ''
    cp -r ${compositionPackage}/lib/node_modules/node-lib/node_modules .
    cp -r ${compositionPackage}/lib/node_modules/node-lib/bin .
    cp -r ${compositionPackage}/lib/node_modules/node-lib/src .
    cp -r ${compositionPackage}/lib/node_modules/node-lib/test .
  '';
}
