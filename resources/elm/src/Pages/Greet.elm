module Pages.Greet exposing (..)

import Html exposing (Html, div, text)
import Inertia exposing (Msg, link)
import Json.Decode exposing (Decoder, Value, decodeValue, field, map, string)
import String exposing (append)



-- MODEL


type alias Model =
    { name : String }


propsDecoder : Decoder Model
propsDecoder =
    map Model
        (field "name" string)



-- VIEW


view : Value -> Html Msg
view value =
    case decodeValue propsDecoder value of
        Ok props ->
            div []
                [ text (append "Hello, " props.name)
                , link "/" [ text "Back home" ]
                ]

        Err _ ->
            div [] [ text "Oopsie on greet" ]
