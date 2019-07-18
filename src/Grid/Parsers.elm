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

{-| 

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


stringParser : Parser String
stringParser =
    -- the input string cannot contain "\t"
    -- another implementation is:
    -- getChompedString <| chompWhile (\c -> True)
    getChompedString <| chompUntilEndOr "\u{0000}"


stringEqualityParser : Parser String
stringEqualityParser =
    succeed identity
        |= stringParser


lessThanStringParser : Parser String
lessThanStringParser =
    succeed identity
        |. spaces
        |. symbol "<"
        |. spaces
        |= stringParser


greaterThanStringParser : Parser String
greaterThanStringParser =
    succeed identity
        |. spaces
        |. symbol ">"
        |. spaces
        |= stringParser


intEqualityParser : Parser Int
intEqualityParser =
    succeed identity
        |= Parser.int


lessThanIntParser : Parser Int
lessThanIntParser =
    succeed identity
        |. spaces
        |. symbol "<"
        |. spaces
        |= Parser.int


greaterThanIntParser : Parser Int
greaterThanIntParser =
    succeed identity
        |. spaces
        |. symbol ">"
        |. spaces
        |= Parser.int


floatEqualityParser : Parser Float
floatEqualityParser =
    succeed identity
        |= Parser.float


lessThanFloatParser : Parser Float
lessThanFloatParser =
    succeed identity
        |. spaces
        |. symbol "<"
        |. spaces
        |= Parser.float


greaterThanFloatParser : Parser Float
greaterThanFloatParser =
    succeed identity
        |. spaces
        |. symbol ">"
        |. spaces
        |= Parser.float


boolParser : Parser Bool
boolParser =
    oneOf
        [ succeed True
            |. keyword "true"
        , succeed False
            |. keyword "false"
        ]


boolEqualityParser : Parser Bool
boolEqualityParser =
    succeed identity
        |= boolParser


lessThanBoolParser : Parser Bool
lessThanBoolParser =
    succeed identity
        |. spaces
        |. symbol "<"
        |. spaces
        |= boolParser


greaterThanBoolParser : Parser Bool
greaterThanBoolParser =
    succeed identity
        |. spaces
        |. symbol ">"
        |. spaces
        |= boolParser
