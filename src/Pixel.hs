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

showPixels :: [Pixel] -> String
showPixels [] = ""
showPixels [p1, p2] = show p1 ++ "\n" ++ show p2
showPixels (pixel:pixels) = show pixel ++ "\n" ++ showPixels pixels

distanceBetweenColors :: Color -> Color -> Float
distanceBetweenColors (Color r1 g1 b1) (Color r2 g2 b2) =
  let sum = ((r1 - r2) ^ 2) + ((g1 - g2) ^ 2) + ((b1 - b2) ^ 2) in
  sqrt $ toEnum sum

sumPixelColors :: [Pixel] -> Color
sumPixelColors [pixel] = color pixel
sumPixelColors (Pixel _ (Color r1 g1 b1):pixels) = 
  let (Color r2 g2 b2) = sumPixelColors pixels in
    Color (r1 + r2) (g1 + g2) (b1 + b2)

computeMeanColor :: [Pixel] -> Int -> Color
computeMeanColor [pixel] _ = color pixel
computeMeanColor pixels size =
  let (Color r g b) = sumPixelColors pixels in
    Color (r `div` size) (g `div` size) (b `div` size)
