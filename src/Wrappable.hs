
module Wrappable (
      Wrappable
    , WrappedValue(..)
    , wrap
    ) where

data WrappedValue =
      WrappedInt Int
    | WrappedChar Char
    | WrappedArray [WrappedValue]

class Wrappable a where
    wrap :: a -> WrappedValue

instance Wrappable Int where
    wrap = WrappedInt

instance Wrappable Char where
    wrap = WrappedChar

instance Wrappable a => Wrappable [a] where
    wrap = WrappedArray . map wrap

-- Can I pull this out from this module?
instance Show WrappedValue where
    show (WrappedInt x) = show x
    show (WrappedChar x) = [x]
    show (WrappedArray []) = []
    show (WrappedArray xs@(WrappedChar x : _)) = map (\(WrappedChar x) -> x) xs
    show (WrappedArray xs) = concatMap show xs
