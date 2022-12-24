let
  pkgs = import <nixpkgs> { };
  buildConf = import ./build_conf/default.nix;
  runtimeConf = import ./runtime_conf/default.nix { inherit pkgs; };
  lib = import ./lib/default.nix { inherit pkgs; };
in
import ./app/default.nix {
  inherit buildConf lib pkgs runtimeConf;
}
