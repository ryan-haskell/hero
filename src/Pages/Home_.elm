module Pages.Home_ exposing (page)

import Html exposing (..)
import Html.Attributes exposing (..)
import View exposing (View)


page : View msg
page =
    { title = "Homepage"
    , body =
        [ h1 [] [ text "Hero Creator" ]
        , a [ href "/create" ] [ text "Get started!" ]
        ]
    }
