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
    cp $src/downloadable_files/loadConf.sh $out/bin/loadConf.sh
  '';
  src = fetchgit {
    url = "https://github.com/mstream/nix-presentation";
    rev = "77cb41438c752f454924852f6d65abc892898328";
    sha256 = "sha256-KTHyxTgZCS104kYhhuSK1HPLtySF+B/SrOvLeDvig+g=";
  };
} 
