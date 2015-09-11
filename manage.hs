#!/usr/bin/env runhaskell

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE LambdaCase #-}

import Turtle
import Control.Monad (forM_)
import Data.Text (strip)

main = do
  dir <- pwd
  files <- return . fmap words . lines =<< liftIO (readFile "files")
  forM_ files $ \(f:fullpath) -> do
         let full = dir </> (fromString f)
         copyTo <- case fullpath of
           []       -> fmap (<>fromString("."<>f)) home
           (path:_) -> fmap (<>fromString path) home
         testfile copyTo >>= \case
           True -> do
             shell (format ("[ -L "%fp%" ]") copyTo) empty >>= \case
               ExitSuccess   -> do
                 (_, linksTo) <- (fmap . fmap) (fromText . strip) $ shellStrict (format ("readlink "%fp) copyTo) empty
                 echo (if linksTo == full
                       then format ("nothing to do: "%fp%" already linked to "%fp) copyTo full
                       else format ("WARNING: "%fp%" linked to another file: "%fp) copyTo linksTo)
               ExitFailure _ -> do
                  echo (format ("WARNING: "%fp%" is not a symlink , NOT LINKING") copyTo)
           False -> void $ do
             echo (format ("linking: "%fp%" --> "%fp) full copyTo)
             shell (format ("ln -sf "%fp%" "%fp) full copyTo) empty
