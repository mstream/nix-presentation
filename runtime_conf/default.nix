{ fetchgit, stdenv, ... }:

stdenv.mkDerivation {
  installPhase = ''
    mkdir -p $out/bin
    cp $src/files/loadConf.sh $out/bin/loadConf.sh
  '';
  name = "runtime-conf";
  src = fetchgit {
    url = "https://github.com/mstream/nix-presentation";
    rev = "";
    sha256 = "";
  };
} 
