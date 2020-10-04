{ name = "unsafe-reference"
, dependencies =
  [ "console", "effect", "exceptions", "prelude", "psci-support" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
