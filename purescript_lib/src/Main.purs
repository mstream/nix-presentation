module Main where

import Prelude

import Data.Array ((!!))
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Class.Console as Console
import Node.Process as Process

main :: Effect Unit
main = do
  args <- Process.argv
  case args !! 2 of
    Just personName ->
      Console.info $ "(PureScript) Hello "
        <> personName
        <> "!"

    Nothing -> do
      Console.error
        "The \"person name\" path parameter should be provided."

      Process.exit 1

