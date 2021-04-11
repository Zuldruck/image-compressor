--
-- EPITECH PROJECT, 2021
-- ImageCompressor
-- File description:
-- Main
--

module Main where

import System.Environment
import Parser
import Params
import KMeans

main :: IO ()
main = do
  args <- getArgs
  let params = getParams args initParams
  pixels <- parseFile $ pathToFile params
  putStrLn "File Parsed"
  centroids <- generateKRandomCentroids $ colorNb params
  let clusters = clusterise centroids pixels $ convergenceLimit params
  return ()
