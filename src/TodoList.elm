port module TodoList exposing (main)

import Browser
import Html exposing (Html, li, text, ul)
import List



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


initialModel : Model
initialModel =
    { items = []
    }


subscriptions : Model -> Sub Msg
subscriptions _ =
    updatedItems NewItems



---- PORTS ----


port updatedItems : (List String -> msg) -> Sub msg



---- MODEL ----


type alias Model =
    { items : List String
    }


type Msg
    = NewItems (List String)



---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewItems items ->
            ( { model | items = items }, Cmd.none )



---- VIEW ----


view : Model -> Html msg
view model =
    ul [] (List.map (\item -> li [] [ text item ]) model.items)
