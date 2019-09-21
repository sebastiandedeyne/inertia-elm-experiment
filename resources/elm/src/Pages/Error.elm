module Pages.Error exposing (..)

import Pages exposing (Msg, ErrorProps)
import Html exposing (Html, text)
import String exposing (append)

view : ErrorProps -> Html Msg
view props =
    text (append "Something went wrong :( " props.reason)
