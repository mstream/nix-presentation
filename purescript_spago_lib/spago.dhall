{ name = "purescript-lib"
, dependencies =
  [ "aff"
  , "arrays"
  , "console"
  , "effect"
  , "maybe"
  , "node-process"
  , "prelude"
  , "spec"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
