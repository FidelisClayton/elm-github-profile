port module Stylesheets exposing (..)

import Css.File exposing (CssFileStructure, CssCompilerProgram)
import HomeStyles

port files : CssFileStructure -> Cmd msg

fileStructure : CssFileStructure
fileStructure =
  Css.File.toFileStructure
    [ ("home.css", Css.File.compile [ HomeStyles.css])]

main : CssCompilerProgram
main =
  Css.File.compiler files fileStructure
