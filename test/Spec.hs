
import Test.Hspec
import Lib

-- `main` is here so that this module can be run from GHCi on its own.  It is
-- not needed for automatic spec discovery.
main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "stringifyField" $ do
    it "returns a number as a string" $ do
      stringifyField 1 `shouldBe` "1"
