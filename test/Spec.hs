
import Test.Hspec
import Lib

-- `main` is here so that this module can be run from GHCi on its own.  It is
-- not needed for automatic spec discovery.
main :: IO ()
main = hspec spec

spec :: Spec
spec = do
    describe "stringifyField" $ do
        it "returns the same string" $ do
            stringifyField "VALUE" `shouldBe` "VALUE"

        it "returns an integer as a string" $ do
            stringifyField (1 :: Int) `shouldBe` "1"

        it "returns a float number as a string" $ do
            stringifyField (1.5 :: Float) `shouldBe` "1.5"

        it "wraps a field value with double quotes if the field contains comma" $ do
            stringifyField "VALUE,A" `shouldBe` "\"VALUE,A\""

        it "wraps a field value with double quotes if the field contains newline" $ do
            stringifyField "VALUE\nA" `shouldBe` "\"VALUE\nA\""
