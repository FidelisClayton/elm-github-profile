module User.Commands exposing (..)

import Http
import RemoteData
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required, optional)

import Models exposing (User)
import Msgs exposing (Msg)

fetchUserUrl : String -> String
fetchUserUrl username = "https://api.github.com/users/" ++ username

fetchUserOrganizationUrl : String -> String
fetchUserOrganizationUrl user =
  "https://api.github.com/users/" ++ user ++ "/orgs"

fetchOrgMembersUrl : String -> String
fetchOrgMembersUrl org = "https://api.github.com/orgs/" ++ org ++ "/members"

fetchUser : String -> Cmd Msg
fetchUser username =
  Http.get (fetchUserUrl username) userDecoder
    |> RemoteData.sendRequest
    |> Cmd.map Msgs.OnFetchUser

fetchUserOrganization : String -> Cmd Msg
fetchUserOrganization user =
  Http.get ( fetchUserOrganizationUrl user ) (Decode.list userDecoder)
    |> RemoteData.sendRequest
    |> Cmd.map Msgs.OnFetchUserOrganization

fetchOrgMembers : String -> Cmd Msg
fetchOrgMembers org =
  Http.get (fetchOrgMembersUrl org) (Decode.list userDecoder)
    |> RemoteData.sendRequest
    |> Cmd.map Msgs.OnFetchOrgMembers

userDecoder : Decode.Decoder User
userDecoder =
  decode User
    |> required "login" Decode.string
    |> required "avatar_url" Decode.string
    |> optional "name" Decode.string ""
    |> optional "type" Decode.string ""
