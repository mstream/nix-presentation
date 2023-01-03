{ pkgs
, system
, ...
}:

let
  /*
    Because name is used to for files lookup, it has to match
    the name in package-lock.json.
  */
  name = "say-hello-javascript-npm";
  compositionPackage = (import
    ./composition.nix
    { inherit pkgs system; }
  ).package;
  libDir = "${compositionPackage}/lib/node_modules/${name}";
in
pkgs.stdenv.mkDerivation {
  inherit name;
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
  nativeBuildInputs = with pkgs; [
    esbuild
    makeWrapper
    nodejs
  ];
  postFixup = ''
    makeWrapper \
      ${pkgs.nodejs}/bin/node \
      $out/bin/${name} \
      --add-flags "$out/app.js"
  '';
  src = ./.;
  unpackPhase = ''
    cp -r ${libDir}/node_modules .
    cp -r ${libDir}/src .
    cp -r ${libDir}/test .
  '';
}
