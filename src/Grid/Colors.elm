module Grid.Colors exposing (black, darkGrey, lightGreen, lightGrey, white)


{-| Helper functions for color

# Documentation

@docs black, darkGrey, lightGreen, lightGrey, white

-}


import Css exposing (hex)

{-| TODO some docs

-}
black : Css.Color
black =
    hex "000"


{-| TODO some docs

-}
darkGrey : Css.Color
darkGrey =
    hex "666"


{-| TODO some docs

-}
lightGreen : Css.Color
lightGreen =
    hex "4d4"


{-| TODO some docs

-}
lightGrey : Css.Color
lightGrey =
    hex "CCC"


{-| TODO some docs

-}
white : Css.Color
white =
    hex "fff"