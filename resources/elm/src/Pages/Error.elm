module Pages.Error exposing (..)

import Html exposing (Html, div, text)
import Inertia exposing (Msg)
import Inertia.Link exposing (link)


view : Html Msg
view =
    div []
        [ text "Something went wrong"
        , link "/" [ text "Back home" ]
        ]
