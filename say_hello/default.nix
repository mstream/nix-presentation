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
  recurseForDerivations = true;
  scalaSbt = pkgs.callPackage
    ./scala_sbt
    { inherit mkSbtDerivation; };
}
