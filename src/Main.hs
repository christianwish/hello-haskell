module Main where

import           Control.Monad
import           Happstack.Server          (dir, dirs, nullConf, ok, simpleHTTP)
import           System.IO
import           System.Log.Handler.Simple
import           System.Log.Logger         (Priority (..), rootLoggerName,
                                            setLevel, updateGlobalLogger)

endPoints =
  [ mzero
  , dirs "hello/exellio" $ ok "Hello Exellio!"
  , dir "hello" $ ok "Hello!"
  , ok "hello world!\ntry http://localhost:8000/hello\nor http://localhost:8000/hello/exellio"
  ]

main :: IO ()
main = do
  updateGlobalLogger rootLoggerName (setLevel INFO)
  simpleHTTP nullConf $ msum endPoints
