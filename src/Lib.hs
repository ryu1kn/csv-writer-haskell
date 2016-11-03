
module Lib (stringifyField) where

import Wrappable

stringifyField :: Wrappable a => a -> String
stringifyField = show . wrap
