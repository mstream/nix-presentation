{ name = "purescript-lib"
, dependencies =
  [ "aff"
  , "ansi"
  , "arrays"
  , "console"
  , "effect"
  , "maybe"
  , "node-process"
  , "prelude"
  , "spec"
  , "strings"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
