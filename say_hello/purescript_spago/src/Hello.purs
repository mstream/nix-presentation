module Hello (format) where

import Prelude

import Ansi.Codes (Color(..), EscapeCode(..), GraphicsParam(..), escapeCodeToString)
import Ansi.Output (foreground)

format :: String -> String
format personName =
  inWhite "(PureScript/Spago) "
    <> inBlue "Hello "
    <> inRed personName
    <> inBlue "!"

inBlue :: String -> String
inBlue = withColor Blue

inRed :: String -> String
inRed = withColor Red

inWhite :: String -> String
inWhite = withColor White

withColor :: Color -> String -> String
withColor color s = escapeCodeToString (Graphics params)
  <> s
  <> escapeCodeToString (Graphics $ pure Reset)
  where
  params = foreground color

