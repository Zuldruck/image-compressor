--
-- EPITECH PROJECT, 2021
-- ImageCompressor
-- File description:
-- Parser
--

module Parser where

import Pixel

intTripleToColor :: (Int, Int, Int) -> Color 
intTripleToColor (r, g, b) = Color r g b

parsePos :: String -> (Int, Int)
parsePos p = read p :: (Int, Int)

parseColor :: String -> Color
parseColor c = intTripleToColor (read c :: (Int, Int, Int))

parseLines :: [String] -> [Pixel]
parseLines [] = []
parseLines (x : xs) = Pixel (parsePos left) (parseColor right) : parseLines xs
  where
    (left, right) = break (== ' ') x

parseFile :: String -> IO [Pixel]
parseFile fileName = do
  fileContent <- readFile fileName
  return $ parseLines $ lines fileContent
