module Pages exposing (..)


type Msg =
    NoOp


type alias GreetProps = { name : String }
type alias ErrorProps = { reason : String }


type Page
    = Home
    | Greet GreetProps
    | Error ErrorProps
