let
  pkgs = import <nixpkgs> { };
  bashLib = import ./bash_lib/default.nix { inherit pkgs; };
  buildConf = import ./build_conf/default.nix;
  nodeLib = import ./node_lib/default.nix { inherit pkgs; };
  runtimeConf = import ./runtime_conf/default.nix { inherit pkgs; };
in
import ./app/default.nix {
  inherit bashLib buildConf nodeLib pkgs runtimeConf;
}
