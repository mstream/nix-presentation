{ easy-purescript-nix
, mach-nix
, nixpkgs
, sbt
, system
, ...
}:
let
  easy-ps = import
    easy-purescript-nix
    { inherit pkgs; };
  buildPythonApplication = mach-nix.lib.${system}.buildPythonApplication;
  mkSbtDerivation = sbt.mkSbtDerivation.${system};
  pkgs = import
    nixpkgs
    { inherit system; };
in
{
  bash = pkgs.callPackage
    ./bash
    { };
  javaSbt = pkgs.callPackage
    ./java_sbt
    { inherit mkSbtDerivation; };
  javascriptNpm = import
    ./javascript_npm
    { inherit pkgs system; };
  purescriptSpago = pkgs.callPackage
    ./purescript_spago
    {
      inherit pkgs;
      inherit (easy-ps) purs spago;
    };
  python = pkgs.callPackage
    ./python
    { inherit buildPythonApplication; };
  scalaSbt = pkgs.callPackage
    ./scala_sbt
    { inherit mkSbtDerivation; };
}
