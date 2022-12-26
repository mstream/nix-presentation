{
  description = "An example Nix flake";

  /*
    A set of all dependencies of the flake.
  */
  inputs = {

    /*
      Nixpkgs is a community-maintained collection of helper functions 
      and expression for derivations building packages of popular software.
    */
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";

    /*
      Flake-utils is a collection of functions which simplify writing
      Nix flakes.
    */
    flake-utils.url = "github:numtide/flake-utils";
  };

  /*
    A function which accepts inputs and produces one or many outputs.
  */
  outputs = { flake-utils, nixpkgs, ... }:
    let
      supportedSystems = [
        "aarch64-darwin"
        "x86_64-darwin"
        "x86_64-linux"
      ];
    in
    flake-utils.lib.eachSystem supportedSystems (system:
      let
        pkgs = import nixpkgs
          { inherit system; };
        bashLib = pkgs.callPackage ./bash_lib/default.nix
          { };
        buildConf = import ./build_conf/default.nix;
        nodeLib = import ./node_lib/default.nix
          { inherit pkgs; nodejs = pkgs.nodejs; };
        runtimeConf = pkgs.callPackage ./runtime_conf/default.nix
          { };
        defaultPackage = pkgs.callPackage ./app/default.nix
          { inherit bashLib buildConf nodeLib pkgs runtimeConf; };
      in
        /* 
          We produce only one output per CPU architecture, 
          which is built from the expression of the app/default.nix,
          but potentially flake can provide many of them. 
        */
      { inherit defaultPackage; }
    );
}
