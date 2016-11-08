
module Lib (stringifyField) where

import Wrappable
import WrappableShow

stringifyField :: Wrappable a => a -> String
stringifyField = quoteIfNecessary . show . wrap

quoteIfNecessary :: String -> String
quoteIfNecessary xs
    |  ',' `elem` xs = quote xs
    | '\n' `elem` xs = quote xs
    |  '"' `elem` xs = quote xs
    | otherwise      = xs

quote :: String -> String
quote xs = concat ["\"", escapeQuotes xs, "\""]

escapeQuotes :: String -> String
escapeQuotes []       = []
escapeQuotes ('"':xs) = '"' : '"' : escapeQuotes xs
escapeQuotes (  x:xs) = x : escapeQuotes xs
