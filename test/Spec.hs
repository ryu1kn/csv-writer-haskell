
import Test.Hspec
import Lib

-- `main` is here so that this module can be run from GHCi on its own.  It is
-- not needed for automatic spec discovery.
main :: IO ()
main = hspec spec

spec :: Spec
spec = describe "stringifyField" $ do
    it "returns the same string" $
        stringifyField "VALUE" `shouldBe` "VALUE"

    it "preserves the space characters" $
        stringifyField " VALUE\tA  " `shouldBe` " VALUE\tA  "

    it "returns an integer as a string" $
        stringifyField (1 :: Int) `shouldBe` "1"

    it "returns a float number as a string" $
        stringifyField (1.5 :: Float) `shouldBe` "1.5"

    it "returns a double number as a string" $
        stringifyField (1.5 :: Double) `shouldBe` "1.5"

    it "returns a boolean value as a string" $
        stringifyField True `shouldBe` "True"

    it "wraps a field value with double quotes if the field contains comma" $
        stringifyField "VALUE,A" `shouldBe` "\"VALUE,A\""

    it "wraps a field value with double quotes if the field contains newline" $
        stringifyField "VALUE\nA" `shouldBe` "\"VALUE\nA\""

    it "wraps a field value with double quotes and escape the double quotes if they are used in the field" $
        stringifyField "VALUE\"A" `shouldBe` "\"VALUE\"\"A\""

    it "escapes double quotes even if double quotes are only on the both edges of the field" $
        stringifyField "\"VALUE\"" `shouldBe` "\"\"\"VALUE\"\"\""
