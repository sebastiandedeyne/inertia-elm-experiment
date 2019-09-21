module Pages.Error exposing (..)

import Html exposing (Html, text)
import Pages exposing (ErrorProps, Msg)
import String exposing (append)


view : ErrorProps -> Html Msg
view props =
    text (append "Something went wrong :( " props.reason)
