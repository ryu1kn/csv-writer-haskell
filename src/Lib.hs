module Lib
    ( someFunc, stringifyField
    ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

stringifyField :: (Show a) => a -> String
stringifyField = show
