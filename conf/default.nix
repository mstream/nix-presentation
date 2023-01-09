{ callPackage
, ...
}:
{
  build = import
    ./build;
  recurseForDerivations = true;
  runtimeLocal = callPackage
    ./runtime_local
    { };
  runtimeRemote = callPackage
    ./runtime_remote
    { };
}
