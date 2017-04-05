module Models exposing (..)

import RemoteData exposing (WebData)

type alias Model =
  { user: WebData User
  , searchUser: String
  , members: WebData (List User)
  , organizations: WebData (List User)
  }

type alias Member =
  { login: String
  , avatar_url: String
  , url: String
  }

type alias User =
  { login: String
  , avatar_url: String
  , name: String
  , userType: String
  }

type alias Organization =
  { login: String
  , avatar_url: String
  , url: String
  }
