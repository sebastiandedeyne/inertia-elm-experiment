module App exposing (..)

import Browser exposing (element)
import Html exposing (Html)
import Inertia exposing (Model, Msg, init, update, subscriptions)
import Pages.Error
import Pages.Greet
import Pages.Home


view : Model -> Html Msg
view model =
    case model.component of
        "Home" ->
            Pages.Home.view

        "Greet" ->
            Pages.Greet.view model.props

        _ ->
            Pages.Error.view


main : Program String Model Msg
main =
    element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
