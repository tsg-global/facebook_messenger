defmodule FacebookMessenger.Delivery do
  @moduledoc """
  Facebook delivery structure

  https://developers.facebook.com/docs/messenger-platform/webhook-reference/message-delivered
  """
  @derive [Poison.Encoder]
  defstruct [
    :mids,
    :watermark,
    :seq,
  ]

  @type t :: %__MODULE__{
    mids: [String.t],
    watermark: String.t,
    seq: integer
  }
end
