{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty
import Data.Aeson ((.=), object)
import Text.Microstache (compileMustacheFile, renderMustache)
import Control.Monad.IO.Class (liftIO)

main = scotty 3000 $ do
  get "/" $ do
    temp <- liftIO $ compileMustacheFile "index.html"
    let val = object ["name" .= ("Mirhaq" :: String)]
    html $ renderMustache temp val
