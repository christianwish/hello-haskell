module Main where

import Control.Monad
import Happstack.Server (nullConf, simpleHTTP, ok, dir)

endPoints = [
        dir "hello" $ dir "exellio" $ ok "Hello Exellio!"
      , dir "hello" $ ok "Hello!"
      , ok "hello world!\ntry http://localhost:8000/hello\nor http://localhost:8000/hello/exellio"
      ]

main :: IO ()
main = simpleHTTP nullConf $ msum endPoints
