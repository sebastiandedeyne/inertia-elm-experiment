module App exposing (..)

import Browser exposing (element)
import Dict exposing (Dict)
import Html exposing (Html)
import Inertia exposing (Model, Msg, init, subscriptions, update)
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


view : Model -> Html Msg
view model =
    case Dict.get model.component pages of
        Just renderer ->
            renderer model.props

        Nothing ->
            Pages.Error.view model.props


main : Program String Model Msg
main =
    element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
