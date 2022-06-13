module Pages.Hero.Id_ exposing (Model, Msg, page)

import ElmLand.Page exposing (Page)
import Features
import Hero
import Html exposing (Html)
import View exposing (View)


page : { id : String } -> Page Model Msg
page params =
    ElmLand.Page.sandbox
        { init = init
        , update = update
        , view = view params
        }



-- INIT


type alias Model =
    {}


init : Model
init =
    {}



-- UPDATE


type Msg
    = ExampleMsgReplaceMe


update : Msg -> Model -> Model
update msg model =
    case msg of
        ExampleMsgReplaceMe ->
            model



-- VIEW


view : { id : String } -> Model -> View Msg
view params model =
    { title = "Hero"
    , body =
        [ Hero.view (Features.fromIdToOptions params.id) ]
    }
