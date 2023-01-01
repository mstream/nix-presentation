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
  buildInputs = with pkgs; [ nodejs ];
  buildPhase = ''
    esbuild \
      src/index.js \
      --bundle \
      --outfile=app.js \
      --platform=node
    esbuild \
      test/index.js \
      --bundle \
      --outfile=test.js \
      --platform=node
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
  '';
  name = "javascript-npm-lib";
  nativeBuildInputs = with pkgs; [
    esbuild
    makeWrapper
  ];
  postFixup = ''
    makeWrapper \
      ${pkgs.nodejs}/bin/node \
      $out/bin/javascriptNpmSayHello \
      --add-flags "$out/app.js"
  '';
  src = ./.;
  unpackPhase = ''
    cp -r ${compositionPackage}/lib/node_modules/node-lib/node_modules .
    cp -r ${compositionPackage}/lib/node_modules/node-lib/src .
    cp -r ${compositionPackage}/lib/node_modules/node-lib/test .
  '';
}
