module Pages.Home exposing (..)

import Pages exposing (Msg)
import Html exposing (Html, text, div, a)
import Html.Attributes exposing (href)

view : Html Msg
view =
  div []
    [ text "Hello, world"
    , a [ href "/greet/seb" ] [ text "Greet" ]
    ]
