#!/usr/bin/env runhaskell

{-# LANGUAGE OverloadedStrings #-}

import Turtle
import Control.Monad (forM_)

main = do
  dir <- pwd
  files <- return . fmap words . lines =<< liftIO (readFile "files")
  forM_ files $ \(f:fullpath) -> do
         let full = dir </> (fromString f)
         copyTo <- case fullpath of
                     []       -> fmap (<>fromString("."<>f)) home
                     (path:_) -> fmap (<>fromString path) home
         exists <- testfile copyTo
         let flag = if exists then "." else "*"
         isLink <- if not exists
                   then return ExitSuccess
                   else shell (format ("[ -L "%fp%" ]") copyTo) empty
         case isLink of
           ExitSuccess -> do
                            echo (format (s%" "%fp%" --> "%fp) flag full copyTo)
                            shell (format ("ln -sf "%fp%" "%fp) full copyTo) empty
           _           -> echo (format ("WARNING: "%fp%" is not a symlink , NOT LINKING") copyTo) >> return ExitSuccess
