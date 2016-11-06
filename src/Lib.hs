
module Lib (stringifyField) where

import Data.Typeable

stringifyField :: (Typeable a, Show a) => a -> String
stringifyField field
    | typeName == "[Char]" = (read . show) field
    | typeName == "Char"   = (read . show) [field]
    | otherwise            = show field
    where
        typeName = (show . typeOf) field
