module Pages.Create exposing (Model, Msg, page)

import Array exposing (Array)
import ElmLand.Page exposing (Page)
import Features
import Hero
import Html exposing (Html)
import Html.Attributes as Attr
import Html.Events
import Svg exposing (..)
import Svg.Attributes exposing (..)
import View exposing (View)


page : Page Model Msg
page =
    ElmLand.Page.sandbox
        { init = init
        , update = update
        , view = view
        }



-- INIT


type alias Model =
    { skinColorIndex : Int
    , mouthStyleIndex : Int
    }


init : Model
init =
    { skinColorIndex = 0
    , mouthStyleIndex = 0
    }



-- UPDATE


type Msg
    = UserClickedPrevious Feature
    | UserClickedNext Feature


type Feature
    = SkinColorFeature
    | MouthStyleFeature


update : Msg -> Model -> Model
update msg model =
    case msg of
        UserClickedPrevious SkinColorFeature ->
            { model
                | skinColorIndex =
                    cycleLeft
                        model.skinColorIndex
                        Features.skinColors
            }

        UserClickedNext SkinColorFeature ->
            { model
                | skinColorIndex =
                    cycleRight
                        model.skinColorIndex
                        Features.skinColors
            }

        UserClickedPrevious MouthStyleFeature ->
            { model
                | mouthStyleIndex =
                    cycleLeft
                        model.mouthStyleIndex
                        Features.mouthStyles
            }

        UserClickedNext MouthStyleFeature ->
            { model
                | mouthStyleIndex =
                    cycleRight
                        model.mouthStyleIndex
                        Features.mouthStyles
            }


cycleLeft : Int -> Array anything -> Int
cycleLeft index array =
    if index - 1 < 0 then
        Array.length array - 1

    else
        index - 1


cycleRight : Int -> Array anything -> Int
cycleRight index array =
    if index + 1 >= Array.length array then
        0

    else
        index + 1



-- VIEW


view : Model -> View Msg
view model =
    { title = "Hero Creator"
    , body =
        [ viewControls
        , Hero.view (Features.toOptions model)
        , viewShareLink model
        ]
    }


viewControls : Html Msg
viewControls =
    Html.div []
        [ viewFeatureControl
            { feature = SkinColorFeature
            , label = "Skin color"
            }
        , viewFeatureControl
            { feature = MouthStyleFeature
            , label = "Mouth style"
            }
        ]


viewShareLink : Model -> Html msg
viewShareLink model =
    Html.p []
        [ Html.a [ Attr.target "_blank", Attr.href (toHeroUrl model) ]
            [ Html.text "Share this hero!" ]
        ]


toHeroUrl : Model -> String
toHeroUrl model =
    "/hero/"
        ++ String.join "-"
            [ String.fromInt model.skinColorIndex
            , String.fromInt model.mouthStyleIndex
            ]


viewFeatureControl : { feature : Feature, label : String } -> Html Msg
viewFeatureControl options =
    Html.div [ Attr.class "control" ]
        [ Html.button
            [ Attr.class "control__button"
            , Html.Events.onClick (UserClickedPrevious options.feature)
            ]
            [ text "👈" ]
        , Html.span [ Attr.class "control__label" ] [ text options.label ]
        , Html.button
            [ Attr.class "control__button"
            , Html.Events.onClick (UserClickedNext options.feature)
            ]
            [ text "👉 " ]
        ]
