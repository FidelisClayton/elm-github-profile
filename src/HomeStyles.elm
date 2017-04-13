module HomeStyles exposing (..)

import Css exposing (..)
import Css.Elements exposing (html, body, img, input, button)
import Css.Namespace exposing (namespace)

import Colors

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

css : Stylesheet
css =
  (stylesheet << namespace "")

  [ each [ html, body ]
    [ padding zero
    , margin zero
    , height <| pct 100
    , displayFlex
    , alignItems center
    , justifyContent center
    , fontFamily monospace
    ]

  , class Main
    [ displayFlex
    , flexDirection column
    , alignItems center
    , maxWidth <| px 300
    , margin2 zero auto
    , padding <| px 20
    , boxShadow5 (px 0) (px 0) (px 5) (px 0) (rgba 0 0 0 0.25)
    ]

  , class User
    [ displayFlex
    , flexDirection column
    , alignItems center
    , padding2 (px 10) (px 10)
    , children
      [ img
        [ width (px 120)
        , height (px 120)
        , borderRadius (pct 50)
        , marginBottom (px 10)
        ]
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
      , border3 (px 1) solid Colors.galleryGrey
      , padding (px 10)
      , width (pct 100)
      , textAlign center
      , fontFamily monospace
      ]
    ]

  , button
    [ withClass Search
      [ backgroundColor Colors.royalblue
      , borderRadius (px 2)
      , borderStyle none
      , color Colors.white
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

  , each [ class Member, class Organization ]
    [ flex (int 1)
    , children
      [ img
        [ width (px 40)
        , height (px 40)
        , borderRadius (pct 50)
        , margin (px 5)
        ]
      ]
    ]
  ]
