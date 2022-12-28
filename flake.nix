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
        nodeLib = (import ./node_lib/default.nix
          { inherit pkgs; nodejs = pkgs.nodejs; }
        ).package;
        runtimeConf = pkgs.callPackage ./runtime_conf/default.nix
          { };
        hello = pkgs.callPackage ./hello/default.nix
          { inherit bashLib buildConf nodeLib pkgs runtimeConf; };
      in
        /* 
          We produce one default app output per system,
          which is built from the expression of the app/default.nix,
          but potentially flake can provide many of them.
          The 'apps' attribute means that its entries contain executables 
          that `nix run` command can run. The 'default' attribute means
          that that if we do not provide any application name for that 
          command, the application assigned to it will be executed.
          On top of that, we expose the hello application and libraries 
          it depends on as package outputs so we can easily build them
          individually if we want.
          To examine all the outputs produced by this flake, we can run
          `nix flake show` from the directory that this flake resides.
        */
      {
        apps.default = flake-utils.lib.mkApp {
          drv = hello;
          name = "hello.sh";
        };
        /*
          DevShell allows to spawn a Bash shell with a customized setup.
          Here, we set it up with all inputs required by the 'hello' 
          application and its libraries. On top of that, a Git package.
          The shell is run with `nix develop` command. It is also 
          possible to make direnv load it automatically.  
        */
        devShell = pkgs.mkShell {
          inputsFrom = [ bashLib hello nodeLib ];
          nativeBuildInputs = [ pkgs.git ];
        };
        packages = {
          inherit bashLib nodeLib;
          default = hello;
        };
      }
    );
}
