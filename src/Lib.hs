module Lib
    ( someFunc, stringifyField
    ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

stringifyField :: (Show a) => a -> String
stringifyField x = removeRedundantQuotes $ show x

removeRedundantQuotes :: String -> String
removeRedundantQuotes ('\"':xs)
    | last xs == '\"' = init xs
removeRedundantQuotes xs = xs
