module Main exposing (main)

import Browser
import Html exposing (Html, button, div, header, img, span, text)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }



-- MODEL


type alias Model =
    Int


init : () -> ( Model, Cmd Msg )
init _ =
    ( 0, Cmd.none )



-- UPDATE


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( model - 1, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ header []
            [ img [ src "./static/logo.svg" ] []
            , span [] [ text "elm-watch" ]
            ]
        , div [ class "counter" ]
            [ button [ onClick Decrement ] [ text "-" ]
            , div [] [ text (String.fromInt model) ]
            , button [ onClick Increment ] [ text "+" ]
            ]
        ]
