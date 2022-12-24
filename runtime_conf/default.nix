{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  installPhase = ''
    mkdir -p $out/bin
    cp $src/loadConf.sh $out/bin/loadConf.sh
  '';
  name = "runtime-conf";
  src = pkgs.fetchgit {
    url = "https://github.com/mstream/nix-presentation";
    rev = "606b7247dc8a5e0855258fea79e5316b641d1d73";
    sha256 = "sha256-NaEhsojd8jB9DDvKZ/MgxVgmFhTnsPwCZnGToe+ms3k=";
  };
} 
