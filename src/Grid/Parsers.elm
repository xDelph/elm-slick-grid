module Grid.Parsers exposing
    ( boolEqualityParser
    , boolParser
    , floatEqualityParser
    , greaterThanBoolParser
    , greaterThanFloatParser
    , greaterThanIntParser
    , greaterThanStringParser
    , intEqualityParser
    , lessThanBoolParser
    , lessThanFloatParser
    , lessThanIntParser
    , lessThanStringParser
    , stringEqualityParser
    )

{-| Helper functions for parsing the grid content


# Docs for boolEqualityParser

@docs boolEqualityParser


# Docs for boolParser

@docs boolParser


# Docs for floatEqualityParser

@docs floatEqualityParser


# Docs for greaterThanBoolParser

@docs greaterThanBoolParser


# Docs for greaterThanFloatParser

@docs greaterThanFloatParser


# Docs for greaterThanIntParser

@docs greaterThanIntParser


# Docs for greaterThanStringParser

@docs greaterThanStringParser


# Docs for intEqualityParser

@docs intEqualityParser


# Docs for lessThanBoolParser

@docs lessThanBoolParser


# Docs for lessThanFloatParser

@docs lessThanFloatParser


# Docs for lessThanIntParser

@docs lessThanIntParser


# Docs for lessThanStringParser

@docs lessThanStringParser


# Docs for stringEqualityParser

@docs stringEqualityParser

-}

import Parser exposing ((|.), (|=), Parser, chompUntilEndOr, getChompedString, keyword, oneOf, spaces, succeed, symbol)

{-| TODO some docs

-}
stringParser : Parser String
stringParser =
    -- the input string cannot contain "\t"
    -- another implementation is:
    -- getChompedString <| chompWhile (\c -> True)
    getChompedString <| chompUntilEndOr "\u{0000}"

{-| TODO some docs

-}
stringEqualityParser : Parser String
stringEqualityParser =
    succeed identity
        |= stringParser

{-| TODO some docs

-}
lessThanStringParser : Parser String
lessThanStringParser =
    succeed identity
        |. spaces
        |. symbol "<"
        |. spaces
        |= stringParser

{-| TODO some docs

-}
greaterThanStringParser : Parser String
greaterThanStringParser =
    succeed identity
        |. spaces
        |. symbol ">"
        |. spaces
        |= stringParser

{-| TODO some docs

-}
intEqualityParser : Parser Int
intEqualityParser =
    succeed identity
        |= Parser.int

{-| TODO some docs

-}
lessThanIntParser : Parser Int
lessThanIntParser =
    succeed identity
        |. spaces
        |. symbol "<"
        |. spaces
        |= Parser.int

{-| TODO some docs

-}
greaterThanIntParser : Parser Int
greaterThanIntParser =
    succeed identity
        |. spaces
        |. symbol ">"
        |. spaces
        |= Parser.int

{-| TODO some docs

-}
floatEqualityParser : Parser Float
floatEqualityParser =
    succeed identity
        |= Parser.float

{-| TODO some docs

-}
lessThanFloatParser : Parser Float
lessThanFloatParser =
    succeed identity
        |. spaces
        |. symbol "<"
        |. spaces
        |= Parser.float

{-| TODO some docs

-}
greaterThanFloatParser : Parser Float
greaterThanFloatParser =
    succeed identity
        |. spaces
        |. symbol ">"
        |. spaces
        |= Parser.float

{-| TODO some docs

-}
boolParser : Parser Bool
boolParser =
    oneOf
        [ succeed True
            |. keyword "true"
        , succeed False
            |. keyword "false"
        ]

{-| TODO some docs

-}
boolEqualityParser : Parser Bool
boolEqualityParser =
    succeed identity
        |= boolParser

{-| TODO some docs

-}
lessThanBoolParser : Parser Bool
lessThanBoolParser =
    succeed identity
        |. spaces
        |. symbol "<"
        |. spaces
        |= boolParser

{-| TODO some docs

-}
greaterThanBoolParser : Parser Bool
greaterThanBoolParser =
    succeed identity
        |. spaces
        |. symbol ">"
        |. spaces
        |= boolParser
