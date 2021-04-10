module Main where

import System.Environment
import Parser
import Params

main :: IO ()
main = do
  args <- getArgs
  let params = getParams args initParams
  pixels <- parseFile $ pathToFile params
  putStrLn "File Parsed"
  return ()
