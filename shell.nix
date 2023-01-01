/*
  A compatibility layer to enable to allow shell scripts
  (like nixify.sh), which do not belong to any derivation, 
  to be run within the same environment that the ones that do.

  Currently I do not know how to make nix interpret these scripts
  using the devShell from flake.nix directly.
*/
let
  flakeCompat = fetchTarball
    {
      url = "https://github.com/edolstra/flake-compat/archive/009399224d5e398d03b22badca40a37ac85412a1.tar.gz";
      sha256 = "sha256:0xcr9fibnapa12ywzcnlf54wrmbqqb96fmmv8043zhsycws7bpqy";
    };
in
(import flakeCompat { src = ./.; }).shellNix

