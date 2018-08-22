module Main where

import           Control.Monad
import           Data.Char                 (toLower)
import           System.IO
import           System.Log.Handler.Simple
import           System.Log.Logger         (Priority (..), rootLoggerName,
                                            setLevel, updateGlobalLogger)

import           Happstack.Server          (Method (GET, POST), dir, dirs,
                                            method, nullConf, ok, path,
                                            simpleHTTP)
import           Happstack.Server.Types    (FromReqURI (..))

data Subject
  = World
  | Haskell

sayHello :: Subject -> String
sayHello World   = "Hello, World"
sayHello Haskell = "Hello, Haskell"

instance FromReqURI Subject where
  fromReqURI sub =
    case map toLower sub of
      "haskell" -> Just Haskell
      "world"   -> Just World
      _         -> Nothing

endPoints =
  [ mzero
  , dir "name" $ path $ \n -> ok $ "hello, " ++ n
  , dir "hi" $ path $ \n -> ok $ sayHello n
  , dirs "hello/exellio" $ ok "Hello Exellio!"
  , dir "hello" $ ok "Hello!"
  , dir "resource" $ do
      method GET
      ok "received a GET request"
  , do method POST
       ok "received a POST request"
 -- , ok "hello world!\ntry http://localhost:8000/hello\nor http://localhost:8000/hello/exellio"
  ]

main :: IO ()
main = do
  updateGlobalLogger rootLoggerName (setLevel INFO)
  simpleHTTP nullConf $ msum endPoints
