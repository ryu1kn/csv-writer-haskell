
module WrappableShow where

import Wrappable

instance Show WrappedValue where
    show (WrappedBool x) = show x
    show (WrappedChar x) = [x]
    show (WrappedDouble x) = show x
    show (WrappedFloat x) = show x
    show (WrappedInt x) = show x
    show (WrappedArray []) = []
    show (WrappedArray xs@(WrappedChar x : _)) = map (\(WrappedChar x) -> x) xs
    show (WrappedArray xs) = concatMap show xs
