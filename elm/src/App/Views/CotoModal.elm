module App.Views.CotoModal exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Util.Modal as Modal
import App.Types.Coto exposing (Coto)
import App.Markdown
import App.Messages exposing (Msg(..))
import App.Types.CotoModal exposing (..)


view : CotoModal -> Html Msg
view model =
    Modal.view
        "coto-modal"
        (case model.coto of
            Nothing ->
                Nothing

            Just coto ->
                Just (modalConfig coto model)
        )


modalConfig : Coto -> CotoModal -> Modal.Config Msg
modalConfig coto model =
    { closeMessage = CloseModal
    , title =
        if coto.asCotonoma then
            "Cotonoma"
        else
            "Coto"
    , content =
        div []
            [ div [ class "coto-content" ]
                [ App.Markdown.markdown coto.content
                ]
            ]
    , buttons =
        [ if coto.asCotonoma then
            span [] []
          else
            button [ class "button", onClick ConfirmDeleteCoto ] [ text "Delete" ]
        ]
    }
