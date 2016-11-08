
module Lib (stringifyField) where

import Wrappable
import WrappableShow

stringifyField :: Wrappable a => a -> String
stringifyField = quoteIfNecessary . show . wrap

quoteIfNecessary :: String -> String
quoteIfNecessary xs
    | ',' `elem` xs  = quote xs
    | '\n' `elem` xs = quote xs
    | otherwise      = xs
    where
        quote xs = concat ["\"", xs, "\""]
