module FirstSpec (spec) where

import           Test.Hspec

spec :: Spec
spec = do
    describe "FirstTest" $ do
        it "works" $ do
            3 `shouldBe` 3
