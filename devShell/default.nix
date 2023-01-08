{ git
, localDrvs
, mkShell
, nix
, nix-prefetch-git
, nodejs
, nodePackages
, shellcheck
, spago2nix
, statix
, ...
}:
mkShell {
  inputsFrom = localDrvs;
  nativeBuildInputs =
    [
      git
      nix
      nix-prefetch-git
      nodejs
      nodePackages.markdown-link-check
      nodePackages.node2nix
      nodePackages.prettier
      shellcheck
      statix
      spago2nix
    ];
}



