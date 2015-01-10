module Main where

import Control.Applicative ((<$>))


main :: IO ()
main = do
    n <- readLn
    putStrLn $ fizzbuzz n


fizzbuzz :: Int -> String
fizzbuzz n | n < 1 || 9 < n    = "No"
           | '3' `elem` show n = "Yes"
           | n `mod` 3 == 0    = "Yes"
           | otherwise         = "No"
