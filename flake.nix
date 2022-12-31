{
  description = "An example Nix flake";
  /*
    A set of all dependencies of the flake.
  */
  inputs = {
    easy-purescript-nix = {
      flake = false;
      url = "github:justinwoo/easy-purescript-nix";
    };
    /*
      Flake-utils is a collection of functions which simplify writing
      Nix flakes.
    */
    flake-utils.url = "github:numtide/flake-utils";
    /*
      Nixpkgs is a community-maintained collection of helper functions 
      and expression for derivations building packages of popular software.
    */
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    sbt = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:zaninime/sbt-derivation";
    };
    spago2nix = {
      flake = false;
      url = "github:justinwoo/spago2nix";
    };
  };
  /*
    A function which accepts inputs and produces one or many outputs.
  */
  outputs =
    { easy-purescript-nix
    , flake-utils
    , nixpkgs
    , sbt
    , spago2nix
    , ...
    }:
    let
      supportedSystems = [
        "aarch64-darwin"
        "x86_64-darwin"
        "x86_64-linux"
      ];
    in
    flake-utils.lib.eachSystem supportedSystems (system:
    let
      mkSbtDerivation = sbt.mkSbtDerivation.${system};
      pkgs = import nixpkgs
        { inherit system; };
      easy-ps = import easy-purescript-nix
        { inherit pkgs; };
      bashLib = pkgs.callPackage ./bash_lib/default.nix
        { };
      buildConf = import ./build_conf/default.nix;
      javaLib = pkgs.callPackage ./java_lib/default.nix
        { inherit mkSbtDerivation; };
      localRuntimeConf = pkgs.callPackage ./local_runtime_conf/default.nix
        { };
      nodeLib = (import ./node_lib/default.nix
        { inherit pkgs system; }
      );
      scalaLib = pkgs.callPackage ./scala_lib/default.nix
        { inherit mkSbtDerivation; };
      spago-pkgs = import ./purescript_lib/spago-packages.nix
        { inherit pkgs; };
      purescriptLib = pkgs.callPackage ./purescript_lib/default.nix
        {
          inherit spago-pkgs;
          inherit (easy-ps) purs spago;
        };
      remoteRuntimeConf = pkgs.callPackage ./remote_runtime_conf/default.nix
        { };
      hello = pkgs.callPackage ./hello/default.nix
        {
          inherit
            bashLib
            buildConf
            javaLib
            localRuntimeConf
            nodeLib
            pkgs
            purescriptLib
            remoteRuntimeConf
            scalaLib;
        };
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
      apps = {
        bash = flake-utils.lib.mkApp {
          drv = bashLib;
          name = "sayHello.sh";
        };
        node = flake-utils.lib.mkApp {
          drv = nodeLib;
          name = "cli.js";
        };
        purescript = flake-utils.lib.mkApp {
          drv = purescriptLib;
          name = "cli.mjs";
        };
        default = flake-utils.lib.mkApp {
          drv = hello;
          name = "hello.sh";
        };
      };
      /*
        DevShell allows to spawn a Bash shell with a customized setup.
        Here, we set it up with all inputs required by the 'hello' 
        application and its libraries. On top of that, a Git package.
        The shell is run with `nix develop` command. It is also 
        possible to make direnv load it automatically.  
      */
      devShell = pkgs.mkShell {
        inputsFrom = [ bashLib hello nodeLib purescriptLib scalaLib ];
        nativeBuildInputs = with pkgs; [
          git
          nix-prefetch-git
          nodejs
          nodePackages.node2nix
          (import spago2nix { inherit pkgs; })
        ];
      };
      packages = {
        inherit bashLib nodeLib purescriptLib scalaLib;
        default = hello;
      };
    }
    );
}
