module Pages.Greet exposing (..)

import Html exposing (Html, text, div, a)
import Html.Attributes exposing (href)
import Pages exposing (Msg, GreetProps)
import String exposing (append)

view : GreetProps -> Html Msg
view props =
    div []
        [ text (append "Hello, " props.name)
        , a [ href "/" ] [ text "Back home" ]
        ]
