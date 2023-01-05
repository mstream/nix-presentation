module Test.Spec.Hello (spec) where

import Prelude

import Data.String (Pattern(..))
import Data.String as String
import Hello as Hello
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldSatisfy)

spec ∷ Spec Unit
spec = describe "Hello" do
  describe "format" do
    it "produces a valid greeting" do
      let
        actual = Hello.format "John"

      actual `shouldSatisfy`
        String.contains (Pattern "(PureScript/Spago)")

      actual `shouldSatisfy`
        String.contains (Pattern "Hello")

      actual `shouldSatisfy`
        String.contains (Pattern "John")
