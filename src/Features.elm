module Features exposing (..)

import Array exposing (Array)


defaultSkinColor : String
defaultSkinColor =
    "tan"


skinColors : Array String
skinColors =
    Array.fromList
        [ "tan"
        , "red"
        , "orange"
        , "yellow"
        , "green"
        , "blue"
        , "violet"
        ]


type MouthStyle
    = OpenMouth
    | ClosedMouth


defaultMouthStyle : MouthStyle
defaultMouthStyle =
    ClosedMouth


mouthStyles : Array MouthStyle
mouthStyles =
    Array.fromList
        [ ClosedMouth
        , OpenMouth
        ]


type alias Options =
    { skinColor : String
    , hairColor : String
    , mouthStyle : MouthStyle
    }


toOptions :
    { model
        | skinColorIndex : Int
        , mouthStyleIndex : Int
    }
    -> Options
toOptions model =
    { skinColor =
        skinColors
            |> Array.get model.skinColorIndex
            |> Maybe.withDefault defaultSkinColor
    , mouthStyle =
        mouthStyles
            |> Array.get model.mouthStyleIndex
            |> Maybe.withDefault defaultMouthStyle
    , hairColor = "#644"
    }


fromIdToOptions : String -> Options
fromIdToOptions string =
    case String.split "-" string of
        [ skinColorStr, mouthStyleStr ] ->
            toOptions
                { skinColorIndex =
                    String.toInt skinColorStr
                        |> Maybe.withDefault 0
                , mouthStyleIndex =
                    String.toInt mouthStyleStr
                        |> Maybe.withDefault 0
                }

        _ ->
            toOptions
                { skinColorIndex = 0
                , mouthStyleIndex = 0
                }
