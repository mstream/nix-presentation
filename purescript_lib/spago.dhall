{ name = "purescript-lib"
, dependencies = [ "console", "effect", "node-process", "prelude" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
