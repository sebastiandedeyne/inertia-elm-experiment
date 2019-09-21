module Pages.Home exposing (..)

import Html exposing (Html, a, div, text)
import Html.Attributes exposing (href)
import Pages exposing (Msg)


view : Html Msg
view =
    div []
        [ text "Hello, world"
        , a [ href "/greet/seb" ] [ text "Greet" ]
        ]
