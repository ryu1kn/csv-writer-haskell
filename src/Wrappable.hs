
module Wrappable (
      Wrappable
    , WrappedValue(..)
    , wrap
    ) where

data WrappedValue =
      WrappedBool Bool
    | WrappedChar Char
    | WrappedDouble Double
    | WrappedInt Int
    | WrappedFloat Float
    | WrappedArray [WrappedValue]

class Wrappable a where
    wrap :: a -> WrappedValue

instance Wrappable Bool where
    wrap = WrappedBool

instance Wrappable Char where
    wrap = WrappedChar

instance Wrappable Double where
    wrap = WrappedDouble

instance Wrappable Int where
    wrap = WrappedInt

instance Wrappable Float where
    wrap = WrappedFloat

instance Wrappable a => Wrappable [a] where
    wrap = WrappedArray . map wrap
