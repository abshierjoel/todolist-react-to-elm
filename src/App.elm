module App exposing (main)

import Browser
import Html exposing (Html, div, form, h1, input, li, text, ul)
import Html.Attributes exposing (class, type_, value)
import Html.Events exposing (onInput, onSubmit)



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


initialModel : Model
initialModel =
    { items = []
    , inputText = ""
    }



---- MODEL ----


type alias Model =
    { items : List String
    , inputText : String
    }


type Msg
    = ChangedText String
    | SubmittedForm



---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangedText text ->
            ( { model | inputText = text }, Cmd.none )

        SubmittedForm ->
            let
                items =
                    model.inputText :: model.items
            in
            ( { model | items = items, inputText = "" }, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div [ class "App" ]
        [ h1 [] [ text "Todo List" ]
        , viewTodos model.items
        , viewTodoForm model.inputText
        ]


viewTodos : List String -> Html Msg
viewTodos items =
    ul [] (List.map (\item -> li [] [ text item ]) items)


viewTodoForm : String -> Html Msg
viewTodoForm inputText =
    form [ onSubmit SubmittedForm ]
        [ input [ type_ "text", onInput ChangedText, value inputText ] []
        , input [ type_ "submit", value "Add" ] []
        ]
