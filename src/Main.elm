import Html exposing (Html, div)
import Html.CssHelpers
import RemoteData exposing (WebData)

import Msgs exposing (Msg)
import Models exposing (Model, User)
import User.View exposing (maybeUser, maybeOrganization, maybeMembers, formView)
import Update exposing (update)

import HomeStyles

{ class } =
    Html.CssHelpers.withNamespace ""

init : ( Model, Cmd Msg )
init =
  let
    notAsked = RemoteData.NotAsked
  in
    ( Model notAsked "" notAsked notAsked, Cmd.none )

view : Model -> Html Msg
view model =
  div [ class [ HomeStyles.Main ] ]
      [ maybeUser model.user
      , maybeMembers model.members
      , maybeOrganization model.organizations
      , formView model
      ]

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

main : Program Never Model Msg
main =
  Html.program
    { init = init
    , view = view
    , subscriptions = subscriptions
    , update = update
    }
