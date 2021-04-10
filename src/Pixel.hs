--
-- EPITECH PROJECT, 2021
-- ImageCompressor
-- File description:
-- Pixel
--

module Pixel where

data Color = Color Int Int Int
  deriving (Eq, Read)

data Pixel = Pixel {
  position :: (Int, Int),
  color :: Color
} deriving (Eq, Read)

instance Show Color where
  show (Color r g b) = "(" ++ show r ++ "," ++ show g ++ "," ++ show b ++ ")"

instance Show Pixel where
  show (Pixel (x, y) color) = "(" ++ show x ++ "," ++ show y ++ ") " ++ show color
