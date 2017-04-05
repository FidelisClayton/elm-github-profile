module User.View exposing (..)

import RemoteData exposing (WebData)
import Html exposing (Html, div, img, text, a, form, button, input)
import Html.Attributes exposing (src, class, href, target, type_, placeholder, value)
import Html.Events exposing (onSubmit, onInput)

import Msgs exposing (Msg)
import Models exposing (Model, User)

userView : User -> Html Msg
userView user =
  div [ class "user" ]
      [ img [ src user.avatar_url ] []
      , div [ class "username" ] [ text <| "github.com/" ++ user.login ]
      , div [ class "name" ] [ text user.name ]
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
  div [ class "members" ]
      (List.take 20 members |> List.map memberView)

memberView : User -> Html Msg
memberView member =
  a [ class "member"
    , href <| "https://github.com/" ++ member.login
    , target "blank"
    ]
    [ img [ src member.avatar_url ] [] ]

organizationView : User -> Html Msg
organizationView organization =
  a [ class "organization"
    , href ("https://github.com/" ++ organization.login)
    , target "blank"
    ]
    [ img [ src organization.avatar_url ] [] ]

organizationsView : List User -> Html Msg
organizationsView organizations =
  div [ class "organizations" ]
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
    [ class "form"
    , onSubmit Msgs.Search
    ]
    [ input
        [ class "search"
        , placeholder "Username"
        , onInput Msgs.UpdateSearchUser
        , value model.searchUser
        ] []
    , button
        [ class "search"
        , type_ "submit"
        ] [ text "Search" ]
    ]
