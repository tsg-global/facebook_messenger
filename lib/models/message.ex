defmodule FacebookMessenger.Message do
  @moduledoc """
  Facebook message structure
  """

  @derive [Poison.Encoder]
  defstruct [
    :is_echo,
    :app_id,
    :metadata,
    :mid,
    :seq,
    :text,
    :attachments,
    :quick_reply,
    :location,
  ]

  @type t :: %__MODULE__{
    is_echo: boolean,
    app_id: integer,
    metadata: String.t,
    mid: String.t,
    seq: integer,
    text: String.t,
    attachments: list,
    quick_reply: map,
    location: map
  }
end
