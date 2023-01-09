{ callPackage
, ...
}:
{
  bash = callPackage
    ./bash
    { };
  dhall = callPackage
    ./dhall
    { };
  recurseForDerivations = true;
}
