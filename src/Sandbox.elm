module Sandbox where
-- also see RainbowLambda.elm for a more complex example!

import Graphics.Collage as Collage exposing (..)
import Graphics.Element exposing (..)
import Text
import Color exposing (..)
import Time exposing (Time)
import Gif exposing (Gif)
import Array exposing (Array)

width = 512
height = 64
fps = 12

colors : List Color
colors =
  [purple, blue, green, yellow, orange, red]

colorRect : Int -> Color -> Collage.Form
colorRect index color =
  let
    scaleFactor = 1 - (0.04 * toFloat index)
    width' = width * scaleFactor
    height' = height * scaleFactor
  in
    Collage.rect width' height' |> filled color

view : Int -> a -> Gif.Frame
view index _ =
  colors
    |> List.repeat 6
    |> List.concat
    |> List.drop index
    |> List.take 24
    |> List.indexedMap colorRect

frames : List (Gif.Frame)
frames =
  List.indexedMap view colors

gif : Gif
gif =
  Gif.gif width height frames |> Gif.withFps fps
