module Msgs exposing (..)

import RemoteData exposing (WebData)
import Models exposing (User)

type Msg =
  Search
  | UpdateSearchUser String
  | OnFetchUser (WebData User)
  | OnFetchOrgMembers (WebData (List User))
  | OnFetchUserOrganization (WebData (List User))
