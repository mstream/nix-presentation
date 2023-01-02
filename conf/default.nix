{ pkgs
, ...
}:
{
  build = import
    ./build;
  runtimeLocal = pkgs.callPackage
    ./runtime_local
    { };
  runtimeRemote = pkgs.callPackage
    ./runtime_remote
    { };
}
