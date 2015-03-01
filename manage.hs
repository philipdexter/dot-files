#!/usr/bin/env runhaskell

{-# LANGUAGE OverloadedStrings #-}

import Turtle
import Control.Monad (forM_)

main = do
  dir <- pwd
  files <- return . lines =<< liftIO (readFile "files")
  forM_ files $ \f -> do
         let full = dir </> (fromString f)
         copyTo <- fmap (<>fromString("."<>f)) home
         exists <- testfile copyTo
         let flag = if exists then "." else "\\*"
         stdout (inshell (format ("[ -L "%fp%" ] && true || echo WARNING: "%fp%"is not a symlink") copyTo copyTo) empty)
         shell ("echo " <> (format (s%" "%fp%" --\\> "%fp) flag full copyTo)) empty
         shell (format ("ln -sf "%fp%" "%fp) full copyTo) empty
