module User.View exposing (..)

import RemoteData exposing (WebData)
import Html exposing (Html, div, img, text, a, form, button, input)
import Html.Attributes exposing (src, href, target, type_, placeholder, value)
import Html.Events exposing (onSubmit, onInput)
import Html.CssHelpers

import HomeStyles

import Msgs exposing (Msg)
import Models exposing (Model, User)

{ class } =
    Html.CssHelpers.withNamespace ""

userView : User -> Html Msg
userView user =
  div [ class [ HomeStyles.User ] ]
      [ img [ src user.avatarUrl, class [ HomeStyles.UserImage ] ] []
      , div [] [ text <| "github.com/" ++ user.login ]
      , div [] [ text user.name ]
      ]

maybeUser : WebData User -> Html Msg
maybeUser response =
  case response of
    RemoteData.NotAsked ->
      text ""

    RemoteData.Loading ->
      text "Loading..."

    RemoteData.Success user ->
      userView user

    RemoteData.Failure error ->
      text (toString error)

maybeMembers : WebData (List User) -> Html Msg
maybeMembers response =
  case response of
    RemoteData.NotAsked ->
      text ""

    RemoteData.Success members ->
      membersView members

    _ ->
      text ""

membersView : List User -> Html Msg
membersView members =
  div [ class [ HomeStyles.Members ] ]
      (List.take 20 members |> List.map memberView)

memberView : User -> Html Msg
memberView member =
  a [ class [ HomeStyles.Member ]
    , href <| "https://github.com/" ++ member.login
    , target "blank"
    ]
    [ img [ src member.avatarUrl, class [ HomeStyles.MemberImage ] ] [] ]

organizationView : User -> Html Msg
organizationView organization =
  a [ class [ HomeStyles.Organization ]
    , href ("https://github.com/" ++ organization.login)
    , target "blank"
    ]
    [ img [ src organization.avatarUrl, class [ HomeStyles.OrganizationImage ] ] [] ]

organizationsView : List User -> Html Msg
organizationsView organizations =
  div [ class [ HomeStyles.Organizations ] ]
      (List.map organizationView organizations)

maybeOrganization : WebData (List User) -> Html Msg
maybeOrganization response =
  case response of
    RemoteData.Success organizations ->
      organizationsView organizations

    _ ->
      text ""

formView : Model -> Html Msg
formView model =
  form
    [ class [ HomeStyles.Form ]
    , onSubmit Msgs.Search
    ]
    [ input
        [ class [ HomeStyles.Search ]
        , placeholder "Username"
        , onInput Msgs.UpdateSearchUser
        , value model.searchUser
        ] []
    , button
        [ class [ HomeStyles.Search ]
        , type_ "submit"
        ] [ text "Search" ]
    ]
