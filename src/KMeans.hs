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
  size :: Int,
  pixels :: [Pixel]
}

instance Show Cluster where
  show cluster =
    "--\n" ++
    show (centroid cluster) ++
    "\n-\n" ++
    showPixels (pixels cluster)


showClusters :: [Cluster] -> String
showClusters [] = ""
showClusters [c1, c2] = show c1 ++ "\n" ++ show c2
showClusters (cluster:clusters) = show cluster ++ "\n" ++ showClusters clusters

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
createClusters = map (\centroid -> Cluster centroid 0 [])

assignPixelToCentroid :: Pixel -> Centroid -> [Cluster] -> [Cluster]
assignPixelToCentroid pixel c [] = []
assignPixelToCentroid pixel c (cluster:clusters)
  | centroid cluster == c = cluster{
    pixels = pixel : pixels cluster,
    size = size cluster + 1
  } : clusters
  | otherwise = cluster : assignPixelToCentroid pixel c clusters

assignPixelsToClusters :: [Pixel] -> [Centroid] -> [Cluster] -> [Cluster]
assignPixelsToClusters [] _ clusters = clusters
assignPixelsToClusters (pixel:pixels) centroids clusters =
  let nearestCentroid = findNearestCentroid (color pixel) centroids
      updatedClusters = assignPixelToCentroid pixel nearestCentroid clusters
  in
    assignPixelsToClusters pixels centroids updatedClusters

generateNewCentroids :: [Cluster] -> [Centroid]
generateNewCentroids = map (computeMeanColor . pixels)

clusterise :: [Centroid] -> [Pixel] -> Float -> [Cluster]
clusterise _ [] _ = []
clusterise centroids pixels limit =
  let clusters = assignPixelsToClusters pixels centroids (createClusters centroids)
      newCentroids = generateNewCentroids clusters
  in
    if centroids == newCentroids then
      clusters
    else
      clusterise newCentroids pixels limit
