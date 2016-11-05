
module Wrappable (
      Wrappable
    , WrappedValue(..)
    , wrap
    ) where

data WrappedValue =
      WrappedInt Int
    | WrappedFloat Float
    | WrappedChar Char
    | WrappedArray [WrappedValue]

class Wrappable a where
    wrap :: a -> WrappedValue

instance Wrappable Int where
    wrap = WrappedInt

instance Wrappable Float where
    wrap = WrappedFloat

instance Wrappable Char where
    wrap = WrappedChar

instance Wrappable a => Wrappable [a] where
    wrap = WrappedArray . map wrap
