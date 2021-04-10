--
-- EPITECH PROJECT, 2021
-- ImageCompressor
-- File description:
-- KMeans
--

module KMeans where

import System.Random
import Pixel

type Centroid = Color

generateKRandomCentroids :: Int -> IO [Centroid]
generateKRandomCentroids 0 = return []
generateKRandomCentroids k = do
  r <- randomRIO (0, 255)
  g <- randomRIO (0, 255)
  b <- randomRIO (0, 255)
  xs <- generateKRandomCentroids (k - 1)
  return (Color r g b : xs)
