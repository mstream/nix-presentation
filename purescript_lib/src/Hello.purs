module Hello (format) where

import Prelude

format :: String -> String
format personName = "(PureScript) Hello "
  <> personName
  <> "!"

