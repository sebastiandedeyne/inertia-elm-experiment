module Pages.Home exposing (..)

import Html exposing (Html, div, text)
import Inertia exposing (Msg)
import Inertia.Link exposing (link)


view : Html Msg
view =
    div []
        [ text "Hello, world"
        , link "/greet/seb" [ text "Greet" ]
        ]
