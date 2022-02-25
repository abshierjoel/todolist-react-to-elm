port module App exposing (main)

import Browser
import Html exposing (Html, div)



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    addItem SubmittedForm


initialModel : Model
initialModel =
    { items = []
    }



---- PORTS ----


port addItem : (String -> msg) -> Sub msg


port sendItems : List String -> Cmd msg



---- MODEL ----


type alias Model =
    { items : List String
    }


type Msg
    = SubmittedForm String



---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SubmittedForm newItem ->
            let
                items =
                    newItem :: model.items
            in
            ( { model | items = items }, sendItems items )



---- VIEW ----


view : Model -> Html Msg
view _ =
    div [] []
