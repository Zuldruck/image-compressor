--
-- EPITECH PROJECT, 2021
-- ImageCompressor
-- File description:
-- Params
--

module Params where

data Params = Params {
  colorNb :: Int,
  covergenceLimit :: Float,
  pathToFile :: String
} deriving Show

initParams :: Params
initParams = Params 0 0 ""

getParams :: [String] -> Params -> Params
getParams [] args = args
getParams ("-n" : n : xs) args = getParams xs args { colorNb = read n :: Int }
getParams ("-l" : l : xs) args = getParams xs args { covergenceLimit = read l :: Float }
getParams ("-f" : f : xs) args = getParams xs args { pathToFile = f }
