{ flake-utils
, ...
}:
with flake-utils.lib.system; [
  aarch64-darwin
  x86_64-darwin
  x86_64-linux
]
