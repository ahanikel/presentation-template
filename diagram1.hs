#!/usr/bin/env stack
-- stack --resolver lts-14.3 script
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.Backend.Rasterific.CmdLine

node :: Int -> Diagram B
node n = text (show n) # fontSizeL 0.2 # fc white <> circle 0.2 # fc green

tournament :: Int -> Diagram B
tournament n = atPoints (trailVertices $ regPoly n 1) (map node [1..n])

tour items = atPoints (trailVertices $ regPoly (length items) 1) items

label :: String -> Diagram B
label l = text l # fontSizeL 0.08 # fc white <> rect 0.75 0.25 # fc green

--main = mainWith $ tournament 5
main = mainWith $ tour (map label ["Quickstart", "Backend Store", "Journal"])
