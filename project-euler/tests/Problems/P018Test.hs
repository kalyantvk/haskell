module Problems.P018Test (case_018_main) where

import Test.Tasty.Discover (Assertion, (@?=))
import Problems.P018
import qualified TestData.P018

case_018_main :: Assertion
case_018_main = process TestData.P018.txt @?= "1074"
