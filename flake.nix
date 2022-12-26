{
  description = "An example Nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { flake-utils, nixpkgs, self, ... }:
    let
      supportedSystems = [
        "aarch64-darwin"
        "x86_64-darwin"
        "x86_64-linux"
      ];
    in
    flake-utils.lib.eachSystem supportedSystems (system:
      let
        pkgs = import nixpkgs { inherit system; };
        bashLib = pkgs.callPackage ./bash_lib/default.nix { };
        buildConf = import ./build_conf/default.nix;
        nodeLib = import ./node_lib/default.nix { inherit pkgs; nodejs = pkgs.nodejs; };
        runtimeConf = pkgs.callPackage ./runtime_conf/default.nix { };
        defaultPackage = pkgs.callPackage
          ./app/default.nix
          { inherit bashLib buildConf nodeLib pkgs runtimeConf; };
      in
      { inherit defaultPackage; }
    );
}
