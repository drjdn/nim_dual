# Package

version       = "0.1.0"
author        = "Jason Nielsen"
description   = "Implementation of dual numbers"
license       = "MIT"


# Dependencies

requires "nim >= 1.0.4"

# Tests
task test, "Runs the test suite.":
  exec "nimble c -y -r dual/dual"
