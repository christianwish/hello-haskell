module Main where

import Control.Monad
import Happstack.Server (nullConf, simpleHTTP, ok, dir)
import System.IO
import System.Log.Handler.Simple
import System.Log.Logger ( updateGlobalLogger
                         , rootLoggerName
                         , setLevel
                         , Priority(..)
                         )

endPoints = [
        dir "hello" $ dir "exellio" $ ok "Hello Exellio!"
      , dir "hello" $ ok "Hello!"
      , ok "hello world!\ntry http://localhost:8000/hello\nor http://localhost:8000/hello/exellio"
      ]

main :: IO ()
main = do
  updateGlobalLogger rootLoggerName (setLevel INFO)
  simpleHTTP nullConf $ msum endPoints
