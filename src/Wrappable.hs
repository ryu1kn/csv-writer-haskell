
module Wrappable (
      Wrappable
    , WrappedValue(..)
    , wrap
    ) where

data WrappedValue =
      WrappedInt Int
    | WrappedString String_
    | WrappedArray [WrappedValue]

class Wrappable a where
    wrap :: a -> WrappedValue

    wrapAll :: [a] -> WrappedValue
    wrapAll = WrappedArray . map wrap

instance Wrappable Int where
    wrap = WrappedInt

instance Wrappable Char where
    wrap = toWrappedString . (:[])
    wrapAll = toWrappedString

instance Wrappable String_ where
    wrap = WrappedString

instance Wrappable a => Wrappable [a] where
    wrap = wrapAll

-- Can I pull this out from this module?
instance Show WrappedValue where
    show (WrappedInt x) = show x
    show (WrappedString x) = toString x


newtype String_ = String_ { toString :: String }

instance Show String_ where
    show = toString


toWrappedString :: String -> WrappedValue
toWrappedString = WrappedString . String_
