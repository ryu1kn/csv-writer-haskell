
module Lib (stringifyField) where

import Wrappable
import WrappableShow

stringifyField :: Wrappable a => a -> String
stringifyField = show . wrap
