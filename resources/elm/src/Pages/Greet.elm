module Pages.Greet exposing (..)

import Html exposing (Html, a, div, text)
import Html.Attributes exposing (href)
import Pages exposing (GreetProps, Msg)
import String exposing (append)


view : GreetProps -> Html Msg
view props =
    div []
        [ text (append "Hello, " props.name)
        , a [ href "/" ] [ text "Back home" ]
        ]
