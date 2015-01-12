module Main where

import Control.Applicative ((<$>))


main :: IO ()
main = do
    n <- readLn
    putStrLn $ fizzbuzz n


fizzbuzz :: Int -> String
fizzbuzz n | n < 1 || 9 < n    = "NO"
           | '3' `elem` show n = "YES"
           | n `mod` 3 == 0    = "YES"
           | otherwise         = "NO"
