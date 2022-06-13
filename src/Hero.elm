module Hero exposing (view)

import Features exposing (Options)
import Svg exposing (..)
import Svg.Attributes exposing (..)


view : Options -> Svg msg
view options =
    svg
        [ viewBox "0 0 100 100"
        , width "500px"
        , height "500px"
        ]
        [ viewBody options
        , viewHead options
        ]


background : Svg msg
background =
    rect
        [ x "0"
        , y "0"
        , width "100"
        , height "100"
        , fill "#ccc"
        ]
        []


viewBody : Features.Options -> Svg msg
viewBody options =
    g [ class "body" ]
        [ g [ class "hand hand--back" ]
            [ circle
                [ cx "30"
                , cy "72"
                , r "5"
                , fill options.skinColor
                , stroke "black"
                ]
                []
            ]
        , g [ class "legs" ]
            [ rect
                [ x "40"
                , y "65"
                , width "25"
                , height "30"
                , rx "4"
                , fill "white"
                , stroke "black"
                ]
                []
            ]
        , g [ class "torso" ]
            [ rect
                [ x "34"
                , y "45"
                , width "35"
                , height "30"
                , rx "4"
                , fill "white"
                , stroke "black"
                ]
                []
            ]
        , g [ class "hand hand--front" ]
            [ circle
                [ cx "77"
                , cy "72"
                , r "5"
                , fill options.skinColor
                , stroke "black"
                ]
                []
            ]
        ]


viewHead : Features.Options -> Svg msg
viewHead options =
    g [ class "head" ]
        [ viewFace options
        , viewHair options
        ]


viewHair : Features.Options -> Svg msg
viewHair options =
    rect [ x "30", y "8", width "40", height "15", rx "5", fill options.hairColor ] []



-- rect [ x "30", y "8", width "40", height "15", fill options.hairColor ] []


viewFace : Features.Options -> Svg msg
viewFace options =
    g [ class "face" ]
        [ circle
            [ cx "50"
            , cy "30"
            , r "20"
            , fill options.skinColor
            , stroke "black"
            ]
            []
        , g [ class "eyes" ]
            [ circle
                [ cx "38"
                , cy "30"
                , r "2"
                , fill "black"
                ]
                []
            , circle
                [ cx "52"
                , cy "30"
                , r "2"
                , fill "black"
                ]
                []
            ]
        , g [ class "eyelids" ]
            [ rect
                [ class "eyelids__top"
                , x "35"
                , y "24"
                , width "20"
                , height "3"
                , fill options.skinColor
                ]
                []
            , rect
                [ class "eyelids__bottom"
                , x "35"
                , y "33"
                , width "20"
                , height "3"
                , fill options.skinColor
                ]
                []
            ]
        , g [ class "mouth" ]
            [ case options.mouthStyle of
                Features.OpenMouth ->
                    ellipse
                        [ cx "44"
                        , cy "39"
                        , rx "5"
                        , ry "3"
                        , fill "indianred"
                        ]
                        []

                Features.ClosedMouth ->
                    line
                        [ x1 "40"
                        , y1 "40"
                        , x2 "50"
                        , y2 "40"
                        , strokeWidth "2"
                        , strokeLinecap "round"
                        , stroke "black"
                        ]
                        []
            ]
        ]
