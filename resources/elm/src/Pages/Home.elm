module Pages.Home exposing (..)

import Html exposing (Html, div, text)
import Inertia exposing (Msg, link)
import Json.Decode exposing (Value)


view : Value -> Html Msg
view props =
    div []
        [ text "Hello, world"
        , link "/greet/seb" [ text "Greet" ]
        ]
