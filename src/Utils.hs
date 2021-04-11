--
-- EPITECH PROJECT, 2021
-- image-compressor
-- File description:
-- Utils
--

module Utils where

takeAndDrop :: Int -> [a] -> ([a], [a])
takeAndDrop 0 list = ([], list)
takeAndDrop _ [] = ([], [])
takeAndDrop n (x:xs) = 
  let (taken, rest) = takeAndDrop (n - 1) xs in
    (x:taken, rest)
