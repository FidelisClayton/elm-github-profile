module Update exposing (update)

import RemoteData

import Msgs exposing (Msg)
import User.Commands exposing (fetchUser, fetchUserOrganization, fetchOrgMembers)
import Models exposing (Model)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Msgs.Search ->
      ( model, fetchUser model.searchUser )

    Msgs.UpdateSearchUser searchUser ->
      let
        newModel =
          { model | searchUser = searchUser }
      in
        ( newModel, Cmd.none )

    Msgs.OnFetchUser response ->
      case response of
        RemoteData.Success user ->
          let
              newModel =
                { model | user = response, members = RemoteData.NotAsked, organizations = RemoteData.NotAsked }
          in
              if user.userType == "Organization" then
                ( newModel, fetchOrgMembers user.login )
              else
                ( newModel, fetchUserOrganization user.login )
        _ ->
          ( model, Cmd.none)

    Msgs.OnFetchOrgMembers response ->
      let
        newModel =
          { model | members = response, organizations = RemoteData.NotAsked }
      in
        ( newModel, Cmd.none )

    Msgs.OnFetchUserOrganization response ->
      let
        newModel =
          { model | organizations = response, members = RemoteData.NotAsked }

      in
        ( newModel, Cmd.none)
