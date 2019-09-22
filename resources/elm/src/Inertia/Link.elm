module Inertia.Link exposing (link)

import Html exposing (Html, a)
import Html.Attributes
import Html.Events
import Inertia exposing (Msg)
import Json.Decode exposing (Decoder)


link : String -> List (Html Msg) -> Html Msg
link href innerHtml =
    a
        [ Html.Attributes.href href
        , Html.Events.custom "click" (preventDefault (Inertia.Visit href))
        ]
        innerHtml


preventDefault : msg -> Decoder { message : msg, stopPropagation : Bool, preventDefault : Bool }
preventDefault message =
    Json.Decode.succeed { message = message, preventDefault = True, stopPropagation = False }
