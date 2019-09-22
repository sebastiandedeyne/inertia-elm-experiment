port module Inertia exposing (..)

import Browser exposing (element)
import Html
import Html.Attributes
import Html.Events
import Json.Decode exposing (Decoder, Value, decodeString, field, map2, string, value)
import Json.Encode exposing (null)



-- MODEL


type alias Model =
    { component : String, props : Value }



-- INIT


init : String -> ( Model, Cmd Msg )
init page =
    case decodeString pageDecoder page of
        Ok model ->
            ( model, Cmd.none )

        Err err ->
            ( { component = "Error", props = null }, Cmd.none )



-- UPDATE


type Msg
    = Visit String
    | SetPage String Value


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Visit url ->
            ( model, visit url )

        SetPage component props ->
            ( { component = component, props = props }, Cmd.none )


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions page =
    setPage decodeSubscription


decodeSubscription : String -> Msg
decodeSubscription page =
    case decodeString pageDecoder page of
        Ok model ->
            SetPage model.component model.props

        Err _ ->
            SetPage "Error" null


port visit : String -> Cmd msg


port setPage : (String -> msg) -> Sub msg


-- DECODERS


pageDecoder : Decoder Model
pageDecoder =
    map2 Model
        (field "component" string)
        (field "props" value)
