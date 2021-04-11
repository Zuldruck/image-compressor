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

data Cluster = Cluster {
  centroid :: Centroid,
  pixels :: [Pixel]
} deriving Show

generateKRandomCentroids :: Int -> IO [Centroid]
generateKRandomCentroids 0 = return []
generateKRandomCentroids k = do
  r <- randomRIO (0, 255)
  g <- randomRIO (0, 255)
  b <- randomRIO (0, 255)
  xs <- generateKRandomCentroids (k - 1)
  return (Color r g b : xs)

findNearestCentroid :: Color -> [Centroid] -> Centroid
findNearestCentroid _ [centroid] = centroid
findNearestCentroid color (x:xs) =
  let nearestCentroid = findNearestCentroid color xs in
    if distanceBetweenColors color x < distanceBetweenColors color nearestCentroid then
      x
    else
      nearestCentroid

createClusters :: [Centroid] -> [Cluster]
createClusters = map (`Cluster` [])

assignPixelToCentroid :: Pixel -> Centroid -> [Cluster] -> [Cluster]
assignPixelToCentroid pixel c [] = []
assignPixelToCentroid pixel c (cluster:clusters)
  | centroid cluster == c = cluster{pixels = pixel : pixels cluster} : clusters
  | otherwise = cluster : assignPixelToCentroid pixel c clusters

assignPixelsToClusters :: [Pixel] -> [Centroid] -> [Cluster] -> [Cluster]
assignPixelsToClusters [] _ clusters = clusters
assignPixelsToClusters (pixel:pixels) centroids clusters =
  let nearestCentroid = findNearestCentroid (color pixel) centroids
      updatedClusters = assignPixelToCentroid pixel nearestCentroid clusters
  in
    assignPixelsToClusters pixels centroids updatedClusters
