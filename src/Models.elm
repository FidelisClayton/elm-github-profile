module Models exposing (..)

import RemoteData exposing (WebData)

type alias Model =
  { user: WebData User
  , searchUser: String
  , members: WebData (List User)
  , organizations: WebData (List User)
  }

type alias User =
  { login: String
  , avatarUrl: String
  , name: String
  , userType: String
  }
