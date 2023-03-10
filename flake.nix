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
    nixpkgs.url = "github:nixos/nixpkgs/22.11";
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
    , mach-nix
    , nixpkgs
    , sbt
    , spago2nix
    , ...
    }:
    flake-utils.lib.eachSystem
      (import ./supportedSystems.nix { inherit flake-utils; })
      (system:
      let
        pkgs = import
          nixpkgs
          { inherit system; };
        conf = pkgs.callPackage
          ./conf
          { };
        sayHello = import
          ./say_hello
          { inherit easy-purescript-nix mach-nix nixpkgs sbt system; };
        confDrvs = flake-utils.lib.flattenTree { inherit conf; recurseForDerivations = true; };
        sayHelloDrvs = flake-utils.lib.flattenTree { inherit sayHello; recurseForDerivations = true; };
        demo = pkgs.callPackage
          ./demo
          {
            inherit conf;
            sayHelloDrvs = builtins.attrValues sayHelloDrvs;
          };
        demoApp = flake-utils.lib.mkApp { drv = demo; };
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
          default = demoApp;
          demo = demoApp;
        }
        // (builtins.mapAttrs
          (name: value: flake-utils.lib.mkApp { drv = value; })
          sayHelloDrvs
        );
        defaultApp = demoApp;
        defaultPackage = demo;
        /*
          DevShell allows to spawn a Bash shell with a customized setup.
          Here, we set it up with all inputs required by the 'hello' 
          application and its libraries. On top of that, a Git package.
          The shell is run with `nix develop` command. It is also 
          possible to make direnv load it automatically.  
        */
        devShell = pkgs.callPackage ./devShell {
          localDrvs = builtins.attrValues confDrvs ++ builtins.attrValues sayHelloDrvs;
          spago2nix = import spago2nix { inherit pkgs; };
        };
        formatter = pkgs.nixpkgs-fmt;
        packages = {
          inherit demo;
          default = demo;
        } // confDrvs // sayHelloDrvs;
      });
}
