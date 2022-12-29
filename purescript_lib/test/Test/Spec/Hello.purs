module Test.Spec.Hello (spec) where

import Prelude

import Hello as Hello
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)

spec ∷ Spec Unit
spec = describe "Hello" do
  describe "format" do
    it "produces a valid greeting" do
      let
        actual = Hello.format "John"
        expected = "(PureScript) Hello John!"

      actual `shouldEqual` expected

