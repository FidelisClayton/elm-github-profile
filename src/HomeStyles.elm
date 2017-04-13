module HomeStyles exposing (..)

import Css exposing (..)
import Css.Elements exposing (html, body, img, input, button)
import Css.Namespace exposing (namespace)

type CssClasses
  = Main
  | User
  | UserImage
  | Form
  | Search
  | Members
  | Member
  | MemberImage
  | Organization
  | OrganizationImage
  | Organizations

css =
  (stylesheet << namespace "")
  [ html htmlAndBodyStyle
  , body htmlAndBodyStyle
  , class Main
    [ displayFlex
    , flexDirection column
    , alignItems center
    , maxWidth <| px 300
    , margin2 zero auto
    , padding <| px 20
    ]
  , class User
    [ displayFlex
    , flexDirection column
    , alignItems center
    , padding2 (px 10) (px 10)
    ]
  , img
    [ withClass UserImage
      [ width (px 120)
      , height (px 120)
      , borderRadius (pct 50)
      , marginBottom (px 10)
      ]
    , withClass MemberImage
      [ width (px 40)
      , height (px 40)
      , margin (px 5)
      , borderRadius (pct 50)
      ]
    , withClass OrganizationImage
      [ width (px 40)
      , height (px 40)
      , margin (px 5)
      , borderRadius (pct 50)
      ]
    ]
  , class Form
    [ flexDirection column
    , width (px 250)
    , marginTop (px 10)
    ]
  , input
    [ withClass Search
      [ height (px 40)
      , borderStyle none
      , borderRadius (px 2)
      , border3 (px 1) solid (hex "eee")
      , padding (px 10)
      , width (pct 100)
      , textAlign center
      , fontFamily monospace
      ]
    ]
  , button
    [ withClass Search
      [ backgroundColor (hex "4169e1")
      , borderRadius (px 2)
      , borderStyle none
      , color (hex "fff")
      , fontFamily monospace
      , fontWeight bold
      , height (px 35)
      , marginTop (px 10)
      , width (pct 100)
      ]
    ]
  , class Members
    [ displayFlex
    , flexFlow2 row wrap
    , width (px 250)
    ]
  , class Member [ flex (int 1)]
  , class Organization [ flex (int 1) ]
  ]

htmlAndBodyStyle =
  [ padding zero
  , margin zero
  , height <| pct 100
  , displayFlex
  , alignItems center
  , justifyContent center
  , fontFamily monospace
  ]
