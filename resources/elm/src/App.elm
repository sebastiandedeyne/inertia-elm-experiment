module App exposing (..)

import Browser exposing (element)
import Dict exposing (Dict)
import Html exposing (Html, text)
import Inertia exposing (Model, Msg, init, subscriptions, update, view)
import Json.Decode exposing (Value)
import Pages.Error
import Pages.Greet
import Pages.Home


pages : Dict String (Value -> Html Msg)
pages =
    Dict.fromList
        [ ( "Home", Pages.Home.view )
        , ( "Greet", Pages.Greet.view )
        ]


errorView : Html Msg
errorView =
    text "Oopsie!"


main : Program String Model Msg
main =
    element
        { init = init
        , view = view pages errorView
        , update = update
        , subscriptions = subscriptions
        }
