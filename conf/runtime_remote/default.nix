{ fetchgit
, stdenv
, ...
}:
let
  name = "conf-runtime-remote";
in
stdenv.mkDerivation {
  inherit name;
  installPhase = ''
    mkdir -p $out/bin
    cp $src/files/loadConf.sh $out/bin/loadConf.sh
  '';
  src = fetchgit {
    url = "https://github.com/mstream/nix-presentation";
    rev = "e9850e98b370692a980e1e3378df201b71b0b53e";
    sha256 = "sha256-iNI+CvLT9f8KedUcfFLUFQrYWjagaADqlaXutUwzomI=";
  };
} 
