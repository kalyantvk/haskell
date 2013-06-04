-- 044.hs
{-
 - Pentagonal numbers are generated by the formula, Pn=n(3n−1)/2. The first ten
 - pentagonal numbers are:
 -
 - 1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...
 -
 - It can be seen that P4 + P7 = 22 + 70 = 92 = P8. However, their difference,
 - 70 − 22 = 48, is not pentagonal.
 -
 - Find the pair of pentagonal numbers, Pj and Pk, for which their sum and
 - difference are pentagonal and D = |Pk − Pj| is minimised; what is the value
 - of D?
 -}

import Data.List (inits)

pents :: [Integer]
pents = [ n*(3*n-1) `div` 2 | n <- [1..] ]

isPent :: Integer -> Bool
isPent k = let n = round $ (1.0 + sqrt (1.0 + 24.0*(fromIntegral k))) / 6.0 
           in n*(3*n-1) `div` 2 == k

sols = [ (x,x') | xs <- tail $ inits pents
                , let x' = last xs
                , x <- init xs
                , isPent (x'-x) && isPent (x'+x) ]

solveProblem = let (x,x') = head $ sols
               in x' - x

main = print solveProblem
