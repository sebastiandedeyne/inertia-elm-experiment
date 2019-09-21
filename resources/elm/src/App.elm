module App exposing (..)

import Browser
import Html exposing (Html, text)
import Json.Decode
import Pages exposing (Msg, Page)
import Pages.Error
import Pages.Greet
import Pages.Home
import String exposing (concat)


init : String -> ( Page, Cmd Msg )
init flags =
    case Json.Decode.decodeString decodeComponent flags of
        Ok component ->
            case component of
                "Home" ->
                    ( Pages.Home, Cmd.none )

                "Greet" ->
                    case Json.Decode.decodeString decodeGreetProps flags of
                        Ok props ->
                            ( Pages.Greet props, Cmd.none )

                        Err _ ->
                            ( Pages.Error { reason = "Couldn't decode GreetProps" }, Cmd.none )

                _ ->
                    ( Pages.Error { reason = concat [ "Couldn't match component [", component, "]" ] }, Cmd.none )

        Err _ ->
            ( Pages.Error { reason = "Couldn't decode component" }, Cmd.none )


decodeComponent : Json.Decode.Decoder String
decodeComponent =
    Json.Decode.field "component" Json.Decode.string


decodeGreetProps : Json.Decode.Decoder Pages.GreetProps
decodeGreetProps =
    Json.Decode.map Pages.GreetProps
        (Json.Decode.at [ "props", "name" ] Json.Decode.string)


view : Page -> Html Msg
view page =
    case page of
        Pages.Home ->
            Pages.Home.view

        Pages.Greet props ->
            Pages.Greet.view props

        Pages.Error props ->
            Pages.Error.view props


update : Msg -> Page -> ( Page, Cmd Msg )
update msg page =
    ( page, Cmd.none )


main : Program String Page Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }
